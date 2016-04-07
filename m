Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 6907F52A70
	for <meta-arago@arago-project.org>;
	Thu,  7 Apr 2016 19:29:01 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5A00GTT3FZ7P00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 07 Apr 2016 14:28:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=aWhG__WUpEDR-ET7KkoA:9
Received: by 100.15.86.14 with SMTP id 59b0a4e0; Thu, 07 Apr 2016 19:28:48 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 54548161F54;	Thu,
	7 Apr 2016 15:28:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 07 Apr 2016 15:28:46 -0400
Message-id: <1460057326-25068-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: packagegroup*: disable opencl and openmp for now due to llvm build issues
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
X-List-Received-Date: Thu, 07 Apr 2016 19:29:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 18 ++++++------
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 21 +++++++------
 .../packagegroup-arago-tisdk-addons.bb             | 34 +++++++++++-----------
 .../packagegroup-arago-tisdk-matrix.bb             | 20 ++++++-------
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  4 +--
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  4 +--
 .../packagegroup-arago-tisdk-multimedia.bb         |  4 +--
 7 files changed, 54 insertions(+), 51 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 0306c1b..46e9271 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,25 +31,25 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
+#    opencl-examples-src
+#    openmpacc-examples-src
 UTILS_append_dra7xx = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
 "
 
+#    opencl-examples-src
+#    openmpacc-examples-src
 UTILS_append_k2hk-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
     linalg-examples-src \
 "
 
+#    opencl-examples-src
+#    openmpacc-examples-src
 UTILS_append_k2l-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
 "
 
+#    opencl-examples-src
+#    openmpacc-examples-src
 UTILS_append_k2e-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
 "
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 062e8ce..a5b4828 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -119,21 +119,24 @@ EXTRA_LIBS_append_k2e-evm = "\
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
+#                        opencl-staticdev
+#                        openmpacc-dev
 UTILS_append_dra7xx = " canutils-dev \
-                        opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
-                        openmpacc-dev \
 "
-UTILS_append_k2hk-evm = " opencl-staticdev \
-                          openmpacc-dev \
+#opencl-staticdev
+#                          openmpacc-dev
+UTILS_append_k2hk-evm = " \
                           linalg-dev \
 "
-UTILS_append_k2l-evm = " opencl-staticdev \
-                         openmpacc-dev \
+#opencl-staticdev
+#                         openmpacc-dev
+UTILS_append_k2l-evm = " \
 "
-UTILS_append_k2e-evm = " opencl-staticdev \
-                         openmpacc-dev \
+#opencl-staticdev
+#                         openmpacc-dev
+UTILS_append_k2e-evm = " \
 "
 UTILS_append_k2g-evm = " canutils-dev"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2894f74..517f6a6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r44"
+PR = "r45"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -58,31 +58,31 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
 
+#                        opencl-examples
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
-                        opencl-examples \
 "
 
 UTILS_append_keystone = " \
     ti-ipc-rtos-fw \
 "
 
+#    opencl-examples
 UTILS_append_k2hk-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
+#    opencl-examples
 UTILS_append_k2l-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
+#    opencl-examples
 UTILS_append_k2e-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
@@ -103,26 +103,26 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
 "
+#    opencl-staticdev
+#    opencl-examples-dev
+#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_dra7xx = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
 "
+#    opencl-staticdev
+#    opencl-examples-dev
+#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_k2hk-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
     linalg-examples \
 "
+#    opencl-staticdev
+#    opencl-examples-dev
+#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_k2l-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
 "
+#    opencl-staticdev
+#    opencl-examples-dev
+#    openmpacc-examples-dev
 EXTRA_PACKAGES_append_k2e-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 11ff899..9bb68f4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r51"
+PR = "r52"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -129,10 +129,10 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
+#    matrix-opencl-demo-floatcompute  
+#    matrix-opencl-demo-vecadd        
+#    matrix-video-analytics-opencv-opencl-opengl-demo
 MATRIX_APPS_append_dra7xx = "        \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-    matrix-video-analytics-opencv-opencl-opengl-demo \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -171,19 +171,19 @@ MATRIX_APPS_append_keystone = " \
     matrix-mc-demo-ipc          \
 "
 
+#    matrix-opencl-demo-floatcompute  
+#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2hk-evm = "      \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
 "
 
+#    matrix-opencl-demo-floatcompute  
+#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2l-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
 "
 
+#    matrix-opencl-demo-floatcompute  
+#    matrix-opencl-demo-vecadd        
 MATRIX_APPS_append_k2e-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
 "
 
 RDEPENDS_${PN} = "        \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index e83a01c..ddf1148 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -21,8 +21,8 @@ MULTIMEDIA_append_ti43x = " \
     image-gallery-src \
 "
 
+#    qt-opencv-opencl-opengl-multithreaded-src
 MULTIMEDIA_append_dra7xx = " \
-    qt-opencv-opencl-opengl-multithreaded-src \
 "
 
 #Demo doesn't work on 3.14
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 93b6664..991d29f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
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
index f5f2a25..4423827 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
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


