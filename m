Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1CFAE529B3
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 22:56:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1KMujWj031108
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:45 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1KMuimX009143
	for <meta-arago@arago-project.org>; Fri, 20 Feb 2015 16:56:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Feb 2015 16:56:44 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1KMuhFQ004184;	Fri, 20 Feb 2015 16:56:43 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t1KMubAi006776;	Sat, 21 Feb 2015 04:26:41 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Feb 2015 16:56:35 -0600
Message-ID: <1424472995-22977-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424472995-22977-1-git-send-email-fcooper@ti.com>
References: <1424472995-22977-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] dual-camera-demo: Move Matrix files to the recipe instead of the git repository
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
X-List-Received-Date: Fri, 20 Feb 2015 22:56:46 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Dual camera demo requires a bit more work to run then other demos and it
  is dependent on what is running on the filesystem.
* Pull these files into a recipe since it will make things alot easier to fix
  incase filesystem changes breaks things.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dual-camera-demo/desc_dual-camera.html         |    7 +++++++
 .../dual-camera-demo/dual-camera.desktop           |   10 ++++++++++
 .../dual-camera-demo/dual_camera_qt4.sh            |   11 +++++++++++
 .../dual-camera-demo/dual_camera_qt5.sh            |    8 ++++++++
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   16 ++++++++++++----
 5 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual-camera.desktop
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
 create mode 100644 meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/desc_dual-camera.html b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
new file mode 100644
index 0000000..e326960
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
@@ -0,0 +1,7 @@
+<h1> Dual Camera Demo </h1>
+
+<p> This example demonstrates the dual camera capabilities of the VPFE and DSS.  If used on an AM437x GP EVM, two camera displays will be available.  Otherwise, one camera feed will be displayed. </p>
+<p>
+<span style="color:red">NOTE: Please make sure the camera module is inserted into AM437x GP EVM header for dual camera functionality. </span>
+</p>
+
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual-camera.desktop b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual-camera.desktop
new file mode 100644
index 0000000..e354488
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual-camera.desktop
@@ -0,0 +1,10 @@
+#!/usr/bin/env xdg-open
+[Desktop Entry]
+Name=Dual Camera Demo
+GenericName=Demo App
+Icon=/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
+Type=Application
+Exec=dual_camera.sh
+Categories=camera
+ProgramType=gui
+X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/dual-camera/desc_dual-camera.html
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
new file mode 100644
index 0000000..7a3e497
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+/etc/init.d/matrix-gui-2.0 stop
+
+export TSLIB_TSDEVICE=/dev/input/touchscreen0
+export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+
+dual_camera -qws
+
+/etc/init.d/matrix-gui-2.0 start
+
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
new file mode 100644
index 0000000..cd137d5
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+/etc/init.d/matrix-gui-2.0 stop
+
+dual_camera
+
+/etc/init.d/matrix-gui-2.0 start
+
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 643daab..7893d01 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,15 +7,22 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r5"
+PR = "r6"
 
 BRANCH = "drm"
 SRCREV = "0c48cb66cc995420dfec2f1fd620c8977f0170aa"
 
-SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
+           file://desc_dual-camera.html \
+           file://dual_camera_qt5.sh \
+           file://dual_camera_qt4.sh \
+           file://dual-camera.desktop \
+"
 
 S = "${WORKDIR}/git"
 
+DEMO_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
+
 inherit qt-provider
 
 export SDK_PATH_TARGET='${STAGING_DIR_HOST}'
@@ -25,8 +32,9 @@ do_install() {
     install -d ${D}/usr/bin
     install -d ${D}${MATRIX_APP_DIR}/dual-camera
     install dual_camera ${D}/usr/bin/dual_camera
-    install dual_camera.sh ${D}/usr/bin/dual_camera.sh
-    install matrix/* ${D}/${MATRIX_APP_DIR}/dual-camera
+    install ${WORKDIR}/${DEMO_SCRIPT} ${D}/usr/bin/dual_camera.sh
+    install ${WORKDIR}/desc_dual-camera.html ${D}/${MATRIX_APP_DIR}/dual-camera
+    install ${WORKDIR}/dual-camera.desktop ${D}/${MATRIX_APP_DIR}/dual-camera
 }
 
 PACKAGES += "matrix-gui-apps-dual-camera"
-- 
1.7.9.5


