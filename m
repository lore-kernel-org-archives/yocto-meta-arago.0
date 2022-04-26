Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713ABC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:24:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.707.1651008238604636614
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V93wnR3b;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLNsbV070650;
	Tue, 26 Apr 2022 16:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651008234;
	bh=K2N5Cc4Mg8HwXXgry4wqpnRF2SJp6QppIyJPx2v2poI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V93wnR3b1opfqSygzaqyursCFbulnwnk+yQ7fMy9Sw5VCfzmCHrejPdm2S//BNMWV
	 RmAyB4dOJq/Yo7mVn/eJGJHAotmfx3ksU6/V6f3OU9j2u4J6fW5qyieGBRZs326Rdb
	 zpTakpTNtoEA40uQifT2F4QWlhyQVXCwCWY8VH+s=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLNsYE016306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:23:54 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:23:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:23:53 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLNr5s059656;
	Tue, 26 Apr 2022 16:23:53 -0500
Message-ID: <e7a7aabf-4dd3-7f3e-1bd4-f17c1a1c0735@ti.com>
Date: Tue, 26 Apr 2022 16:23:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 4/6] Rename BB_ENV_EXTRAWHITE to
 BB_ENV_PASSTHROUGH_ADDITIONS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-4-afd@ti.com> <20220426210811.GC9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426210811.GC9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13809

On 4/26/22 4:08 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:02:49PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> This variable was renamed upstream, rename it in our setenv file.
> 
> This will break dunfell...
> 


And not doing it breaks master...

There is a check for BB_ENV_EXTRAWHITE, having it set will halt
build (think the check is in bitbake but haven't looked).


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   oe-layertool-setup.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index f171f94..72416b0 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -853,7 +853,7 @@ unset BITBAKEDIR
>>   unset SCRIPTS
>>   export PATH
>>   export BUILDDIR=${builddir}
>> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>> +export BB_ENV_PASSTHROUGH_ADDITIONS="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>>   EOM
>>   }

