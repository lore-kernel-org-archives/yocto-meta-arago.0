Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id F0B5552A2B
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 12:01:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t55C1dJm021495
	for <meta-arago@arago-project.org>; Fri, 5 Jun 2015 07:01:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t55C1dcc013612
	for <meta-arago@arago-project.org>; Fri, 5 Jun 2015 07:01:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Jun 2015 07:01:39 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t55C1dAg015908;	Fri, 5 Jun 2015 07:01:39 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Z0qJe-0007H8-T5;
	Fri, 05 Jun 2015 08:01:38 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Jun 2015 08:01:33 -0400
Message-ID: <1433505693-27926-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433505693-27926-1-git-send-email-j-stiffler@ti.com>
References: <1433505693-27926-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-llvm3.3: Add LLVM 3.3 with c6x intrinsic support.
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
X-List-Received-Date: Fri, 05 Jun 2015 12:01:41 -0000
Content-Type: text/plain

* Supports target, native, and nativesdk classes.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Previously submitted to meta-ti.

 ...e-Do-not-check-build-executable-extension.patch |   60 ++++++++++++
 .../recipes-core/llvm/ti-llvm3.3_3.3.bb            |  103 ++++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
 create mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
new file mode 100644
index 0000000..b6e5331
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
@@ -0,0 +1,60 @@
+From 60da8adc29a84796c9768a1a962eda1915c87332 Mon Sep 17 00:00:00 2001
+From: Jake Stiffler <j-stiffler@ti.com>
+Date: Fri, 20 Feb 2015 10:55:11 -0500
+Subject: [PATCH] configure: Do not check build executable extension.
+
+ * This seems to cause issues nativesdk and build sdk
+   architectures are the same.
+
+Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
+---
+ configure                 |    3 +++
+ projects/sample/configure |    4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/configure b/configure
+index decbc40..387c4fd 100755
+--- a/configure
++++ b/configure
+@@ -4951,6 +4951,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
+   rm -f conftest*
+   echo 'int main () { return 0; }' > conftest.$ac_ext
+   ac_cv_build_exeext=
++
++if false; then
+   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
+   (eval $ac_build_link) 2>&5
+   ac_status=$?
+@@ -4967,6 +4969,7 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
+ echo "$as_me: error: installation or configuration problem: compiler cannot create executables." >&2;}
+    { (exit 1); exit 1; }; }
+   fi
++fi
+   rm -f conftest*
+   test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
+ fi
+diff --git a/projects/sample/configure b/projects/sample/configure
+index a2c70c6..b57f21c 100755
+--- a/projects/sample/configure
++++ b/projects/sample/configure
+@@ -4753,6 +4753,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
+   rm -f conftest*
+   echo 'int main () { return 0; }' > conftest.$ac_ext
+   ac_cv_build_exeext=
++
++if false; then
+   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
+   (eval $ac_build_link) 2>&5
+   ac_status=$?
+@@ -4769,6 +4771,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
+ echo "$as_me: error: installation or configuration problem: compiler cannot create executables." >&2;}
+    { (exit 1); exit 1; }; }
+   fi
++fi
++
+   rm -f conftest*
+   test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
+ fi
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
new file mode 100644
index 0000000..9ae8866
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.3_3.3.bb
@@ -0,0 +1,103 @@
+DESCRIPTION = "LLVM 3.3 with support for TI C66x intrinsics"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
+
+do_configure_prepend_class-native() {
+    # Fix paths in llvm-config
+    sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-config/llvm-config.cpp
+}
+
+require recipes-core/llvm/llvm.inc
+require recipes-core/llvm/llvm3.inc
+
+DEPENDS_append_class-native = " llvm-common-native"
+
+LLVM_DIR = "ti-llvm${PV}"
+
+BRANCH = "master"
+
+SRC_URI = " \
+  git://git.ti.com/opencl/ti-llvm-clang-3_3.git;protocol=git;branch=${BRANCH} \
+  file://0001-configure-Do-not-check-build-executable-extension.patch \
+"
+
+
+SRCREV = "29629a3e70d445cfbfbb4046a56d3648ebae9544"
+
+S = "${WORKDIR}/git"
+
+do_compile_class-native() {
+  cd ${LLVM_BUILD_DIR}
+  oe_runmake
+}
+
+do_compile_class-nativesdk() {
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake \
+        AR="${BUILD_AR}" \
+        CC="${BUILD_CC}" \
+        CFLAGS="${BUILD_CFLAGS}" \
+        CXX="${BUILD_CXX}" \
+        CXXFLAGS="${BUILD_CXXFLAGS}" \
+        CPP="${BUILD_CPP}" \
+        CPPFLAGS="${BUILD_CPPFLAGS}" \
+        LD="${BUILD_LD}" \
+        LDFLAGS="${BUILD_LDFLAGS}" \
+        NM="${BUILD_NM}" \
+        RANLIB="${BUILD_RANLIB}" \
+        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
+        cross-compile-build-tools
+    oe_runmake
+}
+
+do_install_append_class-target() {
+    for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
+        if [ ! -L ${b} ]; then
+            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-||g'`
+        fi
+    done
+}
+
+do_install_class-native() {
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti
+
+    install -d ${D}${bindir}
+    for b in ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-clang*; do
+        if [ ! -L ${b} ]; then
+            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-||g'`
+        fi
+    done
+
+    install -d ${D}${bindir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
+
+    install -d ${D}${includedir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
+
+    install -d ${D}${libdir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
+    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
+
+    install -d ${D}${docdir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
+
+    install -d ${D}${bindir}
+    install -m 0755 ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti ${D}${bindir}
+}
+
+SYSROOT_PREPROCESS_FUNCS_class-target += "llvm_sysroot_preprocess_target"
+SYSROOT_PREPROCESS_FUNCS_class-nativesdk += "llvm_sysroot_preprocess_target"
+
+llvm_sysroot_preprocess() {
+    :
+}
+
+llvm_sysroot_preprocess_target() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}-ti
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.9.5


