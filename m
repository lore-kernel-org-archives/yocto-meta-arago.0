Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6B7CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 16:02:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1523.1757347337644891429
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 09:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nb4jB/Uj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588G2E7V3827114;
	Mon, 8 Sep 2025 11:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757347334;
	bh=AlN+eoI9e5KqVelR8AFA2vbl4u6Vn/Z0o5UabsiuXE4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nb4jB/UjIV/JbZQpcKBLugOZMziyceBZWJjAFQTpL4y7qdYXmBOoEAvgP70mUjhnY
	 xrWDbvOFLlp5BIvL/Jl8vKrmRanZBwFUA3YFcplc0TmHDVb7N84rPUd/tuWyFqD/d4
	 +DwM/3N/0DWGNrTIYLedG92GATAGW0VP+5QUGwN4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588G2ERI2514018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 11:02:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 11:02:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 11:02:14 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588G2EMx1162793;
	Mon, 8 Sep 2025 11:02:14 -0500
Message-ID: <f2238668-2306-4b6d-b0d5-28dfc8798427@ti.com>
Date: Mon, 8 Sep 2025 11:02:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/3] meta-arago-test:
 recipes-extended: Specify correct PV for OCL C headers
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250905233849.2506703-1-a-christidis@ti.com>
 <20250905233849.2506703-3-a-christidis@ti.com>
 <20250908152108.GC3125@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250908152108.GC3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 16:02:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16546



On 9/8/2025 10:21 AM, Denys Dmytriyenko wrote:
> Please don't use "meta-arago-test: recipes-extended:" prefix in the commit
> summary (Subject) - it's very high level and absolutely useless.
> 
> The convention that OE layers use is to specify the "area:", which is usually
> the name of the recipe for a single change, or a common name for multiple
> changes in the same commit, e.g. "conf/machine:" or even "opencl:" here.
> 
> So, this would change current subject
> 
> "meta-arago-test: recipes-extended: Specify correct PV for OCL C headers"
> 
> into
> 
> "opencl-headers: specify correct PV"
> 
> And for #3:
> 
> "opencl-clhpp: update v2.0.16 -> v2024.05.08"
> 
> In other words, instead of doing this:
> 
> "blah: blah: blah: do foo for bar"
> 
> do this:
> 
> "bar: do foo"

I need to add a check to the PRC to flag this kind of thing.  I agree 
this level of subject tagging is not needed or desired.


> 
> On Fri, Sep 05, 2025 at 06:38:48PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> With the .bbappend and .inc file, the version of the headers is
>> increased. So, specify the correct PV of the headers.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
>> index 48335204..1216adf5 100644
>> --- a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
>> +++ b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
>> @@ -1,6 +1,7 @@
>>   inherit cmake
>>   
>>   SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
>> +PV = "2024.05.08"
>>   
>>   EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
>>   
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


