Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DB8C5473A
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61256.1724699794927944021
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85A1340CC1;
	Mon, 26 Aug 2024 19:16:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buCnHbq42gKZ; Mon, 26 Aug 2024 19:16:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6709C40CCF;
	Mon, 26 Aug 2024 19:16:32 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4F12416406F;
	Mon, 26 Aug 2024 15:16:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 15/16] llvm: deprecate
Date: Mon, 26 Aug 2024 15:16:24 -0400
Message-Id: <20240826191625.8267-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191625.8267-1-denis@denix.org>
References: <20240826191625.8267-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15540

From: Denys Dmytriyenko <denys@konsulko.com>

Remove llvm component as deprecated and not maintained.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/images/arago-image.inc       |   1 -
 .../recipes-core/llvm/llvm-common.bb          |  20 --
 .../recipes-core/llvm/llvm-common.bbappend    |   5 -
 .../recipes-core/llvm/llvm-common/llvm-config |  11 --
 meta-arago-extras/recipes-core/llvm/llvm.inc  | 162 ---------------
 ...not-check-build-executable-extension.patch |  37 ----
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb       | 184 ------------------
 7 files changed, 420 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common.bb
 delete mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common.bbapp=
end
 delete mode 100644 meta-arago-extras/recipes-core/llvm/llvm-common/llvm-=
config
 delete mode 100644 meta-arago-extras/recipes-core/llvm/llvm.inc
 delete mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-c=
onfigure-Do-not-check-build-executable-extension.patch
 delete mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index c4438e5c..37b20850 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -22,7 +22,6 @@ TOOLCHAIN_HOST_TASK:append =3D " nativesdk-buildtools-p=
erl-dummy"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
 BAD_RECOMMENDATIONS +=3D " \
-    ti-llvm3.6-dev \
     libulm-dev \
     gdbserver-c6x-dev \
     coreutils \
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-ar=
ago-extras/recipes-core/llvm/llvm-common.bb
deleted file mode 100644
index b69a5775..00000000
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "Helper script for OE's llvm support"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-SRC_URI =3D "file://llvm-config"
-
-ALLOW_EMPTY:${PN} =3D "1"
-SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " llvm_common_sysroot_p=
reprocess"
-
-llvm_common_sysroot_preprocess() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_cr=
ossscripts}/
-}
-
-do_install:class-native() {
-    install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
-}
-
-BBCLASSEXTEND =3D "native"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend b/m=
eta-arago-extras/recipes-core/llvm/llvm-common.bbappend
deleted file mode 100644
index 273fb314..00000000
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR:append =3D ".arago0"
-
-SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " llvm_common_sysroo=
t_preprocess"
-
-BBCLASSEXTEND +=3D "nativesdk"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config =
b/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config
deleted file mode 100644
index b0f33c8d..00000000
--- a/meta-arago-extras/recipes-core/llvm/llvm-common/llvm-config
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# Wrapper script for real llvm-config. Simply calls
-
-if [ $WANT_LLVM_RELEASE ]; then
-	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
-else
-	echo "To use llvm-common WANT_LLVM_RELEASE needs to be exported."
-	echo "For example if this is being called through a recipe:"
-	echo "export WANT_LLVM_RELEASE=3D\"3.3\""
-	exit 1
-fi
diff --git a/meta-arago-extras/recipes-core/llvm/llvm.inc b/meta-arago-ex=
tras/recipes-core/llvm/llvm.inc
deleted file mode 100644
index 64451af8..00000000
--- a/meta-arago-extras/recipes-core/llvm/llvm.inc
+++ /dev/null
@@ -1,162 +0,0 @@
-# LLVM does not provide ABI stability between different versions. For th=
is
-# reason OE makes it possible to build and install different llvm versio=
ns
-# at the same time.
-#
-# This is true for the normal recipes as well as the native ones.
-#
-# All regular installation directories are prefixed with 'llvm${LLVM_REL=
EASE}'
-# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
-#
-# For your program or library that makes use of llvm you do should not n=
eed to
-# modify anything as long as it uses the results of various llvm-config
-# invocations. If you need customizations something is wrong and it need=
s to be
-# fixed (report bug).
-#
-# However the *recipe* for your program/library *must* declare
-# export WANT_LLVM_RELEASE =3D "<valid version number>"
-# The version number is picked up by a generic wrapper script which just=
 calls
