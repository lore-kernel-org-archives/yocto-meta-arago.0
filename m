Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AFE0752A52
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:23:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24KN7rW007304
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:23:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24KN6Jc027474
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:23:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 14:23:06 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24KN64f012060;	Wed, 4 Mar 2015 14:23:06 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTFow-0000W6-8f;
	Wed, 04 Mar 2015 15:23:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 15:22:59 -0500
Message-ID: <1425500579-1954-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] dual-camera-demo: patch Makefile.build to work with Qt5
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
X-List-Received-Date: Wed, 04 Mar 2015 20:23:08 -0000
Content-Type: text/plain

Makefile.build is only used when building from within SDK through a
top-level SDK Makefile.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 ++++++++++++++++++++
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |    8 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
new file mode 100644
index 0000000..a544c87
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
@@ -0,0 +1,31 @@
+From 42653f94bbaff15d04ec527add6eeb3082ab4873 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 4 Mar 2015 12:00:45 -0500
+Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ Makefile.build |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.build b/Makefile.build
+index d715722..fdea3d8 100644
+--- a/Makefile.build
++++ b/Makefile.build
+@@ -9,11 +9,11 @@ all: release
+ .PHONY: qmake
+ qmake : dual_camera.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=release dual_camera.pro
++	qmake CONFIG+=release dual_camera.pro
+ 
+ qmake_debug : dual_camera.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=debug dual_camera.pro
++	qmake CONFIG+=debug dual_camera.pro
+ 
+ debug : qmake_debug
+ 	@. ${ENV_SETUP}; \
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 7893d01..4f7d835 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "drm"
 SRCREV = "0c48cb66cc995420dfec2f1fd620c8977f0170aa"
@@ -19,6 +19,12 @@ SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=gi
            file://dual-camera.desktop \
 "
 
+QT5_DIFF = " \
+    file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
+"
+
+SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
+
 S = "${WORKDIR}/git"
 
 DEMO_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
-- 
1.7.9.5


