Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E42C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 22:58:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.60674.1674169108803845563
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 14:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9F4740C88;
	Thu, 19 Jan 2023 22:58:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OBYxYp_pEjm; Thu, 19 Jan 2023 22:58:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C194740C2B;
	Thu, 19 Jan 2023 22:58:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B3ED2163701; Thu, 19 Jan 2023 17:58:06 -0500 (EST)
Date: Thu, 19 Jan 2023 17:58:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] weston: update bbappend
 9.0.0 -> 10.0.2
Message-ID: <20230119225806.GN22689@denix.org>
References: <20230104190739.27676-1-afd@ti.com>
 <20230104210711.GL22689@denix.org>
 <703f4c52-85a0-598e-c6c9-2e08d2048614@ti.com>
 <20230118215007.GK22689@denix.org>
 <cd8bfcd1-b931-eb36-f9a5-81bdefdcd447@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd8bfcd1-b931-eb36-f9a5-81bdefdcd447@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Jan 2023 22:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14176

On Wed, Jan 18, 2023 at 04:34:00PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 1/18/23 3:50 PM, Denys Dmytriyenko wrote:
> >On Wed, Jan 04, 2023 at 04:15:44PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>On 1/4/23 3:07 PM, Denys Dmytriyenko wrote:
> >>>On Wed, Jan 04, 2023 at 01:07:39PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>To match upstream oe-core/master.
> >>>>
> >>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>---
> >>>>  ...equire-GL_EXT_unpack_subimage-commit.patch | 91 +++++++++++++++++++
> >>>>  ...ct-plane-based-on-current-attached-C.patch | 52 +++++------
> >>>>  ..._9.0.0.bbappend => weston_10.0.2.bbappend} |  3 +-
> >>>>  3 files changed, 115 insertions(+), 31 deletions(-)
> >>>>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> >>>>  rename meta-arago-distro/recipes-graphics/wayland/{weston_9.0.0.bbappend => weston_10.0.2.bbappend} (78%)
> >>>>
> >>>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> >>>>new file mode 100644
> >>>>index 00000000..8bc882fb
> >>>>--- /dev/null
> >>>>+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> >>>>@@ -0,0 +1,91 @@
> >>>>+From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
> >>>>+From: Andrew Davis <afd@ti.com>
> >>>>+Date: Thu, 6 Oct 2022 15:49:31 -0500
> >>>>+Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
> >>>>+
> >>>>+This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
> >>>>+
> >>>>+That commit removed support for GPU drivers without GL_EXT_unpack_subimage
> >>>>+which SGX does not support. Add back support for GPUs without this
> >>>>+extension.
> >>>
> >>>The obvious question - how safe is it to assume GL_EXT_unpack_subimage is
> >>>not being used some place else outside of this commit and not guarded by:
> >>>
> >>>if (!gr->has_unpack_subimage)
> >>>
> >>>
> >>>Is this extention really in the driver, or just in a Mesa API translation
> >>>layer? Could it be better fixed in the DDK?
> >>>
> >>
> >>You are right, it is not a very safe assumption, this patch is almost certainly
> >>not complete for all cases. And even if it was, it only fixes Weston, others like
> >>wlroots have the same issues[0], so other compositors are going to be broken too.
> >>
> >>Long term this extension will need added to the driver. Unfortunately all work on
> >>keeping this driver alive is unofficial, and I just don't have the free time to
> >>add and test new extensions right now :(
> >>
> >>Andrew
> >>
> >>[0] https://github.com/tmlind/wlroots/commit/04491889240bbadb693aa37036dc55835118b2cc
> >
> >Ryan,
> >
> >I see you are pulling this patch to the WIP branches - what's the consensus
> >here? As discussed, this is a very partial solution. Moreover, it only "fixes"
> >meta-arago, so won't help people using just meta-ti with other distros...
> >
> 
> Partial solution is better than no solution, right? Today even *with* meta-arago
> your images will have broken graphics, at least with this we can start building
> and testing some part of the graphics stack kirkstone.
> 
> (I don't like half-measures either, but it's all I have today)

Ok, sounds fair... Next question - was it tested and is it supposed to 
build/work? Or is it again a maintainers' problem? :)

-- 
Denys

