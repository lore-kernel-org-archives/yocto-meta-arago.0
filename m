Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 231E2529DA
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 11:58:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DBw8CP011012
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 06:58:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DBw73A015241
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 06:58:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 06:58:06 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DBw6of022302;
	Fri, 13 Mar 2015 06:58:06 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWOEA-0007NC-EX;
	Fri, 13 Mar 2015 07:58:06 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 07:58:04 -0400
Message-ID: <1426247884-28312-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] dual-camera-demo: Get latest fixes for fully removing PIP box.
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
X-List-Received-Date: Fri, 13 Mar 2015 11:58:09 -0000
Content-Type: text/plain

* Also add workaround to disable blinking cursor.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 --------------------
 .../dual-camera-demo/dual_camera_qt5.sh            |    4 +++
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   10 ++-----
 3 files changed, 6 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
deleted file mode 100644
index a544c87..0000000
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 42653f94bbaff15d04ec527add6eeb3082ab4873 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 4 Mar 2015 12:00:45 -0500
-Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- Makefile.build |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.build b/Makefile.build
-index d715722..fdea3d8 100644
---- a/Makefile.build
-+++ b/Makefile.build
-@@ -9,11 +9,11 @@ all: release
- .PHONY: qmake
- qmake : dual_camera.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=release dual_camera.pro
-+	qmake CONFIG+=release dual_camera.pro
- 
- qmake_debug : dual_camera.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=debug dual_camera.pro
-+	qmake CONFIG+=debug dual_camera.pro
- 
- debug : qmake_debug
- 	@. ${ENV_SETUP}; \
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
index cd137d5..9bf560b 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
@@ -2,7 +2,11 @@
 
 /etc/init.d/matrix-gui-2.0 stop
 
+echo 0 > /sys/class/graphics/fbcon/cursor_blink
+
 dual_camera
 
+echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
 /etc/init.d/matrix-gui-2.0 start
 
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 4f7d835..e882cad 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r7"
+PR = "r8"
 
 BRANCH = "drm"
-SRCREV = "0c48cb66cc995420dfec2f1fd620c8977f0170aa"
+SRCREV = "4ede12a9c6b51b7693b005b00a715056e99fa7a0"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
@@ -19,12 +19,6 @@ SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=gi
            file://dual-camera.desktop \
 "
 
-QT5_DIFF = " \
-    file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
-"
-
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
-
 S = "${WORKDIR}/git"
 
 DEMO_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
-- 
1.7.9.5


