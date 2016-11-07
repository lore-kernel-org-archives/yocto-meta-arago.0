Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 5D3CF529B8
	for <meta-arago@arago-project.org>;
	Mon,  7 Nov 2016 19:45:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA7JjJfc007910
	for <meta-arago@arago-project.org>; Mon, 7 Nov 2016 13:45:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA7JjJsf022085
	for <meta-arago@arago-project.org>; Mon, 7 Nov 2016 13:45:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 13:45:19 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uA7JjJhI014553	for <meta-arago@arago-project.org>;
	Mon, 7 Nov 2016 13:45:19 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Nov 2016 14:45:15 -0500
Message-ID: <1478547915-20844-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qtwayland_git: fix null icon.pixmap display warning problem
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2016 19:45:23 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...orations-bradient-display-window-icon-onl.patch | 42 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |  6 ++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
new file mode 100644
index 0000000..33f2839
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-plugins-decorations-bradient-display-window-icon-onl.patch
@@ -0,0 +1,42 @@
+From 547fd678ba55025c3578f021b40c96b1e91b839e Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 9 Sep 2016 16:54:02 -0400
+Subject: [PATCH] plugins/decorations/bradient: display window icon only if
+ icon.pixmap not null
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/plugins/decorations/bradient/main.cpp | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/src/plugins/decorations/bradient/main.cpp b/src/plugins/decorations/bradient/main.cpp
+index ea29869..279bff1 100644
+--- a/src/plugins/decorations/bradient/main.cpp
++++ b/src/plugins/decorations/bradient/main.cpp
+@@ -222,13 +222,16 @@ void QWaylandBradientDecoration::paint(QPaintDevice *device)
+     // Window icon
+     QIcon icon = waylandWindow()->windowIcon();
+     if (!icon.isNull()) {
+-        QPixmap pixmap = icon.pixmap(QSize(128, 128));
+-        QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
+-
+-        QRectF iconRect(0, 0, 22, 22);
+-        p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
+-                                       margins().left() + BUTTON_SPACING, 4),
+-                     scaled, iconRect);
++        QPixmap pixmap = icon.pixmap(QSize(128, 128));
++        if(!pixmap.isNull())
++        {
++            QPixmap scaled = pixmap.scaled(22, 22, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
++
++            QRectF iconRect(0, 0, 22, 22);
++            p.drawPixmap(iconRect.adjusted(margins().left() + BUTTON_SPACING, 4,
++                                           margins().left() + BUTTON_SPACING, 4),
++                         scaled, iconRect);
++        }
+     }
+ 
+     // Window title
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
new file mode 100644
index 0000000..82d98e5
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PR_append = ".arago0"
+
+SRC_URI += " \
+    file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
+"
-- 
1.9.1


