Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 27B7552986
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2B8720B62;
	Thu, 15 Feb 2018 17:13:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FsBh8mK6Hr65; Thu, 15 Feb 2018 17:13:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B8042017C;
	Thu, 15 Feb 2018 17:13:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 02B081632A5;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:22 -0500
Message-Id: <1518714813-23100-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 01/12] recipes: replace base_conditional and oe_filter_out with corresponding oe.utils calls
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf               | 14 +++++++-------
 .../packagegroups/packagegroup-arago-base-tisdk.bb     |  2 +-
 .../packagegroups/packagegroup-arago-qte.bb            |  4 ++--
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb         |  2 +-
 .../packagegroup-arago-tisdk-connectivity.bb           |  2 +-
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb    |  2 +-
 .../packagegroup-arago-tisdk-qte-sdk-host.bb           |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb      |  4 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb         |  8 ++++----
 meta-arago-extras/classes/qt-vars.bbclass              | 16 ++++++++--------
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb       |  2 +-
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb      |  2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb              |  8 ++++----
 .../recipes-core/meta/external-linaro-sdk-toolchain.bb | 18 +++++++++---------
 .../meta/external-linaro-toolchain.bbappend            |  4 ++--
 .../recipes-core/meta/meta-toolchain-arago-qte.bb      | 12 ++++++------
 .../packagegroup-arago-qte-toolchain-target.bb         |  4 ++--
 .../packagegroup-arago-standalone-sdk-target.bb        |  6 +++---
 .../dual-camera-demo/dual-camera-demo_1.0.bb           |  2 +-
 meta-arago-extras/recipes-support/opencv/opencv_3.1.bb |  4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb         |  2 +-
 21 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index bdeb5e6..71c4789 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -72,13 +72,13 @@ DISTRO_FEATURES_append = " pam wayland opengl"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "udev", "systemd", d)}"
-VIRTUAL-RUNTIME_init_manager = "${@base_conditional("ARAGO_SYSVINIT", "1", "sysvinit", "systemd", d)}"
-VIRTUAL-RUNTIME_initscripts = "${@base_conditional("ARAGO_SYSVINIT", "1", "initscripts", "systemd-compat-units", d)}"
-VIRTUAL-RUNTIME_initramfs = "${@base_conditional("ARAGO_SYSVINIT", "1", "sysvinit-initramfs", "systemd-initramfs", d)}"
+VIRTUAL-RUNTIME_dev_manager = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "udev", "systemd", d)}"
+VIRTUAL-RUNTIME_init_manager = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "sysvinit", "systemd", d)}"
+VIRTUAL-RUNTIME_initscripts = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "initscripts", "systemd-compat-units", d)}"
+VIRTUAL-RUNTIME_initramfs = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "sysvinit-initramfs", "systemd-initramfs", d)}"
 VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 
-DISTRO_FEATURES_append = "${@base_conditional("ARAGO_SYSVINIT", "1", "", " systemd", d)}"
+DISTRO_FEATURES_append = "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", " systemd", d)}"
 
 # Set preferred Qt version
 QT_PROVIDER ?= "qt5"
@@ -110,11 +110,11 @@ ARAGO_KERNEL_SUFFIX ?= ""
 
 # Set real-time kernel suffix
 ARAGO_RT_ENABLE ?= "0"
-ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
+ARAGO_KERNEL_SUFFIX_append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
 
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?= "0"
-ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
+ARAGO_KERNEL_SUFFIX_append = "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
 
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 8238b1b..8908adb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -24,5 +24,5 @@ RDEPENDS_${PN} = "\
     arago-feed-config \
     nfs-utils-client \
     cifs-utils \
-    ${@base_conditional('OPTEEMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
+    ${@oe.utils.conditional('OPTEEMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index d9486a3..06f00e3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -23,7 +23,7 @@ QT4_ESSENTIALS = "\
     libqt-embeddedmultimedia4 \
     libqt-embeddeddeclarative4 \
     libqt-embeddedxmlpatterns4 \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT4_SGX_SUPPORT}', '', d)} \
+    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT4_SGX_SUPPORT}', '', d)} \
 "
 
 QT5_ESSENTIALS = "\
@@ -47,5 +47,5 @@ QT5_ESSENTIALS = "\
 "
 
 RDEPENDS_${PN} = "\
-    ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
+    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 8020bb8..52a9988 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -29,6 +29,6 @@ RDEPENDS_${PN} = "\
     ${UBOOT_SRC} \
     ${KERNEL_SRC} \
     ${BOOT_MONITOR} \
-    ${@base_conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
+    ${@oe.utils.conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
     tisdk-install \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7b32b3b..6d3be93 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -33,7 +33,7 @@ FIRMWARE_AND_DRIVERS = "\
 "
 
 DEMO_APPS = "\
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
+    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
 "
 
 BLUETOOTH_STACK = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index c3a46be..e80fe2f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -29,7 +29,7 @@ MULTIMEDIA_append_dra7xx = " \
 MULTIMEDIA_append_keystone = " barcode-roi-src"
 
 #Demo doesn't work on 3.14
-# ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
+# ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
 
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 5d596f8..4e34ec7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 QT4_DEMOS = "\
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
+    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
     qt-tstat-src \
 "
 
@@ -16,6 +16,6 @@ QT_DEMOS = "\
 #    qt-tstat-src 
 
 RDEPENDS_${PN} = "\
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
+    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
     ${QT_DEMOS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f6f7468..3ace7b5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -9,7 +9,7 @@ inherit packagegroup
 QT4_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
-    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
+    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
     qt-tstat \
 "
 
@@ -34,6 +34,6 @@ QT_DEMOS = "\
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte \
-    ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEMOS}", "${QT4_DEMOS}", d)} \
+    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEMOS}", "${QT4_DEMOS}", d)} \
     ${QT_DEMOS} \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 698f599..4ee3b9f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,7 +54,7 @@ PR = "r84"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-                        ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
