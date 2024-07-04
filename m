Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B93C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 22:54:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6292.1720133643554182820
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Jul 2024 15:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 948E040C7B;
	Thu,  4 Jul 2024 22:54:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlOPSDJMoOrf; Thu,  4 Jul 2024 22:54:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F29940AC9;
	Thu,  4 Jul 2024 22:53:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1F4DF163FE6; Thu,  4 Jul 2024 18:53:59 -0400 (EDT)
Date: Thu, 4 Jul 2024 18:53:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [master][PATCH] weston: adjust bbappend for minor
 version bump
Message-ID: <20240704225352.GM18231@denix.org>
References: <20240702195208.39626-1-denis@denix.org>
 <182eac05-6ae0-4ef1-b779-e67742e8fd7f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182eac05-6ae0-4ef1-b779-e67742e8fd7f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Jul 2024 22:54:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15430

On Wed, Jul 03, 2024 at 08:40:41PM -0500, Ryan Eatmon wrote:
> 
> 
> On 7/2/2024 2:52 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Make bbappend less strict to apply against minor version bumps, such as 3.0.1
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../wayland/{weston_13.0.0.bbappend => weston_13.0.%.bbappend}    | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-arago-distro/recipes-graphics/wayland/{weston_13.0.0.bbappend => weston_13.0.%.bbappend} (100%)
> >
> >diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> >similarity index 100%
> >rename from meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
> >rename to meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> 
> Any good reason to not put this on scarthgap as well?  Just to keep
> them in sync?

I guess it should be fine for scarthgap as well

-- 
Denys

