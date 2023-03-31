Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14122C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 22:29:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9027.1680301777758361909
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 15:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JWv2zoYl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32VMTW5f043095;
	Fri, 31 Mar 2023 17:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680301772;
	bh=1SnQUrk3k+u/8ZbvMSX4EyG6AWcKkdIpgk4o8F0J1xw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JWv2zoYlNfPe6ODa1L0hf7ElUyi6NwjeEH5A1NwV3CbeGuw8F5dmTfIYx2Cm6SvlJ
	 qx6oHbG7Cv540L3lfC5WVymccyzNA3kMmrhHlgIkSFTD/V3zCgJO67EJfGW851OAKW
	 Zm3mx5YXbYK5RIM0rkvGDDcv/fS62M38kPifZDA8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32VMTWd4020882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Mar 2023 17:29:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 31
 Mar 2023 17:29:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 31 Mar 2023 17:29:32 -0500
Received: from [10.249.35.0] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32VMTVmi067127;
	Fri, 31 Mar 2023 17:29:32 -0500
Message-ID: <0cacad68-0e77-a9da-3129-c7095b45d934@ti.com>
Date: Fri, 31 Mar 2023 17:29:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arago][dunfell][PATCH] images: Add variable to add extra
 packages from the local.conf
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230331220143.20090-1-reatmon@ti.com>
 <20230331220847.GJ18050@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230331220847.GJ18050@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Mar 2023 22:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14289



On 3/31/2023 17:08, Denys Dmytriyenko wrote:
> On Fri, Mar 31, 2023 at 05:01:43PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The bootstrap, thinlinux and tiny images all had a variable that allowed
>> for adding additional packages to the image from the local.conf file.
>> Add this same concept to the default and base images.
> 
> Missing Suggested-by? :) But sure, looks good to me!
> 
> Why is it dunfell specific?
> 

Because the patch did not apply to kirkstone/master, so I sent a second 
patch with the updated patch.



>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/tisdk-base-image.bb    | 3 +++
>>   meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
>> index 8698816d..ec09b90b 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
>> @@ -8,12 +8,15 @@ require arago-image.inc
>>   IMAGE_FSTYPES += "cpio.xz"
>>   IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
>>   
>> +ARAGO_BASE_IMAGE_EXTRA_INSTALL ?= ""
>> +
>>   IMAGE_INSTALL += "\
>>       packagegroup-arago-base \
>>       packagegroup-arago-console \
>>       packagegroup-arago-base-tisdk \
>>       ${VIRTUAL-RUNTIME_initramfs} \
>>       ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
>> +    ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
>>   "
>>   
>>   export IMAGE_BASENAME = "tisdk-base-image"
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index 16772ee9..9cd0a28f 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -7,6 +7,8 @@ require arago-image.inc
>>   
>>   SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
>>   
>> +ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
>> +
>>   IMAGE_INSTALL += "\
>>       packagegroup-arago-base \
>>       packagegroup-arago-console \
>> @@ -27,6 +29,7 @@ IMAGE_INSTALL += "\
>>       ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
>>       ti-analytics \
>>       ti-demos \
>> +    ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>>   "
>>   
>>   export IMAGE_BASENAME = "tisdk-default-image"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

