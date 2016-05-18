Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id E44C852079
	for <meta-arago@arago-project.org>;
	Wed, 18 May 2016 05:05:38 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7C00LDVWT98M00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 18 May 2016 00:05:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=A4XlS-OwJD9JVlngPSoA:9
Received: by 100.15.86.14 with SMTP id 6ff70386; Wed, 18 May 2016 05:05:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 92F84162012;	Wed,
	18 May 2016 01:05:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 18 May 2016 01:05:33 -0400
Message-id: <1463547933-9966-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [RFC][PATCH] packagegroups: separate opencl and deps, remove cruft, simplify code
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
X-List-Received-Date: Wed, 18 May 2016 05:05:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Requires new "opencl" MACHINE_FEATURE in meta-ti

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |   1 +
 .../recipes-core/images/tisdk-rootfs-image.bb      |   1 +
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  23 +---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  15 +--
 .../packagegroup-arago-tisdk-addons.bb             |  32 +-----
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |  15 +--
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |   7 --
 .../packagegroup-arago-tisdk-crypto.bb             |  10 --
 .../packagegroup-arago-tisdk-matrix.bb             | 124 ++++-----------------
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  12 +-
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |   4 +-
 .../packagegroup-arago-tisdk-multimedia.bb         |  32 ++----
 .../packagegroup-arago-tisdk-opencl-sdk-host.bb    |  20 ++++
 .../packagegroup-arago-tisdk-opencl-sdk-target.bb  |  20 ++++
 .../packagegroup-arago-tisdk-opencl.bb             |  31 ++++++
 15 files changed, 114 insertions(+), 233 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 87cdf55..c2e318a 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -47,6 +47,7 @@ IMAGE_INSTALL_QT_keystone = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
     packagegroup-arago-tisdk-crypto-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index c61ccc1..98988b2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -7,6 +7,7 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index ee73b61..e026089 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r26"
+PR = "r27"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,27 +31,6 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
-UTILS_append_dra7xx = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
-
-UTILS_append_k2hk-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-    linalg-examples-src \
-"
-
-UTILS_append_k2l-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
-
-UTILS_append_k2e-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
-
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 564126d..5bc9218 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r31"
+PR = "r32"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -116,24 +116,11 @@ EXTRA_LIBS_append_k2e-evm = "\
 	nwal-lld-staticdev \
 "
 
-UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev \
-                        opencl-staticdev \
                         elfutils-dev \
                         elfutils-staticdev \
-                        openmpacc-dev \
-"
-UTILS_append_k2hk-evm = " opencl-staticdev \
-                          openmpacc-dev \
-                          linalg-dev \
-"
-UTILS_append_k2l-evm = " opencl-staticdev \
-                         openmpacc-dev \
-"
-UTILS_append_k2e-evm = " opencl-staticdev \
-                         openmpacc-dev \
 "
 UTILS_append_k2g-evm = " canutils-dev"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 9a63ef9..efa6ab9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r49"
+PR = "r50"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -53,16 +53,10 @@ UTILS_append_omap-a15 = " mmc-utils \
                           ti-ipc-rtos-fw \
 "
 
-# Add PRU examples for am180x-evm devices
-UTILS_append_am180x-evm = " ti-pru-sw-examples"
-
-UTILS_append_omap3 = " canutils"
-
 UTILS_append_dra7xx = " canutils \
                         dsptop \
                         gdbc6x \
                         glsdk-example-apps \
-                        opencl-examples \
 "
 
 UTILS_append_keystone = " \
@@ -70,19 +64,16 @@ UTILS_append_keystone = " \
 "
 
 UTILS_append_k2hk-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
 UTILS_append_k2l-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
 UTILS_append_k2e-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
@@ -103,27 +94,6 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
 "
-EXTRA_PACKAGES_append_dra7xx = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
-EXTRA_PACKAGES_append_k2hk-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-    linalg-examples \
-"
-EXTRA_PACKAGES_append_k2l-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
-EXTRA_PACKAGES_append_k2e-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index cf5e2e3..c5b7ddc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,14 +1,13 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r26"
+PR = "r27"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
 # Choose the kernel and u-boot recipe sources to use
-
-U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
+UBOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
 KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}"
@@ -17,23 +16,15 @@ KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHADOW_CLONE}
 BOOT_MONITOR = ""
 BOOT_MONITOR_keystone = "boot-monitor-src"
 
-TOOLS = ""
-TOOLS_omap-a15 = ""
-TOOLS_ti43x = ""
-TOOLS_keystone = ""
-TOOLS_append_am37x-evm = " flash-utility"
-TOOLS_append_am3517-evm = " flash-utility"
-
 EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS_${PN} = "\
-    ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
     ti-tisdk-makefile \
