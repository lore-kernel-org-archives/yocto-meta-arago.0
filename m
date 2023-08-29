Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54D0C6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 14:52:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19486.1693320740970064288
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 07:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZB5p7Jmd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37TEqE0Q072527;
	Tue, 29 Aug 2023 09:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693320734;
	bh=ng+mnjKhN9a7ALNcvqn8TdWDndZagZZFxB/urNfsy5c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZB5p7JmdyBVn1qvt8S64fQaoYxWHj2vTrW7FUlyJKDqjekI4DNSbUyF0nGsuiRFpV
	 sutzIUFjdgZFF40PaavPQwikDo29lOOmmtmlPfBUp6XXBQETg4MNMM/OTmF39GC2Zg
	 KZbeN40wGtDZyQg5QDDYDxH6tVJRs5/h5l+DKoeg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37TEqETt121215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Aug 2023 09:52:14 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Aug 2023 09:52:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Aug 2023 09:52:14 -0500
Received: from [10.249.36.124] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37TEqEIo103289;
	Tue, 29 Aug 2023 09:52:14 -0500
Message-ID: <7575e4e2-c315-b6fc-d1d8-fcad94427ec0@ti.com>
Date: Tue, 29 Aug 2023 09:52:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] flatbuffers: Add protocol
 and branch to SRC_URI
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230828221423.22410-1-reatmon@ti.com>
 <20230829002852.GS3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230829002852.GS3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Aug 2023 14:52:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14878



On 8/28/2023 7:28 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 28, 2023 at 05:14:23PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Add missing protocol and branch to the SRC_URI to remove new warning
>> messages.
> 
> Should also be removed - it's an ancient version that was "backported" from
> meta-oe 4 years ago. And more recent versions now available in meta-oe:
> 
> http://layers.openembedded.org/layerindex/recipe/301166/
> 
> There were some specific-version requirements for armnn+tensorflow back then.
> Is it still the case?

Good to know.  I'll look into it.  Adding to my todo list.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb          | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>> index 92363915..7f7b8b99 100644
>> --- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
>>   
>>   SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
>>   
>> -SRC_URI = "git://github.com/google/flatbuffers.git"
>> +SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
>>   
>>   # Make sure C++11 is used, required for example for GCC 4.9
>>   CXXFLAGS += "-std=c++11"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

