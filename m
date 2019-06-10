Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1868E52A13
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 23:50:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo6MT033134
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560210606;
	bh=Iw+dicFIpGkFlZiwlI1tlk9/3SHbZ3NljplEE7qcfKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FV+2Uxn/IQPJkPU1qXTzLDJHwkoBK9xSQ7FO8NMJCXvYGOtV/zw3VnYxVzSD26INm
	vo2fPFz7PxUZjV1w8cReEgNzZCoK1LDqydI47sRdC3rDqpTziexhB/cZ3c8ZPmVgxF
	LNbDDhe9CpohsSV+Jr9U9zfouI+YhH+/9h3KtMUM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANo670115942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:50:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:50:05 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo4wl077708;
	Mon, 10 Jun 2019 18:50:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Jun 2019 23:37:48 +0000
Message-ID: <20190610233750.31009-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610233750.31009-1-denys@ti.com>
References: <20190610233750.31009-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/4] ti-sci-fw: upgrade to 2019.05 and add support for J7 platform
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
X-List-Received-Date: Mon, 10 Jun 2019 23:50:47 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ci-fw_2019.04a.bb => ti-sci-fw_2019.05.bb} | 48 +++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.04a.bb => ti-sci-fw_2019.05.bb} (61%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb
similarity index 61%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb
index 60e15892..e783f33d 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.04a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.05.bb
@@ -14,11 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "b41c4f097ab6f341462645f76059f48f78bbd17e"
-
+SRCREV = "94a06ceb66aa821b293e8b903f6b65346d33328d"
 BRANCH ?= "ti-linux-firmware"
-
-SRCREV_imggen = "f68fe913c16f13a7e04f6f340de1c4f6cc561c10"
+SRCREV_imggen = "45a79c0ec817df212296bb148aa55f888d3a7f8b"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
@@ -26,7 +24,7 @@ SRC_URI = " \
 	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
-# Please note, "install.source.dir.local" is not a real URL, files need to be pre-downloaded
+# Please note, "install.source.dir.local" is not a real URL, below files need to be pre-downloaded
 SRC_URI_append_am65xx-hs-evm = " \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-cert.bin;name=hs-cert \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
@@ -39,20 +37,42 @@ SRC_URI[hs-enc.sha256sum] = "73a17fd6ee2770d12ba328dd64009572b9ab0fbd4989111b34a
 
 S = "${WORKDIR}/git"
 
-SYSFW_TISCI_am65xx-evm = "${S}/ti-sysfw/ti-sci-firmware-am65x-gp.bin"
-SYSFW_TISCI_am65xx-hs-evm = "${WORKDIR}/ti-sci-firmware-am65x-hs-*.bin"
-SYSFW_BINARY = "sysfw.itb"
+SYSFW_SOC_am65xx = "am65x"
+SYSFW_SOC_j7-evm = "j721e"
+SYSFW_CONFIG = "evm"
+
+SYSFW_PREFIX = "ti-sci-firmware"
+
+SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-gp"
+SYSFW_BASE_am65xx-hs-evm = "${SYSFW_PREFIX}-${SYSFW_SOC}-hs"
+
+SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
+SYSFW_TISCI_am65xx-hs-evm = "${WORKDIR}/${SYSFW_BASE}-*.bin"
+
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${PV}.itb"
+SYSFW_SYMLINK = "sysfw.itb"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
 
 CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${ELT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
 CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
-EXTRA_OEMAKE = "CROSS_COMPILE=${CROSS_COMPILE_V7} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL=''"
-EXTRA_OEMAKE_append_am65xx-hs-evm = " HS=1"
+EXTRA_OEMAKE = "\
+    CROSS_COMPILE=${CROSS_COMPILE_V7} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
+    SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
+"
+EXTRA_OEMAKE_append_am65xx-hs-evm = " \
+    HS=1 SYSFW_HS_PATH="${WORKDIR}/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${WORKDIR}/${SYSFW_BASE}-cert.bin" \
+"
 
 do_compile() {
-	cp ${SYSFW_TISCI} ${WORKDIR}/imggen/
 	cd ${WORKDIR}/imggen/
 	oe_runmake
 }
@@ -60,7 +80,7 @@ do_compile() {
 do_install() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
-	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
+	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_SYMLINK}
 }
 
 FILES_${PN} = "/boot"
@@ -70,8 +90,8 @@ inherit deploy
 do_deploy () {
 	install -d ${DEPLOYDIR}
 	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
-	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
+	rm -f ${DEPLOYDIR}/${SYSFW_SYMLINK}
+	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_SYMLINK}
 
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
-- 
2.17.1


