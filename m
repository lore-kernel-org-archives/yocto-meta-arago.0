Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9BBE252999
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 23:32:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNWoNt003190
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091170;
	bh=QrgzoRDBOtj5MrCpjsfZYz4/tUni65awBysvdLMJkBk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sZdDRm4aLFN4Dm/BfbeTAVFLbTK3OhxSYyYQu5tJFIcnNqhz6Fv6XX1uc3WyvH7Oo
	3XdFWie8Tqe7ZTjl62z7o0FX93ZK2GTbdQOPFPo9r64t8szkgHXxRjEi7DBDWud4kk
	lkYqmv016qt/B7guDxO2rf+2ekodJpgCINpgyuNI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWoje020224
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:32:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 18:32:50 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWnn9004772;
	Thu, 27 Sep 2018 18:32:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 23:28:35 +0000
Message-ID: <20180927232836.21884-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180927232836.21884-1-denys@ti.com>
References: <20180927232836.21884-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next][PATCH 2/3] u-boot-k3-r5: SYSFW is now separate from R5 SPL
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
X-List-Received-Date: Thu, 27 Sep 2018 23:32:59 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-k3-r5_2018.01.bb            | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index 04476ae4..dcd1e316 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -7,19 +7,6 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-SYSFW_VER = "2018.08b"
-SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
-SYSFW_BINARY = "sysfw.bin"
-SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
-
-SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
-SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
-SRCREV_FORMAT = "sysfw"
-
-SRC_URI += " \
-	file://gen_x509_cert.sh \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;name=sysfw;branch=${SYSFW_BRANCH};destsuffix=fw"
-
 CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
@@ -27,24 +14,8 @@ UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/${SYSFW_BINARY}'
 
 UBOOT_BINARY = "tiboot3.bin"
 UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
-
-do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/${SYSFW_BINARY} -l 0x40000
-}
-
-do_install_append() {
-	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
-	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
-}
-
-do_deploy_append() {
-	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
-	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
-}
-- 
2.17.1


