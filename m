Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 16A5E52A4E
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6075940C26;
	Sat, 29 Feb 2020 16:15:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id y3r7T2FkLiZi; Sat, 29 Feb 2020 16:15:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 161BF40C1D;
	Sat, 29 Feb 2020 16:15:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 62A75174427;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:42 -0500
Message-Id: <1582992888-3508-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 3/9] ti-world: list of packages to populate feeds
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

As ti-world contains everything from default rootfs plus more, shrink down
default rootfs by dropping following piece:
* OpenCL-extra
* Build essentials and other devtools
* valgrind
* qt-opencv-opencl-opengl-multithreaded-dev
* qt3d-examples
* qtwebengine and qtbrowser
* Introduce "misc" packagegroup

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |  1 -
 .../packagegroups/packagegroup-arago-misc.bb       | 11 +++++
 .../packagegroups/packagegroup-arago-qte.bb        |  8 ----
 .../packagegroup-arago-tisdk-addons.bb             |  9 -----
 .../packagegroup-arago-tisdk-multimedia.bb         |  1 -
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  | 10 -----
 .../ti-world.bb}                                   | 47 ++++++++++++++++------
 7 files changed, 46 insertions(+), 41 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
 copy meta-arago-distro/recipes-core/{images/tisdk-rootfs-image.bb => packagegroups/ti-world.bb} (52%)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 54771c1..3efb578 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -14,7 +14,6 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
new file mode 100644
index 0000000..091d728
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Task to install additional miscellaneous packages"
+LICENSE = "MIT"
+PR = "r0"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    nano \
+    mc \
+    rsync \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 5984fee..bf8124d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -41,19 +41,11 @@ QT5_ESSENTIALS = "\
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
     qtwebkit-qmlplugins \
-    qtwebengine-qmlplugins \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
 "
 
-#QT5_ESSENTIALS_append_k3 = "\
-#    qtwebkit-qmlplugins \
-#"
-#QT5_ESSENTIALS_remove_k3 = "\
-#    qtwebengine-qmlplugins \
-#"
-
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 4e1e404..af2c254 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -23,7 +23,6 @@ UTILS = " \
     libdrm-kms \
     kms++ \
     kms++-python \
-    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     stream \
     strongswan \
     kexec \
@@ -130,13 +129,6 @@ EXTRA_LIBS_append_ti33x = " \
     uio-module-drv \
 "
 
-DEVTOOLS = " \
-    linux-libc-headers-dev \
-    packagegroup-core-buildessential \
-    packagegroup-core-tools-debug \
-    git \
-"
-
 EXTRA_PACKAGES = " \
     nodejs \
     nodejs-npm \
@@ -197,7 +189,6 @@ EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-    ${DEVTOOLS} \
     ${EXTRA_LIBS} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index f8e3954..d230b44 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -29,7 +29,6 @@ MULTIMEDIA_append_omap-a15 = " \
 MULTIMEDIA_append_dra7xx = " \
     vis \
     hevc-arm-decoder \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
 MULTIMEDIA_append_omap5-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 5250d61..f83ac52 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -13,7 +13,6 @@ QT4_DEMOS = "\
 "
 
 QT5_DEMOS = "\
-    qt3d-examples \
     qtbase-examples \
     qtdeclarative-examples \
     qtdeclarative-tools \
@@ -22,19 +21,10 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
-    qtwebengine-examples \
-    qtwebbrowser \
-    qtwebbrowser-examples \
     qtserialport-examples \
     qtcharts-examples \
 "
 
-#QT5_DEMOS_remove_k3 = "\
-#    qtwebbrowser \
-#    qtwebbrowser-examples \
-#    qtwebengine-examples \
-#"
-
 QT_DEMOS = "\
     qt-tstat \
 "
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
similarity index 52%
copy from meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
copy to meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 54771c1..1d5e286 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -1,10 +1,34 @@
-# Arago TI SDK full filesystem image
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
 
-require arago-image.inc
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
+inherit packagegroup
 
-IMAGE_INSTALL += "\
+INSANE_SKIP_${PN} += "dev-deps"
+
+CHROMIUM = ""
+#CHROMIUM_append_omap-a15 = "\
+#    chromium-ozone-wayland \
+#"
+#CHROMIUM_append_k3 = "\
+#    chromium-ozone-wayland \
+#"
+
+EXTRABROWSERS = " \
+    qtwebbrowser-examples \
+    qtwebengine-qmlplugins \
+    qtwebengine-examples \
+"
+
+DEVTOOLS = " \
+    linux-libc-headers-dev \
+    packagegroup-core-buildessential \
+    packagegroup-core-tools-debug \
+    git \
+"
+
+RDEPENDS_${PN} = "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
@@ -12,7 +36,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
@@ -24,11 +48,10 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
+    ${DEVTOOLS} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+    packagegroup-arago-misc \
 "
-
-export IMAGE_BASENAME = "tisdk-rootfs-image"
-
-# Disable ubi/ubifs as the filesystem requires more space than is
-# available on the HW.
-IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
-IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
-- 
2.7.4


