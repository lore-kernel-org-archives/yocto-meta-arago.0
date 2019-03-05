Return-Path: <gaurav@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0434F529D1
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 22:04:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25M427J038686
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 16:04:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551823442;
	bh=NgweilInS956nRbO7E7pCpfAQ//UZtU0Fg5vkDTxo14=;
	h=From:To:CC:Subject:Date;
	b=dx+rOVeV8qljRWSpoXbvIbzKg+ZyXNJ5uG7/ED5z1QM2JqFtVQwp8av+KbHymu4pk
	khwAu6opouFGK9GJ83qZzSDMLjkyilZroi9ewP+3oT27G2HFnr6aDwpHQiw+ZrVTi7
	Ri9OAiTsDHPOZ/1wQic1aGGOBzkFy3aMJdwVLkt0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25M42jO059330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 16:04:02 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 16:04:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 16:04:01 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25M4187022965;
	Tue, 5 Mar 2019 16:04:01 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 16:03:59 -0600
Message-ID: <20190305220359.102680-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] openmpacc: update version to 1.5.5.1
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
X-List-Received-Date: Tue, 05 Mar 2019 22:04:09 -0000
Content-Type: text/plain

    - Changes for openmpacc examples: Removed vecadd_lib
    - Changes for clacc host_cc and host_link_cc parameters

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 .../recipes-ti/openmpacc/clacc_git.bb              | 25 +++++++++++++++++-----
 .../recipes-ti/openmpacc/openmpacc-examples_git.bb |  7 +-----
 .../recipes-ti/openmpacc/openmpacc.inc             |  4 ++--
 .../recipes-ti/openmpacc/openmpacc_git.bb          |  4 ----
 4 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
index 75ce4628..5610f360 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -18,16 +18,31 @@ export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
 
 PARALLEL_MAKE = ""
 
+# The variables CLACC_CC and CLACC_CXX are used to point clacc to set its
+# host_cc and host_link_cc variables which were previously hardcoded in clacc.h.
+# This adds support for different toolchain configurations to build clacc by
+# passing in the compiler names at the build stage and removes corresponding
+# string replacement requirements in yocto recipes.
+python __anonymous() {
+    if d.getVar("TOOLCHAIN_PREFIX"):
+        cc_name = d.getVar("TOOLCHAIN_PREFIX") + "gcc"
+        cxx_name = d.getVar("TOOLCHAIN_PREFIX") + "g++"
+# Convert to upper case to workaround GCC preprocessor bug where the word
+# 'linux' is defined to be 1. This results in arm-linux-gnueabihf- being
+# stringized to arm-1-gnueabihf- by the GCC preprocessor. To workaround this
+# bug, convert the names to upper case and send through. Clacc will convert
+# to lower case before usage.
+        d.setVar("CLACC_CC_NAME", cc_name.upper())
+        d.setVar("CLACC_CXX_NAME", cxx_name.upper())
+}
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
index b2f4122c..3e8e4bde 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -21,7 +21,6 @@ OMPACC_EXAMPLE_LIST = " target_update \
                         local \
                         null \
                         dsplib_fft \
-                        vecadd_lib \
                         edmabw \
                         sub_section \
 "
@@ -35,7 +34,6 @@ python do_unpack_append() {
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
     for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
@@ -47,11 +45,9 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
 MKFILELIST = "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makefile \
 null/Makefile dspheap/Makefile target_implicit_map/Makefile printf_debug/Makefile \
 edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile target_update/Makefile \
-edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"
+edmabw/Makefile sub_section/Makefile local/Makefile"
 
 do_configure() {
-    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc
-    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
     for f in ${MKFILELIST}; do
         sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g" -i $f
     done
@@ -66,7 +62,6 @@ do_install() {
 
     install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc
     install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc
-    install -m 644 ${B}/ompacc_env.sh ${D}${datadir}/ti/examples/openmpacc
 
     for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do
         install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example}
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index ce0236d4..07abbe75 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
 HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
 LICENSE = "BSD"
 
-PV = "1.5.4.0"
+PV = "1.5.5.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
@@ -13,7 +13,7 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL = "git"
 OMPACC_GIT_BRANCH = "master"
 
-OMPACC_SRCREV = "808cef58b4ed196a9ced2310d419dbaf63dfbeb6"
+OMPACC_SRCREV = "ea48dbc2c300d55ed6cc9936ac5af97aea87a1b4"
 
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


