Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E506C52993
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 14:46:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHEiWux102193
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 08:44:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576593872;
	bh=GHh09VI96Ln/GXMNrn4dUpmtuQt05irtsy0JgI6GraY=;
	h=From:To:CC:Subject:Date;
	b=L2JvPxWqY6ZmXIoo21P0WdanvcR5dRZspo+Ttt0PHUqOtUuaxzUCyxqp5aEMQLfcz
	Fv3xio9PC9/PdX/cqkaYrU2/E8BQ2+IJ0ZtegSCW/rMdJe4a3hU1wPVnqV4kjhKGdB
	OM4QGAO1nz7K2IH4Uzp8ggMG8lxmDB+O2BSnDlZE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHEiW5T047377
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 08:44:32 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 08:44:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Dec 2019 08:44:31 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHEiV9H071857;
	Tue, 17 Dec 2019 08:44:31 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Dec 2019 08:44:11 -0600
Message-ID: <20191217144411.19000-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.05][PATCH v3] openmpacc: update version to 01.05.06.00
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
X-List-Received-Date: Tue, 17 Dec 2019 14:46:10 -0000
Content-Type: text/plain

- Changes for openmpacc examples: Removed vecadd_lib, edmabw
- Changes for clacc host_cc and host_link_cc parameters: Determine target
  compiler name directly from CMake
- Documentation update regarding no support for variadic functions in
  target regions

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../recipes-ti/openmpacc/clacc_git.bb              | 34 ++++++++++++++++++----
 .../recipes-ti/openmpacc/openmpacc-examples_git.bb |  8 +----
 .../recipes-ti/openmpacc/openmpacc.inc             |  4 +--
 .../recipes-ti/openmpacc/openmpacc_git.bb          |  4 ---
 4 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
index 75ce4628..cecffa02 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP-Acc C compiler"
 
 include openmpacc.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 DEPENDS = "boost elfutils"
 RDEPENDS_${PN} += "clocl"
@@ -18,16 +18,38 @@ export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
 
 PARALLEL_MAKE = ""
 
+# The variables CLACC_CC and CLACC_CXX are used to point clacc to set its
+# host_cc and host_link_cc variables which were previously hardcoded in clacc.h.
+# This adds support for different toolchain configurations to build clacc by
+# passing in the compiler names at the build stage and removes corresponding
+# string replacement requirements in yocto recipes.
+python __anonymous() {
+    cc_name = ""
+    cxx_name = ""
+    if d.getVar("TOOLCHAIN_PREFIX"):
+        cc_name = d.getVar("TOOLCHAIN_PREFIX") + "gcc"
+        cxx_name = d.getVar("TOOLCHAIN_PREFIX") + "g++"
+    else:
+        cc_name = d.getVar("TARGET_PREFIX") + "gcc"
+        cxx_name = d.getVar("TARGET_PREFIX") + "g++"
+
+    # Convert to upper case to workaround GCC preprocessor bug where the word
+    # 'linux' is defined to be 1. This results in arm-linux-gnueabihf- being
+    # stringized to arm-1-gnueabihf- by the GCC preprocessor. To workaround this
+    # bug, convert the names to upper case and send through. Clacc will convert
+    # to lower case before usage.
+    d.setVar("CLACC_CC_NAME", cc_name.upper())
+    d.setVar("CLACC_CXX_NAME", cxx_name.upper())
+}
+
+
 EXTRA_OEMAKE = " -C ${S}/clacc \
                   ${TARGET} \
                   CXX="${CXX}" \
+                  CLACC_CC="${CLACC_CC_NAME}" \
+                  CLACC_CXX="${CLACC_CXX_NAME}" \
 "
 
-do_configure() {
-    sed "s|arm-linux-gnueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g" -i clacc/clacc.h
-    sed "s|arm-linux-gnueabihf-g++|${TOOLCHAIN_PREFIX}g++|g" -i clacc/clacc.h
-}
-
 do_compile() {
     oe_runmake
 }
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
index b2f4122c..39902f8f 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -21,8 +21,6 @@ OMPACC_EXAMPLE_LIST = " target_update \
                         local \
                         null \
                         dsplib_fft \
-                        vecadd_lib \
-                        edmabw \
                         sub_section \
 "
 
@@ -35,7 +33,6 @@ python do_unpack_append() {
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
     for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
@@ -47,11 +44,9 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
 MKFILELIST = "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makefile \
 null/Makefile dspheap/Makefile target_implicit_map/Makefile printf_debug/Makefile \
 edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile target_update/Makefile \
-edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"
+sub_section/Makefile local/Makefile"
 
 do_configure() {
-    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc
-    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
     for f in ${MKFILELIST}; do
         sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g" -i $f
     done
@@ -66,7 +61,6 @@ do_install() {
 
     install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc
     install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc
-    install -m 644 ${B}/ompacc_env.sh ${D}${datadir}/ti/examples/openmpacc
 
     for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do
         install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example}
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index ce0236d4..d33a156b 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
 HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
 LICENSE = "BSD"
 
-PV = "1.5.4.0"
+PV = "1.5.6.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
@@ -13,7 +13,7 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL = "git"
 OMPACC_GIT_BRANCH = "master"
 
-OMPACC_SRCREV = "808cef58b4ed196a9ced2310d419dbaf63dfbeb6"
+OMPACC_SRCREV = "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"
 
 BRANCH = "${OMPACC_GIT_BRANCH}"
 SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
index a28a9225..44b59a4f 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
@@ -18,7 +18,3 @@ export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
 EXTRA_OECMAKE += "-DVERSION="${PV}" -DBUILD_OUTPUT=lib"
 
 FILES_${PN} += "/usr/share/ti/openmpacc/*"
-
-do_configure_prepend() {
-	sed -i -e 's/-march=armv7-a//' ${S}/libompacc/CMakeLists.txt
-}
-- 
2.14.1


