Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E2065529C0
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 22:08:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCM6hrJ032028
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:06:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576188403;
	bh=eQQh5z4x2zUNfS5Owldq2ud04CBZYV/6Ws3a9nlqDJI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=psa30IxE6sk9xruHjisoo0IER4UzWRcgHRDU5IaxI2nPhv89usm395gnap5N0BaFy
	yae0HG6SSa6xsX4bHjvnT7RoG4I78DgCeQO7HofoImT8VIFUBvefjfNgtuaRK5IiqT
	27KvA6oNhhH51ouXxa6eE6IUJs8VF3bq8UkkmP2g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCM6hOA106356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:06:43 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 16:06:43 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Thu, 12 Dec 2019 16:06:43 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] neo-ai-dlr:
	Add TIDL support on top of meta-aws neo-ai-dlr
Thread-Index: AQHVsR9V0JpqV0QCmk+yR8bKTa45pae3Dl8g
Date: Thu, 12 Dec 2019 22:06:43 +0000
Message-ID: <ef699fc67c274b76af5ab5b935d4c88c@ti.com>
References: <20191212190434.4725-1-d-senicic1@ti.com>
In-Reply-To: <20191212190434.4725-1-d-senicic1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] neo-ai-dlr: Add TIDL support on top of meta-aws neo-ai-dlr
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
X-List-Received-Date: Thu, 12 Dec 2019 22:08:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you resubmit using the option "-C01". This will compare the bbappend to=
 the original bb file. There seem to be some differences in the licenses an=
d sources which are not obvious here.

Thank you,
Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Senicic, Djordje
Sent: Thursday, December 12, 2019 2:05 PM
To: meta-arago@arago-project.org
Cc: Senicic, Djordje
Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] neo-ai-dlr: Ad=
d TIDL support on top of meta-aws neo-ai-dlr

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
 delete mode 100644 recipes-support/neo-ai/files/0001-CMakeLists-skip-cloni=
