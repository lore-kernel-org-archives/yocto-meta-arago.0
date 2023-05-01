Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABDFC77B7C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 19:08:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.103940.1682968126547294624
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 May 2023 12:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zBiH0XRw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 341J8f3e047812;
	Mon, 1 May 2023 14:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682968121;
	bh=fsaeT6VZaKWPPCk3iaR0/HgFqru/F6U3sDvTB74JWuc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=zBiH0XRw3vCvHFWD6pPnIHebQpTKJAAodSS7LguxFexzzqY7f50BNA2GVcj4Ya96t
	 Om2y8EkVoaDEgrzqjyEkCGGc9OLfgIJZe9pZUKVLwm+5ia1T2ysr3HuPXlS1HzOTWm
	 sEDwbwn/FYwOQSaXJ7UGt8lau96de2Fb7hHZoYRk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 341J8fo0072303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 May 2023 14:08:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 May 2023 14:08:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 May 2023 14:08:40 -0500
Received: from [10.249.32.181] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 341J8ex2009150;
	Mon, 1 May 2023 14:08:40 -0500
Message-ID: <696be171-120c-87eb-d987-251a3afb9d8e@ti.com>
Date: Mon, 1 May 2023 14:08:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-gst:
 Disable vpe and ducati plugins
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230501163915.10612-1-reatmon@ti.com>
 <20230501165551.GV9226@denix.org>
 <3c531a0e-7c07-16ce-5fce-084c66cdb5c6@ti.com>
 <20230501184934.GW9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230501184934.GW9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 May 2023 19:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14384



On 5/1/2023 13:49, Denys Dmytriyenko wrote:
> On Mon, May 01, 2023 at 01:39:12PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 5/1/2023 11:55, Denys Dmytriyenko wrote:
>>> On Mon, May 01, 2023 at 11:39:15AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> The code for the plugins uses dma allocation code that we add in with a
>>>> patch.  Theoretically we no longer need that code and can use some
>>>> upstreamed dma buffer allocation code.  The work to rewrite these
>>>> plugins to support the newer gstreamer versions needs to be scheduled.
>>>
>>> I'm guessing you are missing this in "ltsprep" and other brandings:
>>> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/include/branding-core.inc#n15
>>>
>>> But it is a more broader approach, so maybe surgically disabling individual
>>> components and re-enabling "mmip" machine feature in "core" is better...
>>
>> It's not that I missed it, but evn running ltsprep the recipes were
>> being included and they fail to build.  So something else must be
>> going on to make them be included.  Let me look into it.
>>
>> I still need to understand why we did not see these build failures
>> in kirkstone-wip.  Because these errors are related to the version
>> of gstreamer and the bbappends not being applied.  And the only time
>> these tests were turned off was under ltsprep...  Odd.
> 
> I think you got it in reverse: "mmip" is being completely disabled for default
> "core" builds, but not for "ltsprep" ones, hence you see the breakage there.

Ahhhh... gotcha... Yes.  That is what is missing.  I'll remove this 
patch and add that to the ltsprep brand file.

> 
>>>> In the meantime, disable using these plugins that cause build errors.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>>   .../recipes-core/packagegroups/packagegroup-arago-gst.bb      | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>>>> index e8a639bd..2184ab58 100644
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
>>>> @@ -27,8 +27,8 @@ GSTREAMER_DEPS:append:dra7xx = " \
>>>>   "
>>>>   GSTREAMER_ACCEL_MM = ""
>>>> -GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
>>>> -GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
>>>> +#GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
>>>> +#GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
>>>>   RDEPENDS:${PN} = "\
>>>>       ${GSTREAMER_DEPS} \
>>>> -- 
>>>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

