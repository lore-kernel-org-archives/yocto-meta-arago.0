Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 392255297E
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2020 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1DCD240BEF;
	Thu,  6 Aug 2020 20:39:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id W2z9hRTKf_yd; Thu,  6 Aug 2020 20:39:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F064F40BAB;
	Thu,  6 Aug 2020 20:39:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EF324173BE2;
	Thu,  6 Aug 2020 16:39:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Aug 2020 16:39:27 -0400
Message-Id: <1596746367-40736-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] images, packagegroups, matrix: pull Qt deps if "gpu" MACHINE_FEATURES is on
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
X-List-Received-Date: Thu, 06 Aug 2020 20:42:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-core-bundle.inc      | 18 +++--------------
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb    |  6 +-----
 .../packagegroup-arago-tisdk-matrix.bb             | 23 +++++-----------------
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |  4 +++-
 .../packagegroup-arago-toolchain-tisdk-target.bb   | 10 +---------
 .../recipes-core/matrix/matrix-gui_2.0.bb          |  4 +---
 6 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 1c35829..d8fd9d2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -37,20 +37,8 @@ TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 
-TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
-TOOLCHAIN_SUFFIX = "-tisdk"
-
-TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
-TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
-TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
-TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
-
-IMAGE_INSTALL_QT = "\
-    packagegroup-arago-tisdk-qte-sdk-host \
-"
-
-IMAGE_INSTALL_QT_keystone = ""
-IMAGE_INSTALL_QT_omapl138 = ""
+TISDK_TOOLCHAIN = "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
+TOOLCHAIN_SUFFIX = "${@bb.utils.contains('MACHINE_FEATURES','gpu','-tisdk','-tisdk-server',d)}"
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
@@ -61,5 +49,5 @@ IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-hmi-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
-    ${IMAGE_INSTALL_QT} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte-sdk-host','',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 5a35e1c..a4a33f2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -11,11 +11,7 @@ MATRIX_GUI = " \
     refresh-screen-src \
 "
 
-MATRIX_GUI_keystone = ""
-MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_j7 = ""
-
 RDEPENDS_${PN} = "\
     matrix-gui-src \
-    ${MATRIX_GUI} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index dff30fb..897b354 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -18,10 +18,6 @@ MATRIX_GUI = "               \
     matrix-gui-browser       \
 "
 
-MATRIX_GUI_keystone = ""
-MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_j7 = ""
-
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
     matrix-gui-crypto-demos         \
@@ -36,22 +32,13 @@ MATRIX_QT_APPS = " \
     matrix-qt5-demo-webkit-browser \
     matrix-qt5-demo-calculator \
     matrix-qt5-demo-deform \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-thermostat-demo','',d)} \
+    matrix-gui-thermostat-demo \
 "
 
 MATRIX_TOUCH_APPS = " \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demos','',d)} \
 "
 
-MATRIX_QT_APPS_keystone = ""
-MATRIX_QT_APPS_omapl138 = ""
-MATRIX_QT_APPS_j7 = ""
-
-#MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
-#MATRIX_QT_APPS_append_k3 = " \
-#    matrix-qt5-demo-webkit-browser \
-#"
-
 MATRIX_GPU_DEMOS = " \
     matrix-3d-demo-chameleon \
     matrix-3d-demo-coverflow \
@@ -197,11 +184,11 @@ MATRIX_APPS_append_keystone = " \
 
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
-    ${MATRIX_GUI}         \
-    ${MATRIX_COMMON_APPS} \
-    ${MATRIX_QT_APPS}     \
-    ${MATRIX_TOUCH_APPS}  \
     ${MATRIX_APPS}        \
+    ${MATRIX_COMMON_APPS} \
+    ${@bb.utils.contains('MACHINE_FEATURES','touchscreen',"${MATRIX_TOUCH_APPS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_QT_APPS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GPU_DEMOS}",'',d)} \
     ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index a2e3794..7498dd2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -4,7 +4,9 @@ PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 QT4_DEMOS = "\
     qt4-embedded-examples \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 10dd899..5244637 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -6,13 +6,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-QT_TOOLCHAIN_TARGET = "\
-    packagegroup-arago-qte-toolchain-target \
-"
-QT_TOOLCHAIN_TARGET_keystone = ""
-QT_TOOLCHAIN_TARGET_omapl138 = ""
-QT_TOOLCHAIN_TARGET_j7 = ""
-
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
     packagegroup-arago-tisdk-multimedia-sdk-target \
@@ -24,10 +17,9 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
-TISDK_TOOLCHAIN_EXTRA_TARGET_j7 = ""
 
 RDEPENDS_${PN} = "\
-    ${QT_TOOLCHAIN_TARGET} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-qte-toolchain-target','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index c5e35ad..e67decd 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -54,9 +54,7 @@ do_install(){
 	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
 }
 
-GUIDEPS = "matrix-gui-browser refresh-screen"
-GUIDEPS_keystone = ""
-GUIDEPS_omapl138 = ""
+GUIDEPS = "${@bb.utils.contains('MACHINE_FEATURES','gpu',"matrix-gui-browser refresh-screen",'',d)}"
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.7.4


