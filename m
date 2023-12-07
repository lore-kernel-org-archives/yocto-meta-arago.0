Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5827C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 00:58:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.72911.1701910684771601801
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 16:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OOIDLJT7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B70vvxZ014169;
	Wed, 6 Dec 2023 18:57:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701910677;
	bh=DrEZoEOi9mFrpXkxGcXJ8/6BqZDyhnJn9+pyzVAMJGk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OOIDLJT7XM8YD7A2GlHc4LSJZAJ86O2rl85/qL8P2GEa9sBe7u02LKyaXBswhkQSr
	 aaxPJ7AjJmbyCOF3S0mEJItF5HWIHqa+dZis25jVffKR9CH7DkMSeUpIC9o0F9VWRp
	 bPAPLhlSBnYbYtNTecbApvwCi8BvUElqllYM0lqo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B70vvfZ110678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 18:57:57 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 18:57:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 18:57:57 -0600
Received: from [10.249.38.142] ([10.249.38.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B70vv9s072132;
	Wed, 6 Dec 2023 18:57:57 -0600
Message-ID: <658f7403-cb11-4a9f-a85c-7c705295edd0@ti.com>
Date: Wed, 6 Dec 2023 18:57:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH RFC 2/4] gst-plugins-ti: Enable
 network task flag for do_configure
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <sinthu.raja@mistralsolutions.com>, <denys@konsulko.com>,
        <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <u-kumar1@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
 <20231206143618.27770-3-sinthu.raja@ti.com>
 <8851630a-004c-4cfa-8ded-a96a07f8c72f@ti.com>
 <20231206223824.GC11745@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231206223824.GC11745@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Dec 2023 00:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15049



On 12/6/2023 4:38 PM, Denys Dmytriyenko wrote:
> On Wed, Dec 06, 2023 at 09:33:31AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 12/6/2023 8:36 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> The Ducati and VPE gst plugins requires network during the do_configure task
>>> so, enable the network task flag for the same.
>>
>> Why does it require network?  Can you elaborate a little more?
> 
> Because sources in git didn't have common gstreamer-specific autotools
> files, scripts and supporting stuff, which were pulled and setup as a
> "common" git submodule from here:
> git://anongit.freedesktop.org/gstreamer/common
> https://cgit.freedesktop.org/gstreamer/common/
> 
> That is done by autogen.sh in do_configure():
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
> https://git.ti.com/cgit/glsdk/gst-plugin-ducati/tree/autogen.sh
> 
> That's also been the case for git versions of the upstream gstreamer and
> plugins years ago. So, autogen.sh had to be called after do_unpack() and
> before do_configure(), but the former is a python function.
> 
> Released versions of gstreamer and plugins never had this issue, as they
> come with all required pieces already packaged in a tarball.
> 
> All git-versioned recipes for gstreamer and plugins were removed from
> OE-Core almost 7 years ago:
> https://git.openembedded.org/openembedded-core/commit/?id=2b15451e3f1b9fb9a7f44317f3f9cd22d8712ff5
> 
> Moreover, gstreamer builds have migrated from autotools to meson around the
> same time and this "common" submodule/tree hasn't been used or updated for
> quite some time. Unfortunaly, gst-plugins-ti haven't been touched for 5 years
> and still use the old (ancient) "common" submodule for autotools stuff...
> 
> So, proper, but most involved solution would be to migrate gst-plugins-ti to
> use meson.
> 
> Otherwise, you can add the "common" tree to SRC_URI and set the corresponding
> SRCREV. That should satisfy git submodule update, but may need extra tweaking.
> 
> SRC_URI += "git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common"
> SRCREV_common = "011bcc8a0fc7f798ee874a7ba899123fb2470e22"

This is exactly what I was hoping to hear.  That it there was the 
possibility of condensing the network stuff into the SRC_URI to be a 
little more yocto compliant.  I agree that long term all of the stuff 
should be moved to meson like the main gstreamer.


> BTW, this commit ^^^ that is used for "common" submodule in gst-plugins-ti
> is 13 years old and dated 2010-10-27!!!
> 
> 
>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>> ---
>>>   .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 ++
>>>   .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 ++
>>>   2 files changed, 4 insertions(+)
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
>>> index 1ff2dfb0..99a5615c 100644
>>> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
>>> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
>>> @@ -18,4 +18,6 @@ SRC_URI = " \
>>>       file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
>>>   "
>>> +do_configure[network] = "1"
>>> +
>>>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
>>> index 237031b1..25d4d9c2 100644
>>> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
>>> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
>>> @@ -15,3 +15,5 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
>>>   SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
>>>              file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
>>>   "
>>> +
>>> +do_configure[network] = "1"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

