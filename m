Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6301C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 20:49:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5228.1686257395000477508
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 13:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 109CD40C93;
	Thu,  8 Jun 2023 20:49:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BLGZVPK9iPl; Thu,  8 Jun 2023 20:49:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D21F240C16;
	Thu,  8 Jun 2023 20:49:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 800101639C9; Thu,  8 Jun 2023 16:49:03 -0400 (EDT)
Date: Thu, 8 Jun 2023 16:49:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] kms++: Restore pybind11 support
Message-ID: <20230608204903.GD9226@denix.org>
References: <20230608183641.30832-1-reatmon@ti.com>
 <20230608185719.GC9226@denix.org>
 <ccec32a8-4cbc-9f43-1f3f-e16e1aae36de@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccec32a8-4cbc-9f43-1f3f-e16e1aae36de@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 20:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14559

On Thu, Jun 08, 2023 at 02:39:17PM -0500, Ryan Eatmon wrote:
> 
> 
> On 6/8/2023 1:57 PM, Denys Dmytriyenko wrote:
> >On Thu, Jun 08, 2023 at 01:36:41PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Having this turned off is causing build errors and the errors that
> >>disabling pybind11 solved do not appear to be in master any more.
> >
> >Yeah, I already had this change in my local queue for master, but have been
> >fighting other upstream issues...
> 
> Do you have other fixes for the optee CFG_DT issues, and the
> binutils-cross-canadian qa errors?  Or should I keep looking into
> those?

Yes, I believe I did mention this on our call couple of days ago...
optee issue is being discussed on meta-arm list and binutils on oe-core list.


> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >
> >Tested-by: Denys Dmytriyenko <denys@konsulko.com>
> >
> >
> >>---
> >>  meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> >>index eb39736c..56b83c7a 100644
> >>--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> >>+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> >>@@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
> >>  DEPENDS = "drm fmt"
> >>-# New meson build system fails to find pybind11 in sysroot, disable for now
> >>-#DEPENDS += "python3-pybind11"
> >>-#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
> >>+DEPENDS += "python3-pybind11"
> >>+EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
> >>  PACKAGES =+ "${PN}-python"

