Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7C94C529E5
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4725740C18;
	Thu, 23 Apr 2020 23:20:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZqE11JkwaVH1; Thu, 23 Apr 2020 23:20:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E21E40A6E;
	Thu, 23 Apr 2020 23:20:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BA0FB172A02;
	Thu, 23 Apr 2020 19:20:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Apr 2020 19:20:06 -0400
Message-Id: <1587684006-51903-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] conf, recipes: add support for j7-hs-evm platform and j7 SoC family
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
X-List-Received-Date: Thu, 23 Apr 2020 23:22:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc          | 10 +++++-----
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb   |  7 ++++++-
 meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb   |  1 +
 .../recipes-core/images/arago-core-tisdk-bundle.inc            |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb  |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb  |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       |  2 +-
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb |  4 ++--
 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb   |  2 +-
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb        |  2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image   |  3 ++-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb   |  7 ++++---
 .../recipes-devtools/util-scripts/glsdk-util-scripts.bb        |  3 +--
 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb        |  2 --
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb          |  8 +++-----
 17 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index f34fc65..6d15662 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -15,11 +15,11 @@ PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
 # J7 has a Rogue GPU core
-PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/egl_j7 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1_j7 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
 
 # OpenGL preferences
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
index d73e919..4dba62b 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.02.bb
@@ -28,16 +28,18 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 SYSFW_SOC_am65xx = "am65x"
-SYSFW_SOC_j7-evm = "j721e"
+SYSFW_SOC_j7 = "j721e"
 SYSFW_CONFIG = "evm"
 
 SYSFW_PREFIX = "ti-sci-firmware"
 
 SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-gp"
 SYSFW_BASE_am65xx-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
+SYSFW_BASE_j7-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
 SYSFW_TISCI_am65xx-hs-evm = "${S}/ti-sysfw/${SYSFW_BASE}-*.bin"
+SYSFW_TISCI_j7-hs-evm = "${S}/ti-sysfw/${SYSFW_BASE}-*.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${PV}.itb"
@@ -61,6 +63,9 @@ EXTRA_OEMAKE = "\
 EXTRA_OEMAKE_append_am65xx-hs-evm = " \
     HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
 "
+EXTRA_OEMAKE_append_j7-hs-evm = " \
+    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
+"
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
index 0263b66..f368572 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
@@ -14,6 +14,7 @@ PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
 UBOOT_MACHINE_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 UBOOT_MACHINE_j7-evm = "j721e_evm_r5_defconfig"
+UBOOT_MACHINE_j7-hs-evm = "j721e_hs_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
index 52ca790..016a4ef 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.inc
@@ -29,7 +29,7 @@ DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
 DTB_FILTER_omapl138 = "da850"
 DTB_FILTER_am65xx = "am65"
-DTB_FILTER_j7-evm = "j721e"
+DTB_FILTER_j7 = "j721e"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 90ce00e..32d6c98 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -43,7 +43,7 @@ UTILS_append_k3 = " \
 "
 
 #    ti-img-encode-decode-src
-UTILS_append_j7-evm = " \
+UTILS_append_j7 = " \
     pru-icss-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index e694765..2c5f7e5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -75,7 +75,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
-UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_j7 = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index fddc929..5a35e1c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -13,7 +13,7 @@ MATRIX_GUI = " \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_j7-evm = ""
+MATRIX_GUI_j7 = ""
 
 RDEPENDS_${PN} = "\
     matrix-gui-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a6e5e4c..d1acfc5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -20,7 +20,7 @@ MATRIX_GUI = "               \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_j7-evm = ""
+MATRIX_GUI_j7 = ""
 
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
@@ -45,7 +45,7 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
-MATRIX_QT_APPS_j7-evm = ""
+MATRIX_QT_APPS_j7 = ""
 
 #MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
 #MATRIX_QT_APPS_append_k3 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index d230b44..44ab026 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -41,7 +41,7 @@ ACCEL_MM_append_omap-a15 = " \
     ipumm-fw \
 "
 
