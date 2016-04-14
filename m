Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 2477B52A80
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 20:04:34 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N00F123R39GA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Apr 2016 15:04:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=T_g1ERISvjS-8UDjmaoA:9
Received: by 100.15.86.14 with SMTP id 2751f9c4; Thu, 14 Apr 2016 20:04:15 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D21C3161FA9;	Thu,
	14 Apr 2016 16:04:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Apr 2016 16:04:14 -0400
Message-id: <1460664254-28326-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup*: disable opencl on AM5/DRA7 due to dependency on cmem
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
X-List-Received-Date: Thu, 14 Apr 2016 20:04:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb            | 10 +++++-----
 .../packagegroup-arago-tisdk-addons-sdk-target.bb          |  7 ++++---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 14 +++++++-------
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb       | 12 ++++++------
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb        |  8 ++++----
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb      |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb   |  4 ++--
 7 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index e27f382..6067982 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,10 +31,10 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
-UTILS_append_dra7xx = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
+#UTILS_append_dra7xx = " \
+#    opencl-examples-src \
+#    openmpacc-examples-src \
+#"
 
 #    linalg-examples-src
 #UTILS_append_k2hk-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7d3647e..748ea1a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r29"
+PR = "r30"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -119,11 +119,12 @@ EXTRA_LIBS_append_k2e-evm = "\
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
+
+#                        opencl-staticdev
+#                        openmpacc-dev
 UTILS_append_dra7xx = " canutils-dev \
-                        opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
-                        openmpacc-dev \
 "
 #                          linalg-dev
 #UTILS_append_k2hk-evm = " opencl-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 206c4d0..a45d641 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r47"
+PR = "r48"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -58,11 +58,11 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
 
+#                        opencl-examples
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
-                        opencl-examples \
 "
 
 UTILS_append_keystone = " \
@@ -103,11 +103,11 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
 "
-EXTRA_PACKAGES_append_dra7xx = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
+#EXTRA_PACKAGES_append_dra7xx = " \
+#    opencl-staticdev \
+#    opencl-examples-dev \
+#    openmpacc-examples-dev \
+#"
 #    linalg-examples
 #EXTRA_PACKAGES_append_k2hk-evm = " \
 #    opencl-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 7a02004..28153b3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r54"
+PR = "r55"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -129,11 +129,11 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
-MATRIX_APPS_append_dra7xx = "        \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-    matrix-video-analytics-opencv-opencl-opengl-demo \
-"
+#MATRIX_APPS_append_dra7xx = "        \
+#    matrix-opencl-demo-floatcompute  \
+#    matrix-opencl-demo-vecadd        \
+#    matrix-video-analytics-opencv-opencl-opengl-demo \
+#"
 
 MATRIX_APPS_append_beagleboard = "  \
     matrix-gui-display-control      \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 80288f4..5bc77de 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -21,9 +21,9 @@ MULTIMEDIA_append_ti43x = " \
     image-gallery-src \
 "
 
-MULTIMEDIA_append_dra7xx = " \
-    qt-opencv-opencl-opengl-multithreaded-src \
-"
+#MULTIMEDIA_append_dra7xx = " \
+#    qt-opencv-opencl-opengl-multithreaded-src \
+#"
 
 #Demo doesn't work on 3.14
 # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index c74b79c..e6000ea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,10 +8,10 @@ inherit packagegroup
 
 MULTIMEDIA = ""
 
+#    qt-opencv-opencl-opengl-multithreaded-dev
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
-    qt-opencv-opencl-opengl-multithreaded-dev \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index c17dde2..4cfd160 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 = " \
     amsdk-av-files \
 "
 
+#    qt-opencv-opencl-opengl-multithreaded-dev
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder \
-    qt-opencv-opencl-opengl-multithreaded-dev \
 "
 
 MULTIMEDIA_append_am37x-evm = " \
-- 
2.2.0


