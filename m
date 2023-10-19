Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03421CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:20:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.28958.1697725239811643906
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SOAuzeuI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JEKZAk039937;
	Thu, 19 Oct 2023 09:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697725235;
	bh=XOL1PEFgjb1NKKtjoDnmJl9H+2/SFXY3zq0OzniEKDw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SOAuzeuIRzzWPkvxbl3xjg/9rfSn7RpMv1zKqmdkez2Bmo09PxjlTdJQCaKJki4xq
	 Fjmf9Zv/FPDWZ5RPVsS2ktciQY1pm10M4T1a7WLwvZD7ynHLi2RNIHXoCmcRulgGDY
	 HtEsSCShdQLhubQ+4GF21sKxzx6YK5C26avLxTUE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JEKZ1C022254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 09:20:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 09:20:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 09:20:34 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JEKYnO044223;
	Thu, 19 Oct 2023 09:20:34 -0500
Message-ID: <e1deddbf-45f1-40b9-a1fa-acb7b84862a0@ti.com>
Date: Thu, 19 Oct 2023 09:20:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] tisdk-default-image: Add Matrix
 GUI only for legacy platforms
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <c-shilwant@ti.com>, <a-limaye@ti.com>, <g-gupta@ti.com>,
        <khasim@ti.com>, <p-bhagat@ti.com>
References: <20231019051056.2055622-1-s-adivi@ti.com>
 <20231019054242.GN2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231019054242.GN2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:20:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14957



On 10/19/2023 12:42 AM, Denys Dmytriyenko wrote:
> On Thu, Oct 19, 2023 at 10:40:56AM +0530, Sai Sree Kartheek Adivi wrote:
>> Today, only ti33x and ti43x family platforms ship matrix-gui in the SDK.
>> It is removed for all other platforms in SDK layers. So add it only for
>> required platforms.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>> ---
>>   .../recipes-core/images/tisdk-default-image.bb       | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index 787fac95..2c7b2f0c 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -24,8 +24,6 @@ IMAGE_INSTALL += "\
>>       ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>>       packagegroup-arago-tisdk-connectivity \
>>       packagegroup-arago-tisdk-crypto \
>> -    packagegroup-arago-tisdk-matrix \
>> -    packagegroup-arago-tisdk-matrix-extra \
>>       packagegroup-arago-tisdk-multimedia \
>>       packagegroup-arago-tisdk-addons \
>>       packagegroup-arago-tisdk-addons-extra \
>> @@ -36,6 +34,16 @@ IMAGE_INSTALL += "\
>>       packagegroup-arago-tisdk-sysrepo \
>>   "
>>   
>> +IMAGE_INSTALL:append:ti33x = " \
>> +    packagegroup-arago-tisdk-matrix \
>> +    packagegroup-arago-tisdk-matrix-extra \
>> +"
>> +
>> +IMAGE_INSTALL:append:ti43x = " \
>> +    packagegroup-arago-tisdk-matrix \
>> +    packagegroup-arago-tisdk-matrix-extra \
>> +"
> 
> Instead of appending directly to IMAGE_INSTALL, it's better to use an indirect
> variable. Take a look how it's done with CHROMIUM variable in the same recipe.

Agreed.

> 
>>   export IMAGE_BASENAME = "tisdk-default-image"
>>   
>>   # Disable ubi/ubifs as the filesystem requires more space than is
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

