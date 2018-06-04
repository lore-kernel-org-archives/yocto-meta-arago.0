Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7E1B6529C0
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 14:56:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54Eunkc016388
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528124209;
	bh=jNxXLRn2tuWt5kiTOj/o3RR0f8LBhHr2K1xt4Y6rsCo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SIBpC2D+pEDADUh/JZH7mnImABUHHqctf3Kp1ZXsJq/IWnUrEZ3cQqMbK1YNsL36z
	dQ8vGAMwWCym1uWLq168dt/27CsnwaPeHt6IHJCOmzTckHA+/SzEjHV7l1lbPwTLN1
	Fg9SkE2kL1M01Vy6FZNjEJtZeeUS7MC2PMlrLDsY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54EunNf014618
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 09:56:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 09:56:49 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eumpq003223;
	Mon, 4 Jun 2018 09:56:49 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 10:56:44 -0400
Message-ID: <1528124204-19003-4-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528124204-19003-1-git-send-email-x0157990@ti.com>
References: <1528124204-19003-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 4/4] sbl: update for DEV.SBL.01.00.10.00
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
X-List-Received-Date: Mon, 04 Jun 2018 14:56:56 -0000
Content-Type: text/plain

* Secondary bootloader package, for K2G, AM57xx, OMAP1L

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb | 108 ++++++++++++++++++++++++++++++
 recipes-bsp/sbl-boot/sbl-boot.inc         |  21 ++++++
 2 files changed, 129 insertions(+)
 create mode 100644 recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb
 create mode 100644 recipes-bsp/sbl-boot/sbl-boot.inc

diff --git a/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb b/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb
new file mode 100644
index 0000000..848d932
--- /dev/null
+++ b/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb
@@ -0,0 +1,108 @@
+DESCRIPTION = "SBL, secondary boot loaded for K2G, AM57xx, omap1L  devices"
+
+require sbl-boot.inc
+require recipes-ti/includes/ti-paths-append.inc
+require recipes-ti/includes/ti-staging.inc
+
+PR = "${INC_PR}.1"
+
+DEPENDS = " ti-cgt-arm-native \
+            gcc-arm-none-eabi-native \
+            uart-lld-rtos \
+            spi-lld-rtos \
+            i2c-lld-rtos \
+            board-rtos \
+            common-csl-ip-rtos\
+            bison-native \
+            flex-native \
+            mono-native \
+"
+
+DEPENDS_append_omap-a15= " mmcsd-lld-rtos \
+            fatfs-rtos \
+            pm-lld-rtos \
+"
+
+DEPENDS_append_k2g = " mmcsd-lld-rtos \
+            fatfs-rtos \
+"
+
+DEPENDS_append_k2g-hs-evm = " \
+            secdev \
+            ti-cgt6x-7.4.16-native \
+            openssl-native \
+"
+
+DEPENDS_append_omapl1= " mmcsd-lld-rtos \
+            fatfs-rtos \
+"
+
+CLEANBROKEN = "1"
+
+PARTNO = ""
+PARTNO_am57xx-evm = "am57xx"
+PARTNO_k2g = "k2g"
+PARTNO_k2hk-evm = "k2hk"
+PARTNO_k2e-evm = "k2e"
+PARTNO_k2l-evm = "k2l"
+PARTNO_omapl137-evm = "omapl137"
+
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export TOOLCHAIN_PATH_ARM9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_CGT6x_INSTALL_DIR = "${TI_CGT6X_7416_INSTALL_DIR}"
+export CROSS_TOOL_PRFX = "arm-none-eabi-"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+LDFLAGS = ""
+CFLAGS = ""
+
+export SBL_SRC_DIR = "${S}"
+export SPI_WRTR_SRC_DIR = "${S}"
+export QSPI_WRTR_SRC_DIR = "${S}"
+export MMCSD_WRTR_SRC_DIR = "${S}"
+
+# Environment variables for K2G HS
+export SECBIN = "${TI_SECURE_DEV_PKG}/scripts/secimagecreate.sh"
+export KEYPATH = "${TI_SECURE_DEV_PKG}/sec/ks2keys/dev"
+export BM_DIR = "${TI_SECURE_DEV_PKG}/boot-monitor"
+export SK_DIR = "${TI_SECURE_DEV_PKG}/ram_secure_kernel"
+
+do_compile_k2g-hs-evm() {
+    cd build
+
+    # We are already messing with the sysroot...
+    for m in $(find "${TI_SECURE_DEV_PKG}/utils" -name Makefile)
+    do
+        sed -i -e 's|^SSL_PATH.*$|SSL_PATH = '"${STAGING_DIR_NATIVE}${prefix}"'|' "$m"
+    done
+    ./sbl_${PARTNO}.sh SECUREMODE=yes
+}
+
+do_compile_omapl138-lcdk() {
+    cd build
+    ./sbl_omapl138.sh
+    ./sbl_c6748.sh
+}
+
+do_compile_am57xx-evm() {
+    cd build
+    ./sbl_${PARTNO}.sh
+    cd ..
+    make sbl_lib SOC=AM572x BOARD=idkAM572x
+    make sbl_lib SOC=AM574x BOARD=idkAM574x
+}
+
+do_compile() {
+    cd build
+    ./sbl_${PARTNO}.sh
+}
+
+do_install() {
+  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl
+  find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch file-rdeps"
diff --git a/recipes-bsp/sbl-boot/sbl-boot.inc b/recipes-bsp/sbl-boot/sbl-boot.inc
new file mode 100644
index 0000000..aabb275
--- /dev/null
+++ b/recipes-bsp/sbl-boot/sbl-boot.inc
@@ -0,0 +1,21 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/qspi/sbl_qspi.h;beginline=1;endline=40;md5=db47887841d8a8cd6c41e72dd13b6d20"
+
+COMPATIBLE_MACHINE = "omap-a15|keystone|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/sbl.git"
+SBL_BOOT_GIT_PROTOCOL = "git"
+SBL_BOOT_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.SBL.01.00.10.00"
+SBL_BOOT_SRCREV = "347555de95032af61e7993e5bfa762e6b9b72ec8"
+
+BRANCH = "${SBL_BOOT_GIT_BRANCH}"
+SRC_URI = "${SBL_BOOT_GIT_URI};protocol=${SBL_BOOT_GIT_PROTOCOL};branch=${BRANCH} "
+
+SRCREV = "${SBL_BOOT_SRCREV}"
+PV = "01.00.10.00"
+INC_PR = "r0"
+
+S = "${WORKDIR}/git"
-- 
1.9.1


