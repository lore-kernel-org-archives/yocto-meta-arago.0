Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 869E3529AD
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 00:26:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3C0Qq3I002446
	for <meta-arago@arago-project.org>; Mon, 11 Apr 2016 19:26:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3C0QqvI022196
	for <meta-arago@arago-project.org>; Mon, 11 Apr 2016 19:26:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 Apr 2016 19:26:52 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3C0QpDF024180;
	Mon, 11 Apr 2016 19:26:52 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1apmAN-00071i-AL; Mon, 11 Apr 2016 20:26:51 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Apr 2016 20:26:49 -0400
Message-ID: <1460420809-26976-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] llvm: correct fix for the multilib libdir
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
X-List-Received-Date: Tue, 12 Apr 2016 00:26:54 -0000
Content-Type: text/plain

* If llvm.inc is used for native and nativesdk class packages, the
  resulting llvm-config is broken since "${base_libdir}" is prefixed
  with the full patch to sysroot
* Replace "/lib" with "/${baselib}" instead of "${base_libdir}" as
  "${base_libdir}" is the full path and "${baselib}" is the name of
  the multilib directory.

Upstream status: pending

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb            | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 8efd516..037256c 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,13 +1,18 @@
 DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
-PR = "r2"
+PR = "r3"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
     sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-config/llvm-config.cpp
 }
 
+do_configure_prepend() {
+    # Workaround for libdir fix for multilib to undo what is currently upstream
+    sed -i 's:${base_libdir}:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.cpp
+}
+
 require recipes-core/llvm/llvm.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
@@ -55,11 +60,19 @@ EXTRA_OEMAKE += "LIBXML2_INC="${LIBXML2_INC}" LIBXML2_LIBS="${LIBXML2_LIBS}""
 
 do_compile_class-native() {
   cd ${LLVM_BUILD_DIR}
+
+  # Fix libdir for multilib
+  sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
+
   oe_runmake
 }
 
 do_compile_class-nativesdk() {
     cd ${LLVM_BUILD_DIR}
+
+    # Fix libdir for multilib
+    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
+
     oe_runmake \
         AR="${BUILD_AR}" \
         CC="${BUILD_CC}" \
@@ -84,6 +97,28 @@ do_compile_class-nativesdk() {
     oe_runmake
 }
 
+# Workaround for libdir fix for multilib
+do_compile() {
+    cd ${LLVM_BUILD_DIR}
+
+    # Fix libdir for multilib
+    sed -i 's:(PROJ_prefix)${base_libdir}:(PROJ_prefix)/${baselib}:g' Makefile.config
+
+    oe_runmake \
+        AR="${BUILD_AR}" \
+        CC="${BUILD_CC}" \
+        CFLAGS="${BUILD_CFLAGS}" \
+        CXX="${BUILD_CXX}" \
+        CXXFLAGS="${BUILD_CXXFLAGS}" \
+        CPP="${BUILD_CPP}" \
+        CPPFLAGS="${BUILD_CPPFLAGS}" \
+        NM="${BUILD_NM}" \
+        RANLIB="${BUILD_RANLIB}" \
+        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
+        cross-compile-build-tools
+    oe_runmake
+}
+
 do_install_append_class-target() {
     for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
         if [ ! -L ${b} ]; then
-- 
1.9.1


