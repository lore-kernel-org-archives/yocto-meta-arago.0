Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6975552A78
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2020 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD72840C2E;
	Mon,  4 May 2020 20:54:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dZcu_Zs7C-4s; Mon,  4 May 2020 20:54:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8DDDF40B3E;
	Mon,  4 May 2020 20:54:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 47AA816EC83;
	Mon,  4 May 2020 16:54:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  4 May 2020 16:54:39 -0400
Message-Id: <1588625682-33592-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/4] recipes-bsp: meta-ti now builds multiconfig u-boot/ti-sci-fw for R5
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
X-List-Received-Date: Mon, 04 May 2020 20:57:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  7 --
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb     | 94 ----------------------
 .../recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb     | 25 ------
 3 files changed, 126 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2fcb953..1c78692 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -154,13 +154,6 @@ RDEPENDS_pulseaudio-server_remove = "alsa-plugins-pulseaudio-conf"
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "arago-tiny-image"
 
-# K3 devices also requre R5 SPL and SYSFW to boot
-EXTRA_IMAGEDEPENDS_append_k3 = " u-boot-k3-r5 ti-sci-fw"
-IMAGE_BOOT_FILES_append_k3 = " tiboot3.bin sysfw.itb"
-EXTRA_WIC_DEPENDS = ""
-EXTRA_WIC_DEPENDS_k3 = "u-boot-k3-r5:do_deploy ti-sci-fw:do_deploy"
-do_image_wic[depends] += "${EXTRA_WIC_DEPENDS}"
-
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
deleted file mode 100644
index bae8e5c..0000000
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.03.bb
+++ /dev/null
@@ -1,94 +0,0 @@
-SUMMARY = "TI SCI firmware"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
-
-DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
-
-CLEANBROKEN = "1"
-PR = "r0"
-
-COMPATIBLE_MACHINE = "k3"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TI_SECURE_DEV_PKG ?= ""
-export TI_SECURE_DEV_PKG
-
-SRCREV = "1c5f73de97c27d99dd8672d9c26c450cd9a4677d"
-BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "79f3807e0b169f2029dec9f3a679c231f4deb625"
-SRCREV_FORMAT = "imggen"
-
-SRC_URI = " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
-"
-
-S = "${WORKDIR}/git"
-
-SYSFW_SOC_am65xx = "am65x"
-SYSFW_SOC_j7 = "j721e"
-SYSFW_CONFIG = "evm"
-
-SYSFW_PREFIX = "ti-sci-firmware"
-
-SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-gp"
-SYSFW_BASE_am65xx-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
-SYSFW_BASE_j7-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
-
-SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
-SYSFW_TISCI_am65xx-hs-evm = "${S}/ti-sysfw/${SYSFW_BASE}-*.bin"
-SYSFW_TISCI_j7-hs-evm = "${S}/ti-sysfw/${SYSFW_BASE}-*.bin"
-
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE = "sysfw-${PV}.itb"
-SYSFW_SYMLINK = "sysfw.itb"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
-CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${ELT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
-CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
-PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
-
-EXTRA_OEMAKE = "\
-    CROSS_COMPILE=${CROSS_COMPILE_V7} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
-    SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-"
-EXTRA_OEMAKE_append_am65xx-hs-evm = " \
-    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
-"
-EXTRA_OEMAKE_append_j7-hs-evm = " \
-    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
-"
-
-do_compile() {
-	cd ${WORKDIR}/imggen/
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
-	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_SYMLINK}
-}
-
-FILES_${PN} = "/boot"
-
-inherit deploy
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-	rm -f ${DEPLOYDIR}/${SYSFW_SYMLINK}
-	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_SYMLINK}
-
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-addtask deploy before do_build after do_compile
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
deleted file mode 100644
index f368572..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require recipes-bsp/u-boot/u-boot-ti-staging_${PV}.bb
-
-PROVIDES = ""
-PKG_${PN} = "${PN}"
-PKG_${PN}-dev = "${PN}-dev"
-PKG_${PN}-dbg = "${PN}-dbg"
-
-COMPATIBLE_MACHINE = "k3"
-
-CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${ELT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
-CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
-PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
-
-UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
-UBOOT_MACHINE_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
-UBOOT_MACHINE_j7-evm = "j721e_evm_r5_defconfig"
-UBOOT_MACHINE_j7-hs-evm = "j721e_hs_evm_r5_defconfig"
-
-EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
-EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-
-UBOOT_BINARY = "tiboot3.bin"
-UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
-SPL_BINARY_k3 = ""
-- 
2.7.4


