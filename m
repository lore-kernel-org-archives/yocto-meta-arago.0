Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C7C87529E6
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 23:39:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCNc8xc017539
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 17:38:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576193888;
	bh=SDU3BhCVrFZNX8mrBXJcbyZ2wFS6wbhWBJ4j3YDiknQ=;
	h=From:To:CC:Subject:Date;
	b=fG/VRFD+Z3P9mgUM4pBRbyMS/4S1HmH7h6qLgb61jvI65w8Ohs+WDl1koI7dycCxN
	xgziC+dQ2z9mjVYEP9ZqXzTBSs9OzZPuZsMOa/fAHBNoejUlJq8CpkXfC+37M/mxnJ
	GLV92zO2fNx7H1er174LzDBysRItKgtZjxQSjZiU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCNc8d2055661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 17:38:08 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 17:38:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 17:38:08 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCNc7D1062807;
	Thu, 12 Dec 2019 17:38:08 -0600
From: Djordje Senicic <d-senicic1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 18:35:43 -0500
Message-ID: <20191212233543.5770-1-d-senicic1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [meta-processor-sdk][PATCHv2] neo-ai-dlr: Add TIDL support on top of meta-aws neo-ai-dlr
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
X-List-Received-Date: Thu, 12 Dec 2019 23:39:44 -0000
Content-Type: text/plain

