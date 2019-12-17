Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0309252993
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 18:08:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHI6eVT045718
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 12:06:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576606000;
	bh=XdCfYih4MgvZjRvy41xtUbwb8FnrGPHktFAlhpKf17k=;
	h=From:To:CC:Subject:Date;
	b=jZUMLrImfhpBb2f7c/4Ni3rXEH2X7tW5TiAJh/Se8E8Dmc9jlfV6BruU1rnRAq1yi
	r7k+ELOFzBK4izADkHDE6S2u2FPTyUi/O2CLshEJX4sXN7BYxqR3DQhpJoTT0K4SIQ
	su6DH0pcnF/M3TNsoHcxD1RS18oQy3l20evwvycs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHI6eM9088773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 12:06:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 12:06:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Dec 2019 12:06:39 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHI6dpb024363;
	Tue, 17 Dec 2019 12:06:39 -0600
From: Djordje Senicic <d-senicic1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Dec 2019 13:04:13 -0500
Message-ID: <20191217180413.10073-1-d-senicic1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr-demo: DL demo using NEO-AI runtime
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
X-List-Received-Date: Tue, 17 Dec 2019 18:08:19 -0000
Content-Type: text/plain

- Add live camera (or video clip) demo package
- Create neo-ai-dlr-dev package
- Add missing license file (Unlicense)

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
---
note: Additional patch to meta-arago layer will be added soon

 conf/layer.conf                               |  1 +
 conf/layer.conf => licenses/Unlicense         | 29 +++++--
 ...oup-arago-tisdk-addons-sdk-target.bbappend |  2 +
 .../packagegroup-arago-tisdk-addons.bbappend  |  2 +-
 .../neo-ai-dlr/files/Makefile.build           | 24 ++++++
 recipes-support/neo-ai-dlr/files/makefile     | 11 +++
 ...ai-dlr.bbappend => neo-ai-dlr-demo_git.bb} | 84 +++++++------------
 .../neo-ai-dlr/neo-ai-dlr.bbappend            | 11 ++-
 8 files changed, 99 insertions(+), 65 deletions(-)
 copy conf/layer.conf => licenses/Unlicense (3%)
 create mode 100644 recipes-support/neo-ai-dlr/files/Makefile.build
 create mode 100644 recipes-support/neo-ai-dlr/files/makefile
 copy recipes-support/neo-ai-dlr/{neo-ai-dlr.bbappend => neo-ai-dlr-demo_git.bb} (5%)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0334463..260a274 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-processor-sdk"
 BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-processor-sdk = "15"
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/conf/layer.conf b/licenses/Unlicense
similarity index 3%
copy from conf/layer.conf
copy to licenses/Unlicense
index 0334463..cf1ab25 100644
--- a/conf/layer.conf
+++ b/licenses/Unlicense
@@ -1,9 +1,24 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
+This is free and unencumbered software released into the public domain.
 
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
 
-BBFILE_COLLECTIONS += "meta-processor-sdk"
-BBFILE_PATTERN_meta-processor-sdk := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-processor-sdk = "15"
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org>
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 6cd7f4d..18928fb 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -10,6 +10,7 @@ UTILS_append_ti43x = " \
 
 UTILS_append_omap-a15 = " \
     opencv-dev \
+    neo-ai-dlr-dev \
 "
 
 UTILS_append_keystone = " \
@@ -49,6 +50,7 @@ EXTRA_LIBS_append_am57xx-evm = " \
     pruss-lld-staticdev \
     icss-emac-lld-dev \
     icss-emac-lld-staticdev \