-# the variant of the specified version.
-
-DESCRIPTION =3D "The Low Level Virtual Machine"
-HOMEPAGE =3D "http://llvm.org"
-
-# 3-clause BSD-like
-# University of Illinois/NCSA Open Source License
-LICENSE =3D "NCSA"
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc2=
73ab1f8"
-
-DEPENDS =3D "libffi libxml2-native llvm-common"
-
-inherit perlnative python3native autotools
-
-LLVM_RELEASE =3D "${PV}"
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
-S =3D "${WORKDIR}/llvm-${PV}.src"
-
-LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
-LLVM_INSTALL_DIR =3D "${WORKDIR}/llvm-install"
-
-EXTRA_OECONF +=3D "--disable-assertions \
-                 --enable-debug-runtime \
-                 --disable-expensive-checks \
-                 --enable-bindings=3Dnone \
-                 --enable-keep-symbols \
-                 --enable-libffi \
-                 --enable-optimized \
-                 --enable-shared \
-                 --enable-targets=3Dhost-only"
-EXTRA_OEMAKE +=3D "REQUIRES_RTTI=3D1 VERBOSE=3D1"
-
-do_configure:prepend() {
-    # Remove RPATHs
-    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Mak=
efile.rules
-
-    # Drop "svn" suffix from version string
-    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
-
-    # Fix paths in llvm-config
-    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::par=
ent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-c=
onfig/llvm-config.cpp
-    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/=
llvm-config/llvm-config.cpp
-
-    # Fix the hardcoded libdir in llvm-config
-    sed -i 's:/lib\>:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.c=
pp
-
-    # Fails to build unless using separate directory from source
-    mkdir -p ${LLVM_BUILD_DIR}
-    cd ${LLVM_BUILD_DIR}
-}
-
-do_compile() {
-    cd ${LLVM_BUILD_DIR}
-
-    # Fix libdir for multilib
-    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.con=
fig
-
-    oe_runmake \
-        AR=3D"${BUILD_AR}" \
-        CC=3D"${BUILD_CC}" \
-        CFLAGS=3D"${BUILD_CFLAGS}" \
-        CXX=3D"${BUILD_CXX}" \
-        CXXFLAGS=3D"${BUILD_CXXFLAGS}" \
-        CPP=3D"${BUILD_CPP}" \
-        CPPFLAGS=3D"${BUILD_CPPFLAGS}" \
-        NM=3D"${BUILD_NM}" \
-        RANLIB=3D"${BUILD_RANLIB}" \
-        PATH=3D"${STAGING_BINDIR_NATIVE}:$PATH" \
-        cross-compile-build-tools
-    oe_runmake
-}
-
-do_install() {
-    cd ${LLVM_BUILD_DIR}
-    oe_runmake DESTDIR=3D${LLVM_INSTALL_DIR} install
-
-    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_=
INSTALL_DIR}/llvm-config-host
-
-    install -d ${D}${bindir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-    install -d ${D}${includedir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-    install -d ${D}${libdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-    install -d ${D}${docdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR=
}
-}
-
-SYSROOT_PREPROCESS_FUNCS +=3D "llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_c=
rossscripts}/llvm-config${PV}
-}
-
-PACKAGES +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
-ALLOW_EMPTY:${PN} =3D "1"
-ALLOW_EMPTY:${PN}-staticdev =3D "1"
-FILES:${PN} =3D ""
-FILES:${PN}-staticdev =3D ""
-FILES:${PN}-dbg =3D " \
-    ${bindir}/${LLVM_DIR}/.debug \
-    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
-    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
-    /usr/src/debug \
-"
-
-FILES:${PN}-dev =3D " \
-    ${bindir}/${LLVM_DIR} \
-    ${includedir}/${LLVM_DIR} \
-"
-RRECOMMENDS:${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
-
-FILES:${PN}-bugpointpasses =3D "\
-    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
-"
-FILES:${PN}-llvmhello =3D "\
-    ${libdir}/${LLVM_DIR}/LLVMHello.so \
-"
-
-PACKAGES_DYNAMIC =3D "^libllvm${LLVM_RELEASE}-.*$"
-NOAUTOPACKAGEDEBUG =3D "1"
-
-INSANE_SKIP:${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} +=3D =
"dev-so"
-
-python llvm_populate_packages() {
-    libdir =3D bb.data.expand('${libdir}', d)
-    libllvm_libdir =3D bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_dbg_packages =3D do_split_packages(d, libllvm_libdir+'/.debug'=
, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package =
for %s', allow_dirs=3DTrue)
-    split_packages =3D do_split_packages(d, libdir, '^lib(.*)\.so$', 'li=
bllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=3DTrue, allo=
w_links=3DTrue, recursive=3DTrue)
-    split_staticdev_packages =3D do_split_packages(d, libllvm_libdir, '^=
lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev pac=
kage for %s', allow_dirs=3DTrue)
-    if split_packages:
-        pn =3D d.getVar('PN')
-        d.appendVar('RDEPENDS:' + pn, ' '+' '.join(split_packages))
-        d.appendVar('RDEPENDS:' + pn + '-dbg', ' '+' '.join(split_dbg_pa=
ckages))
-        d.appendVar('RDEPENDS:' + pn + '-staticdev', ' '+' '.join(split_=
staticdev_packages))
-}
-
-PACKAGESPLITFUNCS:prepend =3D "llvm_populate_packages "
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configur=
e-Do-not-check-build-executable-extension.patch b/meta-arago-extras/recip=
es-core/llvm/ti-llvm3.6/0001-configure-Do-not-check-build-executable-exte=
nsion.patch
deleted file mode 100644
index 9a60caf3..00000000
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-configure-Do-no=
t-check-build-executable-extension.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 60da8adc29a84796c9768a1a962eda1915c87332 Mon Sep 17 00:00:00 2001
-From: Jake Stiffler <j-stiffler@ti.com>
-Date: Fri, 20 Feb 2015 10:55:11 -0500
-Subject: [PATCH] configure: Do not check build executable extension.
-
- * This seems to cause issues nativesdk and build sdk
-   architectures are the same.
-
-Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
----
- configure                 |    3 +++
- 1 files changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index decbc40..387c4fd 100755
---- a/configure
-+++ b/configure
-@@ -4951,6 +4951,8 @@ echo "$as_me: error: no acceptable cc found in \$P=
ATH" >&2;}
-   rm -f conftest*
-   echo 'int main () { return 0; }' > conftest.$ac_ext
-   ac_cv_build_exeext=3D
-+
-+if false; then
-   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
-   (eval $ac_build_link) 2>&5
-   ac_status=3D$?
-@@ -4967,6 +4969,7 @@ echo "$as_me: error: no acceptable cc found in \$P=
ATH" >&2;}
- echo "$as_me: error: installation or configuration problem: compiler ca=
nnot create executables." >&2;}
-    { (exit 1); exit 1; }; }
-   fi
-+fi
-   rm -f conftest*
-   test x"${ac_cv_build_exeext}" =3D x && ac_cv_build_exeext=3Dblank
- fi
---=20
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
deleted file mode 100644
index 395651d3..00000000
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ /dev/null
@@ -1,184 +0,0 @@
-DESCRIPTION =3D "LLVM 3.6 with support for TI C66x intrinsics"
-HOMEPAGE =3D "https://git.ti.com/opencl/llvm"
-
-PR =3D "r7"
-
-do_configure:prepend:class-native() {
-    # Fix paths in llvm-config
-    sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath)=
)).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-c=
onfig/llvm-config.cpp
-}
-
-do_configure:prepend() {
-    # Workaround for libdir fix for multilib to undo what is currently u=
pstream
-    sed -i 's:${base_libdir}:/${baselib}:g' ${S}/tools/llvm-config/llvm-=
config.cpp
-}
-
-require recipes-core/llvm/llvm.inc
-
-inherit pkgconfig
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd=
7814d1d"
-
-DEPENDS +=3D "ncurses libxml2 groff-native"
-DEPENDS:append:class-target =3D " valgrind"
-
-LLVM_DIR =3D "ti-llvm${PV}"
-
-LLVM_GIT_NAME =3D "llvm"
-LLVM_GIT_URI =3D "git://git.ti.com/git/opencl/llvm.git"
-LLVM_GIT_PROTOCOL =3D "https"
-LLVM_GIT_BRANCH =3D "release_36_ti"
-LLVM_GIT_DESTSUFFIX =3D "git"
-LLVM_GIT_SRCREV =3D "09780c6750b30da81e4a0a805aedf1699fbc37c7"
-
-CLANG_GIT_NAME =3D "clang"
-CLANG_GIT_URI =3D "git://git.ti.com/git/opencl/clang.git"
-CLANG_GIT_PROTOCOL =3D "https"
-CLANG_GIT_BRANCH =3D "release_36_ti"
-CLANG_GIT_DESTSUFFIX =3D "${LLVM_GIT_DESTSUFFIX}/tools/clang"
-CLANG_GIT_SRCREV =3D "5b006f07bdc22b5ae6917eecdfe243908dd7b029"
-
-SRC_URI =3D " \
-  ${LLVM_GIT_URI};protocol=3D${LLVM_GIT_PROTOCOL};branch=3D${LLVM_GIT_BR=
ANCH};destsuffix=3D${LLVM_GIT_DESTSUFFIX};name=3D${LLVM_GIT_NAME} \
-  ${CLANG_GIT_URI};protocol=3D${CLANG_GIT_PROTOCOL};branch=3D${CLANG_GIT=
_BRANCH};destsuffix=3D${CLANG_GIT_DESTSUFFIX};name=3D${CLANG_GIT_NAME} \
-  file://0001-configure-Do-not-check-build-executable-extension.patch \
-"
-
-SRCREV_${LLVM_GIT_NAME} =3D "${LLVM_GIT_SRCREV}"
-SRCREV_${CLANG_GIT_NAME} =3D "${CLANG_GIT_SRCREV}"
-
-SRCREV_FORMAT =3D "${LLVM_GIT_NAME}"
-
-S =3D "${WORKDIR}/git"
-
-LIBXML2_INC =3D "`pkg-config libxml-2.0 --cflags`"
-LIBXML2_LIBS =3D "`pkg-config libxml-2.0 --libs`"
-
-EXTRA_OECONF +=3D " --enable-targets=3D"host,arm,c6000,msp430" \
-                  --disable-zlib \
-                  --disable-terminfo \
-                  --disable-libedit \
-"
-
-EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}" LIBXML2_LIBS=3D"${LIBX=
ML2_LIBS}""
-
-do_compile:class-native() {
-  cd ${LLVM_BUILD_DIR}
-
-  # Fix libdir for multilib
-  sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.confi=
g
-
-  oe_runmake
-}
-
-do_compile:class-nativesdk() {
-    # Fix for buildpaths error referring to TMPDIR
-    sed -i 's:@LLVM_SRC_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.=
inc.in
-    sed -i 's:@LLVM_OBJ_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.=
inc.in
-
-    cd ${LLVM_BUILD_DIR}
-
-    # Fix libdir for multilib
-    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.con=
fig
-
-    oe_runmake \
-        AR=3D"${BUILD_AR}" \
-        CC=3D"${BUILD_CC}" \
-        CFLAGS=3D"${BUILD_CFLAGS}" \
-        CXX=3D"${BUILD_CXX}" \
-        CXXFLAGS=3D"${BUILD_CXXFLAGS}" \
-        CPP=3D"${BUILD_CPP}" \
-        CPPFLAGS=3D"${BUILD_CPPFLAGS}" \
-        LD=3D"${BUILD_LD}" \
-        LDFLAGS=3D"${BUILD_LDFLAGS}" \
-        NM=3D"${BUILD_NM}" \
-        RANLIB=3D"${BUILD_RANLIB}" \
-        PATH=3D"${STAGING_BINDIR_NATIVE}:$PATH" \
-        cross-compile-build-tools
-
-    # Workaround for timestamp issue on built-tools
-    for f in ${LLVM_BUILD_DIR}/BuildTools/Release/bin/*
-    do
-        touch $f
-    done
-
-    oe_runmake
-}
-
-# Workaround for libdir fix for multilib
-do_compile() {
-    cd ${LLVM_BUILD_DIR}
-
-    # Fix libdir for multilib
-    sed -i 's:(PROJ_prefix)${base_libdir}:(PROJ_prefix)/${baselib}:g' Ma=
kefile.config
-
-    oe_runmake \
-        AR=3D"${BUILD_AR}" \
-        CC=3D"${BUILD_CC}" \
-        CFLAGS=3D"${BUILD_CFLAGS}" \
-        CXX=3D"${BUILD_CXX}" \
-        CXXFLAGS=3D"${BUILD_CXXFLAGS}" \
-        CPP=3D"${BUILD_CPP}" \
-        CPPFLAGS=3D"${BUILD_CPPFLAGS}" \
-        NM=3D"${BUILD_NM}" \
-        RANLIB=3D"${BUILD_RANLIB}" \
-        PATH=3D"${STAGING_BINDIR_NATIVE}:$PATH" \
-        cross-compile-build-tools
-    oe_runmake
-}
-
-do_install:append:class-target() {
-    for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
-        if [ ! -L ${b} ]; then
-            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${D}${bindir}=
/${LLVM_DIR}/${HOST_SYS}-||g'`
-        fi
-    done
-}
-
-do_install:class-native() {
-    cd ${LLVM_BUILD_DIR}
-    oe_runmake DESTDIR=3D${LLVM_INSTALL_DIR} install
-
-    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config ${LLVM_INSTA=
LL_DIR}/llvm-config${PV}-ti
-
-    install -d ${D}${bindir}
-    for b in ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-clang*; do
-        if [ ! -L ${b} ]; then
-            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${LLVM_INSTAL=
L_DIR}${bindir}/${HOST_SYS}-||g'`
-        fi
-    done
-
-    install -d ${D}${bindir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-    install -d ${D}${includedir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-    install -d ${D}${libdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-    install -d ${D}${docdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR=
}
-
-    install -d ${D}${bindir}
-    install -m 0755 ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti ${D}${bindir=
}
-}
-
-
-SYSROOT_PREPROCESS_FUNCS:class-target +=3D "llvm_sysroot_preprocess_targ=
et"
-SYSROOT_PREPROCESS_FUNCS:class-nativesdk +=3D "llvm_sysroot_preprocess_t=
arget"
-
-llvm_sysroot_preprocess() {
-    :
-}
-
-llvm_sysroot_preprocess_target() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_c=
rossscripts}/llvm-config${PV}-ti
-}
-
-INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
-INSANE_SKIP:${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.0 +=3D=
 "dev-so"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


