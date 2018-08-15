Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5937552A29
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2018 22:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D62D020C46;
	Wed, 15 Aug 2018 22:04:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a6FpGq8IaUbM; Wed, 15 Aug 2018 22:04:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A41E720567;
	Wed, 15 Aug 2018 22:04:32 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2111F16354F;
	Wed, 15 Aug 2018 18:04:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 15 Aug 2018 18:04:31 -0400
Message-Id: <1534370671-53172-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-k3-r5: update SYSFW to public version 2018.07a from git.ti.com/ti-linux-firmware
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
X-List-Received-Date: Wed, 15 Aug 2018 22:04:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb             | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index b733793..0ff5658 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -7,16 +7,16 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-SYSFW_VER = "2018.07"
+SYSFW_VER = "2018.07a"
 SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
-SYSFW_DL_am65xx-evm = "ti-sci-firmware-am6x-gp-${SYSFW_VER}.bin"
+
+SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
+SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
+SRCREV_FORMAT = "sysfw"
 
 SRC_URI += " \
 	file://gen_x509_cert.sh \
-	http://lcpd.gt.design.ti.com/sysfw/${SYSFW_VER}/${SYSFW_BIN};name=sysfw;downloadfilename=${SYSFW_DL}"
-
-SRC_URI[sysfw.md5sum] = "368fc9e9b2113b0d25bae901d521c638"
-SRC_URI[sysfw.sha256sum] = "7ed6262ce8a1171eb10a89845d6007ea5e54d80647c6af57434d10d4ded8d80b"
+	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;name=sysfw;branch=${SYSFW_BRANCH};destsuffix=fw"
 
 CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
@@ -33,7 +33,7 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
 
 do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/${SYSFW_DL} -o ${WORKDIR}/sysfw.bin -l 0x40000
+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
 }
 
 do_install_append() {
-- 
2.7.4


