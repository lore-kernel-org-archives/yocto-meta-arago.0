Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E2B4852986
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C4D840BAA;
	Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id q5FMOZ4-3VBW; Thu,  9 May 2019 04:15:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21D4340BAD;
	Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CCA0416EAF7;
	Thu,  9 May 2019 00:15:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:28 -0400
Message-Id: <1557375331-41998-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375331-41998-1-git-send-email-denys@ti.com>
References: <1557375331-41998-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 6/9] ti-sci-fw: add support for am65xx-hs-evm
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
X-List-Received-Date: Thu, 09 May 2019 04:16:08 -0000

This uses HS SYSFW images that have to be pre-downloaded for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb    | 33 +++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
index 0519b56..60e1589 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
@@ -11,31 +11,50 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+TI_SECURE_DEV_PKG ?= ""
+export TI_SECURE_DEV_PKG
+
 SRCREV = "b41c4f097ab6f341462645f76059f48f78bbd17e"
 
 BRANCH ?= "ti-linux-firmware"
 
+SRCREV_imggen = "f68fe913c16f13a7e04f6f340de1c4f6cc561c10"
+SRCREV_FORMAT = "imggen"
+
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
 	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-SRCREV_imggen = "f68fe913c16f13a7e04f6f340de1c4f6cc561c10"
-SRCREV_FORMAT = "imggen"
+# Please note, "install.source.dir.local" is not a real URL, files need to be pre-downloaded
+SRC_URI_append_am65xx-hs-evm = " \
+	http://install.source.dir.local/ti-sci-firmware-am65x-hs-cert.bin;name=hs-cert \
+	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
+"
+
+SRC_URI[hs-cert.md5sum] = "9c4de5577d92c83a467dad36ef04691b"
+SRC_URI[hs-cert.sha256sum] = "262d4e4edc8eca996caaeefeb3d5daffe11d45d9499c6f71ad1a6a2fcf68aa97"
+SRC_URI[hs-enc.md5sum] = "c851061ec96db61b601ad3685b1ecd23"
+SRC_URI[hs-enc.sha256sum] = "73a17fd6ee2770d12ba328dd64009572b9ab0fbd4989111b34a7d67c5dfd2ca8"
 
 S = "${WORKDIR}/git"
 
-SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
+SYSFW_TISCI_am65xx-evm = "${S}/ti-sysfw/ti-sci-firmware-am65x-gp.bin"
+SYSFW_TISCI_am65xx-hs-evm = "${WORKDIR}/ti-sci-firmware-am65x-hs-*.bin"
 SYSFW_BINARY = "sysfw.itb"
 SYSFW_IMAGE = "sysfw-${PV}.itb"
 
-CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
+CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${ELT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
+CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
+EXTRA_OEMAKE = "CROSS_COMPILE=${CROSS_COMPILE_V7} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL=''"
+EXTRA_OEMAKE_append_am65xx-hs-evm = " HS=1"
+
 do_compile() {
-	cp ${S}/ti-sysfw/${SYSFW_TISCI} ${WORKDIR}/imggen/
+	cp ${SYSFW_TISCI} ${WORKDIR}/imggen/
 	cd ${WORKDIR}/imggen/
-	oe_runmake SYSFW_DL_URL=""
+	oe_runmake
 }
 
 do_install() {
@@ -54,7 +73,7 @@ do_deploy () {
 	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
 	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
 
-        install -m 644 ${S}/ti-sysfw/${SYSFW_TISCI} ${DEPLOYDIR}/${SYSFW_TISCI}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile
-- 
2.7.4


