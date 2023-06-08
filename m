Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53ECFC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:39:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3631.1686253160721127481
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 12:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rfmWRZGj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358JdINe023892;
	Thu, 8 Jun 2023 14:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686253158;
	bh=wz/CpvUsnapqmeyFquRG/a5EU3eu+2sS9oVTE7zTPuY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rfmWRZGjUjfA5jNmS2cVVh1dtwA7o/i1okHg3FxKgTXM4Ol853Tubcn10FVI6VZG1
	 9LjgKfhjbE4Xh+GzvDaw9DtlobB3ijgwRYKCa+m2a4jLvzgRigskTRxhBoJSAhS6oi
	 4U1SyfD0Awq3jBHyMQ77CNBmXxz4MirOzE7at3F8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358JdICI089430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 14:39:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 14:39:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 14:39:17 -0500
Received: from [10.249.33.79] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358JdHOG022206;
	Thu, 8 Jun 2023 14:39:17 -0500
Message-ID: <ccec32a8-4cbc-9f43-1f3f-e16e1aae36de@ti.com>
Date: Thu, 8 Jun 2023 14:39:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master][PATCH] kms++: Restore pybind11 support
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230608183641.30832-1-reatmon@ti.com>
 <20230608185719.GC9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230608185719.GC9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 19:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14551



On 6/8/2023 1:57 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 08, 2023 at 01:36:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Having this turned off is causing build errors and the errors that
>> disabling pybind11 solved do not appear to be in master any more.
> 
> Yeah, I already had this change in my local queue for master, but have been
> fighting other upstream issues...

Do you have other fixes for the optee CFG_DT issues, and the 
binutils-cross-canadian qa errors?  Or should I keep looking into those?

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
>> ---
>>   meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> index eb39736c..56b83c7a 100644
>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> @@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
>>   
>>   DEPENDS = "drm fmt"
>>   
>> -# New meson build system fails to find pybind11 in sysroot, disable for now
>> -#DEPENDS += "python3-pybind11"
>> -#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>> +DEPENDS += "python3-pybind11"
>> +EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>>   
>>   PACKAGES =+ "${PN}-python"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

