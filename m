Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6961152A9A
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:35:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HZjT3011620
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:45 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HZjCT021906
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:35:46 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s84HZix2026612;	Thu, 4 Sep 2014 12:35:45 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s84HZgk0032659;	Thu, 4 Sep 2014 23:05:43 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 12:35:38 -0500
Message-ID: <1409852140-13616-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/3] qtwayland: Fix windows margin issue when using touch events.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:35:49 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This is another QtWayland bug that was discussed in the Qt bug report:
  https://bugreports.qt-project.org/browse/QTBUG-36602
* Patch link:
    https://codereview.qt-project.org/#/c/93664/

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-Wayland-correct-touch-location.patch      |   31 ++++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |    5 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
new file mode 100644
index 0000000..caa6dff
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
@@ -0,0 +1,31 @@
+From ae54be549e6ebeef829d5c1089d5307d00d0b791 Mon Sep 17 00:00:00 2001
+From: Shawn Rutledge <shawn.rutledge@digia.com>
+Date: Mon, 1 Sep 2014 15:30:42 +0200
+Subject: [PATCH] Wayland: correct touch location
+
+The window margins were offsetting the touch point in the wrong
+direction.
+
+Task-number: QTBUG-36602
+Change-Id: Id8b31d2de4051f36d3ff4e088bbc9bd7cc84ca13
+Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
+---
+ src/client/qwaylandinputdevice.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/client/qwaylandinputdevice.cpp b/src/client/qwaylandinputdevice.cpp
+index 4a100f7..014303f 100644
+--- a/src/client/qwaylandinputdevice.cpp
++++ b/src/client/qwaylandinputdevice.cpp
+@@ -921,7 +921,7 @@ void QWaylandInputDevice::handleTouchPoint(int id, double x, double y, Qt::Touch
+ 
+         tp.area = QRectF(0, 0, 8, 8);
+         QMargins margins = win->frameMargins();
+-        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x+margins.left(), y+margins.top())));
++        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x - margins.left(), y - margins.top())));
+     }
+ 
+     tp.state = state;
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
index dca1710..336484b 100644
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,8 +1,9 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://0001-Fix-touch-with-Weston.patch"
+SRC_URI += "file://0001-Fix-touch-with-Weston.patch \
+            file://0001-Wayland-correct-touch-location.patch"
 
 
 QT_MODULE_BRANCH = "5.4"
-- 
1.7.9.5


