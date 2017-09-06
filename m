Return-Path: <i-pang@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 68F8A529CD
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 20:28:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86KSDK3017311
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 15:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504729693;
	bh=f7nvKe9+Qmm8B87GqVNdZWEkeBoDRBXL+0K/f128Pek=;
	h=From:To:Subject:Date;
	b=SjQ5W3AYUzvXtPhW/ZzLeDaHfMrkqPY8qR6batgRfZcuPGARTlf0NnUuAZIHPiTjS
	8D8OzANwi6YD+LyB305zh+uxYVygp/2KZg+vj2E0//bm8XpKVuNxI5nmFI794bpjD/
	XG6ostd/tIWb4iOcuzN/pA9LMmvV3e+mF2BnaEIc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86KSDo4031846
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 15:28:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 15:28:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 15:28:13 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86KSDJl011899
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 15:28:13 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 15:28:13 -0500
Message-ID: <1504729693-32319-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-cgt-pru: updated version to 2.1.5
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
X-List-Received-Date: Wed, 06 Sep 2017 20:28:13 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/ti-cgt-pru_2.1.5.bb | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt-pru_2.1.5.bb

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
new file mode 100644
index 0000000..5586d0f
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "TI PRU Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-unpack.inc
+
+BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
+BINFILE_NAME = "cgt-pru-x86"
+TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_CMDS = ""
+
+BINFILE_class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
+BINFILE_NAME_class-target = "cgt-pru-arm"
+
+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
+
+SRC_URI[cgt-pru-x86.md5sum] = "06ac11b90a55ee787ac20fcca9a27013"
+SRC_URI[cgt-pru-x86.sha256sum] = "0f5b965ae1fda818ce5a81f1adbdae0a65047c6ae6cff1869e08e678122f8dff"
+
+SRC_URI[cgt-pru-arm.md5sum] = "bedda3b31d8918d5d1d3c6d886821d0a"
+SRC_URI[cgt-pru-arm.sha256sum] = "f2711478f9160a73660a2b2f316ad446bc481141bb9889f1001441beccce3584"
+
+do_install() {
+    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
+    cp -r ${S}/ti-cgt-pru_${PV}/. \
+          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
+}
+
+do_install_class-target() {
+    ${WORKDIR}/${BINFILE} --prefix ${D}
+}
+
+FILES_${PN} += "${datadir}/ti/*"
+
+FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
+                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
+"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+INSANE_SKIP_${PN} += "arch staticdev already-stripped"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