-ACCEL_MM_append_j7-evm = " \
+ACCEL_MM_append_j7 = " \
     ti-img-encode-decode \
     vxd-dec-fw \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 4866e42..10dd899 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -11,7 +11,7 @@ QT_TOOLCHAIN_TARGET = "\
 "
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
-QT_TOOLCHAIN_TARGET_j7-evm = ""
+QT_TOOLCHAIN_TARGET_j7 = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
@@ -24,7 +24,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
-TISDK_TOOLCHAIN_EXTRA_TARGET_j7-evm = ""
+TISDK_TOOLCHAIN_EXTRA_TARGET_j7 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index 1e7ee19..abdb609 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -22,7 +22,7 @@ ANALYTICS = " \
     ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 "
 ANALYTICS_keystone = ""
-ANALYTICS_j7-evm = ""
+ANALYTICS_j7 = ""
 ANALYTICS_omapl138 = ""
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index c4d74f3..3e9bbf1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -67,7 +67,7 @@ ARAGO_TI_TEST_append_am65xx = " \
     ti-ipc-test \
 "
 
-ARAGO_TI_TEST_append_j7-evm = " \
+ARAGO_TI_TEST_append_j7 = " \
     viddec-test-app \
     videnc-test-app \
     ufs-tool \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 94ee40d..ab7ff72 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,6 +1,7 @@
 # Define the following to support multple platforms
 PLATFORM_TYPE_$(PLATFORM) = gp
 PLATFORM_TYPE_am65xx-hs-evm = hs
+PLATFORM_TYPE_j7-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 
 SYSFW_CONFIG = evm
@@ -9,6 +10,7 @@ SYSFW_SOC_$(PLATFORM) = NULL
 SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_j7-evm = j721e
+SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
 SYSFW_PREFIX = ti-sci-firmware
@@ -44,4 +46,3 @@ sysfw-image_install:
 	@echo   Installing SYSFW Image
 	@echo =============================
 	@echo "Nothing to do"
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index aa3a9c4..2a44938 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -67,7 +67,7 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 
 MAKEFILES_MATRIX_GUI_keystone = ""
 MAKEFILES_MATRIX_GUI_omapl138 = ""
-MAKEFILES_MATRIX_GUI_j7-evm = ""
+MAKEFILES_MATRIX_GUI_j7 = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -199,7 +199,7 @@ MAKEFILES_append_am65xx = " \
                         pdm-anomaly-detection \
 "
 
-MAKEFILES_append_j7-evm = " pru-icss \
+MAKEFILES_append_j7 = " pru-icss \
                             ti-img-rogue-driver \
                             ti-img-encode-decode \
 "
@@ -239,7 +239,7 @@ PRU_ICSS_INSTALL_TARGET_ti43x = "pru-icss_install_am437x"
 PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
-PRU_ICSS_INSTALL_TARGET_j7-evm = "pru-icss_install_j721e"
+PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
 
 # Path to toolchains for the various cores in TI SOCs
 #
@@ -364,6 +364,7 @@ K3_UBOOT_MACHINE_R5 = ""
 K3_UBOOT_MACHINE_R5_am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
index abe9ad9..9dd2cd3 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
 PR = "r1"
 
-COMPATIBLE_MACHINE = "omap-a15|j7-evm"
+COMPATIBLE_MACHINE = "omap-a15|j7"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} += "bash"
 
@@ -29,4 +29,3 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}/ti/util-scripts/*"
-
diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
index 3502ed0..6a7796c 100644
--- a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
+++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
@@ -14,8 +14,6 @@ SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
 PR = "r1"
 S = "${WORKDIR}/git"
 
-COMPATIBLE_MACHINE = "j7-evm"
-
 # Build only DevIL
 OECMAKE_SOURCEPATH = "${S}/DevIL"
 
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 7cdc618..d1f9e05 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -49,7 +49,7 @@ do_install () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2FilmTV ${D}${bindir}/SGX/demos/DRM/
 }
 
-do_install_append_j7-evm () {
+do_install_append_j7 () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
@@ -72,14 +72,12 @@ do_install_append_j7-evm () {
 }
 
 
-RDEPENDS_${PN} = "ti-sgx-ddk-um"
-RDEPENDS_${PN}_j7-evm = "ti-img-rogue-umlibs"
+RDEPENDS_${PN} = "libegl"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so staticdev already-stripped ldflags file-rdeps"
 
 FILES_${PN} += " \
-    /opt/img-powervr-sdk/PVRHub/* \
-    /opt/img-powervr-sdk/PVRScopeDeveloper/* \
+    /opt/img-powervr-sdk/* \
 "
-- 
2.7.4


