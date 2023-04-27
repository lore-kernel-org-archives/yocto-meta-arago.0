Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2747C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 19:54:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1839.1682625247257104383
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 12:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2137940C76;
	Thu, 27 Apr 2023 19:54:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EW7Tt29-jRGc; Thu, 27 Apr 2023 19:54:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA63940031;
	Thu, 27 Apr 2023 19:54:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3BE8916386A; Thu, 27 Apr 2023 15:53:21 -0400 (EDT)
Date: Thu, 27 Apr 2023 15:53:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone][PATCHv2 4/5] qtwayland: drop the
 plugins-decorations patch
Message-ID: <20230427195321.GN9226@denix.org>
References: <20230427172036.863789-1-rs@ti.com>
 <20230427172036.863789-5-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427172036.863789-5-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 19:54:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14370

On Thu, Apr 27, 2023 at 12:20:35PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This seems like it was a needless patch to guard against garbage from
> being shown if the window icon request failed to return any useful icon.
> Not necessary.
> 
> Add some info about why this bbappend still exists. It's to prefer
> wayland over x11 and remove some unoptimized components.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  ...ons-bradient-display-window-icon-onl.patch | 42 -------------------
>  .../recipes-qt/qt5/qtwayland_git.bbappend     |  8 ++--
>  2 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
> deleted file mode 100644
> index 33f28390..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 547fd678ba55025c3578f021b40c96b1e91b839e Mon Sep 17 00:00:00 2001
> -From: Eric Ruei <e-ruei1@ti.com>
> -Date: Fri, 9 Sep 2016 16:54:02 -0400
> -Subject: [PATCH] plugins/decorations/bradient: display window icon only if
> - icon.pixmap not null
> -
> -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ----
> - src/plugins/decorations/bradient/main.cpp | 17 ++++++++++-------
> - 1 file changed, 10 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/plugins/decorations/bradient/main.cpp b/src/plugins/decorations/bradient/main.cpp
> -index ea29869..279bff1 100644
> ---- a/src/plugins/decorations/bradient/main.cpp
> -+++ b/src/plugins/decorations/bradient/main.cpp
> -@@ -222,13 +222,16 @@ void QWaylandBradientDecoration::paint(QPaintDevice *device)
> -     // Window icon
> -     QIcon icon = waylandWindow()->windowIcon();
> -     if (!icon.isNull()) {
> --        QPixmap pixmap = icon.pixmap(QSize(128, 128));
> --        QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
> --
> --        QRectF iconRect(0, 0, 22, 22);
> --        p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
> --                                       margins().left() + BUTTON_SPACING, 4),
> --                     scaled, iconRect);
> -+        QPixmap pixmap = icon.pixmap(QSize(128, 128));
> -+        if(!pixmap.isNull())
> -+        {
> -+            QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
> -+
> -+            QRectF iconRect(0, 0, 22, 22);
> -+            p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
> -+                                           margins().left() + BUTTON_SPACING, 4),
> -+                         scaled, iconRect);
> -+        }
> -     }
> - 
> -     // Window title
> --- 
> -1.9.1
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> index df8b5eff..11d8e2ce 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> @@ -1,8 +1,6 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> -PR:append = ".arago2"
> +# This append exists to modify the PACKAGECONFIG such that the wayland backend
> +# is preferred over x11 and unoptimized components are removed.

If changing PACKAGECONFIG is the only need for a bbappend, then you should 
rather do it in the distro config:

https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n72


> -SRC_URI += " \
> -    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
> -"
> +PR:append = ".arago3"
>  
>  PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
> -- 
> 2.40.0

