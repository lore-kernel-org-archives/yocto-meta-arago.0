Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7D5B152985
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 02:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AEF840BBF;
	Tue, 25 Jun 2019 02:41:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ofezwp7XBN8y; Tue, 25 Jun 2019 02:41:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6234440B7B;
	Tue, 25 Jun 2019 02:40:59 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2A61416B9E5;
	Mon, 24 Jun 2019 22:40:59 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 24 Jun 2019 22:40:58 -0400
Message-Id: <1561430458-14355-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] recipes: rename "sgx" flag to "gpu" in MACHINE_FEATURES
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
X-List-Received-Date: Tue, 25 Jun 2019 02:41:43 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc           |  2 +-
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb  |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-addons.bb         |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb       | 10 +++++-----
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb         | 12 ++++++------
 .../packagegroup-arago-toolchain-tisdk-target.bb             |  4 ++--
 .../matrix/matrix-gui-machinevision-demos_2.0.bb             |  2 +-
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 0125bb5..4b1a338 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -64,7 +64,7 @@ IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
     packagegroup-arago-tisdk-crypto-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-hmi-sdk-host \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 8486a8e..bb2515a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -8,8 +8,8 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base-tisdk \
     packagegroup-arago-test \
     packagegroup-arago-test-addons \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-gtk','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     packagegroup-arago-tisdk-qte \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a7be94a..2521382 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -80,7 +80,7 @@ UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
 UTILS_append_dra7xx = " can-utils \
                         ${UTILS_DSP} \
-                        ${@bb.utils.contains('MACHINE_FEATURES','sgx','glsdk-example-apps','',d)} \
+                        ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-example-apps','',d)} \
 "
 
 UTILS_append_keystone = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index aee7c3a..6a60375 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -14,18 +14,18 @@ GRAPHICS_WAYLAND = "\
 "
 
 GRAPHICS_WAYLAND_append_omap-a15 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','chromium-wayland','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
 "
 
 GRAPHICS_WAYLAND_append_k3 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','chromium-wayland','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
 "
 
 GRAPHICS_RDEPENDS = "\
     libgbm \
     ${PREFERRED_PROVIDER_virtual/egl} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glmark2','',d)} \
 "
 GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km"
 
@@ -33,7 +33,7 @@ GRAPHICS_DISPLAY_UTILS = "\
 "
 
 GRAPHICS_DISPLAY_UTILS_append_omap-a15  = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','glsdk-util-scripts','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-util-scripts','',d)} \
 "
 
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 78f9c56..c2c5975 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -37,11 +37,11 @@ MATRIX_QT_APPS = " \
     matrix-qt5-demo-webkit-browser \
     matrix-qt5-demo-calculator \
     matrix-qt5-demo-deform \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-thermostat-demo','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-thermostat-demo','',d)} \
 "
 
 MATRIX_TOUCH_APPS = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-touch-demos','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demos','',d)} \
 "
 
 MATRIX_QT_APPS_keystone = ""
@@ -53,7 +53,7 @@ MATRIX_QT_APPS_j7-evm = ""
 #    matrix-qt5-demo-webkit-browser \
 #"
 
-MATRIX_SGX_DEMOS = " \
+MATRIX_GPU_DEMOS = " \
     matrix-3d-demo-chameleon \
     matrix-3d-demo-coverflow \
     matrix-3d-demo-navigation \
@@ -61,7 +61,7 @@ MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-kmscube \
 "
 
-MATRIX_SGX_DEMOS_append_omap-a15 = " \
+MATRIX_GPU_DEMOS_append_omap-a15 = " \
     matrix-3d-demo-kmscubevideo \
 "
 
@@ -165,7 +165,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-analytics-pdm-anomaly-detection \
 "
 
-#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
+#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
 #                                \
 #
 
@@ -212,7 +212,7 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_QT_APPS}     \
     ${MATRIX_TOUCH_APPS}  \
     ${MATRIX_APPS}        \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GPU_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp',"${MATRIX_OPENCL_APPS}",'',d)} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 03c3f47..81299f0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -28,10 +28,10 @@ TISDK_TOOLCHAIN_EXTRA_TARGET_j7-evm = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index c316730..cadfefa 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -25,7 +25,7 @@ RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
 "
 
 RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','point-cloud-viewer','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
 "
 
 RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
-- 
2.7.4


