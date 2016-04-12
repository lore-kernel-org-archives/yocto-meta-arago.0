Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 4111752996
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 05:10:39 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5I004OM916OB20@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Apr 2016 00:10:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=aWhG__WUpEDR-ET7KkoA:9
Received: by 100.15.86.14 with SMTP id 5e62b34a; Tue, 12 Apr 2016 05:10:23 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 60060161F94;	Tue,
	12 Apr 2016 01:10:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Apr 2016 01:10:17 -0400
Message-id: <1460437817-4400-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] Revert "HACK: packagegroup*: disable opencl and openmp for now due to llvm build issues"
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
X-List-Received-Date: Tue, 12 Apr 2016 05:10:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 32b89275199b4911e899d141bee308f02834437d.
This reverts commit ea1f9df2d9229d388ba880f585054e2ae3f609fc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 18 +++++-----
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 23 ++++++-------
 .../packagegroup-arago-tisdk-addons.bb             | 40 +++++++++++-----------
 .../packagegroup-arago-tisdk-matrix.bb             | 20 +++++------
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  4 +--
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  4 +--
 .../packagegroup-arago-tisdk-multimedia.bb         |  4 +--
 .../nativesdk-packagegroup-arago-sdk-host.bb       |  6 ++--
 8 files changed, 58 insertions(+), 61 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 2295e49..1faf487 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,25 +31,25 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
-#    opencl-examples-src
-#    openmpacc-examples-src
 UTILS_append_dra7xx = " \
+    opencl-examples-src \
+    openmpacc-examples-src \
 "
 
-#    opencl-examples-src
-#    openmpacc-examples-src
 #    linalg-examples-src
 UTILS_append_k2hk-evm = " \
+    opencl-examples-src \
+    openmpacc-examples-src \
 "
 
-#    opencl-examples-src
-#    openmpacc-examples-src
 UTILS_append_k2l-evm = " \
+    opencl-examples-src \
+    openmpacc-examples-src \
 "
 
-#    opencl-examples-src
-#    openmpacc-examples-src
 UTILS_append_k2e-evm = " \
+    opencl-examples-src \
+    openmpacc-examples-src \
 "
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b2a0c44..8db75a2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -119,24 +119,21 @@ EXTRA_LIBS_append_k2e-evm = "\
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
-#                        opencl-staticdev
-#                        openmpacc-dev
 UTILS_append_dra7xx = " canutils-dev \
+                        opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
+                        openmpacc-dev \
 "
-#opencl-staticdev
-#                          openmpacc-dev
-#UTILS_append_k2hk-evm = " \
-#                          linalg-dev \
-#"
-#opencl-staticdev
-#                         openmpacc-dev
-UTILS_append_k2l-evm = " \
+#                          linalg-dev
+UTILS_append_k2hk-evm = " opencl-staticdev \
+                          openmpacc-dev \
 "
-#opencl-staticdev
-#                         openmpacc-dev
-UTILS_append_k2e-evm = " \
+UTILS_append_k2l-evm = " opencl-staticdev \
+                         openmpacc-dev \
+"
+UTILS_append_k2e-evm = " opencl-staticdev \
+                         openmpacc-dev \
 "
 UTILS_append_k2g-evm = " canutils-dev"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index baaa03a..a617b7f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r45"
+PR = "r46"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -58,31 +58,31 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
 
-#                        opencl-examples
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
+                        opencl-examples \
 "
 
 UTILS_append_keystone = " \
     ti-ipc-rtos-fw \
 "
 
-#    opencl-examples
 UTILS_append_k2hk-evm = " \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
-#    opencl-examples
 UTILS_append_k2l-evm = " \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
-#    opencl-examples
 UTILS_append_k2e-evm = " \
+    opencl-examples \
     gdbc6x \
     dsptop \
 "
@@ -103,26 +103,26 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
 "
-#    opencl-staticdev
-#    opencl-examples-dev
-#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_dra7xx = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    openmpacc-examples-dev \
+"
+#    linalg-examples
+EXTRA_PACKAGES_append_k2hk-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    openmpacc-examples-dev \
 "
-#    opencl-staticdev
-#    opencl-examples-dev
-#    openmpacc-examples-dev
-#EXTRA_PACKAGES_append_k2hk-evm = " \
-#    linalg-examples \
-#"
-#    opencl-staticdev
-#    opencl-examples-dev
-#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_k2l-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    openmpacc-examples-dev \
 "
-#    opencl-staticdev
-#    opencl-examples-dev
-#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_k2e-evm = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    openmpacc-examples-dev \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 9bb68f4..28f4b29 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r52"
+PR = "r53"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -129,10 +129,10 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
-#    matrix-opencl-demo-floatcompute  
-#    matrix-opencl-demo-vecadd        
-#    matrix-video-analytics-opencv-opencl-opengl-demo
 MATRIX_APPS_append_dra7xx = "        \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
+    matrix-video-analytics-opencv-opencl-opengl-demo \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -171,19 +171,19 @@ MATRIX_APPS_append_keystone = " \
     matrix-mc-demo-ipc          \
 "
 
-#    matrix-opencl-demo-floatcompute  
-#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2hk-evm = "      \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
 "
 
-#    matrix-opencl-demo-floatcompute  
-#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2l-evm = "       \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
 "
 
-#    matrix-opencl-demo-floatcompute  
-#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2e-evm = "       \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
 "
 
 RDEPENDS_${PN} = "        \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index ddf1148..80288f4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -21,8 +21,8 @@ MULTIMEDIA_append_ti43x = " \
     image-gallery-src \
 "
 
-#    qt-opencv-opencl-opengl-multithreaded-src
 MULTIMEDIA_append_dra7xx = " \
+    qt-opencv-opencl-opengl-multithreaded-src \
 "
 
 #Demo doesn't work on 3.14
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 991d29f..c74b79c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,10 +8,10 @@ inherit packagegroup
 
 MULTIMEDIA = ""
 
-#    qt-opencv-opencl-opengl-multithreaded-dev
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
+    qt-opencv-opencl-opengl-multithreaded-dev \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 4423827..c17dde2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,9 +26,9 @@ MULTIMEDIA_append_omap-a15 = " \
     amsdk-av-files \
 "
 
-#    qt-opencv-opencl-opengl-multithreaded-dev
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder \
+    qt-opencv-opencl-opengl-multithreaded-dev \
 "
 
 MULTIMEDIA_append_am37x-evm = " \
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 331c801..a9efdc9 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r14"
+PR = "r15"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
-#               nativesdk-clocl
-#               nativesdk-clacc
 EXTRA_TOOLS = "nativesdk-ti-cgt6x \
                nativesdk-ti-cgt-pru \
+               nativesdk-clocl \
+               nativesdk-clacc \
                nativesdk-mtd-utils-ubifs \
 "
 
-- 
2.2.0


