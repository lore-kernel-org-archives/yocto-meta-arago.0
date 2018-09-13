Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6E3AB52993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D5DB20C41;
	Thu, 13 Sep 2018 19:43:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ckFq7qGY-OPA; Thu, 13 Sep 2018 19:43:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E14D207AB;
	Thu, 13 Sep 2018 19:43:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 86055163639;
	Thu, 13 Sep 2018 15:43:11 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 13 Sep 2018 15:43:10 -0400
Message-Id: <1536867790-1768-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH v2] u-boot-k3-r5: update SYSFW to 2018.08b
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
X-List-Received-Date: Thu, 13 Sep 2018 19:43:21 -0000

Also install and deploy versioned SYSFW binary with short symlink.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - replace remaining 2 instances of sysfw.bin with ${SYSFW_BINARY}

 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb        | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index 0ff5658..04476ae 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -7,10 +7,12 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-SYSFW_VER = "2018.07a"
-SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
+SYSFW_VER = "2018.08b"
+SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
+SYSFW_BINARY = "sysfw.bin"
+SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
 
-SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
+SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
 SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
 SRCREV_FORMAT = "sysfw"
 
@@ -25,7 +27,7 @@ UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/sysfw.bin'
+EXTRA_OEMAKE += 'SYSFW=${WORKDIR}/${SYSFW_BINARY}'
 
 UBOOT_BINARY = "tiboot3.bin"
 UBOOT_IMAGE = "tiboot3-${MACHINE}-${PV}-${PR}.bin"
@@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
 
 do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/${SYSFW_BINARY} -l 0x40000
 }
 
 do_install_append() {
-	install -m 644 ${WORKDIR}/sysfw.bin ${D}/boot/
+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
+	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
 }
 
 do_deploy_append() {
-	install -m 644 ${WORKDIR}/sysfw.bin ${DEPLOYDIR}/
+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
+	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
 }
-- 
2.7.4


