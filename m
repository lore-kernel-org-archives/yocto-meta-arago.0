Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F2FC1529F1
	for <meta-arago@arago-project.org>;
	Wed,  7 Dec 2016 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D2E9F20A48;
	Wed,  7 Dec 2016 20:25:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bFC3lPywhOqM; Wed,  7 Dec 2016 20:25:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3022207AF;
	Wed,  7 Dec 2016 20:25:25 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id EF5261621C8;
	Wed,  7 Dec 2016 15:25:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  7 Dec 2016 15:25:24 -0500
Message-Id: <1481142324-24891-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] opencl, openmp: don't hardcode specific toolchain, pass the one being used for the build
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
X-List-Received-Date: Wed, 07 Dec 2016 20:25:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb | 10 +++++++---
 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb     |  9 +++++++--
 .../recipes-ti/openmpacc/openmpacc-examples_git.bb      | 17 +++++++++++++++--
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 2a4b714..c69b7e2 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -1,10 +1,10 @@
-DESCRIPTION = "TI OpenCL example applications"
+SUMMARY = "TI OpenCL example applications"
 HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
 LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -55,8 +55,12 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
                  TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
 "
 
+do_configure() {
+    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
+}
+
 do_compile() {
-    oe_runmake
+    oe_runmake CC="${CC}" CPP="${CPP}" CXX="${CXX}"
 }
 
 do_install() {
diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
index f41c291..75ce462 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -1,8 +1,8 @@
-DESCRIPTION = "TI OpenMP-Acc C compiler"
+SUMMARY = "TI OpenMP-Acc C compiler"
 
 include openmpacc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "boost elfutils"
 RDEPENDS_${PN} += "clocl"
@@ -23,6 +23,11 @@ EXTRA_OEMAKE = " -C ${S}/clacc \
                   CXX="${CXX}" \
 "
 
+do_configure() {
+    sed "s|arm-linux-gnueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g" -i clacc/clacc.h
+    sed "s|arm-linux-gnueabihf-g++|${TOOLCHAIN_PREFIX}g++|g" -i clacc/clacc.h
+}
+
 do_compile() {
     oe_runmake
 }
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
index 703e754..e96fa76 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -1,8 +1,8 @@
-DESCRIPTION = "TI OpenMP-Acc example applications"
+SUMMARY = "TI OpenMP-Acc example applications"
 
 include openmpacc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "openmpacc clacc-native clocl-native ti-cgt6x-native"
 RDEPENDS_${PN} += "opencl-runtime"
@@ -44,6 +44,19 @@ EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
                  TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
 "
 
+MKFILELIST = "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makefile \
+null/Makefile dspheap/Makefile target_implicit_map/Makefile printf_debug/Makefile \
+edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile target_update/Makefile \
+edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"
+
+do_configure() {
+    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc
+    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
+    for f in ${MKFILELIST}; do
+        sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g" -i $f
+    done
+}
+
 do_compile() {
     oe_runmake
 }
-- 
2.7.4


