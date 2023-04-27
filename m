Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345A6C7EE25
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:20:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.27080.1682616049121015249
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 10:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YTKjeNYF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj5a113456;
	Thu, 27 Apr 2023 12:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682616045;
	bh=7Jcq7Wr2o8YwR/3MSx4fChYrM7ZZvxusum2P2Go3g9Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YTKjeNYFowp9BplHhTz1hpK6xeylsCbJZ8EKYvWnCaydLvW0y69xRGnkQc7lweXef
	 NvNfkQ4UiPaZHQ0iAxteCsxFHHe9IMcz4KQPgAQAOMEbfPMJ9DtewBJkm2QRsbh0IJ
	 +he6iu3tH+MCgtKv0bFCz7nsS94gTPL9DYvSkIGs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RHKjsL017492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 12:20:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 12:20:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 12:20:45 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RHKj8j110570;
	Thu, 27 Apr 2023 12:20:45 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 4/5] qtwayland: drop the plugins-decorations patch
Date: Thu, 27 Apr 2023 12:20:35 -0500
Message-ID: <20230427172036.863789-5-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172036.863789-1-rs@ti.com>
References: <20230427172036.863789-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 17:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14366

From: Randolph Sapp <rs@ti.com>

This seems like it was a needless patch to guard against garbage from
being shown if the window icon request failed to return any useful icon.
Not necessary.

Add some info about why this bbappend still exists. It's to prefer
wayland over x11 and remove some unoptimized components.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...ons-bradient-display-window-icon-onl.patch | 42 -------------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  8 ++--
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch

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
index df8b5eff..11d8e2ce 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,8 +1,6 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-PR:append = ".arago2"
+# This append exists to modify the PACKAGECONFIG such that the wayland backend
+# is preferred over x11 and unoptimized components are removed.
 
-SRC_URI += " \
-    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
-"
+PR:append = ".arago3"
 
 PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
-- 
2.40.0


