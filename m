Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A948B520C0
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 21:22:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GLLVig049355
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 16:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563312091;
	bh=V/KE68UUDDsLuJnCSPZ+J/Y6EQrs64tQr6WibUveuM4=;
	h=From:To:CC:Subject:Date;
	b=Jn2bzTD3R+VUcbwf+Dx64xgdvrQNoyC700DJqEpypbF7wzzfztCY14i0LlnTAa4xx
	fva+D4mF2jzZ68cDFz/LJVyG4Ngx3AXVbxDn811Nr2dFoeg0YADVp3uC+jI7NATZGV
	Mq9juZozI3TSQEIO8ubi9OxKY2gBqJXwt4+utU5Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GLLVsc118488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 16:21:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 16:21:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 16:21:30 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GLLUUm079122;
	Tue, 16 Jul 2019 16:21:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jul 2019 17:04:45 -0400
Message-ID: <1563311086-22881-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v2 1/2] kaldi: add the kaldi speech recognition toolkit
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
X-List-Received-Date: Tue, 16 Jul 2019 21:22:21 -0000
Content-Type: text/plain

From: Yimin Zhang <a0216607@ti.com>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Use KALDI_CONF instead of EXTRA_OECONF to avaoid confusion as this
  is a handwritten configure script without the standard options.

 .../recipes-support/kaldi/kaldi_git.bb             | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb

diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
new file mode 100644
index 0000000..4c14968
--- /dev/null
+++ b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "TI KALDI speech recognition toolkit"
+HOMEPAGE = "http://kaldi-asr.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=35439d742a3df991e4f4f0e68e2d634c"
+
+PR = "r0"
+COMPATIBLE_MACHINE = "dra7xx"
+
+require recipes-ti/includes/arago-paths.inc
+
+SRC_URI = "git://git.ti.com/processor-sdk/kaldi.git;protocol=git;branch=${BRANCH}"
+BRANCH = "kaldi_1-0-0"
+SRCREV = "a472be2e2f8598a3e360bc7ca87ff4f73afa2d9e"
+
+DEPENDS = " \
+	linalg \
+	openfst \
+"
+
+S = "${WORKDIR}/git"
+
+export LINALG_DIR  = "${LINALG_INSTALL_DIR}"
+export OPENFST_DIR = "${STAGING_DIR_TARGET}${prefix}"
+export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+KALDI_CONF = "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
+
+EXTRA_OEMAKE = "-C src"
+
+do_configure() {
+	cd src
+	chmod +x configure
+	./configure ${KALDI_CONF}
+}
+
+do_compile() {
+	oe_runmake online2bin featbin
+}
+
+do_install() {
+	chmod +x export_kaldi.sh
+	./export_kaldi.sh --nnet2-online . ${D}${datadir}/ti/examples/kaldi
+}
+
+# to create a package for KALDI
+FILES_${PN} += "${datadir}/ti/examples/kaldi"
-- 
2.7.4


