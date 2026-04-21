Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9250EF94CA0
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 18:28:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43279.1776796084745711567
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 11:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EEA5340C37;
	Tue, 21 Apr 2026 18:28:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfTMryEGeOkl; Tue, 21 Apr 2026 18:28:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C085740031;
	Tue, 21 Apr 2026 18:28:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2183617C4D4; Tue, 21 Apr 2026 14:28:01 -0400 (EDT)
Date: Tue, 21 Apr 2026 14:28:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	"Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: Re: [meta-arago] [master][PATCH] mesa-demos: set default
 PREFERRED_VERSION
Message-ID: <20260421182801.GE4186@denix.org>
References: <20260420195557.22133-1-denis@denix.org>
 <37e9ff17-ca6c-414f-ba39-84f763983ceb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e9ff17-ca6c-414f-ba39-84f763983ceb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Apr 2026 18:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17480

On Tue, Apr 21, 2026 at 08:20:52AM -0500, Ryan Eatmon wrote:
> 
> 
> On 4/20/2026 2:55 PM, Denys Dmytriyenko wrote:
> >From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> >
> >Set default PREFERRED_VERSION for mesa-demos to use the version from
> >OE-Core when not using Arago distro. When Arago distro is used, it
> >gets changed to our version in arago-prefs.conf
> >This addresses the signature change issue in yocto-check-layer.
> 
> This means we have to stay on top of this change for when they
> change the version from 9.0.0 to something else.  We will be
> preferring a version that no longer exists.

Yes, this is correct and rather inconvenient. But lowering DEFAULT_PREFERENCE 
won't work here, as meta-arago-distro has a higher layer priority than OE-Core 
and hence supersedes the recipe's DEFAULT_PREFERENCE.

It's either keep track of the OE-Core version or convert the recipe to a 
bbappend, like you already did.

Specifically in this case it's not so bad - OE-Core has version 9.0.0 and 
Randolph's updated local version pulls additional commits that were merged 
after the release, making it 9.0.0+git. So, when a new version comes out and 
OE-Core updates the recipe, we would anyway need to remove our local version.


> Need to think on this.  Thanks for tracking down an alternative solution.
> 
> 
> >Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> >---
> >  meta-arago-distro/conf/layer.conf                         | 2 ++
> >  meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb | 1 -
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> >index 2ad036f5..af3be2b9 100644
> >--- a/meta-arago-distro/conf/layer.conf
> >+++ b/meta-arago-distro/conf/layer.conf
> >@@ -39,3 +39,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> >  "
> >  HOSTTOOLS_NONFATAL += "corkscrew getent socket"
> >+
> >+PREFERRED_VERSION_mesa-demos = "9.0.0"
> >diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >index 2da3ceff..62cb0ee6 100644
> >--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> >@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481
> >  SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
> >  SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> >-DEFAULT_PREFERENCE = "-1"
> >  PV = "9.0.0+git"
> >  inherit meson pkgconfig features_check