-    ${U-BOOT_SRC} \
+    ${UBOOT_SRC} \
     ${KERNEL_SRC} \
     ${BOOT_MONITOR} \
     ${@base_conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 632efe7..59593e8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -17,13 +17,6 @@ CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-src"
 
-CRYPTO_RDEPENDS_append_am37x-evm = "\
-    ti-ocf-crypto-module-src \
-"
-
-CRYPTO_RDEPENDS_append_am3517-evm = "\
-    ti-ocf-crypto-module-src \
-"
 RDEPENDS_${PN} = "\
     ${CRYPTO_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 7cbe3d0..78b16cf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -20,16 +20,6 @@ CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-te
 CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT_append_keystone = " ti-crypto-examples cryptodev-module cryptodev-tests"
 
-# Add crypto hardware support for am37x-evm
-# NOTE: this package depends on a kernel patch which also has a TSU
-#       exemption filed.  The current name and checksums of the
-#       kernel patch are:
-# Name: 0001-linux-omap3-PSP-3.0.1.6-kernel-with-OCF-Linux.patch
-# md5sum: 00bb20f2f33a37489d8c52212933368d
-# sha256sum: 1fea8323d12cf1ee4f743f0f1c82d7f3821a7d9b7996c44b17d7761579bb090d
-CRYPTO_SUPPORT_append_am37x-evm = " ti-ocf-crypto-module"
-CRYPTO_SUPPORT_append_am3517-evm = " ti-ocf-crypto-module"
-
 RDEPENDS_${PN} = "\
     ${CRYPTO_SUPPORT} \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index d9ed0e1..73f4b0c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r56"
+PR = "r57"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -27,95 +27,67 @@ MATRIX_COMMON_APPS = "              \
     matrix-gui-submenus-ethernet    \
 "
 
-MATRIX_QT_APPS = "                  \
-    ${@base_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-qt5-demos', 'matrix-gui-qt4-demos', d)} \
-    ${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','matrix-gui-apps-quick-playground','', d)} \
+#    matrix-gui-thermostat-demo
+MATRIX_QT_APPS = " \
+    matrix-gui-qt5-demos \
 "
-#    matrix-gui-thermostat-demo      
 
-MATRIX_SGX_DEMOS = "                \
-    matrix-3d-demo-chameleon        \
-    matrix-3d-demo-film             \
-    matrix-3d-demo-lantern          \
-    matrix-3d-demo-skull            \
-"
+MATRIX_QT_APPS_keystone = ""
 
-MATRIX_SGX_DEMOS_omap-a15 = " \
+MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
     matrix-3d-demo-coverflow \
     matrix-3d-demo-navigation \
     matrix-3d-demo-exampleui \
     matrix-3d-demo-kmscube \
-    matrix-3d-demo-kmscubevideo \
 "
 
-MATRIX_SGX_DEMOS_ti43x = " \
-    matrix-3d-demo-chameleon \
-    matrix-3d-demo-coverflow \
-    matrix-3d-demo-navigation \
-    matrix-3d-demo-exampleui \
-    matrix-3d-demo-kmscube \
+MATRIX_SGX_DEMOS_append_omap-a15 = " \
+    matrix-3d-demo-kmscubevideo \
 "
 
-MATRIX_SGX_DEMOS_ti33x = " \
-    matrix-3d-demo-chameleon \
-    matrix-3d-demo-coverflow \
-    matrix-3d-demo-navigation \
-    matrix-3d-demo-exampleui \
-    matrix-3d-demo-kmscube \
+MATRIX_OPENCL_APPS = " \
+    matrix-opencl-demo-floatcompute  \
+    matrix-opencl-demo-vecadd        \
 "
 
-MATRIX_QT_APPS_keystone = ""
+MATRIX_OPENCL_APPS_append_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl','matrix-video-analytics-opencv-opencl-opengl-demo','',d)} \
+"
 
 MATRIX_APPS = ""
 
-MATRIX_APPS_append_omap3 = "        \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-    matrix-multimedia-demo-aac \
-    matrix-multimedia-demo-h264dec      \
-    matrix-multimedia-demo-mpeg4aacdec   \
-    matrix-multimedia-demo-mpeg4dec     \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
-"
-
 MATRIX_APPS_append_ti33x = "        \
-    matrix-gui-ethernet-demos       \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-    matrix-multimedia-demo-aac \
+    matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
-    matrix-multimedia-demo-h264dec      \
-    matrix-multimedia-demo-mpeg4aacdec   \
-    matrix-multimedia-demo-mpeg4dec     \
+    matrix-multimedia-demo-h264dec  \
+    matrix-multimedia-demo-mpeg4aacdec  \
+    matrix-multimedia-demo-mpeg4dec \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    matrix-gui-ethernet-demos       \
 "
 
 MATRIX_APPS_append_ti43x = "        \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-                                    \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-h264dec  \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-                                    \
     matrix-gui-generic-pm           \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
+                                    \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-                                    \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-h265dec  \
     ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
@@ -129,67 +101,17 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
-MATRIX_APPS_append_dra7xx = "        \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-    matrix-video-analytics-opencv-opencl-opengl-demo \
-"
-
-MATRIX_APPS_append_beagleboard = "  \
-    matrix-gui-display-control      \
-"
-
-MATRIX_APPS_append_am3517-evm = "   \
-    matrix-gui-v4l2-demos           \
-"
-
-MATRIX_APPS_append_am37x-evm = "    \
-                                    \
-    matrix-gui-generic-pm           \
-    matrix-gui-pm-demos-count       \
-    matrix-gui-pm-demos-dump-reg    \
-    matrix-gui-pm-demos-snapshot1   \
-    matrix-gui-pm-demos-snapshot2   \
-    matrix-gui-pm-demos-suspend     \
-                                    \
-    matrix-gui-display-control      \
-    matrix-gui-camera-loopback      \
-    matrix-gui-v4l2-demos           \
-    matrix-gui-display-control      \
-    matrix-gui-clocks               \
-                                    \
-                                    \
-    matrix-multimedia-demo-audiocapture \
-"
-
-MATRIX_APPS_append_am180x-evm = "   \
-    matrix-gui-pru-demos            \
-"
-
 MATRIX_APPS_append_keystone = " \
     matrix-gui-utility-demos    \
     matrix-mc-demo-ipc          \
 "
 
-MATRIX_APPS_append_k2hk-evm = "      \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
-
-MATRIX_APPS_append_k2l-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
-
-MATRIX_APPS_append_k2e-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
-
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_GUI}         \
     ${MATRIX_COMMON_APPS} \
