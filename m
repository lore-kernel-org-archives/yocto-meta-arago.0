Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF373C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 15:33:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.10817.1648049623719408851
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 08:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mDMXdOm6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NFXcgg034069;
	Wed, 23 Mar 2022 10:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648049618;
	bh=4XxRrxaXxriFHHJCLdMymTp9Whh6U8MoCfHWXB1yqlY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mDMXdOm6ktkeUfqAyi1TsfIlPPBWVj0vZr0uPw7k7Qd/CMuY8Sjgl9QEKM2f+n8Xx
	 Bv8AbELdczPFXwBh9b5cCGv65Je5z9m1xSsCa4JKLDMap7U3V5BM/A1xgzt9OVPtd9
	 4+qUmjabyIgJQzC5JYiPZ8UU3XmDdpHca1abXCXY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NFXc2F032911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 10:33:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 10:33:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 10:33:38 -0500
Received: from [10.250.32.71] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NFXb8k076251;
	Wed, 23 Mar 2022 10:33:38 -0500
Message-ID: <d5a6f763-4118-8208-eabd-9d4af9698a87@ti.com>
Date: Wed, 23 Mar 2022 10:33:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][master/dunfell][PATCH] images: Build
 tisdk-thinklinux-image with tisdk-core-bundle
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <nm@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220314202840.18904-1-reatmon@ti.com>
 <20220318134823.7rzaq2wqcfnkxgv2@animate> <20220318171143.GA23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220318171143.GA23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 15:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13725

I'm fixing it and submitting a v2.  Thanks.


On 3/18/2022 12:11, Denys Dmytriyenko wrote:
> On Fri, Mar 18, 2022 at 08:48:23AM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
>> On 15:28-20220314, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Add tisdk-thinklinux-image to the list of TARGET_IMAGES for
> 
> think linux? :)
> 
> 
>>> tisdk-core-bundle.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>>   meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> index 9f0e65db..5ce688ef 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> @@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
>>>   DTB_FILTER_j7 = "j721e"
>>>   
>>>   # List of target side images to build for the SDK
>>> -TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
>>> +TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
>>>   
>>>   # dra71 lcard requires an initramfs with modules for NFS boot
>>>   TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
>>
>> Reviewed-by: Nishanth Menon <nm@ti.com>
> 

-- 
Ryan Eatmon
reatmon@ti.com