- Add support for custom TIDL inference relay node
- Use github.com/TexasInstruments repositories
- Include CPP live demo and Python file-to-stdout inference scripts

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
---
 .../neo-ai-dlr/neo-ai-dlr.bbappend            | 64 +++++++++++++++
 ...akeLists-skip-cloning-of-googletests.patch | 54 -------------
 recipes-support/neo-ai/neo-ai-dlr_git.bb      | 77 -------------------
 3 files changed, 64 insertions(+), 131 deletions(-)
 create mode 100644 recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
 delete mode 100644 recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
 delete mode 100644 recipes-support/neo-ai/neo-ai-dlr_git.bb

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
new file mode 100644
index 0000000..50895b2
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -0,0 +1,64 @@
+PR_append = ".int0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
+                    file://3rdparty/tvm/LICENSE;md5=f563935cf80d1c889dd958372e9ea7c4 \
+                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
+                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
+                    file://3rdparty/treelite/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
+                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
+                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b \
+                    file://3rdparty/treelite/3rdparty/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
+                    file://3rdparty/treelite/3rdparty/protobuf/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://3rdparty/treelite/3rdparty/protobuf/third_party/googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
+"
+
+PV = "1.01"
+
+DEPENDS += " opencv "
+
+BRANCH-NEO-AI-DLR = "dev"
+BRANCH-NEO-TVM = "dev"
+
+# Main DLR sources plus submodules (and submodules of submodules).
+SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${BRANCH-NEO-AI-DLR};name=neo-ai-dlr \
+           git://github.com/TexasInstruments/tvm;protocol=https;branch=${BRANCH-NEO-TVM};destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
+           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
+           git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
+           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/rang;name=neo-ai-tvm-rang \
+           git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
+           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
+           git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
+           git://github.com/google/protobuf;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf;name=neo-ai-treelite-protobuf \
+           git://github.com/google/benchmark;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/benchmark;name=neo-ai-treelite-protobuf-benchmark \
+           git://github.com/google/googletest;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googletest;name=neo-ai-treelite-protobuf-googletest \
+"
+
+SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
+SRCREV_neo-ai-tvm = "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
+SRCREV_neo-ai-tvm-dmlc-core = "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
+SRCREV_neo-ai-tvm-dlpack = "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
+SRCREV_neo-ai-tvm-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
+
+SRCREV_neo-ai-treelite = "938af7867641fb09a8c93aadb66587ad9cbed9c2"
+SRCREV_neo-ai-treelite-dmlc-core = "ec147925f1daccee6a33796880935f9cec8541cf"
+SRCREV_neo-ai-treelite-fmt = "9f2e7edaebccf8f271cec5e855cce1223ff3e6d6"
+SRCREV_neo-ai-treelite-protobuf = "6d087c256c8ab04b3a1a9832746e9c3a8d3afd79"
+SRCREV_neo-ai-treelite-protobuf-benchmark = "360e66c1c4777c99402cf8cd535aa510fee16573"
+SRCREV_neo-ai-treelite-protobuf-googletest = "78fdd6c00b8fa5dd67066fbb796affc87ba0e075"
+
+do_compile_append() {
+   ninja demo
+   ninja democv
+}
+
+
+do_install_append() {
+
+    # Now install additional python test scripts, bash scripts and precomputed models
+    install -d ${D}${datadir}/dlr/demos
+    cp -Prf --preserve=mode,timestamps ${S}/examples/tidl/* ${D}${datadir}/dlr/demos
+    install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
+}
+
+RDEPENDS_${PN} =+ " tidl-api "
+FILES_${PN}-tests += "${datadir}/dlr/demos"
diff --git a/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch b/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
deleted file mode 100644
index b7d3c85..0000000
--- a/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3d9fa328598b38022c638b402d111000ce0d88c7 Mon Sep 17 00:00:00 2001
-From: Jianzhong Xu <xuj@ti.com>
-Date: Tue, 26 Nov 2019 08:53:33 -0500
-Subject: [PATCH] CMakeLists: skip cloning of googletests
-
-Signed-off-by: Jianzhong Xu <xuj@ti.com>
-
-Upstream-status: Inappropriate (OE-specific)
-* googletest should be obtained as a proper dependency
-
----
- CMakeLists.txt | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 281fdb7..70a88d7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -293,19 +293,19 @@ add_custom_target(demo DEPENDS ${DEMO_EXECS})
- 
- # Tests
- if(NOT(ANDROID_BUILD OR AAR_BUILD))
--  include(cmake/googletest.cmake)
--  fetch_googletest(
--    ${PROJECT_SOURCE_DIR}/cmake
--    ${PROJECT_BINARY_DIR}/googletest
--    )
--
--  enable_testing()
--
--  file(GLOB TEST_SRCS tests/cpp/*.cc)
--  if(WITH_TENSORFLOW_LITE_LIB)
--    file(GLOB TFLITE_TEST_SRCS tests/cpp/dlr_tflite/*.cc)
--    list(APPEND TEST_SRCS ${TFLITE_TEST_SRCS})
--  endif()
-+  #include(cmake/googletest.cmake)
-+  #fetch_googletest(
-+  #  ${PROJECT_SOURCE_DIR}/cmake
-+  #  ${PROJECT_BINARY_DIR}/googletest
-+  #  )
-+  #
-+  #enable_testing()
-+  #
-+  #file(GLOB TEST_SRCS tests/cpp/*.cc)
-+  #if(WITH_TENSORFLOW_LITE_LIB)
-+  #  file(GLOB TFLITE_TEST_SRCS tests/cpp/dlr_tflite/*.cc)
-+  #  list(APPEND TEST_SRCS ${TFLITE_TEST_SRCS})
-+  #endif()
-   foreach(__srcpath ${TEST_SRCS})
-     get_filename_component(__srcname ${__srcpath} NAME)
-     string(REPLACE ".cc" "" __execname ${__srcname})
--- 
-2.17.1
-
diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
deleted file mode 100644
index 636714a..0000000
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY = "NEO-AI Deep Learning Runtime"
-DESCRIPTION = "Neo-AI-DLR is a common runtime for machine learning models compiled by AWS SageMaker Neo, TVM, or TreeLite."
-HOMEPAGE = "https://aws.amazon.com/sagemaker/neo/"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
-                    file://3rdparty/tvm/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
-                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
-                    file://3rdparty/tvm/3rdparty/HAlideIR/LICENSE;md5=9910386e68f0616e1ecf1037479fa97e \
-                    file://3rdparty/treelite/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
-                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=c2e38bc8629eac247a73b65c1548b2f0 \
-"
-
-PV = "1.0"
-
-BRANCH ?= "master"
-
-# Main DLR sources plus submodules (and submodules of submodules).
-SRC_URI = "git://github.com/neo-ai/neo-ai-dlr;protocol=https;branch=${BRANCH};name=neo-ai-dlr \
-           git://github.com/neo-ai/tvm;protocol=https;branch=stable;destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
-           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
-           git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
-           git://github.com/dmlc/HalideIR;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/HAlideIR;name=neo-ai-tvm-halideir \
-           git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
-           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
-           git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
-           file://0001-CMakeLists-skip-cloning-of-googletests.patch \
-"
-
-SRCREV_neo-ai-dlr = "35ed4fa2607056608451d85508fea70f458a14a6"
-SRCREV_neo-ai-tvm = "44779571412930681eef9e8b9d32aa845b8cc5ad"
-SRCREV_neo-ai-tvm-dmlc-core = "4d49691f1a9d944c3b0aa5e63f1db3cad1f941f8"
-SRCREV_neo-ai-tvm-dlpack = "bee4d1dd8dc1ee4a1fd8fa6a96476c2f8b7492a3"
-SRCREV_neo-ai-tvm-halideir = "e4a4c02764d37c9c3db0d64c4996651a3ef9513c"
-SRCREV_neo-ai-treelite = "0972ce97687b4a1fb1262fad56232e7cc61116eb"
-SRCREV_neo-ai-treelite-dmlc-core = "4d49691f1a9d944c3b0aa5e63f1db3cad1f941f8"
-SRCREV_neo-ai-treelite-fmt = "135ab5cf71ed731fc9fa0653051e7d4884a3652f"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3 cmake python3native
-
-# Set B so that DLR Python installation can find the library
-B = "${S}/build"
-
-do_install() {
-    # This does not do anything
-    #cmake_do_install
-
-    install -d ${D}${includedir}/dlr_tflite
-    install -m 0644 ${S}/include/*.h ${D}${includedir}
-    install -m 0644 ${S}/include/dlr_tflite/*.h ${D}${includedir}/dlr_tflite
-
-    # Install DLR Python binding
-    cd ${S}/python
-    distutils3_do_install
-
-    # setup.py install some libs under datadir, but we don't need them, so remove.
-    rm ${D}${datadir}/dlr/*.so
-
-    # Install DLR library to Python import search path
-    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
-
-    # Now install python test scripts
-    install -d ${D}${datadir}/dlr/tests/python/integration
-    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/python/integration
-    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/dlr/tests/python/integration
-}
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${datadir}/dlr/tests"
-RDEPENDS_${PN}-tests += "${PN}"
-
-# Versioned libs are not produced
-FILES_SOLIBSDEV = ""
-- 
2.17.1


