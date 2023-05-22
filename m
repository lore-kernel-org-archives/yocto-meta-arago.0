Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B77C7EE29
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 22:34:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5631.1684794859172869384
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 15:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1BC2D40C37;
	Mon, 22 May 2023 22:34:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWeB0XE0_hxZ; Mon, 22 May 2023 22:34:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E288440429;
	Mon, 22 May 2023 22:34:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 659D31638FB; Mon, 22 May 2023 18:33:29 -0400 (EDT)
Date: Mon, 22 May 2023 18:33:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: rs@ti.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 3/3] all: remove all legacy
 arago-sdk build recipes
Message-ID: <20230522223329.GX9226@denix.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-4-rs@ti.com>
 <14e59972-1f38-b1e8-e3ac-da4c05ede009@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e59972-1f38-b1e8-e3ac-da4c05ede009@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 22:34:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14440

On Mon, May 22, 2023 at 02:38:15PM -0500, Andrew Davis wrote:
> On 5/22/23 1:38 PM, rs@ti.com wrote:
> >From: Randolph Sapp <rs@ti.com>
> >
> >Remove all the legacy arago-sdk build recipies, groups, targets, etc.
> >All of this can be replaced by using the Yocto Standard SDK build
> >target:
> >
> >	bitbake tisdk-default-image -c populate_sdk
> >
> >For more info about the SDK build targets see:
> >https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer
> >
> >There's probably still more that can be cleaned up, but I'll leave that
> >to the more experienced.
> >
> 
> Some documentation around this will need cleaned up next cycle. Plus there are
> parts of the Processor/Auto/EdgeAI SDK layers that live on top of this layer
> that use some of this, they will have to switch to the Yocto Standard SDK now.

1. This cleanup was already in the pipeline, but was planned after the product 
SDKs (Processor/Auto/EdgeAI) adopttion of Kirkstone baseline with 9.x release.

2. Please stop calling something "the Yocto Standard SDK" - both flows are 
quite standard. While meta-toolchain was there earlier, it's still a supported 
and very standard flow. In some cases it is still necessary and preferred. 
Sure, "populate_sdk" is easier for a single image, as the SDK then matches 
that image. But if you need an SDK that doesn't depend on an image, or need 
to cover multiple images, then meta-toolchain is still the way to go. Even 
OE-Core has meta-toolchain for backward compatibility - it just builds the SDK 
with the toolchain in it. And meta-qt5 extends that to build its SDK/toolchain 
with Qt tools. Then AGL defines whole bunch of *-crosssdk recipes that are 
basically meta-toolchain variants for different purposes with different 
content. And so on - many layers still use the old flow and it's still very 
standard. But don't get me wrong - I'm all for simplifying it and removing all 
the customization cruft that got accumulated in 15 years of Arago! Maybe a bit 
more surgical and gradual and with a proper description though? :)

3. Have you tested the new SDK and ensured that all use cases are working as 
expected? Specifically with multiconfig and multiple architectures?

-- 
Denys

