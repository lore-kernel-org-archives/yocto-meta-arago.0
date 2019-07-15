Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 67E39520E1
	for <meta-arago@arago-project.org>;
	Mon, 15 Jul 2019 19:17:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FJGIhu018088
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563218178;
	bh=LqscnIBG0fFAhkVTPwLnn+aeCw8ZiCD2ggpL2jNaGr0=;
	h=From:To:CC:Subject:Date;
	b=s8/hIKIZQAf2CqGHz9eN+RKvSrheGmd2xk4hZA0ZGelTXM8H9uNTiY/Te01QyTt4B
	RjE/uTVOek/uTb0Kg7L3/n1nbhDr8vUy2Z3I3ndAeabYP5KxKW0njHRxAZmZl1gAdh
	I7X9nYGNonXRCYE9EKGDzicvNHbVpCKdenxy+84Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FJGIIA004243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 14:16:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 14:16:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 14:16:17 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FJGHHV026541;
	Mon, 15 Jul 2019 14:16:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Jul 2019 14:59:36 -0400
Message-ID: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/2] kaldi: add the kaldi speech recognition toolkit
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
X-List-Received-Date: Mon, 15 Jul 2019 19:17:08 -0000
Content-Type: text/plain

From: Yimin Zhang <a0216607@ti.com>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-support/kaldi/kaldi_git.bb             | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb

diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
new file mode 100644
index 0000000..6937696
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
+EXTRA_OECONF += "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
+
+EXTRA_OEMAKE = "-C src"
+
+do_configure() {
+	cd src
+	chmod +x configure
+	./configure ${EXTRA_OECONF}
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


