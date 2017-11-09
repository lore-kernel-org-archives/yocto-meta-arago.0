Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 64A1652A19
	for <meta-arago@arago-project.org>;
	Thu,  9 Nov 2017 13:20:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA9DKgtj004303
	for <meta-arago@arago-project.org>; Thu, 9 Nov 2017 07:20:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510233643;
	bh=YSHflV/P1xdpsOva6imX2U8rLK32tAwgSO4AVLHLBRU=;
	h=From:To:CC:Subject:Date;
	b=FwqCm0iKig4JmjDXWqOYlRvFiLA70QifI7CRAkYJL9Em4dktsh2gjgTYSAq3B5BeZ
	80ErOEvLJtLJulI3Nz5RkLCNO/WSeP15xvk4s8rStzq3H28oQ0bjVpwMEbQaxZAgiP
	oFNEoAQ9FQknxz5NVzG1xaZ38G/36sbziM4Q3+tA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9DKgQ2012714
	for <meta-arago@arago-project.org>; Thu, 9 Nov 2017 07:20:42 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 9 Nov 2017 07:20:42 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 9 Nov 2017 07:20:42 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9DKgiG014556;
	Thu, 9 Nov 2017 07:20:42 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Nov 2017 08:13:10 -0500
Message-ID: <1510233190-7015-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] openfst: library for operating on finite-state transducers
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
X-List-Received-Date: Thu, 09 Nov 2017 13:20:44 -0000
Content-Type: text/plain

From: Yimin Zhang <a0216607@ti.com>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-support/openfst/openfst_1.6.2.bb       | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb

diff --git a/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb b/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
new file mode 100644
index 0000000..2f693d2
--- /dev/null
+++ b/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
@@ -0,0 +1,56 @@
+SUMMARY = "OpenFst: library for operating on finite-state transducers"
+DESCRIPTION = "OpenFst: a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)"
+LICENSE = "Apache-2.0"
+HOMEPAGE = "http://www.openfst.org/twiki/bin/view/FST/WebHome"
+PR ="r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=17bdccf7f927b4b2aeac950537db3369"
+SRC_URI = "http://openslr.org/resources/2/openfst-${PV}.tar.gz"
+
+S = "${WORKDIR}/openfst-${PV}"
+
+SRC_URI[md5sum] = "e5b2b8c41a8320a03f3a8bbea63bb0ca"
+SRC_URI[sha256sum] = "3f72e35097fdf1c1c41e15165c16696c223295b40b7b145b5466306db7972578"
+
+inherit autotools pythonnative
+
+# From the OpenFST documentation:
+#
+#Optional features:
+#
+#  --enable-bin             Enable fst::script and executables (def: yes)
+#  --enable-compact-fsts    Enable CompactFst extensions (def: no)
+#  --enable-compress        Enable compression extension (def: no)
+#  --enable-const-fsts      Enable ConstFst extensions (def: no)
+#  --enable-far             Enable FAR extensions (def: no)
+#  --enable-grm             Enable all dependencies of OpenGrm (def: no)
+#  --enable-linear-fsts     Enable LinearTagger/ClassifierFst extensions (def: no)
+#  --enable-lookahead-fsts  Enable LookAheadFst extensions (def: no)
+#  --enable-mpdt            Enable MPDT extensions (def: no)
+#  --enable-ngram-fsts      Enable NGramFst extensions (def: no)
+#  --enable-pdt             Enable PDT extensions (def: no)
+#  --enable-python          Enable Python extension (def: no)
+#  --enable-special         Enable special-matcher extensions (def: no)
+
+PACKAGECONFIG ??= "bin static-only-libs far ngram-fsts"
+
+PACKAGECONFIG[bin] = "--enable-bin,--disable-bin,,"
+PACKAGECONFIG[static-only-libs] = "--enable-static --disable-shared,--enable-static --enable-shared,,"
+PACKAGECONFIG[compact-fsts] = "--enable-compact-fsts,--disable-compact-fsts,,"
+PACKAGECONFIG[compress] = "--enable-compress,--disable-compress,zlib,"
+PACKAGECONFIG[const-fsts] = "--enable-const-fsts,--disable-const-fsts,,"
+PACKAGECONFIG[far] = "--enable-far,--disable-far,,"
+PACKAGECONFIG[grm] = "--enable-grm,--disable-grm,,"
+PACKAGECONFIG[linear-fsts] = "--enable-linear-fsts,--disable-linear-fsts,,"
+PACKAGECONFIG[lookahead-fsts] = "--enable-lookahead-fsts,--disable-lookahead-fsts,,"
+PACKAGECONFIG[mpdt] = "--enable-mpdt,--disable-mpdt,,"
+PACKAGECONFIG[ngram-fsts] = "--enable-ngram-fsts,--disable-ngram-fsts,,"
+PACKAGECONFIG[pdt] = "--enable-pdt,--disable-pdt,,"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,,${PYTHON_PN}"
+PACKAGECONFIG[special] = "--enable-special,--disable-special,,"
+
+FILES_${PN} += "${libdir}/fst/* ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-dev += "${libdir}/fst/*${SOLIBSDEV} ${libdir}/fst/*.la ${PYTHON_SITEPACKAGES_DIR}/*.la"
+FILES_${PN}-staticdev += "${libdir}/fst/*.a ${PYTHON_SITEPACKAGES_DIR}/*.a"
+
+ALLOW_EMPTY_${PN} = "${@bb.utils.contains("PACKAGECONFIG", "bin", "0", "1", d)}"
-- 
2.7.4


