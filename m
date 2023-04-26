Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86113C7EE24
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:32:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5180.1682544740619182981
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dv/wyncE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWHTj111345;
	Wed, 26 Apr 2023 16:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682544737;
	bh=rHPuPD3QWd1e2LUv/UoD0s2Ut2GouifpBrBrwSMZBbs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dv/wyncEnkQf3pKZLXdqJeSeko3+NHDpUNyYqpSnF164rdjJNYjIDFooiPybvl940
	 c3JLC2RtOv5ysQ3TfJYS/zzPrNaEDS8Nyg74DQVWBm1+kRbpnlNOU4TZdRJr2rtLXZ
	 E8zBvQqugeUbUjtXMfVRDHRdqsPQ2SD67l12aUTM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLWHTG088764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:32:17 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:32:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:32:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLWGvk067242;
	Wed, 26 Apr 2023 16:32:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 4/6] qtwayland: drop the plugins-decorations patch
Date: Wed, 26 Apr 2023 16:32:11 -0500
Message-ID: <20230426213214.3501230-5-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426213214.3501230-1-rs@ti.com>
References: <20230426213214.3501230-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14355

From: Randolph Sapp <rs@ti.com>

This seems like it was a needless patch to guard against garbage from
being shown if the window icon request failed to return any useful icon.
Not necessary.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...ons-bradient-display-window-icon-onl.patch | 42 -------------------
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  4 --
 2 files changed, 46 deletions(-)
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
index df8b5eff..e7560d02 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,8 +1,4 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 PR:append = ".arago2"
 
-SRC_URI += " \
-    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
-"
-
 PACKAGECONFIG:remove = "xcomposite-egl xcomposite-glx"
-- 
2.40.0


