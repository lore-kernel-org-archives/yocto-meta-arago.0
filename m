Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 94A6E52A8F
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 21:06:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92L6koc031789
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 16:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506978406;
	bh=LGx/Z20A2F6I2X6qSoopna7IaWxq0LUDIbeJ+khKECc=;
	h=From:To:CC:Subject:Date;
	b=cpgaP6Rj+ksdFo0gFvllqkXJjad/lsvng5/oXYQY6KgCIQEi83I4wLRxDU95Pwmvb
	olQ7rgGb3K4+wL+5rXgk2dELYyJxKp691TKP7F8zMo4TjrKY39ZvHQ5HXHZVw4//2B
	kBt/OU2hgjeEzRYQGj+GJ0MKSeEOZ+0wm4M7AqQs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92L6kqt026532
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 16:06:46 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 16:06:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 16:06:46 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92L6j7j003766;
	Mon, 2 Oct 2017 16:06:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 17:06:45 -0400
Message-ID: <1506978405-8104-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] llvm: restore version 3.x of llvm.inc and llvm-common
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
X-List-Received-Date: Mon, 02 Oct 2017 21:06:46 -0000
Content-Type: text/plain

As LLVM support is migrating from meta-openembedded to oe-core, version 3.x
is being dropped and latest 5.x is being used. Because ti-llvm uses version
3.6 and is based on the old recipes and llvm.inc, restore those for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/llvm/llvm-common.bb |   22 +++
 .../recipes-core/llvm/llvm-common/llvm-config      |   11 ++
 meta-arago-extras/recipes-core/llvm/llvm.inc       |  162 ++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common.bb
 create mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config
 create mode 100644 meta-arago-extras/recipes-core/llvm/llvm.inc

diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
new file mode 100644
index 0000000..618cc1e
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Helper script for OE's llvm support"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
+"
+
+SRC_URI = "file://llvm-config"
+
+ALLOW_EMPTY_${PN} = "1"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_common_sysroot_preprocess"
+
+llvm_common_sysroot_preprocess() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+}
+
+do_install_class-native() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config b/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config
new file mode 100644
index 0000000..b0f33c8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config
@@ -0,0 +1,11 @@
+#!/bin/sh
+# Wrapper script for real llvm-config. Simply calls
+
+if [ $WANT_LLVM_RELEASE ]; then
+	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
+else
+	echo "To use llvm-common WANT_LLVM_RELEASE needs to be exported."
+	echo "For example if this is being called through a recipe:"
+	echo "export WANT_LLVM_RELEASE=\"3.3\""
+	exit 1
+fi
diff --git a/meta-arago-extras/recipes-core/llvm/llvm.inc b/meta-arago-extras/recipes-core/llvm/llvm.inc
new file mode 100644
index 0000000..fa971f3
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/llvm.inc
@@ -0,0 +1,162 @@
+# LLVM does not provide ABI stability between different versions. For this
+# reason OE makes it possible to build and install different llvm versions
+# at the same time.
+#
+# This is true for the normal recipes as well as the native ones.
+#
+# All regular installation directories are prefixed with 'llvm${LLVM_RELEASE}'
+# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
+#
+# For your program or library that makes use of llvm you do should not need to
+# modify anything as long as it uses the results of various llvm-config
+# invocations. If you need customizations something is wrong and it needs to be
+# fixed (report bug).
+#
+# However the *recipe* for your program/library *must* declare
+# export WANT_LLVM_RELEASE = "<valid version number>"
+# The version number is picked up by a generic wrapper script which just calls
+# the variant of the specified version.
+
+DESCRIPTION = "The Low Level Virtual Machine"
+HOMEPAGE = "http://llvm.org"
+
+# 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
+
+DEPENDS = "libffi libxml2-native llvm-common"
+
+inherit perlnative pythonnative autotools
+
+LLVM_RELEASE = "${PV}"
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+S = "${WORKDIR}/llvm-${PV}.src"
+
+LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
+LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+
+EXTRA_OECONF += "--disable-assertions \
+                 --enable-debug-runtime \
+                 --disable-expensive-checks \
+                 --enable-bindings=none \
+                 --enable-keep-symbols \
+                 --enable-libffi \
+                 --enable-optimized \
+                 --enable-shared \
+                 --enable-targets=host-only"
+EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
+
+do_configure_prepend() {
+    # Remove RPATHs
+    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Makefile.rules
+
+    # Drop "svn" suffix from version string
+    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
+
+    # Fix paths in llvm-config
+    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
+    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
+
+    # Fix the hardcoded libdir in llvm-config
+    sed -i 's:/lib\>:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.cpp
+
+    # Fails to build unless using separate directory from source
+    mkdir -p ${LLVM_BUILD_DIR}
+    cd ${LLVM_BUILD_DIR}
+}
+
+do_compile() {
+    cd ${LLVM_BUILD_DIR}
+
+    # Fix libdir for multilib
+    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
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
+do_install() {
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
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
+}
+
+SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
+}
+
+PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+FILES_${PN} = ""
+FILES_${PN}-staticdev = ""
+FILES_${PN}-dbg = " \
+    ${bindir}/${LLVM_DIR}/.debug \
+    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
+    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
+    /usr/src/debug \
+"
+
+FILES_${PN}-dev = " \
+    ${bindir}/${LLVM_DIR} \
+    ${includedir}/${LLVM_DIR} \
+"
+RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
+
+FILES_${PN}-bugpointpasses = "\
+    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+"
+FILES_${PN}-llvmhello = "\
+    ${libdir}/${LLVM_DIR}/LLVMHello.so \
+"
+
+PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
+NOAUTOPACKAGEDEBUG = "1"
+
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
+
+python llvm_populate_packages() {
+    libdir = bb.data.expand('${libdir}', d)
+    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
+    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
+    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
+    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
+    if split_packages:
+        pn = d.getVar('PN', True)
+        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
+        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
+        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
+}
+
+PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
-- 
1.7.9.5


