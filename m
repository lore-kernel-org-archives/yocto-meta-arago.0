Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 84744529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 00:09:48 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K00DVRR3Z8NG0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 19:09:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=jUlj_eYUT6dO_-YG9mUA:9
Received: by 100.15.86.14 with SMTP id 03d25a22; Tue, 03 May 2016 00:09:36 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 936E1161FD5;	Mon,
	2 May 2016 20:09:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 20:09:35 -0400
Message-id: <1462234175-16230-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1462234175-16230-1-git-send-email-denis@denix.org>
References: <1462234175-16230-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] recipes: replace remaining base_contains with bb.utils.contains
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
X-List-Received-Date: Tue, 03 May 2016 00:09:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc |  2 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |  2 +-
 .../packagegroups/packagegroup-arago-base.bb       |  2 +-
 .../packagegroups/packagegroup-arago-console.bb    |  6 +++---
 .../packagegroups/packagegroup-arago-gst.bb        |  4 ++--
 .../packagegroups/packagegroup-arago-qte.bb        |  2 +-
 .../packagegroups/packagegroup-arago-test.bb       |  2 +-
 .../packagegroup-arago-tisdk-addons.bb             |  2 +-
 .../packagegroup-arago-tisdk-graphics.bb           |  2 +-
 .../packagegroup-arago-tisdk-matrix.bb             | 24 +++++++++++-----------
 .../packagegroup-arago-tisdk-multimedia.bb         |  6 +++---
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |  2 +-
 .../packagegroup-arago-toolchain-tisdk-target.bb   |  2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend |  4 ++--
 .../wpa-supplicant/wpa-supplicant.inc              |  2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |  6 +++---
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |  6 +++---
 17 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index cd1d46e..87cdf55 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -48,7 +48,7 @@ IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     packagegroup-arago-tisdk-crypto-sdk-host \
-    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index d6fd2a1..c61ccc1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -4,7 +4,7 @@ require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
-    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 5b4ced1..42f16b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -29,7 +29,7 @@ ARAGO_EXTRA = "\
 
 # minimal set of packages - needed to boot
 RDEPENDS_${PN} = "\
-    ${@base_contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
     ${ARAGO_BASE} \
     ${ARAGO_EXTRA} \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 4073488..304ad89 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -54,7 +54,7 @@ ARAGO_UTILS = "\
     iproute2 \
     iproute2-tc \
     strace \
-    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
     "
 
 # ARAGO_UTILS - ltrace fails with __cxa_demangle for now
@@ -71,8 +71,8 @@ ARAGO_SDK_PREREQ = "\
     "
 
 ARAGO_CONSOLE = "\
-    ${@base_contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_EXTRA}', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '', '${ARAGO_TSLIB}', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_EXTRA}', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', '${ARAGO_TSLIB}', d)} \
     ${ARAGO_NCURSES} \
     ${ARAGO_FSTOOLS} \
     ${ARAGO_UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 75a2579..d34051e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -26,8 +26,8 @@ GSTREAMER_DEPS_append_keystone = " \
 "
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+GSTREAMER_ACCEL_MM_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+GSTREAMER_ACCEL_MM_append_dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER_DEPS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 5ac3e74..f87530e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -34,7 +34,7 @@ QT5_ESSENTIALS = "\
     qtlocation-qmlplugins \
     qtmultimedia-plugins \
     qtmultimedia-qmlplugins \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
     qt3d-qmlplugins \
     qtwebkit-qmlplugins \
     qtquick1-plugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index b49e28d..8d4a320 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -47,7 +47,7 @@ ARAGO_TI_TEST_append_ti43x = " \
     omapconf \
     "
 
-#    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}
+#    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ti-ipc-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a45d641..fc6b821 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -21,7 +21,7 @@ UTILS = " \
     openssh-sftp-server \
     ptpd \
     libdrm-kms \
-    ${@base_contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     stream \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index a7bc08f..ef2b71d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -17,6 +17,6 @@ GRAPHICS_RDEPENDS = "\
 "
 
 RDEPENDS_${PN} = "\
-    ${@base_contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 28153b3..51cac11 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -70,17 +70,17 @@ MATRIX_QT_APPS_keystone = ""
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
-    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
     matrix-multimedia-demo-aac \
     matrix-multimedia-demo-h264dec      \
     matrix-multimedia-demo-mpeg4aacdec   \
     matrix-multimedia-demo-mpeg4dec     \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
-    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
     matrix-multimedia-demo-aac \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec      \
@@ -92,11 +92,11 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
                                     \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_ti43x = "        \
-    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
                                     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-h264dec  \
@@ -110,19 +110,19 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-pm-demos-governor    \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-init', d)} \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
                                     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-h265dec  \
-    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
-    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
-    ${@base_contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
-    ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4aacdec',d)} \
-    ${@base_contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4dec',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4aacdec',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','mmip','','matrix-multimedia-demo-mpeg4dec',d)} \
                                     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 4cfd160..4c637d4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -45,15 +45,15 @@ MULTIMEDIA_append_am3517-evm = " \
 
 ACCEL_FW = ""
 ACCEL_FW_append_am57xx-evm = " \
-    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
     "
 
 ACCEL_FW_append_omap5-evm = " \
-    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     "
 
 ACCEL_FW_append_dra7xx-evm = " \
-    ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
     vis \
     "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index fac2c5b..6dd58ae 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -21,7 +21,7 @@ QT5_DEMOS = "\
     qtlocation-examples \
     qtmultimedia-examples \
     qtscript-examples \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtquick1-examples \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 13f294d..2acb723 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -23,6 +23,6 @@ TISDK_TOOLCHAIN_BASE_TARGET_keystone = "packagegroup-arago-standalone-sdk-target
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
-    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index d504b2d..f40d978 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -6,7 +6,7 @@ PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_
 
 PR_append = "-arago12"
 
-QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
+QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
 QT_EGLFS_PATCHES = "\
     file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
@@ -15,7 +15,7 @@ QT_EGLFS_PATCHES = "\
 "
 
 SRC_URI += "\
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0002-deform-disable-opengl-button.patch \
 "
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 42ef907..8ca40ae 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -69,7 +69,7 @@ do_install () {
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}/${systemd_unitdir}/system
 		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
 	fi
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index ab9cb85..9b1ba47 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -18,13 +18,13 @@ inherit update-rc.d
 BRANCH ?= "master"
 SRCREV = "621bab39c23ea476ec0b31a7baf86c1bd4f24ec4"
 
-MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
+MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
-           ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
+           ${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
 "
 
 require matrix-gui-paths.inc
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index bb0180f..5f4652c 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -3,9 +3,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PACKAGECONFIG = "faad"
 
 # gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
-PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti43x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti33x = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
 
 DEPENDS_append_omap-a15 = " \
     libdce \
-- 
2.2.0


