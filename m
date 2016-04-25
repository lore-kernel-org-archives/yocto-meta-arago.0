Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id CDAB252A80
	for <meta-arago@arago-project.org>;
	Mon, 25 Apr 2016 17:56:55 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O670073MB6IYJA0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Apr 2016 12:56:43 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=L0-Mk3cr4GkqVsNRA_cA:9
Received: by 100.15.86.14 with SMTP id 42b027c4; Mon, 25 Apr 2016 17:56:42 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 535E3161FB4;	Mon,
	25 Apr 2016 13:56:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Apr 2016 13:56:41 -0400
Message-id: <1461607001-25675-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] conf, recipes: update for new SGX names, simplify conf and packagegroups
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
X-List-Received-Date: Mon, 25 Apr 2016 17:56:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |  4 +-
 .../conf/distro/include/arago-prefs.inc            | 47 ++++------------------
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  | 10 +----
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 24 ++---------
 .../packagegroup-arago-tisdk-graphics.bb           | 38 ++---------------
 .../libgl/libgles-omap3_%.bbappend                 |  1 -
 ...Makefile_omapdrm-pvr => Makefile_ti-sgx-ddk-km} | 21 +++++-----
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  8 ++--
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  2 +-
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |  2 +-
 10 files changed, 34 insertions(+), 123 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend
 rename meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/{Makefile_omapdrm-pvr => Makefile_ti-sgx-ddk-km} (68%)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 9dca564..90ae80f 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -203,8 +203,8 @@ SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${
 CREATE_SRCIPK_pn-gdbserverproxy-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-omapdrm-pvr = "1"
-SRCIPK_INSTALL_DIR_pn-omapdrm-pvr = "board-support/extra-drivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-sgx-ddk-km = "1"
+SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 2d8368e..5b68fa1 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,34 +21,11 @@ PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
-ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
-PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
-
-PREFERRED_PROVIDER_omap3-sgx-modules = "omap3-sgx-modules"
-PREFERRED_PROVIDER_libgles-omap3 = "libgles-omap3"
-PREFERRED_PROVIDER_libgles-omap3-dev = "libgles-omap3-dev"
-PREFERRED_PROVIDER_libgles-omap3-dbg = "libgles-omap3-dbg"
-PREFERRED_PROVIDER_virtual/egl = "libgles-omap3"
-PREFERRED_PROVIDER_virtual/libgles1 = "libgles-omap3"
-PREFERRED_PROVIDER_virtual/libgles2 = "libgles-omap3"
-
-PREFERRED_PROVIDER_virtual/egl_omap-a15 = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles1_omap-a15 = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles2_omap-a15 = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_libgbm_omap-a15 = "libgbm"
-PREFERRED_PROVIDER_libgbm-dev_omap-a15 = "libgbm-dev"
-
-PREFERRED_PROVIDER_virtual/egl_ti43x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles1_ti43x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles2_ti43x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_libgbm_ti43x = "libgbm"
-PREFERRED_PROVIDER_libgbm-dev_ti43x = "libgbm-dev"
-
-PREFERRED_PROVIDER_virtual/egl_ti33x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles1_ti33x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_virtual/libgles2_ti33x = "omap5-sgx-ddk-um-linux"
-PREFERRED_PROVIDER_libgbm_ti33x = "libgbm"
-PREFERRED_PROVIDER_libgbm-dev_ti33x = "libgbm-dev"
+PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_libgbm = "libgbm"
+PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
 
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
@@ -61,28 +38,18 @@ PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
-# Use latest TI staging kernel and u-boot trees
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
 PREFERRED_VERSION_linux-ti-staging = "4.4%"
 
-PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader_omap-a15 = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
-
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 PREFERRED_VERSION_u-boot-ti-staging = "2015.07%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_eudev = "3.1.5"
 PREFERRED_PROVIDER_eudev = "eudev"
 
-# Set the PREFERRED_PROVIDER for jpeg functionality based on the MACHINE
-# architecture.  For armv7a devices libjpeg-turbo should be used to take
-# advantage of the SIMD instructions.
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
-PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
 # application that does not have a GPLv3 license
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 2dae8ba..b987947 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,16 +1,10 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r4"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r5"
 
 inherit packagegroup
 
-GRAPHICS_RDEPENDS = ""
-
-GRAPHICS_RDEPENDS_append_ti33x = " omapdrm-pvr-src"
-GRAPHICS_RDEPENDS_append_ti43x = " omapdrm-pvr-src"
-GRAPHICS_RDEPENDS_append_omap-a15 = " omapdrm-pvr-src"
+GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
 
 RDEPENDS_${PN} = "\
     ${GRAPHICS_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 7c2300c..484baab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,30 +1,12 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r6"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r7"
 
 inherit packagegroup
 
-GRAPHICS_RDEPENDS = ""
-
-GRAPHICS_RDEPENDS_ti33x = "\
-    libgbm-dev \
-    omap5-sgx-ddk-um-linux-dev \
-    "
-
-GRAPHICS_RDEPENDS_omap3 = "\
-    libgles-omap3-dev \
-"
-
-GRAPHICS_RDEPENDS_ti43x = "\
-    libgbm-dev \
-    omap5-sgx-ddk-um-linux-dev \
-    "
-
-GRAPHICS_RDEPENDS_omap-a15 = "\
+GRAPHICS_RDEPENDS = "\
     libgbm-dev \
-    omap5-sgx-ddk-um-linux-dev \
+    ti-sgx-ddk-um-dev \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 07fd8b3..a7bc08f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r12"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+PR = "r13"
 
 inherit packagegroup
 
@@ -12,40 +10,12 @@ GRAPHICS_WESTON = "\
     weston-examples \
 "
 
-# Until SGX is fixed with 4.1 - omap3-sgx-modules
-GRAPHICS_SDK = "\
-    libgles-omap3 \
-    libgles-omap3-blitwsegl \
-    libgles-omap3-flipwsegl \
-    libgles-omap3-frontwsegl \
-    libgles-omap3-linuxfbwsegl \
-    libgles-omap3-rawdemos \
-"
-
-GRAPHICS_RDEPENDS = ""
-
-GRAPHICS_RDEPENDS_ti33x = "\
+GRAPHICS_RDEPENDS = "\
     libgbm \
-    omap5-sgx-ddk-um-linux \
-    omapdrm-pvr \
+    ti-sgx-ddk-km \
+    ti-sgx-ddk-um \
 "
 
-GRAPHICS_RDEPENDS_ti43x = "\
-    libgbm \
-    omap5-sgx-ddk-um-linux \
-    omapdrm-pvr \
-"
-
-GRAPHICS_RDEPENDS_omap3 = "\
-    ${GRAPHICS_SDK} \
-"
-
-GRAPHICS_RDEPENDS_omap-a15 = "\
-    libgbm \
-    omap5-sgx-ddk-um-linux \
-    omapdrm-pvr \
-    "
-
 RDEPENDS_${PN} = "\
     ${@base_contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WESTON}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend b/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend
deleted file mode 100644
index e0c105c..0000000
--- a/meta-arago-distro/recipes-graphics/libgl/libgles-omap3_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-RRECOMMENDS_${PN}_remove = "omap3-sgx-modules"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
similarity index 68%
rename from meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
rename to meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
index 9f50900..8d9b583 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
@@ -1,26 +1,25 @@
-# omapdrm-pvr module
-omapdrm-pvr: linux
+# ti-sgx-ddk-km module
+ti-sgx-ddk-km: linux
 	@echo ================================
-	@echo      Building omapdrm-pvr
+	@echo      Building ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
 
-omapdrm-pvr_clean:
+ti-sgx-ddk-km_clean:
 	@echo ================================
-	@echo      Cleaning omapdrm-pvr
+	@echo      Cleaning ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
-omapdrm-pvr_install:
+ti-sgx-ddk-km_install:
 	@echo ================================
-	@echo      Installing omapdrm-pvr
+	@echo      Installing ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
 	cd ./eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 5e0ae41..d76b5c7 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cmem-mod \
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
-    file://Makefile_omapdrm-pvr \
+    file://Makefile_ti-sgx-ddk-km \
     file://Makefile_opencl-examples \
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
@@ -85,7 +85,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
-                           omapdrm-pvr \
+                           ti-sgx-ddk-km \
                            pru-icss \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
@@ -95,7 +95,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            cryptodev \
                            dual-camera-demo \
                            image-gallery \
-                           omapdrm-pvr \
+                           ti-sgx-ddk-km \
                            pru-icss \
 "
 
@@ -112,7 +112,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
                               omapconf \
                               linux-dtbs \
-                              omapdrm-pvr \
+                              ti-sgx-ddk-km \
                               pru-icss \
 "
 MAKEFILES_append_am180x-evm = " pru \
diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 8833cf6..1e9a8bf 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
 
-DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
+DEPENDS = "libdrm libgbm ti-sgx-ddk-um"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index f5880b4..1d22511 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test applications for OMAP DRM interface"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
-DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
+DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-- 
2.2.0


