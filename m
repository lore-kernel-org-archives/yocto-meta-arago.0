Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB94C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:51:24 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.46271.1753116677146378221
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NLgHNsrb;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LGpCH5849954;
	Mon, 21 Jul 2025 11:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753116672;
	bh=K6+ZByNZ96WdNcyzWyqxzJzOaw+n/xfCqS1hrHSa2Lo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NLgHNsrbPXz+frWgAXPFmRtyiA4CeXwccOxMcUkrSq3+ur2bMofHPxHkZiGg5NTIz
	 BR5qYG5RIppQqwsdqoDBEqtlXspc0LbbHsJUkxsDdwtRmHgkRDukuOEA6XRYjPZs3J
	 JiryOblERTq5jbij3k7X4awpFhpk17gw/RplL5ak=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LGpCBx3441562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 11:51:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 11:51:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 11:51:12 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LGpCCu3848974;
	Mon, 21 Jul 2025 11:51:12 -0500
Message-ID: <ca89cc4a-314e-4c30-bc09-b6c004a850ea@ti.com>
Date: Mon, 21 Jul 2025 11:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] dma-heap-tests: Update SRCREV to fix
 CMake 4.0 issue
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250721145146.21181-1-reatmon@ti.com>
 <20250721162454.GG24899@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250721162454.GG24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 16:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16317


Sigh... Andrew changed the lic file...  Ok.  I'll do a more formal 
update and send a v2.


On 7/21/2025 11:24 AM, Denys Dmytriyenko wrote:
> ERROR: dma-heap-tests-1.0-r0 do_populate_lic: QA Issue: dma-heap-tests: LIC_FILES_CHKSUM points to an invalid file: .../dma-heap-tests-1.0/src/heap_test_fixture.cpp [license-checksum]
> 
> 
> On Mon, Jul 21, 2025 at 09:51:46AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>> index 69f95391..c0eeaaaa 100644
>> --- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>> +++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>> @@ -7,7 +7,7 @@ PV = "1.0"
>>   
>>   BRANCH = "master"
>>   SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
>> -SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
>> +SRCREV = "ead2ea8a9c3b81e97324da44c76cd9295e6c5efc"
>>   
>>   DEPENDS = "googletest"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

