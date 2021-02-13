Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 1EB18529D0
	for <meta-arago@arago-project.org>;
	Sat, 13 Feb 2021 06:47:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11D6lI5I109629
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2021 00:47:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613198838;
	bh=VN167l2uMo5Cpu2FTodN/nRHuqjAR+tVsc8iqiOCQvU=;
	h=From:To:CC:Subject:Date;
	b=TxSm5Z4w/4T2s8uVpGggTlk/eiKeBtsdKMtTHe98gfD5vUrzjazXr4uCpAZ8XxO7M
	WqwIe38tYcFAEmbVs22DT4kZ/2/CslxRGFakm0QJj7FIYPLQt0SMLDuBPbHSF07HmN
	ug45Lubn2f9JcteX8HPy+L4HBw5GXMcDI71u44Es=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11D6lIrQ007202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2021 00:47:18 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 13 Feb 2021 00:47:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 13 Feb 2021 00:47:17 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11D6lFoD078287;
	Sat, 13 Feb 2021 00:47:16 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <dmurphy@ti.com>
Date: Sat, 13 Feb 2021 12:17:04 +0530
Message-ID: <20210213064704.29454-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com
Subject: [meta-ti][dunfell PATCH v2] recipes-bsp: wl-fw: New recipe for WiLink firmwares
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
X-List-Received-Date: Sat, 13 Feb 2021 06:47:09 -0000
Content-Type: text/plain

Add a new recipe which installs the WiLink firmware from the
official ti-linux-firmware repo.

This is required for supporting the Wireless functionaliy on
the am64xx-sk board.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Only install files that are required

As confirmed with Kishon offline, we only need single firmware binary.
Others are not required.

 recipes-bsp/wl-fw/wl-fw_git.bb | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-bsp/wl-fw/wl-fw_git.bb

diff --git a/recipes-bsp/wl-fw/wl-fw_git.bb b/recipes-bsp/wl-fw/wl-fw_git.bb
new file mode 100644
index 00000000..2e063af5
--- /dev/null
+++ b/recipes-bsp/wl-fw/wl-fw_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Firmware files for Wilink"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec"
+
+PV = "7.3+git${SRCPV}"
+
+SRCREV = "b66ee9ae020c31d7138f0af38518823bb4f5791e"
+BRANCH = "ti-linux-firmware"
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;branch=${BRANCH}"
+
+COMPATIBLE_MACHINE = "k3"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CLEANBROKEN = "1"
+
+S = "${WORKDIR}/git"
+
+TARGET = "wl18xx-fw-4.bin"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${base_libdir}/firmware/ti-connectivity
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-connectivity/$f ${D}${base_libdir}/firmware/ti-connectivity/$f
+	done
+}
+
+FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
-- 
2.17.1


