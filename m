Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 784E552A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1342C20C41;
	Thu, 13 Sep 2018 19:17:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id igTmC5LPw763; Thu, 13 Sep 2018 19:17:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA34F20059;
	Thu, 13 Sep 2018 19:17:28 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 23471163639;
	Thu, 13 Sep 2018 15:17:28 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 13 Sep 2018 15:17:25 -0400
Message-Id: <1536866245-50936-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-k3-r5: update SYSFW to 2018.08b
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
X-List-Received-Date: Thu, 13 Sep 2018 19:17:41 -0000

Also install and deploy versioned SYSFW binary with short symlink.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb          | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index 0ff5658..57055c7 100644
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
 
@@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
 
 do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/sysfw.bin -l 0x40000
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


