Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC0EC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 22:34:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.31288.1674081246344220458
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 14:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N8CDNCYL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30IMY2xD038761;
	Wed, 18 Jan 2023 16:34:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674081242;
	bh=8wL5SSScM4M/TsOXDzrsgkIUaB0lQxlGKteQs4m2F+M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N8CDNCYLcLlbE7mGo5H0qcoiMgrohnI3K2iFs4c0b3xS1VisanpzUQs2jM+R/TR4g
	 8yjMUgnCmVzRpkBTUBc6e8LVsiaP/UUqvzUDknAdaPT3n7MtvPf+bUEhRTIK6X8i5d
	 1LVP9bpzJwzHgE0j6I3f6/Ltly3zvVzClipge0k4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30IMY2Mr121473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jan 2023 16:34:02 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 18
 Jan 2023 16:34:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 18 Jan 2023 16:34:01 -0600
Received: from [10.250.34.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30IMY1Rl115311;
	Wed, 18 Jan 2023 16:34:01 -0600
Message-ID: <cd8bfcd1-b931-eb36-f9a5-81bdefdcd447@ti.com>
Date: Wed, 18 Jan 2023 16:34:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] weston: update bbappend
 9.0.0 -> 10.0.2
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230104190739.27676-1-afd@ti.com>
 <20230104210711.GL22689@denix.org>
 <703f4c52-85a0-598e-c6c9-2e08d2048614@ti.com>
 <20230118215007.GK22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230118215007.GK22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Jan 2023 22:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14173

On 1/18/23 3:50 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 04, 2023 at 04:15:44PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 1/4/23 3:07 PM, Denys Dmytriyenko wrote:
>>> On Wed, Jan 04, 2023 at 01:07:39PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>>>> To match upstream oe-core/master.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   ...equire-GL_EXT_unpack_subimage-commit.patch | 91 +++++++++++++++++++
>>>>   ...ct-plane-based-on-current-attached-C.patch | 52 +++++------
>>>>   ..._9.0.0.bbappend => weston_10.0.2.bbappend} |  3 +-
>>>>   3 files changed, 115 insertions(+), 31 deletions(-)
>>>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>>>   rename meta-arago-distro/recipes-graphics/wayland/{weston_9.0.0.bbappend => weston_10.0.2.bbappend} (78%)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>>> new file mode 100644
>>>> index 00000000..8bc882fb
>>>> --- /dev/null
>>>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>>> @@ -0,0 +1,91 @@
>>>> +From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
>>>> +From: Andrew Davis <afd@ti.com>
>>>> +Date: Thu, 6 Oct 2022 15:49:31 -0500
>>>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>>>> +
>>>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>>>> +
>>>> +That commit removed support for GPU drivers without GL_EXT_unpack_subimage
>>>> +which SGX does not support. Add back support for GPUs without this
>>>> +extension.
>>>
>>> The obvious question - how safe is it to assume GL_EXT_unpack_subimage is
>>> not being used some place else outside of this commit and not guarded by:
>>>
>>> if (!gr->has_unpack_subimage)
>>>
>>>
>>> Is this extention really in the driver, or just in a Mesa API translation
>>> layer? Could it be better fixed in the DDK?
>>>
>>
>> You are right, it is not a very safe assumption, this patch is almost certainly
>> not complete for all cases. And even if it was, it only fixes Weston, others like
>> wlroots have the same issues[0], so other compositors are going to be broken too.
>>
>> Long term this extension will need added to the driver. Unfortunately all work on
>> keeping this driver alive is unofficial, and I just don't have the free time to
>> add and test new extensions right now :(
>>
>> Andrew
>>
>> [0] https://github.com/tmlind/wlroots/commit/04491889240bbadb693aa37036dc55835118b2cc
> 
> Ryan,
> 
> I see you are pulling this patch to the WIP branches - what's the consensus
> here? As discussed, this is a very partial solution. Moreover, it only "fixes"
> meta-arago, so won't help people using just meta-ti with other distros...
> 

Partial solution is better than no solution, right? Today even *with* meta-arago
your images will have broken graphics, at least with this we can start building
and testing some part of the graphics stack kirkstone.

(I don't like half-measures either, but it's all I have today)

Andrew

