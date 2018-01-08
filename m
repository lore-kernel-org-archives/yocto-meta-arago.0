Return-Path: <s-das@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3A5ED529BB
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 20:07:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08K7UkU026553
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 14:07:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515442051;
	bh=eP2hqWJYp6gHpjHQqy31lQnu9pQ6llW/RClq38OBtwg=;
	h=From:To:CC:Subject:Date;
	b=u0v4/ojTu602Tcf0DFA6qFlT7hw1XeZGBBGGtqIsUpfjXM/SIrCHb/cdlabKy/s/l
	xiX94/j/Y+ckxaG7HgnNac++k9cXKm5d6rT1WFbxUN7kRRsvNCwKb5Kh/KGoe8yIEe
	vL+w7MqvyHPhTm1lN9aCD3XKJI1mFNtLeSQuTDfw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08K7UVQ007059
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 14:07:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 14:07:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 14:07:30 -0600
Received: from uda0226011a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08K7UcJ024670;
	Mon, 8 Jan 2018 14:07:30 -0600
From: Suraj Das <s-das@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 15:07:25 -0500
Message-ID: <1515442045-9279-1-git-send-email-s-das@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] ti-cgt-pru: update toolchain to 2.2.1 version
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
X-List-Received-Date: Mon, 08 Jan 2018 20:07:37 -0000
Content-Type: text/plain

---
 recipes-ti/devtools/ti-cgt-pru_2.2.1.bb | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 recipes-ti/devtools/ti-cgt-pru_2.2.1.bb

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
new file mode 100644
index 0000000..8d3887e
--- /dev/null
+++ b/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "TI PRU Code Generation Tools"
+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
+
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
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
+SRC_URI[cgt-pru-x86.md5sum] = "749d75841eef7b465c7cb08beaa1d135"
+SRC_URI[cgt-pru-x86.sha256sum] = "7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377"
+
+SRC_URI[cgt-pru-arm.md5sum] = "389eef56777e30e6dab337efca4af2bf"
+SRC_URI[cgt-pru-arm.sha256sum] = "b47a032f67cb3a3e5bea8ee3ed1908038f42938dd08e2ff72fc64f7aae2c1ff8"
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