-    ${MATRIX_QT_APPS} \
+    ${MATRIX_QT_APPS}     \
     ${MATRIX_APPS}        \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCL_APPS}",'',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 80288f4..9bb62fc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,21 +8,13 @@ inherit packagegroup
 
 MULTIMEDIA = ""
 
-MULTIMEDIA_append_am37x-evm = " \
-    av-examples-src \
-"
-
-MULTIMEDIA_append_am3517-evm = " \
-    av-examples-src \
-"
-
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo-src \
     image-gallery-src \
 "
 
 MULTIMEDIA_append_dra7xx = " \
-    qt-opencv-opencl-opengl-multithreaded-src \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
 "
 
 #Demo doesn't work on 3.14
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index c74b79c..e77f66d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,7 +11,7 @@ MULTIMEDIA = ""
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
-    qt-opencv-opencl-opengl-multithreaded-dev \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index a9b6e1a..bb344b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,61 +1,45 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-MULTIMEDIA = ""
-
-MULTIMEDIA_append_omap3 = " \
+MULTIMEDIA = " \
     amsdk-av-files \
 "
 
-MULTIMEDIA_append_ti33x = " \
-    amsdk-av-files \
-"
+MULTIMEDIA_keystone = ""
 
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo \
     image-gallery \
-    amsdk-av-files \
-"
-
-MULTIMEDIA_append_omap-a15 = " \
-    amsdk-av-files \
 "
 
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder \
-    qt-opencv-opencl-opengl-multithreaded-dev \
-"
-
-MULTIMEDIA_append_am37x-evm = " \
-    av-examples \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
 MULTIMEDIA_append_omap5-evm = " \
     abefw \
-    "
-
-MULTIMEDIA_append_am3517-evm = " \
-    av-examples \
 "
 
 ACCEL_FW = ""
+
 ACCEL_FW_append_am57xx-evm = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
-    "
+"
 
 ACCEL_FW_append_omap5-evm = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
-    "
+"
 
 ACCEL_FW_append_dra7xx-evm = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
     vis \
-    "
+"
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-gst \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
new file mode 100644
index 0000000..aac2472
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Task to install sources for OpenCL/MP apps and demos"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+UTILS = " \
+    opencl-examples-src \
+    openmpacc-examples-src \
+"
+
+UTILS_append_k2hk-evm = " \
+    linalg-examples-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
new file mode 100644
index 0000000..211fcd3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Task to install headers and libraries of OpenCL/MP and related components"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+UTILS = " \
+    opencl-staticdev \
+    openmpacc-dev \
+"
+
+UTILS_append_k2hk-evm = " \
+    linalg-dev \
+"
+
+RDEPENDS_${PN} = "\
+    ${UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
new file mode 100644
index 0000000..24a8eef
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Task to install OpenCL/MP and related components"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES =+ "${PN}-extra"
+
+MAIN_PKGS = " \
+    opencl-examples \
+"
+
+EXTRA_PKGS = " \
+    opencl-staticdev \
+    opencl-examples-dev \
+    openmpacc-examples-dev \
+"
+
+EXTRA_PKGS_append_k2hk-evm = " \
+    linalg-examples \
+"
+
+RDEPENDS_${PN} = "\
+    ${MAIN_PKGS} \
+"
+
+RDEPENDS_${PN}-extra = "\
+    ${EXTRA_PKGS} \
+"
-- 
2.2.0


