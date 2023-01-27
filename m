Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7422C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:13:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.109583.1674843230886535310
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38F3640BD6;
	Fri, 27 Jan 2023 18:13:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9Wymyxx7Dgg; Fri, 27 Jan 2023 18:13:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC3F7406B7;
	Fri, 27 Jan 2023 18:13:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 188A2163712; Fri, 27 Jan 2023 13:13:24 -0500 (EST)
Date: Fri, 27 Jan 2023 13:13:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, rs@ti.com, denys@ti.com, detheridge@ti.com,
	meta-arago@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-arago] [PATCH] all: Remove excessive switches based on
 gpu
Message-ID: <20230127181324.GH22689@denix.org>
References: <20230124231733.2219206-1-rs@ti.com>
 <20230126205801.GE22689@denix.org>
 <D1D4PR.W8OT1AZZ313H@ti.com>
 <46352935-21d8-680c-776b-580bdc333ce6@ti.com>
 <0c318fc9-17b6-7a33-714a-64acb12b48de@ti.com>
 <173E3C7B75F9B49E.686@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173E3C7B75F9B49E.686@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:13:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14193

On Fri, Jan 27, 2023 at 01:03:04PM -0500, Denys Dmytriyenko wrote:
> On Fri, Jan 27, 2023 at 10:52:34AM -0600, Ryan Eatmon wrote:
> > 
> > 
> > On 1/27/2023 9:52, Andrew Davis wrote:
> > >On 1/26/23 6:51 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> > >>On Thu, Jan 26 2023 at 03:58:01 PM -0500, Denys Dmytriyenko
> > >><denis@denix.org> wrote:
> > >>>I'm realizing now that simply depending on "opengl"
> > >>>DISTRO_FEATURES won't be
> > >>>enough, unfortunately.
> > >>>
> > >>>The issue is that DISTRO_FEATURES are set by the distro globally for all
> > >>>machines, whether with accelerated graphics, display w/o acceleration or
> > >>>completely headless. E.g. when building for J7200, "opengl"
> > >>>will be set, but
> > >>>none of the graphics packages should be built or installed
> > >>>into the image.
> > >>>
> > >>>So, some sort of check for MACHINE_FEATURES or PREFERRED_PROVIDER (less
> > >>>elegant) would still be needed in some places...
> > >>
> > >>Arguably that's a package group / distro target issue. I believe
> > >>when a user selects the default image with all features enabled
> > >>for J721E and J721S2 the package selection should be equivalent
> > >>(or at least as equivalent as possible with the stuff going on
> > >>now in meta-ti) to align with the distro features selected. I
> > >>believe the solution to this is to add a headless target/image
> > >>that removes Qt, GTK, etc. from the selected package groups and
> > >>to suggest the use of that instead if users want a truly
> > >>headless distro.
> > >>
> > >>
> > >
> > >Agree here, I believe this was the solution we came up with in
> > >our call the other day.
> > >
> > >I'd go as far as suggesting we drop the "default" image and try to match
> > >Ubuntu naming here. Have 3 images: Desktop, Server, and IoT. (IoT is
> > >a rebranded tisdk-thinlinux-image). User selects the one that matches
> > >their usecase, no need to force them into one bucket automatically based
> > >on their hardware.
> > >
> > >Andrew
> > 
> > 
> > That level of renaming will likely require a broader audience.  I
> > agree that it would be clearer naming to follow what other
> > distributions do and not invent our own names.
> 
> Agree. As I mentioned on the call yesterday, last round of image (re-)naming 
> took quite a while and lots of effort to get everyone on the product side 
> aligned and agree...

BTW, you should still be able to find the corresponding internal Confluence 
page with that activity and related discussions.


> Moreover, images is just part of the problem - some thought needs to be put 
> into how the devkit is produced (and or named) and the top-level SDK product 
> bundle, which combines all images, devkit and docs/manifests.