+                        ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
 "
 
 MAKEFILES_MATRIX_GUI_keystone = ""
@@ -70,7 +70,7 @@ MAKEFILES_COMMON = "linux \
 MAKEFILES = ""
 
 # This example application should not be used when using non-SGX
-QUICK_PLAYGROUND = "${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','quick-playground','', d)}"
+QUICK_PLAYGROUND = "${@oe.utils.conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','quick-playground','', d)}"
 
 # Add device specific make targets
 
@@ -187,13 +187,13 @@ PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
 
-KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
+KERNEL_BUILD_CMDS = "${@oe.utils.conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
 DEFCONFIG = "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 
 AMSDK_DEFCONFIG = "singlecore-omap2plus_defconfig"
 
-DEFCONFIG := "${@base_conditional('ARAGO_BRAND','amsdk','${AMSDK_DEFCONFIG}','${DEFCONFIG}',d)}"
+DEFCONFIG := "${@oe.utils.conditional('ARAGO_BRAND','amsdk','${AMSDK_DEFCONFIG}','${DEFCONFIG}',d)}"
 
 # This step will stitch together the final Makefile based on the supported
 # make targets.
diff --git a/meta-arago-extras/classes/qt-vars.bbclass b/meta-arago-extras/classes/qt-vars.bbclass
index d516a69..83e4360 100644
--- a/meta-arago-extras/classes/qt-vars.bbclass
+++ b/meta-arago-extras/classes/qt-vars.bbclass
@@ -5,13 +5,13 @@ QT_PROVIDER ?= "qt5"
 # Build-time dependencies - those are now separate modules in Qt5 and
 # require separate dependencies, unlike Qt4 that provides everything
 # in a single qt4-embedded/qt4-x11 recipe
-QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
-QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
-QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
-QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
-QT_DEPENDS_WEBENGINE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebengine', '', d)}"
+QT_DEPENDS_BASE = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
+QT_DEPENDS_WEBKIT = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
+QT_DEPENDS_SVG = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
+QT_DEPENDS_SCRIPT = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
+QT_DEPENDS_WEBENGINE = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtwebengine', '', d)}"
 
 # Run-time dependencies
-QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt4-embedded-fonts', d)}"
-QT_RDEPENDS_NATIVESDK_TOOLS = "${@base_conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
-QT_RDEPENDS_MKSPECS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
+QT_RDEPENDS_FONTS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qt4-embedded-fonts', d)}"
+QT_RDEPENDS_NATIVESDK_TOOLS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
+QT_RDEPENDS_MKSPECS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 494d582..3349587 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
 	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
 "
 
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
+SRC_URI += "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
 	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch', '', d)}"
 
 S = "${WORKDIR}/git/"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 0455962..695d43d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -16,7 +16,7 @@ PR = "r15"
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
 QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
 
-SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
+SRCREV = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 2bd0d89..f13e0bf 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -18,12 +18,12 @@ inherit update-rc.d
 BRANCH ?= "master"
 SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
 
-MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
+MATRIX_INITSCRIPT = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
-           ${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
+           ${@oe.utils.conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
 "
 
@@ -31,8 +31,8 @@ require matrix-gui-paths.inc
 
 S = "${WORKDIR}/git"
 
-MATRIX_FLAGS = "${@base_conditional('QT_PROVIDER','qt5','','-qws',d)}"
-SWITCH_FOREGROUND_VT = "${@base_conditional('QT_PROVIDER','qt5','','chvt 4',d)}"
+MATRIX_FLAGS = "${@oe.utils.conditional('QT_PROVIDER','qt5','','-qws',d)}"
+SWITCH_FOREGROUND_VT = "${@oe.utils.conditional('QT_PROVIDER','qt5','','chvt 4',d)}"
 do_install(){
 	install -d ${D}${MATRIX_BASE_DIR}
 	install -d ${D}${MATRIX_WEB_DIR}
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index de6fd57..593239b 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -20,13 +20,13 @@ INSANE_SKIP_binutils-cross-canadian-arm = "dev-so file-rdeps"
 
 PROVIDES = "\
 	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
 	binutils-cross-canadian-arm \
 "
 
 PACKAGES = "\
 	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
 	binutils-cross-canadian-arm \
 "
 
@@ -112,9 +112,9 @@ do_install() {
 	install -d ${D}${libdir}
 	install -d ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
 	install -d ${D}${libexecdir}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
 	install -d ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
 
 #	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{c++,g++,gcc*} ${D}${prefix}/${ELT_TARGET_SYS}/bin
@@ -123,10 +123,10 @@ do_install() {
 	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
 	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
 
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
 
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ranlib,as,ar,objdump} ${D}${prefix}/${ELT_TARGET_SYS}/bin
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 6ebcb4b..3744a3c 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -13,7 +13,7 @@ PROVIDES += "virtual/libc-locale"
 
 RPROVIDES_${PN}-staticdev += "glibc-staticdev"
 
-PACKAGES := "${@oe_filter_out('libgcc-dev', '${PACKAGES}', d)}"
+PACKAGES := "${@oe.utils.str_filter_out('libgcc-dev', '${PACKAGES}', d)}"
 PACKAGES =+ "libgcc-dev"
 
 RDEPENDS_${PN}-utils = ""
@@ -26,7 +26,7 @@ RDEPENDS_libubsan += "libstdc++"
 PKGV = "${ELT_VER_LIBC}"
 PKGV_glibc-thread-db = "${ELT_VER_LIBC}"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@oe.utils.conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_${PN} += "\
 	${libdir}/bin \
 	${libdir}/locale \
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 9aa29ca..3178a7b 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -1,6 +1,6 @@
 # Qt Embedded toolchain
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
-TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-arago-qte-toolchain-target', d)}"
+TOOLCHAIN_TARGET_TASK ?= "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-arago-qte-toolchain-target', d)}"
 TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
@@ -8,11 +8,11 @@ require meta-toolchain-arago.bb
 PR = "r19"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
-QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
-QT_BIN_PREFIX = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT_DIR_NAME}/", '', d)}"
-QT_BIN_SUFFIX = "${@base_conditional('QT_PROVIDER', 'qt5', '', '4', d)}"
-QT_MKSPECS_LOCATION = "${@base_conditional('QT_PROVIDER', 'qt5', "${libdir}", "${datadir}", d)}"
-QT_MKSPECS_DIR = "${@base_conditional('QT_PROVIDER', 'qt5', "linux-oe-g++", "linux-gnueabi-oe-g++", d)}"
+QT_DIR_NAME = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
+QT_BIN_PREFIX = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT_DIR_NAME}/", '', d)}"
+QT_BIN_SUFFIX = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', '4', d)}"
+QT_MKSPECS_LOCATION = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${libdir}", "${datadir}", d)}"
+QT_MKSPECS_DIR = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "linux-oe-g++", "linux-gnueabi-oe-g++", d)}"
 
 toolchain_create_sdk_env_script_append() {
 	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 88c5c6b..d81588e 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -38,7 +38,7 @@ QT4_DEV = " \
         libqt-embeddedxmlpatterns4-dev \
         libqt-embeddedmultimedia4-dev \
         libqt-embeddeddeclarative4-dev \
-        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT4_SGX_SUPPORT}', '', d)} \
+        ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','${QT4_SGX_SUPPORT}', '', d)} \
 "
 
 QT5_DEV = " \
@@ -66,5 +66,5 @@ QT5_DEV = " \
 "
 
 RDEPENDS_${PN} += " \
-        ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
+        ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
 "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index e2f4f50..26cb503 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -20,17 +20,17 @@ RDEPENDS_${PN} = "\
     curl-dev \
     i2c-tools-dev \
     freetype-dev \
-    ${@base_conditional('PREFERRED_PROVIDER_jpeg', 'libjpeg-turbo', 'libjpeg-turbo-dev', 'jpeg-dev', d)}  \
+    ${@oe.utils.conditional('PREFERRED_PROVIDER_jpeg', 'libjpeg-turbo', 'libjpeg-turbo-dev', 'jpeg-dev', d)}  \
     lzo-dev \
     opkg-dev \
     libpng-dev \
     readline-dev \
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'tslib-dev', d)} \
+    ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'tslib-dev', d)} \
     libusb-compat-dev \
     libusb1-dev \
     zlib-dev \
     ncurses-dev \
     opkg-dev \
     util-linux-dev \
-    ${@base_conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
+    ${@oe.utils.conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
     "
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 1d1d836..f861390 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branc
 
 S = "${WORKDIR}/git"
 
-DEMO_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
+DEMO_SCRIPT = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
 
 inherit qt-provider
 
diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
index c4c2f0f..168eeff 100644
--- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
@@ -41,8 +41,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-    ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-    ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index fdc822d..1a9c1bd 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -68,7 +68,7 @@ do_install_append() {
 }
 
 SYSTEMD_SERVICE_${PN} = "ti-mct-daemon.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "${@base_conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
+SYSTEMD_AUTO_ENABLE_${PN} = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
 
 FILES_${PN}-runtime += "${bindir}"
 
-- 
2.7.4