ng-of-googletests.patch
 delete mode 100644 recipes-support/neo-ai/neo-ai-dlr_git.bb

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-suppo=
rt/neo-ai-dlr/neo-ai-dlr.bbappend
new file mode 100644
index 0000000..50895b2
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -0,0 +1,64 @@
+PR_append =3D ".int0"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d165=
8 \
+                    file://3rdparty/tvm/LICENSE;md5=3Df563935cf80d1c889dd9=
58372e9ea7c4 \
+                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=3D0=
ca7d6e8f4af26868cb42025ad83374b \
+                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=3Df62d=
4e85ba68a1574b74d97ab8dea9ab \
+                    file://3rdparty/treelite/LICENSE;md5=3D34400b68072d710=
fecd0a2940a0d1658 \
+                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=3D0ca7d=
6e8f4af26868cb42025ad83374b \
+                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=
=3Daf88d758f75f3c5c48a967501f24384b \
+                    file://3rdparty/treelite/3rdparty/protobuf/LICENSE;md5=
=3D37b5762e07f0af8c74ce80a8bda4266b \
+                    file://3rdparty/treelite/3rdparty/protobuf/third_party=
/benchmark/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://3rdparty/treelite/3rdparty/protobuf/third_party=
/googletest/LICENSE;md5=3Dcbbd27594afd089daa160d3a16dd515a \
+"
+
+PV =3D "1.01"
+
+DEPENDS +=3D " opencv "
+
+BRANCH-NEO-AI-DLR =3D "dev"
+BRANCH-NEO-TVM =3D "dev"
+
+# Main DLR sources plus submodules (and submodules of submodules).
+SRC_URI =3D "git://github.com/TexasInstruments/neo-ai-dlr;protocol=3Dhttps=
;branch=3D${BRANCH-NEO-AI-DLR};name=3Dneo-ai-dlr \
+           git://github.com/TexasInstruments/tvm;protocol=3Dhttps;branch=
=3D${BRANCH-NEO-TVM};destsuffix=3D${S}/3rdparty/tvm;name=3Dneo-ai-tvm \
+           git://github.com/dmlc/dmlc-core;protocol=3Dhttps;branch=3Dmaste=
r;destsuffix=3D${S}/3rdparty/tvm/3rdparty/dmlc-core;name=3Dneo-ai-tvm-dmlc-=
core \
+           git://github.com/dmlc/dlpack;protocol=3Dhttps;branch=3Dmaster;d=
estsuffix=3D${S}/3rdparty/tvm/3rdparty/dlpack;name=3Dneo-ai-tvm-dlpack \
+           git://github.com/agauniyal/rang;protocol=3Dhttps;branch=3Dmaste=
r;destsuffix=3D${S}/3rdparty/tvm/3rdparty/rang;name=3Dneo-ai-tvm-rang \
+           git://github.com/neo-ai/treelite;protocol=3Dhttps;branch=3Dmast=
er;destsuffix=3D${S}/3rdparty/treelite;name=3Dneo-ai-treelite \
+           git://github.com/dmlc/dmlc-core;protocol=3Dhttps;branch=3Dmaste=
r;destsuffix=3D${S}/3rdparty/treelite/dmlc-core;name=3Dneo-ai-treelite-dmlc=
-core \
+           git://github.com/fmtlib/fmt;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${S}/3rdparty/treelite/3rdparty/fmt;name=3Dneo-ai-treelite-fmt \
+           git://github.com/google/protobuf;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${S}/3rdparty/treelite/3rdparty/protobuf;name=3Dneo-ai-treelit=
e-protobuf \
+           git://github.com/google/benchmark;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${S}/3rdparty/treelite/3rdparty/protobuf/third_party/benchmar=
k;name=3Dneo-ai-treelite-protobuf-benchmark \
+           git://github.com/google/googletest;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googlet=
est;name=3Dneo-ai-treelite-protobuf-googletest \
+"
+
+SRCREV_neo-ai-dlr =3D "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
+SRCREV_neo-ai-tvm =3D "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
+SRCREV_neo-ai-tvm-dmlc-core =3D "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
+SRCREV_neo-ai-tvm-dlpack =3D "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
+SRCREV_neo-ai-tvm-rang =3D "cabe04d6d6b05356fa8f9741704924788f0dd762"
+
+SRCREV_neo-ai-treelite =3D "938af7867641fb09a8c93aadb66587ad9cbed9c2"
+SRCREV_neo-ai-treelite-dmlc-core =3D "ec147925f1daccee6a33796880935f9cec85=
41cf"
+SRCREV_neo-ai-treelite-fmt =3D "9f2e7edaebccf8f271cec5e855cce1223ff3e6d6"
+SRCREV_neo-ai-treelite-protobuf =3D "6d087c256c8ab04b3a1a9832746e9c3a8d3af=
d79"
+SRCREV_neo-ai-treelite-protobuf-benchmark =3D "360e66c1c4777c99402cf8cd535=
aa510fee16573"
+SRCREV_neo-ai-treelite-protobuf-googletest =3D "78fdd6c00b8fa5dd67066fbb79=
6affc87ba0e075"
+
+do_compile_append() {
+   ninja demo
+   ninja democv
+}
+
+
+do_install_append() {
+
+    # Now install additional python test scripts, bash scripts and precomp=
uted models
+    install -d ${D}${datadir}/dlr/demos
+    cp -Prf --preserve=3Dmode,timestamps ${S}/examples/tidl/* ${D}${datadi=
r}/dlr/demos
+    install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
+}
+
+RDEPENDS_${PN} =3D+ " tidl-api "
+FILES_${PN}-tests +=3D "${datadir}/dlr/demos"
diff --git a/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-g=
oogletests.patch b/recipes-support/neo-ai/files/0001-CMakeLists-skip-clonin=
g-of-googletests.patch
deleted file mode 100644
index b7d3c85..0000000
--- a/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googlete=
sts.patch
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
-=20
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
---=20
-2.17.1
-
diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo=
-ai/neo-ai-dlr_git.bb
deleted file mode 100644
index 636714a..0000000
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY =3D "NEO-AI Deep Learning Runtime"
-DESCRIPTION =3D "Neo-AI-DLR is a common runtime for machine learning model=
s compiled by AWS SageMaker Neo, TVM, or TreeLite."
-HOMEPAGE =3D "https://aws.amazon.com/sagemaker/neo/"
-LICENSE =3D "Apache-2.0 & BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d165=
8 \
-                    file://3rdparty/tvm/LICENSE;md5=3De3fc50a88d0a364313df=
4b21ef20c29e \
-                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=3D0=
ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=3Df62d=
4e85ba68a1574b74d97ab8dea9ab \
-                    file://3rdparty/tvm/3rdparty/HAlideIR/LICENSE;md5=3D99=
10386e68f0616e1ecf1037479fa97e \
-                    file://3rdparty/treelite/LICENSE;md5=3D34400b68072d710=
fecd0a2940a0d1658 \
-                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=3D0ca7d=
6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=
=3Dc2e38bc8629eac247a73b65c1548b2f0 \
-"
-
-PV =3D "1.0"
-
-BRANCH ?=3D "master"
-
-# Main DLR sources plus submodules (and submodules of submodules).
-SRC_URI =3D "git://github.com/neo-ai/neo-ai-dlr;protocol=3Dhttps;branch=3D=
${BRANCH};name=3Dneo-ai-dlr \
-           git://github.com/neo-ai/tvm;protocol=3Dhttps;branch=3Dstable;de=
stsuffix=3D${S}/3rdparty/tvm;name=3Dneo-ai-tvm \
-           git://github.com/dmlc/dmlc-core;protocol=3Dhttps;branch=3Dmaste=
r;destsuffix=3D${S}/3rdparty/tvm/3rdparty/dmlc-core;name=3Dneo-ai-tvm-dmlc-=
core \
-           git://github.com/dmlc/dlpack;protocol=3Dhttps;branch=3Dmaster;d=
estsuffix=3D${S}/3rdparty/tvm/3rdparty/dlpack;name=3Dneo-ai-tvm-dlpack \
-           git://github.com/dmlc/HalideIR;protocol=3Dhttps;branch=3Dmaster=
;destsuffix=3D${S}/3rdparty/tvm/3rdparty/HAlideIR;name=3Dneo-ai-tvm-halidei=
r \
-           git://github.com/neo-ai/treelite;protocol=3Dhttps;branch=3Dmast=
er;destsuffix=3D${S}/3rdparty/treelite;name=3Dneo-ai-treelite \
-           git://github.com/dmlc/dmlc-core;protocol=3Dhttps;branch=3Dmaste=
r;destsuffix=3D${S}/3rdparty/treelite/dmlc-core;name=3Dneo-ai-treelite-dmlc=
-core \
-           git://github.com/fmtlib/fmt;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${S}/3rdparty/treelite/3rdparty/fmt;name=3Dneo-ai-treelite-fmt \
-           file://0001-CMakeLists-skip-cloning-of-googletests.patch \
-"
-
-SRCREV_neo-ai-dlr =3D "35ed4fa2607056608451d85508fea70f458a14a6"
-SRCREV_neo-ai-tvm =3D "44779571412930681eef9e8b9d32aa845b8cc5ad"
-SRCREV_neo-ai-tvm-dmlc-core =3D "4d49691f1a9d944c3b0aa5e63f1db3cad1f941f8"
-SRCREV_neo-ai-tvm-dlpack =3D "bee4d1dd8dc1ee4a1fd8fa6a96476c2f8b7492a3"
-SRCREV_neo-ai-tvm-halideir =3D "e4a4c02764d37c9c3db0d64c4996651a3ef9513c"
-SRCREV_neo-ai-treelite =3D "0972ce97687b4a1fb1262fad56232e7cc61116eb"
-SRCREV_neo-ai-treelite-dmlc-core =3D "4d49691f1a9d944c3b0aa5e63f1db3cad1f9=
41f8"
-SRCREV_neo-ai-treelite-fmt =3D "135ab5cf71ed731fc9fa0653051e7d4884a3652f"
-
-S =3D "${WORKDIR}/git"
-
-inherit setuptools3 cmake python3native
-
-# Set B so that DLR Python installation can find the library
-B =3D "${S}/build"
-
-do_install() {
-    # This does not do anything
-    #cmake_do_install
-
-    install -d ${D}${includedir}/dlr_tflite
-    install -m 0644 ${S}/include/*.h ${D}${includedir}
-    install -m 0644 ${S}/include/dlr_tflite/*.h ${D}${includedir}/dlr_tfli=
te
-
-    # Install DLR Python binding
-    cd ${S}/python
-    distutils3_do_install
-
-    # setup.py install some libs under datadir, but we don't need them, so=
 remove.
-    rm ${D}${datadir}/dlr/*.so
-
-    # Install DLR library to Python import search path
-    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR=
}/dlr
-
-    # Now install python test scripts
-    install -d ${D}${datadir}/dlr/tests/python/integration
-    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/=
tests/python/integration
-    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/dlr=
/tests/python/integration
-}
-
-PACKAGES =3D+ "${PN}-tests"
-FILES_${PN}-tests =3D "${datadir}/dlr/tests"
-RDEPENDS_${PN}-tests +=3D "${PN}"
-
-# Versioned libs are not produced
-FILES_SOLIBSDEV =3D ""
--=20
2.17.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

