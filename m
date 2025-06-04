Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8414C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 19:09:15 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.25408.1749064151513356750
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 12:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dna2vA5e;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554J98m53891499;
	Wed, 4 Jun 2025 14:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749064148;
	bh=qvLbGe/kbtfBIqSz0ZXJq1WwOhmYkqf6VUzSPVkBfo4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dna2vA5etJPHerTfpbOku1q1hFUmsd9aB705OOQYZ2dKo8PpLn7zxmTeaAUIS/jTj
	 IDeCAFtk9m4e8OOtDcGWqnpAcSgu8otnlvlyD4wZ3X0aYO6I7sv6R0mDiIhfw8GGt8
	 KCs9Zt0uPxKA4imzx+HNcTjLOc4cA1PaQNh00Bds=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554J98uN275948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 14:09:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 14:09:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 14:09:07 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554J97Ys2427607;
	Wed, 4 Jun 2025 14:09:07 -0500
Message-ID: <30a53414-accc-4add-96d0-2f4b4d103ada@ti.com>
Date: Wed, 4 Jun 2025 14:09:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics:
 add mesa-demos and sdl2
To: Randolph Sapp <rs@ti.com>, Andrew Davis <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <vijayp@ti.com>
References: <20250602220116.2091347-1-rs@ti.com>
 <4b4f002d-69f1-44e6-a5f0-e5abece7e210@ti.com>
 <DADY4RC641ZA.3BX1QO4JRZVZL@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DADY4RC641ZA.3BX1QO4JRZVZL@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jun 2025 19:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16254



On 6/4/2025 1:05 PM, Randolph Sapp wrote:
> On Tue Jun 3, 2025 at 3:00 PM CDT, Andrew Davis wrote:
>> On 6/2/25 5:01 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Add the new mesa-demos package to this group so that users and scripts
>>> can use eglinfo to query information about supported extensions and
>>> configs for multiple platforms. It also adds vkgears and es2gears to
>>> test Vulkan and GLES 2 respectively.
>>>
>>> Add libsdl2 as it's a useful, minimal graphics toolkit that allows users
>>> to build GLES and Vulkan applications with less boilerplate. We have a
>>> few internal test applications that currently use it.
>>
>> Any reason these applications could not be added here? libsdl2 like other
>> pure libraries should only be added as dependencies of the applications
>> that use them.
>>
>> Andrew
> 
> While I normally agree with this sentiment, there are currently private test
> applications that depend on SDL2. I can tack this directly into the test groups
> if that's preferable. There was just some talk about introducing it as customers
> who don't want the overhead of Qt may find it preferable to raw EGL+GLES.

So... there is a non-public program that we download during testing that 
requires the library to be on the system in order to run?  And this 
program cannot be made available...

In general I agree with Andrew on this.  We should not be randomly 
including libraries in the rootfs that do not have programs that require 
them.

It might better to create a new packagegroup for running these kinds of 
tests and then the test can pull that packagegroup 
(packagegroup-arago-tisdk-graphics-testlibs?) as part of the test.  That 
way we keep the base rootfs cleaner for everyone else *not* running this 
private hidden mystery program.  We can build that packagegroup as part 
of ti-world so that is available in the package feed.


> - Randolph
> 
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>    .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>>> index fc1a5be3..3728ae52 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>>> @@ -9,6 +9,8 @@ inherit packagegroup
>>>    GFX_WAYLAND = "\
>>>        weston-init-arago \
>>>        weston-examples \
>>> +    mesa-demos \
>>> +    libsdl2 \
>>>    "
>>>    
>>>    RDEPENDS:${PN} = "\
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

