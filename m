Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 242465208B
	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 13:31:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SDVAJl002364
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 07:31:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SDV9LV001047
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 07:31:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 07:31:09 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SDV9GD017488;
	Thu, 28 Jan 2016 07:31:09 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOmfF-000872-4J; Thu, 28 Jan 2016 08:31:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jan 2016 08:31:00 -0500
Message-ID: <1453987865-31150-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 1/6] ti-llvm3.6: Upgrade ti-llvm from version 3.3 to 3.6
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
X-List-Received-Date: Thu, 28 Jan 2016 13:31:12 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Remove unnecessary EXTRA_OECONF += ""

 ...e-Do-not-check-build-executable-extension.patch | 25 +-----------
 .../llvm/{ti-llvm3.3_3.3.bb => ti-llvm3.6_3.6.bb}  | 46 ++++++++++++++++++----
 2 files changed, 39 insertions(+), 32 deletions(-)
 rename meta-arago-extras/recipes-core/llvm/{ti-llvm3.3 => ti-llvm3.6}/0001-configure-Do-not-check-build-executable-extension.patch (56%)
 rename meta-arago-extras/recipes-core/llvm/{ti-llvm3.3_3.3.bb => ti-llvm3.6_3.6.bb} (67%)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-extension.patch
similarity index 56%
rename from meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
rename to meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-extension.patch
index b6e5331..9a60caf 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-extension.patch
@@ -9,8 +9,7 @@ Subject: [PATCH] configure: Do not check build executable extension.
 Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
 ---
  configure                 |    3 +++
- projects/sample/configure |    4 ++++
- 2 files changed, 7 insertions(+)
+ 1 files changed, 3 insertions(+)
 
 diff --git a/configure b/configure
 index decbc40..387c4fd 100755
@@ -33,28 +32,6 @@ index decbc40..387c4fd 100755
    rm -f conftest*
    test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
  fi
-diff --git a/projects/sample/configure b/projects/sample/configure
-index a2c70c6..b57f21c 100755
---- a/projects/sample/configure
-+++ b/projects/sample/configure
-@@ -4753,6 +4753,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
-   rm -f conftest*
-   echo 'int main () { return 0; }' > conftest.$ac_ext
-   ac_cv_build_exeext=
-+
-+if false; then
-   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
-   (eval $ac_build_link) 2>&5
-   ac_status=$?
-@@ -4769,6 +4771,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
- echo "$as_me: error: installation or configuration problem: compiler cannot create executables." >&2;}
-    { (exit 1); exit 1; }; }
-   fi
-+fi
-+
-   rm -f conftest*
-   test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
- fi
 -- 
 1.7.9.5
 
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
similarity index 67%
rename from meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
rename to meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 35514c4..8efd516 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,7 +1,7 @@
-DESCRIPTION = "LLVM 3.3 with support for TI C66x intrinsics"
+DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
-PR = "r1"
+PR = "r2"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
@@ -10,27 +10,47 @@ do_configure_prepend_class-native() {
 
 require recipes-core/llvm/llvm.inc
 
-DEPENDS += "zlib libxml2"
-EXTRA_OECONF += "--enable-zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
+
+DEPENDS += "libxml2"
 
 
 LLVM_DIR = "ti-llvm${PV}"
 
-BRANCH = "master"
+LLVM_GIT_NAME = "llvm"
+LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
+LLVM_GIT_PROTOCOL = "git"
+LLVM_GIT_BRANCH = "release_36_ti"
+LLVM_GIT_DESTSUFFIX = "git"
+LLVM_GIT_SRCREV = "2ff2f1fe65645f9323372e382d0fd9647462abcb"
+
+CLANG_GIT_NAME = "clang"
+CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
+CLANG_GIT_PROTOCOL = "git"
+CLANG_GIT_BRANCH = "release_36_ti"
+CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
+CLANG_GIT_SRCREV = "7b43bc10396ecdd141cec40acacbc240ac76a84f"
 
 SRC_URI = " \
-  git://git.ti.com/opencl/ti-llvm-clang-3_3.git;protocol=git;branch=${BRANCH} \
+  ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
+  ${CLANG_GIT_URI};protocol=${CLANG_GIT_PROTOCOL};branch=${CLANG_GIT_BRANCH};destsuffix=${CLANG_GIT_DESTSUFFIX};name=${CLANG_GIT_NAME} \
   file://0001-configure-Do-not-check-build-executable-extension.patch \
 "
 
-
-SRCREV = "29629a3e70d445cfbfbb4046a56d3648ebae9544"
+SRCREV_${LLVM_GIT_NAME} = "${LLVM_GIT_SRCREV}"
+SRCREV_${CLANG_GIT_NAME} = "${CLANG_GIT_SRCREV}"
 
 S = "${WORKDIR}/git"
 
 LIBXML2_INC = "`pkg-config libxml-2.0 --cflags`"
 LIBXML2_LIBS = "`pkg-config libxml-2.0 --libs`"
 
+EXTRA_OECONF += " --enable-targets="host,arm,c6000,msp430" \
+                  --disable-zlib \
+                  --disable-terminfo \
+                  --disable-libedit \
+"
+
 EXTRA_OEMAKE += "LIBXML2_INC="${LIBXML2_INC}" LIBXML2_LIBS="${LIBXML2_LIBS}""
 
 do_compile_class-native() {
@@ -54,6 +74,13 @@ do_compile_class-nativesdk() {
         RANLIB="${BUILD_RANLIB}" \
         PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
         cross-compile-build-tools
+
+    # Workaround for timestamp issue on built-tools
+    for f in ${LLVM_BUILD_DIR}/BuildTools/Release/bin/*
+    do
+        touch $f
+    done
+
     oe_runmake
 }
 
@@ -95,6 +122,7 @@ do_install_class-native() {
     install -m 0755 ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti ${D}${bindir}
 }
 
+
 SYSROOT_PREPROCESS_FUNCS_class-target += "llvm_sysroot_preprocess_target"
 SYSROOT_PREPROCESS_FUNCS_class-nativesdk += "llvm_sysroot_preprocess_target"
 
@@ -107,4 +135,6 @@ llvm_sysroot_preprocess_target() {
     mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}-ti
 }
 
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.0 += "dev-so"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