+    neo-ai-dlr-dev \
 "
 
 EXTRA_LIBS_append_am335x-evm = " \
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index aa0a182..1424a0c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -17,7 +17,7 @@ EXTRA_PACKAGES_append_k3 = " watchdog"
 
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
-NEO_AI_PACKAGES = "neo-ai-dlr neo-ai-dlr-tests"
+NEO_AI_PACKAGES = "neo-ai-dlr neo-ai-dlr-tests neo-ai-dlr-dev "
 NEO_AI_PACKAGES_armv5 = ""
 
 EXTRA_PACKAGES_append = " hidapi \
diff --git a/recipes-support/neo-ai-dlr/files/Makefile.build b/recipes-support/neo-ai-dlr/files/Makefile.build
new file mode 100644
index 0000000..1a9c19e
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/files/Makefile.build
@@ -0,0 +1,24 @@
+-include ../../Rules.make
+
+ENV_SETUP ?= ../../linux-devkit/environment-setup
+DESTDIR ?=
+
+all: release
+
+release:
+	@. ${ENV_SETUP}; \
+	make
+
+clean:
+	@. ${ENV_SETUP}; \
+        make clean
+
+install:
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@install -d ${DESTDIR}/usr/share/dlr/demos
+	@cp -Prf ${DESTDIR}/usr/share/dlr/demos/run_mobilenet_cv_mt ${DESTDIR}/usr/share/dlr/demos/run_mobilenet_cv_mt.dyn
+	@echo "Dynamically linked run_mobilenet_cv_mt.dyn installed."
diff --git a/recipes-support/neo-ai-dlr/files/makefile b/recipes-support/neo-ai-dlr/files/makefile
new file mode 100644
index 0000000..84461b3
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/files/makefile
@@ -0,0 +1,11 @@
+PHONY: all
+CXXFLAGS =-funroll-loops -O3 -DNDEBUG 
+all: neo-ai-dlr-demo
+LIBS = -ldlr -lpthread -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -lopencv_imgproc -lopencv_core -lrt -ldl 
+
+neo-ai-dlr-demo: run_mobilenet_cv_mt.cc
+	$(CXX) $(CXXFLAGS) run_mobilenet_cv_mt.cc -o run_mobilenet_cv_mt.dyn $(LIBS)
+
+clean:
+	rm -rf run_mobilenet_cv_mt.dyn
+
diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
similarity index 5%
copy from recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
copy to recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
index cfa79c0..4cccf0e 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
@@ -1,68 +1,42 @@
-PR_append = ".int0"
+SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neural Network (RNN)"
+LICENSE = "Apache-2.0" 
+LIC_FILES_CHKSUM = "file://../git/LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-LICENSE = "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib & MIT & Unlicense"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
-                    file://3rdparty/tvm/LICENSE;md5=f563935cf80d1c889dd958372e9ea7c4 \
-                    file://3rdparty/tvm/3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/tvm/3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
-                    file://3rdparty/tvm/3rdparty/rang/LICENSE;md5=911690f51af322440237a253d695d19f \
-                    file://3rdparty/treelite/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
-                    file://3rdparty/treelite/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/treelite/3rdparty/fmt/LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b \
-                    file://3rdparty/treelite/3rdparty/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
-                    file://3rdparty/treelite/3rdparty/protobuf/third_party/benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
-                    file://3rdparty/treelite/3rdparty/protobuf/third_party/googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
-"
-
-SRC_DISTRIBUTE_LICENSES += "Unlicense"
-
-PV = "1.01"
-
-DEPENDS += " opencv "
+PV = "1.0"
+PR = "r1"
 
 BRANCH-NEO-AI-DLR = "dev"
-BRANCH-NEO-TVM = "dev"
-
-# Main DLR sources plus submodules (and submodules of submodules).
 SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${BRANCH-NEO-AI-DLR};name=neo-ai-dlr \
-           git://github.com/TexasInstruments/tvm;protocol=https;branch=${BRANCH-NEO-TVM};destsuffix=${S}/3rdparty/tvm;name=neo-ai-tvm \
-           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dmlc-core;name=neo-ai-tvm-dmlc-core \
-           git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/dlpack;name=neo-ai-tvm-dlpack \
-           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/tvm/3rdparty/rang;name=neo-ai-tvm-rang \
-           git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
-           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
-           git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
-           git://github.com/google/protobuf;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf;name=neo-ai-treelite-protobuf \
-           git://github.com/google/benchmark;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/benchmark;name=neo-ai-treelite-protobuf-benchmark \
-           git://github.com/google/googletest;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/protobuf/third_party/googletest;name=neo-ai-treelite-protobuf-googletest \
-"
+           file://makefile;subdir=demosrc \
+           file://Makefile.build;subdir=demosrc \
+          "
 
 SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
