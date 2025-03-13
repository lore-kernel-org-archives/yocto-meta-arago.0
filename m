Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB679C35FF1
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:47:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22663.1741891619316295333
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 11:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ILtW1kVR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DIktLj1916397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 13:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741891615;
	bh=NQO22EUmDmmB4dr6quJeGDbQ0I95nHOOY8Op+gFGPAQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ILtW1kVRRgL/q9u+rNp4f3pyFiHyOfuV0i2D6JfQX2XXXLEhea1LrnSwoAsGjRn+g
	 Q6IWyzRdMGqgFmb//UE3i1ONdvxpZ/e7hIMox/xwrzWWHe9vEnvWO1XheTwyjOKQxj
	 aqZgtRoZ3NFMiactJhKt7DntXJq/781/wGdhoNXg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DIktO8029713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 13:46:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 13:46:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 13:46:55 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DIks0w004251;
	Thu, 13 Mar 2025 13:46:54 -0500
Message-ID: <cb7610b1-bd40-4c5f-bf2e-33f6ce58f49b@ti.com>
Date: Thu, 13 Mar 2025 13:46:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 10/13] libredblack: move and clean up
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250313104029.14977-1-reatmon@ti.com>
 <20250313104029.14977-11-reatmon@ti.com> <20250313181218.GD23729@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250313181218.GD23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 18:47:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16032



On 3/13/2025 1:12 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 13, 2025 at 05:40:26AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> * Move into recipes-extended
>> * Clean unnecessary comments
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> Huh, when I squashed the 2 commits into 1, I missed some extra text below...

I'll fix that and send a v2.


> 
>> libredblack cleanup
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../sysrepo}/libredblack_git.bb                             | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>   rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
>> similarity index 62%
>> rename from meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
>> rename to meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
>> index 412d08d8..80283c73 100644
>> --- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
>> +++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
>> @@ -10,12 +10,8 @@ SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -# NOTE: if this software is not capable of being built in a separate build directory
>> -# from the source, you should replace autotools with autotools-brokensep in the
>> -# inherit line
>>   inherit python3native autotools
>>   
>> -# Specify any options you want to pass to the configure script using EXTRA_OECONF:
>> -EXTRA_OECONF = " --without-rbgen "
>> +EXTRA_OECONF = "--without-rbgen"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

