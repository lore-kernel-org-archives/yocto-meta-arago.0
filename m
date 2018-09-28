Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A778C52A2B
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 21:01:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SL1H7Y118566
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538168477;
	bh=FGPafi1Z2hqPlh1Qx16ESoyOP+yFYh5LKDn6yL+e7Gc=;
	h=From:To:CC:Subject:Date;
	b=qs4atKP9mKD7EdLrRdG3W8ARzWPAgKFeDbB1chXRsusNRRneeg93OwfJNQZgz1xDK
	kNxS9P+zxbDJU4svZNwqa/in5VWMHOCKBmsvQfWE7kE7kCyb/7yRdlsUFWHmYUjPeS
	wfEjOFRhRXYW1xnxMqQX5hdRi4RK4spMrs30RwG4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1HiR006833
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 16:01:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 16:01:14 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1DZg013264;
	Fri, 28 Sep 2018 16:01:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Sep 2018 20:57:00 +0000
Message-ID: <20180928205703.28562-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCHv2 1/4] ti-sci-fw: separate SYSFW 2018.08b packaging into own recipe
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
X-List-Received-Date: Fri, 28 Sep 2018 21:01:27 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - use public location for sysfw image gen tool

 .../ti-sci-fw/ti-sci-fw_2018.08b.bb           | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.08b.bb
new file mode 100644
index 00000000..bf340312
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
+	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+"
+
+SRCREV_imggen = "8641afac31fae30472edcef797d17d66a335f960"
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


