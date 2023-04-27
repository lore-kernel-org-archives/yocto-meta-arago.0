Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BECC7EE21
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:30:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4672.1682631012401576898
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ycJG88bv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU9cF074827;
	Thu, 27 Apr 2023 16:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682631009;
	bh=t4+ALw3pnCSu8KdAZQYV2f7y0QhcScaDgzvq4M6trGw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ycJG88bvsXS3Roq/wtzamuJ3Ezc5zMJgMho7ExeUHynyU5gvX20d5ZckI3ZjdZapH
	 ae+/STa92uIIpupV9Kon1f+4/VAwPDrGX50yA9zid9dWdesR/tH9VqCbs7dsmOn0KI
	 qRZFtZgjT9jPZ3GBSFAoPblH0DP1hal5L9lO4NHA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RLU9Kb069916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:30:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:30:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:30:08 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RLU807128870;
	Thu, 27 Apr 2023 16:30:08 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCHv3 4/5] qtwayland: drop the plugins-decorations patch
Date: Thu, 27 Apr 2023 16:29:59 -0500
Message-ID: <20230427213000.1923507-5-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427213000.1923507-1-rs@ti.com>
References: <20230427213000.1923507-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14373

From: Randolph Sapp <rs@ti.com>

This seems like it was a needless patch to guard against garbage from
being shown if the window icon request failed to return any useful icon.
Not necessary.

This bbappend has no reason to exist. Move the PACKAGECONFIG
modifications to select wayland over x11 into the distro config.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  1 +
 ...ons-bradient-display-window-icon-onl.patch | 42 -------------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  8 ----
 3 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 58841051..bf54eb2a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -74,6 +74,7 @@ PACKAGECONFIG:append:pn-systemd = " coredump"
 PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO:pn-qtbase = "icu examples accessibility gif gbm kms libinput"
 PACKAGECONFIG_FONTS:pn-qtbase = "fontconfig"
+PACKAGECONFIG:remove:pn-qtwayland = "xcomposite-egl xcomposite-glx"
 
 # Add gstreamer in package configuration to enable video
 PACKAGECONFIG:append:pn-qtmultimedia = " gstreamer"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
deleted file mode 100644
index 33f28390..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 547fd678ba55025c3578f021b40c96b1e91b839e Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 9 Sep 2016 16:54:02 -0400
-Subject: [PATCH] plugins/decorations/bradient: display window icon only if
- icon.pixmap not null
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/plugins/decorations/bradient/main.cpp | 17 ++++++++++-------
- 1 file changed, 10 insertions(+), 7 deletions(-)
-
-diff --git a/src/plugins/decorations/bradient/main.cpp b/src/plugins/decorations/bradient/main.cpp
-index ea29869..279bff1 100644
---- a/src/plugins/decorations/bradient/main.cpp
-+++ b/src/plugins/decorations/bradient/main.cpp
-@@ -222,13 +222,16 @@ void QWaylandBradientDecoration::paint(QPaintDevice *device)
-     // Window icon
-     QIcon icon = waylandWindow()->windowIcon();
-     if (!icon.isNull()) {
--        QPixmap pixmap = icon.pixmap(QSize(128, 128));
--        QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
--
--        QRectF iconRect(0, 0, 22, 22);
--        p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
--                                       margins().left() + BUTTON_SPACING, 4),
--                     scaled, iconRect);
-+        QPixmap pixmap = icon.pixmap(QSize(128, 128));
-+        if(!pixmap.isNull())
-+        {
-+            QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
-+
-+            QRectF iconRect(0, 0, 22, 22);
-+            p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
-+                                           margins().left() + BUTTON_SPACING, 4),
-+                         scaled, iconRect);
-+        }
-     }
- 
-     // Window title
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
deleted file mode 100644
index df8b5eff..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-PR:append = ".arago2"
-
-SRC_URI += " \
-    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
-"
-
-PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
-- 
2.40.0


