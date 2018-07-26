Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 18BB3529AE
	for <meta-arago@arago-project.org>;
	Thu, 26 Jul 2018 21:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1672F20C38;
	Thu, 26 Jul 2018 21:30:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DoiTa0BPGA64; Thu, 26 Jul 2018 21:30:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E082B20567;
	Thu, 26 Jul 2018 21:30:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6B2CD1634FE;
	Thu, 26 Jul 2018 17:30:47 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 26 Jul 2018 17:30:46 -0400
Message-Id: <1532640646-37667-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-k3-r5: instead of handling R5 in bbappend, use separate recipe
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
X-List-Received-Date: Thu, 26 Jul 2018 21:30:56 -0000

This simplifies a lot of things and allows using most of standard u-boot
recipe infrastructure.
Set additional PACKAGECONFIG and EXTRA_IMAGEDEPENDS in distro config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  5 +++++
 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb     | 19 ++++++++++++++++
 .../u-boot/u-boot-ti-staging_2018.01.bbappend      | 26 ----------------------
 3 files changed, 24 insertions(+), 26 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7f7baef..b2711c5 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -120,6 +120,11 @@ PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-bad_omapl1 = "wayland egl gles2"
 
 PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 
+# Enable U-boot OPTEE config for K3
+PACKAGECONFIG_append_pn-u-boot-ti-staging_k3 = " optee"
+
+EXTRA_IMAGEDEPENDS_append_k3 += " u-boot-k3-r5"
+
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
new file mode 100644
index 0000000..e841128
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -0,0 +1,19 @@
+require recipes-bsp/u-boot/u-boot-ti-staging_${PV}.bb
+
+PROVIDES = ""
+
+COMPATIBLE_MACHINE = "k3"
+
+CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
+PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
+
+UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
+
+EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
+EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+EXTRA_OEMAKE += 'SYSFW=${SYSFW_FILE}'
+
+UBOOT_BINARY = "tiboot3.bin"
+UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
+SPL_BINARY_k3 = ""
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
deleted file mode 100644
index 5f6c1a5..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bbappend
+++ /dev/null
@@ -1,26 +0,0 @@
-PACKAGECONFIG_append_k3 = " optee"
-
-CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
-PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
-
-UBOOT_R5_BINARY = "tiboot3.bin"
-UBOOT_R5_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_R5_SYMLINK = "tiboot3-${MACHINE}.bin"
-
-do_compile_append_am65xx-evm() {
-	# Build R5 side now
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r5 am65x_evm_r5_defconfig
-	make ${PARALLEL_MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1 HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" -C ${S} O=${B}/r5 SYSFW=${SYSFW_FILE} ${UBOOT_MAKE_TARGET}
-}
-
-do_install_append_am65xx-evm() {
-	install -m 644 ${B}/r5/${UBOOT_R5_BINARY} ${D}/boot/${UBOOT_R5_IMAGE}
-	ln -sf ${UBOOT_R5_IMAGE} ${D}/boot/${UBOOT_R5_BINARY}
-}
-
-do_deploy_append_am65xx-evm() {
-	install ${B}/r5/${UBOOT_R5_BINARY} ${DEPLOYDIR}/${UBOOT_R5_IMAGE}
-	rm -f ${DEPLOYDIR}/${UBOOT_R5_BINARY} ${DEPLOYDIR}/${UBOOT_R5_SYMLINK}
-	ln -sf ${UBOOT_R5_IMAGE} ${DEPLOYDIR}/${UBOOT_R5_BINARY}
-	ln -sf ${UBOOT_R5_IMAGE} ${DEPLOYDIR}/${UBOOT_R5_SYMLINK}
-}
-- 
2.7.4


