Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C51C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:15:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5198.1672870552729961496
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 14:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nh/ZWhUt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304MFmL0106157;
	Wed, 4 Jan 2023 16:15:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672870548;
	bh=VOEsrBl5EAv6G/JokgOxCtnyZ4AXAEh78hmeLzDHFBM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nh/ZWhUtwFk91ndCMhJaXyG6wpgknRhoXUw1mxjTiEG8H8xaNyc+3/Wn3W0qcas1M
	 U5YGBWxBulzZ2dbezUn5DZcaxTbFtliBWhVCENB6jzxnOerrU05xVKxphyjVj+N/yn
	 UfOu52DnX43JMD/zA71ecJ3W7Fv5GcHxZ5siNqdU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304MFmpH001376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 16:15:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 16:15:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 16:15:48 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304MFmbt016867;
	Wed, 4 Jan 2023 16:15:48 -0600
Message-ID: <abba098c-8ecb-f1e0-fbac-b95d097d3f31@ti.com>
Date: Wed, 4 Jan 2023 16:15:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-arago][master][PATCH] layer.conf: Update LAYERSERIES_COMPAT
 for mickledore
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230104211711.10615-1-reatmon@ti.com>
 <20230104220048.GM22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230104220048.GM22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 22:15:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14156



On 1/4/2023 4:00 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 04, 2023 at 03:17:11PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> oe-core switched to mickedore [1]
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/conf/layer.conf | 2 +-
>>   meta-arago-extras/conf/layer.conf | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
>> index 5de46fc9..1ffcd2fb 100644
>> --- a/meta-arago-distro/conf/layer.conf
>> +++ b/meta-arago-distro/conf/layer.conf
>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>>   BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-arago-distro = "10"
>>   
>> -LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale"
>> +LAYERSERIES_COMPAT_meta-arago-distro = "mickledore"
> 
> Do you want to keep existing compatibility around for a bit longer?

Is it worth keeping it around?  All of our testing is being done with 
master for everything.  How many people do you think are using an older 
version of bitbake with the latest master of meta-ti/meta-arago?  I 
would think they are likely pointing to latest of everything if they are 
doing anything.


>>   
>>   LAYERDEPENDS_meta-arago-distro = " \
>>       core \
>> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
>> index e2c8119f..9cdfcb32 100644
>> --- a/meta-arago-extras/conf/layer.conf
>> +++ b/meta-arago-extras/conf/layer.conf
>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>>   BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-arago-extras = "10"
>>   
>> -LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale"
>> +LAYERSERIES_COMPAT_meta-arago-extras = "mickledore"
>>   
>>   # Set a variable to get to the top of the metadata location
>>   ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
>> -- 
>> 2.17.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14154): https://lists.yoctoproject.org/g/meta-arago/message/14154
> Mute This Topic: https://lists.yoctoproject.org/mt/96060010/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

