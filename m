Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D1A0A529A5
	for <meta-arago@arago-project.org>;
	Thu,  2 Apr 2020 01:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9772E40BCC;
	Thu,  2 Apr 2020 01:33:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9L-mkaIS1mQx; Thu,  2 Apr 2020 01:33:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7823540A32;
	Thu,  2 Apr 2020 01:33:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 80C921718E5;
	Wed,  1 Apr 2020 21:33:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  1 Apr 2020 21:33:42 -0400
Message-Id: <1585791222-47370-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] recipes, packages: deprecate openfst and kaldi components
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
X-List-Received-Date: Thu, 02 Apr 2020 01:35:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-opencl.bb             |  1 -
 .../recipes-support/kaldi/kaldi_git.bb             | 47 ------------------
 .../recipes-support/openfst/openfst_1.6.2.bb       | 56 ----------------------
 3 files changed, 104 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index 0217705..4b3e9db 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -23,7 +23,6 @@ EXTRA_PKGS_append_k2hk = " \
 #    ti-fftw-examples
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
-    kaldi \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
deleted file mode 100644
index 4c14968..0000000
--- a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "TI KALDI speech recognition toolkit"
-HOMEPAGE = "http://kaldi-asr.org"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=35439d742a3df991e4f4f0e68e2d634c"
-
-PR = "r0"
-COMPATIBLE_MACHINE = "dra7xx"
-
-require recipes-ti/includes/arago-paths.inc
-
-SRC_URI = "git://git.ti.com/processor-sdk/kaldi.git;protocol=git;branch=${BRANCH}"
-BRANCH = "kaldi_1-0-0"
-SRCREV = "a472be2e2f8598a3e360bc7ca87ff4f73afa2d9e"
-
-DEPENDS = " \
-	linalg \
-	openfst \
-"
-
-S = "${WORKDIR}/git"
-
-export LINALG_DIR  = "${LINALG_INSTALL_DIR}"
-export OPENFST_DIR = "${STAGING_DIR_TARGET}${prefix}"
-export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-KALDI_CONF = "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
-
-EXTRA_OEMAKE = "-C src"
-
-do_configure() {
-	cd src
-	chmod +x configure
-	./configure ${KALDI_CONF}
-}
-
-do_compile() {
-	oe_runmake online2bin featbin
-}
-
-do_install() {
-	chmod +x export_kaldi.sh
-	./export_kaldi.sh --nnet2-online . ${D}${datadir}/ti/examples/kaldi
-}
-
-# to create a package for KALDI
-FILES_${PN} += "${datadir}/ti/examples/kaldi"
diff --git a/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb b/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
deleted file mode 100644
index b2a1f66..0000000
--- a/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "OpenFst: library for operating on finite-state transducers"
-DESCRIPTION = "OpenFst: a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)"
-LICENSE = "Apache-2.0"
-HOMEPAGE = "http://www.openfst.org/twiki/bin/view/FST/WebHome"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=17bdccf7f927b4b2aeac950537db3369"
-SRC_URI = "http://openslr.org/resources/2/openfst-${PV}.tar.gz"
-
-S = "${WORKDIR}/openfst-${PV}"
-
-SRC_URI[md5sum] = "e5b2b8c41a8320a03f3a8bbea63bb0ca"
-SRC_URI[sha256sum] = "3f72e35097fdf1c1c41e15165c16696c223295b40b7b145b5466306db7972578"
-
-inherit autotools ${@bb.utils.contains("PACKAGECONFIG", "python", "pythonnative", "", d)}
-
-# From the OpenFST documentation:
-#
-#Optional features:
-#
-#  --enable-bin             Enable fst::script and executables (def: yes)
-#  --enable-compact-fsts    Enable CompactFst extensions (def: no)
-#  --enable-compress        Enable compression extension (def: no)
-#  --enable-const-fsts      Enable ConstFst extensions (def: no)
-#  --enable-far             Enable FAR extensions (def: no)
-#  --enable-grm             Enable all dependencies of OpenGrm (def: no)
-#  --enable-linear-fsts     Enable LinearTagger/ClassifierFst extensions (def: no)
-#  --enable-lookahead-fsts  Enable LookAheadFst extensions (def: no)
-#  --enable-mpdt            Enable MPDT extensions (def: no)
-#  --enable-ngram-fsts      Enable NGramFst extensions (def: no)
-#  --enable-pdt             Enable PDT extensions (def: no)
-#  --enable-python          Enable Python extension (def: no)
-#  --enable-special         Enable special-matcher extensions (def: no)
-
-PACKAGECONFIG ??= "bin static-only-libs far ngram-fsts"
-
-PACKAGECONFIG[bin] = "--enable-bin,--disable-bin,,"
-PACKAGECONFIG[static-only-libs] = "--enable-static --disable-shared,--enable-static --enable-shared,,"
-PACKAGECONFIG[compact-fsts] = "--enable-compact-fsts,--disable-compact-fsts,,"
-PACKAGECONFIG[compress] = "--enable-compress,--disable-compress,zlib,"
-PACKAGECONFIG[const-fsts] = "--enable-const-fsts,--disable-const-fsts,,"
-PACKAGECONFIG[far] = "--enable-far,--disable-far,,"
-PACKAGECONFIG[grm] = "--enable-grm,--disable-grm,,"
-PACKAGECONFIG[linear-fsts] = "--enable-linear-fsts,--disable-linear-fsts,,"
-PACKAGECONFIG[lookahead-fsts] = "--enable-lookahead-fsts,--disable-lookahead-fsts,,"
-PACKAGECONFIG[mpdt] = "--enable-mpdt,--disable-mpdt,,"
-PACKAGECONFIG[ngram-fsts] = "--enable-ngram-fsts,--disable-ngram-fsts,,"
-PACKAGECONFIG[pdt] = "--enable-pdt,--disable-pdt,,"
-PACKAGECONFIG[python] = "--enable-python,--disable-python,,${PYTHON_PN}"
-PACKAGECONFIG[special] = "--enable-special,--disable-special,,"
-
-FILES_${PN} += "${libdir}/fst/* ${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_${PN}-dev += "${libdir}/fst/*${SOLIBSDEV} ${libdir}/fst/*.la ${PYTHON_SITEPACKAGES_DIR}/*.la"
-FILES_${PN}-staticdev += "${libdir}/fst/*.a ${PYTHON_SITEPACKAGES_DIR}/*.a"
-
-ALLOW_EMPTY_${PN} = "${@bb.utils.contains("PACKAGECONFIG", "bin", "0", "1", d)}"
-- 
2.7.4


