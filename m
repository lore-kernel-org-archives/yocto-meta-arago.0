Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39ECBC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 14:58:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11970.1648133923349921336
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 07:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WU23qlUJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22OEwfM1126341;
	Thu, 24 Mar 2022 09:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648133921;
	bh=/bMsDd3RTu3A+jrRWV9gGoGTf9aHqmKAXeJALE3EKaM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WU23qlUJm5TeB4y9wIhaNrSuCRtQBhERO2X4LM/JMMBOee6Vb+G1+8tBA426a2Vd2
	 Y3eFTGaTwyXXmM1dXfCcz3hMsaQ8Z4XztIBP0/TAL/jNeJNp3K0yjfT9qjyLoNesAy
	 eoKfrWzUi9AlyR5sOa+vw1IbTdoTWKajmq9ddMyo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22OEwfSH024393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 09:58:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 09:58:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 09:58:40 -0500
Received: from [10.249.37.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22OEweoS111775;
	Thu, 24 Mar 2022 09:58:40 -0500
Message-ID: <15d14c52-85ea-f296-2322-eaea7d34ca5d@ti.com>
Date: Thu, 24 Mar 2022 09:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][master/dunfell][PATCH v2] images: Build
 tisdk-thinlinux-image with tisdk-core-bundle
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220323153451.15543-1-reatmon@ti.com>
 <20220324131645.gihsiax25ecqvu45@washbowl>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220324131645.gihsiax25ecqvu45@washbowl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 14:58:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13750



On 3/24/2022 8:16, Nishanth Menon wrote:
> On 10:34-20220323, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Add tisdk-thinlinux-image to the list of TARGET_IMAGES for
>> tisdk-core-bundle.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>
>> -
>> v2 - Fix typos in commit message.
> 
> you want to move this to diffstat section (below the cut line: ---)

I'll send a v3 with that change.

> Otherwise:
> 
> Reviewed-by: Nishanth Menon <nm@ti.com>
> 
>>
>> ---
>>   meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> index 9f0e65db..5ce688ef 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> @@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
>>   DTB_FILTER_j7 = "j721e"
>>   
>>   # List of target side images to build for the SDK
>> -TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
>> +TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
>>   
>>   # dra71 lcard requires an initramfs with modules for NFS boot
>>   TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
>> -- 
>> 2.17.1
> 

-- 
Ryan Eatmon
reatmon@ti.com

