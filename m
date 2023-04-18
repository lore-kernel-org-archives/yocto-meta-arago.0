Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BDDC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 22:51:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24658.1681858305427876190
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 15:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28F3840C85;
	Tue, 18 Apr 2023 22:51:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4J2clDC4XY2; Tue, 18 Apr 2023 22:51:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF3BA40C2A;
	Tue, 18 Apr 2023 22:51:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 947D6163819; Tue, 18 Apr 2023 18:51:01 -0400 (EDT)
Date: Tue, 18 Apr 2023 18:51:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [DISCUSSION] Weston-Init and non-root weston
Message-ID: <20230418225101.GY9226@denix.org>
References: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
 <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
 <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
 <ca43165d-5958-0cf9-bac4-527c4bdf94ac@ti.com>
 <d47ad5c3-d613-6aec-bb38-390cda358621@ti.com>
 <94b6af33-a7ed-e5d3-de44-81ca8a58fb2c@ti.com>
 <dfc09bbf-10c0-ec5e-95b0-8e520fb1d782@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfc09bbf-10c0-ec5e-95b0-8e520fb1d782@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Apr 2023 22:51:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14322

On Mon, Apr 17, 2023 at 06:16:19PM -0500, Randolph Sapp wrote:
> On 4/17/23 18:08, Andrew Davis wrote:
> >On 4/17/23 6:01 PM, Randolph Sapp wrote:
> >>On 4/17/23 17:52, Andrew Davis wrote:
> >>>On 4/17/23 5:43 PM, Randolph Sapp wrote:
> >>>>On 4/17/23 17:39, Andrew Davis wrote:
> >>>>>On 4/17/23 5:32 PM, Randolph Sapp wrote:
> >>>>>>Finally getting around to weston-init issue I
> >>>>>>highlighted a while back and there's only one real issue
> >>>>>>preventing us from reusing the base weston-init recipe
> >>>>>>-- our touchscreen auto-configuration script.
> >>>>>>
> >>>>>>That script has to have root access to setup and reload
> >>>>>>udev rules and as we know setuid won't work for shell
> >>>>>>scripts.
> >>>>>>
> >>>>>>I propose we rewrite it in something that can use setuid
> >>>>>>(perl or c or something of the sort). I'm currently
> >>>>>>looking at perl as there's already quite a few core
> >>>>>>recipes that rdepend on it.
> >>>>>>
> >>>>>>Then we just need to inject it into the runWeston script
> >>>>>>and adjust the two init scripts to point at that.
> >>>>>>
> >>>>>>Any concerns or objections?
> >>>>>
> >>>>>Why not just drop out that old touchscreen script, it is a
> >>>>>non-standard way of doing
> >>>>>this task and should be removed.
> >>>>>
> >>>>>Andrew
> >>>>
> >>>>It's non-standard, but that's because there really isn't a
> >>>>good standard for calibrating touch screens under Weston.
> >>>>AFAIK this is still useful.
> >>>
> >>>https://wiki.st.com/stm32mpu/wiki/How_to_calibrate_the_touchscreen
> >>>
> >>>This seems like the standard ^^
> >>>
> >>>Andrew
> >>
> >>That does save the config for the user running weston. Currently
> >>our script saves and loads the config for all users. This could
> >>technically be seen as a regression, but it doesn't seem that
> >>bad to me.
> >
> >Better question than does it provide "any benefit at all": Does the
> >benefit outweigh the hacky-ness and effort needed to maintain
> >and document it?..
> >
> >Andrew
> 
> I would say no, it doesn't outweigh the hacky-ness. Our script
> force-reloads Weston adding an unnecessary delay for every
> recalibration.
> 
> Denys, any input here? Anyone you know of expecting this behavior
> downstream?

There's always a balance between doing things generically and making things 
very user friendly. Finding such balance is not easy - the pendulum has been 
swinging back and forth through the years...

This was one of the earliest out-of-box user experience additions to TI 
SDKs and has been relied upon by downstream products. I don't have strong 
objections for removing this custom code, but you might want to check with 
the corresponding product SDK teams.

-- 
Denys

