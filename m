Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D55C02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 20:55:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7944.1738097754468111461
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 12:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CDA4840CBA;
	Tue, 28 Jan 2025 20:55:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 063p2ma41hJL; Tue, 28 Jan 2025 20:55:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D71340BD4;
	Tue, 28 Jan 2025 20:55:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5F3961641B9; Tue, 28 Jan 2025 15:55:50 -0500 (EST)
Date: Tue, 28 Jan 2025 15:55:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: "Etheridge, Darren" <detheridge@ti.com>, rs@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
Message-ID: <20250128205550.GI21836@denix.org>
References: <20250123201215.2812931-1-detheridge@ti.com>
 <20250123212031.GZ21836@denix.org>
 <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
 <20250128203023.GH21836@denix.org>
 <b5d8f183-3222-44b6-a91d-12f5cb006689@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5d8f183-3222-44b6-a91d-12f5cb006689@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 20:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15771

On Tue, Jan 28, 2025 at 02:43:25PM -0600, Ryan Eatmon wrote:
> On 1/28/2025 2:30 PM, Denys Dmytriyenko wrote:
> >On Fri, Jan 24, 2025 at 01:58:08PM -0600, Etheridge, Darren wrote:
> >>On 1/23/2025 3:20 PM, Denys Dmytriyenko wrote:
> >>>A more generic question:
> >>>
> >>>There are now multiple configs with meta-browser and meta-selinux listed:
> >>>
> >>>* arago-scarthgap: both meta-browser and meta-selinux are disabled
> >>>* arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is disabled
> >>>* arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is enabled
> >>>
> >>>Since there are now separate configs, should they be cleaned up and layers
> >>>that are disabled or unused removed from them? That way when you need to bump
> >>>say meta-browser, you just need to update one config, not all 3.
> >>>
> >>
> >>This whole thing was a compromise because we didn't want to take the
> >>hit of building Chromium for every config.  But we did want to give
> >>the ability to enable Chromium easily in every config.  So we just
> >>comment it out and leave it up to the end user to uncomment it if
> >>they want Chromium to get built and burn several hours.  Maybe there
> >>is a nicer way to do it, but at the time this is what we came up
> >>with that worked for everybody involved.
> >
> >Yes, back in Dunfell days this was exactly the case - there was a single main
> >config file with meta-browser being commented out (as it also depended on
> >deprecated Python2). Before that I kept it at an old commit that still allowed
> >Chromium to be built with gcc and didn't require clang (and very long builds).
> >
> >Anyway, with Kirkstone and Scarthgap, you now have separate configs for builds
> >with meta-browser/Chromium enabled, as well as meta-selinux enabled. My point
> >being, since there are separate configus for such builds, why still keep
> >commented out references in the main config?
> >
> >I.e. people can use arago-scarthgap-chromium config directly to get a build
> >with Chromium enabled, instead of manually modifying the main arago-scarthgap
> >config in order to enable Chromium...
> 
> I think part of the issue is if you use our "locked down" configs
> with the SHAs for each of the layers that each snapshot build
> produces, then you can just uncomment the line and move on.  If it
> is a separate config, then you need to add the chromium line to the
> locked down config.  Does that make sense?

Hmm, are those locked down configs available anywhere, or are those internal 
only?

Either way, I was just looking at making everyone's life easier, but if the 
opposite is easier for your workflow, so be it :)

-- 
Denys

