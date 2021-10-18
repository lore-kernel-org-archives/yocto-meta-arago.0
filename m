Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.38475.1634572879386151547
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 09:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gFpssdwR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IG1EPQ080551;
	Mon, 18 Oct 2021 11:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634572874;
	bh=IpSe6958+igbyfNN9XnkNAqVZAslM3sJi2MI19Luwg0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=gFpssdwR06qACRurT6w/YlH18DSzuP3w7GUu42nEW7uOubjHVxsOKYA2VzSB06PML
	 j/ZaobHhnG79Se5pKHn5Z40E4iOOJ6YUKfLl6kPgcPKIUvN+AlXk9mRu4BSWdDg39R
	 71NaDQgTJS/QQPVAJs+J9YDd8LYxTpxKFkEM6jVk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IG1DtE051161
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 11:01:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 11:01:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 11:01:13 -0500
Received: from [10.250.38.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IG1Dqi061877;
	Mon, 18 Oct 2021 11:01:13 -0500
Subject: Re: [meta-arago] [PATCH v2 1/2] qtbase-conf: disable the seccomp filter sandbox
To: Denys Dmytriyenko <denis@denix.org>,
        Vivien Didelot
	<vivien.didelot@gmail.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20211007175730.152202-1-vdidelot@pbsc.com>
 <20211007181210.GS1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <00ec3405-588f-2a3c-9692-edd5e3135cd3@ti.com>
Date: Mon, 18 Oct 2021 11:01:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211007181210.GS1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Is this for master or dunfell or both.

On 10/7/21 1:12 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 07, 2021 at 01:57:29PM -0400, Vivien Didelot wrote:
>> SECCOMP-BPF Sandbox is known to cause runtime issues so set the
>> QTWEBENGINE_CHROMIUM_FLAGS environment variable to disable this
>> feature temporarily until those issues are resolved.
>>
>> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
>> ---
>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 5 +++++
>>   meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> index 146ee07e..928e2cc7 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>> @@ -6,3 +6,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>   export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
>>   export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
>>   export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>> +
>> +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
>> +# from the pthread implementation. Disable this feature temporarily until
>> +# those issues are resolved.
>> +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> index 29fa2969..96526393 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>> @@ -7,3 +7,8 @@ export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
>>   export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
>>   export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
>>   export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
>> +
>> +# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
>> +# from the pthread implementation. Disable this feature temporarily until
>> +# those issues are resolved.
>> +export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
>> -- 
>> 2.33.0
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
