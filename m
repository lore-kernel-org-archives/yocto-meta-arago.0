Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E9291529E3
	for <meta-arago@arago-project.org>;
	Thu,  2 Aug 2018 21:26:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w72LQEGK005775
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 16:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533245174;
	bh=4gOCqfMbDH9b1IyCfRjxGau2i3herQq3uOv2ilcV+20=;
	h=From:To:CC:Subject:Date;
	b=PUD5x/0Hh0bklJ0He3piIoxtArYrJJywINKn2le1zCxfdEgKXv0Y1J9Akcf++OGxA
	rm59K94wdzVvmvd7EkyjKsNlmHiyUAEAzD4K1Uc/rNbfd/FuLnrRxc2hN7CCBE78ze
	VLCHSnMsCb6Wt6Zi0/3muOIO7/dZPlh6Cj/qZGUc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72LQEVn022506
	for <meta-arago@arago-project.org>; Thu, 2 Aug 2018 16:26:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 2 Aug 2018 16:26:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 2 Aug 2018 16:26:14 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72LQD4k012167;
	Thu, 2 Aug 2018 16:26:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Aug 2018 21:24:06 +0000
Message-ID: <20180802212406.1756-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] u-boot-k3-r5: upgrade SYSFW to 2018.07 release
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
X-List-Received-Date: Thu, 02 Aug 2018 21:26:22 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
index 6dd0027c..b733793e 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
@@ -7,15 +7,16 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-SYSFW_VER = "2018.06"
+SYSFW_VER = "2018.07"
 SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
+SYSFW_DL_am65xx-evm = "ti-sci-firmware-am6x-gp-${SYSFW_VER}.bin"
 
 SRC_URI += " \
 	file://gen_x509_cert.sh \
-	http://lcpd.gt.design.ti.com/sysfw/${SYSFW_VER}/${SYSFW_BIN};name=sysfw"
+	http://lcpd.gt.design.ti.com/sysfw/${SYSFW_VER}/${SYSFW_BIN};name=sysfw;downloadfilename=${SYSFW_DL}"
 
-SRC_URI[sysfw.md5sum] = "384a5240572a0c648a991326797fed05"
-SRC_URI[sysfw.sha256sum] = "8a0ef9bc9d21510169e8d656d2872228a8f0e703b0b25437c227a42738d45579"
+SRC_URI[sysfw.md5sum] = "368fc9e9b2113b0d25bae901d521c638"
+SRC_URI[sysfw.sha256sum] = "7ed6262ce8a1171eb10a89845d6007ea5e54d80647c6af57434d10d4ded8d80b"
 
 CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
@@ -32,7 +33,7 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
 SPL_BINARY_k3 = ""
 
 do_configure_append() {
-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/${SYSFW_DL} -o ${WORKDIR}/sysfw.bin -l 0x40000
 }
 
 do_install_append() {
-- 
2.17.1


