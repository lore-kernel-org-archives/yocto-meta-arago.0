Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CA2C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:20:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.633.1651008018034079009
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ifXPmBYZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLKF1l034773;
	Tue, 26 Apr 2022 16:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651008015;
	bh=Sb+Aw8fejDowABz8v+1Uh/3chp6B8YoSOoO6wqZejV0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ifXPmBYZ1/0DNn2FCDbOnInK4OO9G+AOuxzCbCpR98fC/1RmfVxyOgdURXU2uQobB
	 RDGuLoYWQLZXkdxzT1TGhslmefAefFPI1G1b+m3uHkfFl5MLUyhxrg48/V4DuEYeT0
	 M6h8ObSf2REmKZcZksVdIV6nbpg61PoILtk7DGMM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLKEIr039156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:20:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:20:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:20:14 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLKEFm056631;
	Tue, 26 Apr 2022 16:20:14 -0500
Message-ID: <0e1a0fe5-7e77-afd6-5cc4-754ceb469a4a@ti.com>
Date: Tue, 26 Apr 2022 16:20:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 3/6] Remove image-prelink from
 sample USER_CLASSES
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-3-afd@ti.com> <20220426211142.GE9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426211142.GE9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13808

On 4/26/22 4:11 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:02:48PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> Prelinking hasn't worked on ARM in a while so this class was
>> removed in the latests core master. Remove it here.
> 
> This file is used for both dunfell and master. Maybe this change calls for v3
> of the corresponding sample files?
> 


I only see these v2 files referenced in master configs.

Andrew


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   sample-files/local-arago64-v2.conf.sample | 4 +---
>>   sample-files/local-poky-v2.conf.sample    | 4 +---
>>   2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
>> index 9549e8a..13585cb 100644
>> --- a/sample-files/local-arago64-v2.conf.sample
>> +++ b/sample-files/local-arago64-v2.conf.sample
>> @@ -112,11 +112,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>   # enable extra features. Some available options which can be included in this variable
>>   # are:
>>   #   - 'buildstats' collect build statistics
>> -#   - 'image-prelink' in order to prelink the filesystem image
>>   #   - 'image-swab' to perform host system intrusion detection
>> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>>   # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>> -USER_CLASSES ?= "buildstats image-prelink"
>> +USER_CLASSES ?= "buildstats"
>>   
>>   # By default disable interactive patch resolution (tasks will just fail instead):
>>   PATCHRESOLVE = "noop"
>> diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
>> index 5cbe6ef..a958055 100644
>> --- a/sample-files/local-poky-v2.conf.sample
>> +++ b/sample-files/local-poky-v2.conf.sample
>> @@ -109,11 +109,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>   # enable extra features. Some available options which can be included in this variable
>>   # are:
>>   #   - 'buildstats' collect build statistics
>> -#   - 'image-prelink' in order to prelink the filesystem image
>>   #   - 'image-swab' to perform host system intrusion detection
>> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>>   # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>> -USER_CLASSES ?= "buildstats image-prelink"
>> +USER_CLASSES ?= "buildstats"
>>   
>>   # By default disable interactive patch resolution (tasks will just fail instead):
>>   PATCHRESOLVE = "noop"
>> -- 
>> 2.17.1