-SRCREV_neo-ai-tvm = "11f0a9d2349b94a733aae1c8bd652e6055f4b185"
-SRCREV_neo-ai-tvm-dmlc-core = "ca9f9329654dbd42f06988276c6f74eb8bdd5038"
-SRCREV_neo-ai-tvm-dlpack = "b7bd45cdd8b67f4ab2502a8717f2e0926d9b4121"
-SRCREV_neo-ai-tvm-rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
 
-SRCREV_neo-ai-treelite = "938af7867641fb09a8c93aadb66587ad9cbed9c2"
-SRCREV_neo-ai-treelite-dmlc-core = "ec147925f1daccee6a33796880935f9cec8541cf"
-SRCREV_neo-ai-treelite-fmt = "9f2e7edaebccf8f271cec5e855cce1223ff3e6d6"
-SRCREV_neo-ai-treelite-protobuf = "6d087c256c8ab04b3a1a9832746e9c3a8d3afd79"
-SRCREV_neo-ai-treelite-protobuf-benchmark = "360e66c1c4777c99402cf8cd535aa510fee16573"
-SRCREV_neo-ai-treelite-protobuf-googletest = "78fdd6c00b8fa5dd67066fbb796affc87ba0e075"
+S = "${WORKDIR}/demosrc"
 
-do_compile_append() {
-   ninja demo
-   ninja democv
-}
+DEPENDS += " opencv neo-ai-dlr "
 
+do_patch_extra() {
+   install -m 644 ${WORKDIR}/git/demo/cv/run_mobilenet_cv_mt.cc ${S}/.
+   install -m 644 ${WORKDIR}/git/LICENSE ${S}/.
+}
+addtask patch_extra after do_patch before do_create_srcipk
 
-do_install_append() {
+do_compile() {
+  cd ${S}
+  make 
+}
 
-    # Now install additional python test scripts, bash scripts and precomputed models
-    install -d ${D}${datadir}/dlr/demos
-    cp -Prf --preserve=mode,timestamps ${S}/examples/tidl/* ${D}${datadir}/dlr/demos
-    install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
+do_install() {
+   install -d ${D}${datadir}/dlr/demos
+   install -m 644 ${S}/run_mobilenet_cv_mt.cc ${D}${datadir}/dlr/demos/.
+   install -m 644 ${S}/makefile ${D}${datadir}/dlr/demos/.
+   install -m 644 ${S}/Makefile.build ${D}${datadir}/dlr/demos/.
+   install -m 755 ${S}/run_mobilenet_cv_mt.dyn ${D}${datadir}/dlr/demos/.
 }
 
-FILES_${PN}-tests += "${datadir}/dlr/demos"
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+
+FILES_${PN} += " ${datadir}/dlr/demos "
diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
index cfa79c0..36dc6a1 100644
--- a/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr.bbappend
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
 
 SRC_DISTRIBUTE_LICENSES += "Unlicense"
 
-PV = "1.01"
+PV = "1.0.1"
 
 DEPENDS += " opencv "
 
@@ -56,13 +56,20 @@ do_compile_append() {
    ninja democv
 }
 
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
 
 do_install_append() {
-
     # Now install additional python test scripts, bash scripts and precomputed models
     install -d ${D}${datadir}/dlr/demos
     cp -Prf --preserve=mode,timestamps ${S}/examples/tidl/* ${D}${datadir}/dlr/demos
     install -m 0755 ${B}/bin/* ${D}${datadir}/dlr/demos/.
+    # oe_soinstall ${B}/lib/libdlr.so.${PV} ${D}${libdir}
+    install -d ${D}${libdir}
+    install -m 0755  ${B}/lib/libdlr.so ${D}${libdir}
+    cp -Prf --preserve=mode,timestamps  ${S}/3rdparty/tvm/3rdparty/dmlc-core/include/dmlc ${D}${includedir}
+
 }
 
 FILES_${PN}-tests += "${datadir}/dlr/demos"
+FILES_${PN} += "${includedir} ${libdir}/libdlr.so* "
-- 
2.17.1


