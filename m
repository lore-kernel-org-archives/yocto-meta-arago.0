Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398BC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 20:07:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23638.1707854857680078274
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 12:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D954F40C56;
	Tue, 13 Feb 2024 20:07:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTKig-30FxDv; Tue, 13 Feb 2024 20:07:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09DFD406B9;
	Tue, 13 Feb 2024 20:07:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 425F5163E90; Tue, 13 Feb 2024 15:07:31 -0500 (EST)
Date: Tue, 13 Feb 2024 15:07:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: detheridge@ti.com, meta-arago@lists.yoctoproject.org, reatmon@ti.com,
	denys@konsulko.com
Subject: Re: [meta-arago][kirkstone][PATCHv2 2/4] meta-arago: distro: add a
 bbappend to patch the chromium browser
Message-ID: <20240213200731.GA1572@denix.org>
References: <20240209185635.32675-1-detheridge@ti.com>
 <20240209185635.32675-3-detheridge@ti.com>
 <20240213185921.GM15614@denix.org>
 <819a7cd2-2f3f-4ade-8e00-0dc6bd40ce1d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <819a7cd2-2f3f-4ade-8e00-0dc6bd40ce1d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 20:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15181

On Tue, Feb 13, 2024 at 01:17:25PM -0600, Randolph Sapp wrote:
> On 2/13/24 12:59, Denys Dmytriyenko wrote:
> >On Fri, Feb 09, 2024 at 12:56:33PM -0600, Etheridge, Darren via lists.yoctoproject.org wrote:
> >>From: Darren Etheridge <detheridge@ti.com>
> >>
> >>This applies a patch for meta-browser/chromium-ozone-wayland to make the
> >>sandboxing work with the Imagination GPU components without the need for
> >>the --no-sandbox flag.
> >>
> >>GPU acceleration in Chromium is dependant on IMG DDK 23.3.  It works
> >>across AXE/BXS/8XE GPU's.   No acceleration is expected for SGX.
> >>
> >>Also add an upstream patch to stop Chromium from segfaulting when it is
> >>run with no input devices connected to the board.
> >>Patch was retrieved from:
> >>https://chromium.googlesource.com/chromium/src/+/323077958301bc321d840a2c2b983ab469934753
> >>
> >>Signed-off-by: Darren Etheridge <detheridge@ti.com>
> >>---
> >>
> >>v2 Fixed typo on bbappend in subject
> >>
> >>  meta-arago-distro/conf/layer.conf             |  2 +
> >>  ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
> >>  ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 +++++++++++++++++++
> >>  ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
> >>  4 files changed, 136 insertions(+)
> [snip]
> >
> > Both chromium patches are missing Upstream-Status: tag - I guess
> first should
> > be "Inappropriate [TI RGX specific]" and the second "Backport" if
> it's already
> > merged upstream:
> > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status
> >
> 
> One for these patches is directly from upstream Chromium. Only one
> is RGX specific

And that's exactly what I said.


> but thanks for linking the naming reference so we
> can make this clear.

