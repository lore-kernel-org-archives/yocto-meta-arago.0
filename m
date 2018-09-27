Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 890DB52998
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 23:32:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNWnn3003186
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091169;
	bh=zMrZhS4jWjHVsepe0I6tSJxyKUb6jmFbCPN5iFzNZgc=;
	h=From:To:CC:Subject:Date;
	b=jCtdesu2n7uXNFQ3qzfqADk/lJTROuOGtUlSQs+FpzE7yHVQy986I7QLmYUNUG84M
	iUhWofvgkCUK5XTyIAqpyPGgkyRgX32NSGiHn0ZLV+OQX7m8m9Soo77OFIedr69zg9
	Yb2kBfmnra5EZkLPgH7hOFr/SJIqoG3+LjxBDomI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWnGb020218
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:49 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:32:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 18:32:49 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWnn8004772;
	Thu, 27 Sep 2018 18:32:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 23:28:34 +0000
Message-ID: <20180927232836.21884-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next][PATCH 1/3] ti-sci-fw: separate SYSFW 2018.08b packaging into own recipe
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
 .../ti-sci-fw/ti-sci-fw_2018.08b.bb           | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb
new file mode 100644
index 00000000..c2573b84
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb
@@ -0,0 +1,58 @@
+SUMMARY = "TI SCI firmware"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
+
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = " \
+	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
+	git://bitbucket.itg.ti.com/scm/~a0797059/system-firmware-image-gen.git;protocol=http;branch=master;destsuffix=imggen;name=imggen \
+"
+
+SRCREV_imggen = "00f62b3e8b3b02a17b8d08686f1a907d6a395ff9"
+SRCREV_FORMAT = "imggen"
+
+S = "${WORKDIR}/git"
+
+SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
+SYSFW_BINARY = "sysfw.itb"
+SYSFW_IMAGE = "sysfw-${PV}.itb"
+
+CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
+PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
+
+do_compile() {
+	cp ${S}/ti-sysfw/${SYSFW_TISCI} ${WORKDIR}/imggen/
+	cd ${WORKDIR}/imggen/
+	oe_runmake SYSFW_DL_URL=""
+}
+
+do_install() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
+	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
+}
+
+FILES_${PN} = "/boot"
+
+inherit deploy
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
+	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
+}
+
+addtask deploy before do_build after do_compile
-- 
2.17.1


