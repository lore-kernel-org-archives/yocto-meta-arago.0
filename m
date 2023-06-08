Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C5C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:03:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5580.1686258233587627573
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 14:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mG+Lb77S;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358L3nBS088967;
	Thu, 8 Jun 2023 16:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686258229;
	bh=JcRI7o8f/BLaltSsnd0iVfkJpk+XnKK2H8W6w/ri46k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mG+Lb77SYCUzKexBdCi2cqfHn5LeJTZ7kCFRTpbfTHG11VYZSblmhqvhkiVby3w1Y
	 A3glbUtR+kdjLjFSNCBqQRLeyiSzqD8wFlK8+TK15+svteXC2PvdyEIVuOO4Htv2u7
	 dnClyu/duBTckKL0+trm1cZOeOsdETf3a3zGkqhs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358L3nX7033756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 16:03:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 16:03:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 16:03:49 -0500
Received: from [10.249.33.79] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358L3npr083077;
	Thu, 8 Jun 2023 16:03:49 -0500
Message-ID: <c8420a73-7de3-0699-1236-f0e03c6b463a@ti.com>
Date: Thu, 8 Jun 2023 16:03:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master][PATCH] kms++: Restore pybind11 support
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230608183641.30832-1-reatmon@ti.com>
 <20230608185719.GC9226@denix.org>
 <ccec32a8-4cbc-9f43-1f3f-e16e1aae36de@ti.com>
 <20230608204903.GD9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230608204903.GD9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 21:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14560



On 6/8/2023 3:49 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 08, 2023 at 02:39:17PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 6/8/2023 1:57 PM, Denys Dmytriyenko wrote:
>>> On Thu, Jun 08, 2023 at 01:36:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> Having this turned off is causing build errors and the errors that
>>>> disabling pybind11 solved do not appear to be in master any more.
>>>
>>> Yeah, I already had this change in my local queue for master, but have been
>>> fighting other upstream issues...
>>
>> Do you have other fixes for the optee CFG_DT issues, and the
>> binutils-cross-canadian qa errors?  Or should I keep looking into
>> those?
> 
> Yes, I believe I did mention this on our call couple of days ago...
> optee issue is being discussed on meta-arm list and binutils on oe-core list.

Ah.  I think I misunderstood and thought you were talking about 
something else...  It's been a long week so far...


>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>
>>> Tested-by: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>>
>>>> ---
>>>>   meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>>>> index eb39736c..56b83c7a 100644
>>>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>>>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>>>> @@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
>>>>   DEPENDS = "drm fmt"
>>>> -# New meson build system fails to find pybind11 in sysroot, disable for now
>>>> -#DEPENDS += "python3-pybind11"
>>>> -#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>>>> +DEPENDS += "python3-pybind11"
>>>> +EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
>>>>   PACKAGES =+ "${PN}-python"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

