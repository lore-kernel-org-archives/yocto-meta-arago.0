Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039C8C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 21:47:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.196.1652478460774960747
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 14:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74D7340CD2;
	Fri, 13 May 2022 21:47:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q44kr1Gnu94I; Fri, 13 May 2022 21:47:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F49940CCF;
	Fri, 13 May 2022 21:47:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B85C174933; Fri, 13 May 2022 17:47:37 -0400 (EDT)
Date: Fri, 13 May 2022 17:47:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [kirkstone/master][PATCH] arago.conf: switch to
 internal toolchain for now
Message-ID: <20220513214737.GE9834@denix.org>
References: <20220513020008.3048052-1-denis@denix.org>
 <20220513023823.glror67rchv56mah@bottom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513023823.glror67rchv56mah@bottom>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 21:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13863

On Thu, May 12, 2022 at 09:38:23PM -0500, Nishanth Menon wrote:
> On 02:00-20220513, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > Set default to build and use internal toolchain for now, instead of a pre-built
> > external one, as external gcc-11.2 toolchain still requires some work and syncup
> > with latest meta-arm codebase.
> 
> I wonder if we should just settle for internal toolchain and dump the
> entire external toolchain argumentation?

Sure, in due time. There were some concerns about using OE toolchain with the 
SDK, compared to the external toolchain - need to look closer at those.


> Is'nt that more inline with what the rest of the ecosystem is doing?
> 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index b2246537..e24cace9 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -170,7 +170,7 @@ IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') ==
> >  # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
> >  # Set some sane defaults, in case someone forgets to set them in local.conf
> >  TC_SANE_DEFAULT ?= "arm"
> > -TOOLCHAIN_TYPE ?= "external"
> > +TOOLCHAIN_TYPE ?= "internal"
> >  TOOLCHAIN_TYPE:omapl1 = "internal"
> >  TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"

