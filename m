Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3B5C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 10:11:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.17476.1718791905192872062
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 03:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qJ/WkkT3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JABg8A118614;
	Wed, 19 Jun 2024 05:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718791902;
	bh=g0OnBVPihN2Bw2WJYVO9J6xh7va/Pi1Np0ca727pNIc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qJ/WkkT3hkDAjUOmF9/CRFu2GVRC4+gRmZivVFQPII6R17bCk/LFUuYOzMscVd0B3
	 FNGLrEtwKxNvA6oxhxAMKlAQ898mGQ7iYdYG5vs+VCRR30ejXnh90WXLZbuDpHoOmv
	 W3VD33kQS97X6N2RjTtUgEFfE4GmPRa/xeaF3e38=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JABgZO080701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 05:11:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 05:11:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 05:11:42 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JABdmg000848;
	Wed, 19 Jun 2024 05:11:40 -0500
Message-ID: <78c07332-f784-4f6c-84ee-5947dc5a9e69@ti.com>
Date: Wed, 19 Jun 2024 15:41:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v2] recipes-qt: qt5: Add
 xkbcommon to qtbase PACKAGECONFIG
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Kartheek <s-adivi@ti.com>
References: <20240618122453.1131089-1-c-shilwant@ti.com>
 <20240618210129.GB18231@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240618210129.GB18231@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Jun 2024 10:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15404

Hi Denys,

On 19/06/24 02:31, Denys Dmytriyenko wrote:
> Please add it to PACKAGECONFIG_DISTRO variable, where it was originally. Also,
> previously it was done in the arago.conf distro configuration, as adjusting
> PACKAGECONFIGs from their default values is considered a distro-specific
> change. Plus, it avoids creating tons of one-line .bbappends (though in the
> case of qtbase, we already have a .bbappend for other reasons). Lastly,
> refrain from using :append w/o additional overrides and use += instead - it
> automatically handles whitespaces and is much easier to undo downstream.



Thanks for your comments!
Sent a v3 based on your suggestions - 
https://lists.yoctoproject.org/g/meta-arago/message/15403



>
> On Tue, Jun 18, 2024 at 05:54:53PM +0530, Chirag Shilwant wrote:
>> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>>
>> - For QT apps to use physical keyboard, xkbcommon has to be added in
>> PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev which at
>> present is an invalid PACKAGECONFIG & hence was dropped from meta-arago [1].
>>
>> - Hence, add xkbcommon to PACKAGECONFIG which will enable the use of
>> physical keyboard in QT apps.
>>
>> [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=de16946741249265a38acb7bb503b39a0c2b4175
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> v2: Add xkbcommon in PACKAGECONFIG to all platforms instead of making it k3 machine specific
>>
>>   meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>> index 8ae8110b..4ecfd7ed 100644
>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>> @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
>>   
>>   PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
>>   
>> +PACKAGECONFIG:append = " xkbcommon"
>> +
>>   PR:append = ".arago17"
>>   
>>   QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
>> -- 
>> 2.34.1

