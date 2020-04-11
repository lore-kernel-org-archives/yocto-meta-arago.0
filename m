Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 635955298B
	for <meta-arago@arago-project.org>;
	Sat, 11 Apr 2020 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2EC9240A6E;
	Sat, 11 Apr 2020 22:48:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sSybhrqTRNwz; Sat, 11 Apr 2020 22:48:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A7F940B37;
	Sat, 11 Apr 2020 22:48:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B4F961720FB;
	Sat, 11 Apr 2020 18:48:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 11 Apr 2020 18:48:22 -0400
Message-Id: <1586645302-19047-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586645302-19047-1-git-send-email-denis@denix.org>
References: <1586645302-19047-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/2] recipes: remove old Linaro toolchain support
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
X-List-Received-Date: Sat, 11 Apr 2020 22:50:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-linaro.inc       | 116 --------------
 .../external-linaro-secondary-sdk-toolchain.bb     |   4 -
 .../meta/external-linaro-toolchain.bbappend        |  47 ------
 .../include/tclibc-external-linaro-toolchain.inc   |  38 -----
 .../meta/external-linaro-bfd-version.inc           |   8 -
 .../meta/external-linaro-sdk-toolchain.bb          | 128 ---------------
 .../meta/external-linaro-toolchain-cross.bb        |  19 ---
 .../meta/external-linaro-toolchain.bbappend        | 177 ---------------------
 8 files changed, 537 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-linaro.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
 delete mode 100644 meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
deleted file mode 100644
index 06de680..0000000
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ /dev/null
@@ -1,116 +0,0 @@
-# Select external binary prebuilt Linaro toolchain
-TCMODE = "external-linaro"
-TCLIBC = "external-linaro-toolchain"
-
-ELT_TARGET_SYS_ARMV5 ?= "arm-linux-gnueabi"
-ELT_TARGET_SYS_ARMV7 ?= "arm-linux-gnueabihf"
-ELT_TARGET_SYS_ARMV8 ?= "aarch64-linux-gnu"
-
-ELT_TARGET_SYS_arm = "${ELT_TARGET_SYS_ARMV5}"
-ELT_TARGET_SYS_armv7a = "${ELT_TARGET_SYS_ARMV7}"
-ELT_TARGET_SYS_aarch64 = "${ELT_TARGET_SYS_ARMV8}"
-
-SECONDARY_TARGET_ARCH = ""
-SECONDARY_TARGET_ARCH_k3 = "armv7a"
-
-TARGET_VENDOR = ""
-
-TOOLCHAIN_BASE ?= "/opt"
-TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-ti2018.00-armv5-x86_64_${ELT_TARGET_SYS_ARMV5}"
-TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV7}"
-TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-linaro-7.2.1-2017.11-x86_64_${ELT_TARGET_SYS_ARMV8}"
-
-DEF_TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
-DEF_TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
-DEF_TOOLCHAIN_PATH_aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
-
-TOOLCHAIN_PATH ?= "${DEF_TOOLCHAIN_PATH}"
-
-TOOLCHAIN_SYS := "${ELT_TARGET_SYS}"
-TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
-#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-linaro-sdk-toolchain"
-
-# Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
-bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set up runtime preferences
-PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
-PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "linaro-7.2%"
-SDKGDBVERSION ?= "8.0"
-SDKBINUVERSION ?= "linaro-2.27%"
-SDKGLIBCVERSION ?= "2.26%"
-SDKLINUXLIBCVERSION ?= "4.14%"
-
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gdb-crosssdk-${SDK_SYS} ?= "${SDKGDBVERSION}"
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${SDKGDBVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
-
-PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
-
-# Set target toolchain preferences to match Cross/SDK by default
-# Can be overwritten globally, if needed
-GCCVERSION ?= "linaro-7.2%"
-GDBVERSION ?= "8.0"
-BINUVERSION ?= "linaro-2.27%"
-GLIBCVERSION ?= "2.26%"
-
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
-
-# Licenses set for main components of the toolchain:
-# (g)libc is always LGPL version 2 (or later)
-# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
-#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
-# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
-#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
-#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
-#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
-#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
-# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
-#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
-# binutils version 2.17 was the last one under GPL version 2 (or later), according
-#    to the published releases - http://ftp.gnu.org/gnu/binutils/
-
-python external_linaro_toolchain_license_handler () {
-	if not isinstance(e, bb.event.ConfigParsed):
-		return
-	d = e.data
-	ld = d.createCopy()
-	ld.finalize()
-
-	lc_libc = "LGPL-2.1"
-	lc_gcc = ["GPL-3.0", "GPL-2.0"][elt_get_gcc_version(ld) <= "4.2.1"]
-	lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][elt_get_gcc_version(ld) <= "4.3.3"]
-	lc_gdb = ["GPL-3.0", "GPL-2.0"][elt_get_gdb_version(ld) <= "6.6"]
-#	lc_bfd = ["GPL-3.0", "GPL-2.0"][elt_get_bfd_version(ld) <= "2.17"]
-
-	d.setVar('ELT_LIC_LIBC', lc_libc)
-	d.setVar('ELT_LIC_GCC', lc_gcc)
-	d.setVar('ELT_LIC_RLE', lc_rle)
-	d.setVar('ELT_LIC_GDB', lc_gdb)
-#	d.setVar('ELT_LIC_BFD', lc_bfd)
-
-	d.setVar('ELT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
-}
-addhandler external_linaro_toolchain_license_handler
diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
deleted file mode 100644
index d94070e..0000000
--- a/meta-arago-distro/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
-MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
-
-require recipes-core/meta/external-linaro-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
deleted file mode 100644
index 02760d8..0000000
--- a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
+++ /dev/null
@@ -1,47 +0,0 @@
-# This is a rather hacky way to install custom linux-libc-headers
-# on top of the external-linaro-toolchain, since simply depending
-# on linux-libc-headers creates circular dependencies now. Mostly
-# duplication of code from corresponding recipe.
-
-BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
-
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
-
-PKGV_linux-libc-headers-dev = "4.14"
-PKGV_linux-libc-headers = "4.14"
-
-inherit kernel-arch pkgconfig multilib_header
-
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
-
-do_configure_append() {
-	cd ${WORKDIR}/git
-	oe_runmake allnoconfig
-}
-
-do_install_append() {
-	cd ${WORKDIR}/git
-	oe_runmake headers_install INSTALL_HDR_PATH=${B}${exec_prefix}
-
-	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
-
-	# The ..install.cmd conflicts between various configure runs
-	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
-}
-
-do_install_append_aarch64 () {
-        do_install_asm_armmultilib
-}
-
-do_install_append_arm () {
-	do_install_asm_armmultilib
-}
-
-do_install_asm_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
-	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
-}
diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
deleted file mode 100644
index 0c74b49..0000000
--- a/meta-arago-extras/conf/distro/include/tclibc-external-linaro-toolchain.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-#
-# external Linaro glibc specific configuration
-#
-
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
-
-# Add glibc overrides to the overrides for glibc.
-LIBCOVERRIDE = ":libc-glibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
-
-PREFERRED_PROVIDER_virtual/libc-locale ?= "external-linaro-toolchain"
-
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
-
-LIBC_DEPENDENCIES = "libsegfault \
-		     glibc \
-		     glibc-dbg \
-		     glibc-dev \
-		     glibc-utils \
-		     glibc-thread-db \
-		     ${@get_libc_locales_dependencies(d)}"
-
-LIBC_LOCALE_DEPENDENCIES = "\
-	glibc-localedata-i18n \
-	glibc-gconv-ibm850 \
-	glibc-gconv-cp1252 \
-	glibc-gconv-iso8859-1 \
-	glibc-gconv-iso8859-15 \
-	locale-base-en-us \
-	locale-base-en-gb"
-
-def get_libc_locales_dependencies(d):
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
-    else:
-        return ''
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
deleted file mode 100644
index 9dc6e37..0000000
--- a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
-
-def elt_get_bfd_version(d):
-    import subprocess,os,bb
-    if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
-        return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
-
-ELT_VER_BFD := "${@elt_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
deleted file mode 100644
index 7d270b4..0000000
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ /dev/null
@@ -1,128 +0,0 @@
-inherit cross-canadian
-
-require external-linaro-bfd-version.inc
-
-PR = "r8"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_DEFAULT_DEPS = "1"
-EXCLUDE_FROM_SHLIBS = "1"
-
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps"
-INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
-INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
-
-PROVIDES = "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-PACKAGES = "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-# Don't need the extra target triplet in the new SDK dir structure
-bindir = "${exec_prefix}/bin"
-libdir = "${exec_prefix}/lib"
-libexecdir = "${exec_prefix}/libexec"
-datadir = "${exec_prefix}/share"
-gcclibdir = "${libdir}/gcc"
-
-FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
-	${prefix}/${ELT_TARGET_SYS}/lib/libstdc++.* \
-	${prefix}/${ELT_TARGET_SYS}/lib/libgcc_s.* \
-	${prefix}/${ELT_TARGET_SYS}/lib/libsupc++.* \
-	${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}/* \
-	${bindir}/${TARGET_PREFIX}gcov \
-	${bindir}/${TARGET_PREFIX}gcc* \
-	${bindir}/${TARGET_PREFIX}g++ \
-	${bindir}/${TARGET_PREFIX}cpp \
-	${libexecdir}/* \
-"
-
-FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
-	${bindir}/${TARGET_PREFIX}gdb \
-	${bindir}/${TARGET_PREFIX}gdbtui \
-	${datadir}/gdb/* \
-	${datadir}/info/* \
-	${datadir}/man/man1/${TARGET_PREFIX}* \
-"
-
-FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
-	${prefix}/${ELT_TARGET_SYS}/bin/ld* \
-	${prefix}/${ELT_TARGET_SYS}/bin/objcopy \
-	${prefix}/${ELT_TARGET_SYS}/bin/strip \
-	${prefix}/${ELT_TARGET_SYS}/bin/nm \
-	${prefix}/${ELT_TARGET_SYS}/bin/ranlib \
-	${prefix}/${ELT_TARGET_SYS}/bin/as \
-	${prefix}/${ELT_TARGET_SYS}/bin/ar \
-	${prefix}/${ELT_TARGET_SYS}/bin/objdump \
-	${prefix}/${ELT_TARGET_SYS}/lib/ldscripts/* \
-	${bindir}/${TARGET_PREFIX}ld* \
-	${bindir}/${TARGET_PREFIX}addr2line \
-	${bindir}/${TARGET_PREFIX}objcopy \
-	${bindir}/${TARGET_PREFIX}readelf \
-	${bindir}/${TARGET_PREFIX}strip \
-	${bindir}/${TARGET_PREFIX}nm \
-	${bindir}/${TARGET_PREFIX}ranlib \
-	${bindir}/${TARGET_PREFIX}gprof \
-	${bindir}/${TARGET_PREFIX}as \
-	${bindir}/${TARGET_PREFIX}c++filt \
-	${bindir}/${TARGET_PREFIX}ar \
-	${bindir}/${TARGET_PREFIX}strings \
-	${bindir}/${TARGET_PREFIX}objdump \
-	${bindir}/${TARGET_PREFIX}size \
-"
-
-DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
-DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
-DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
-
-#LICENSE = "${ARG_LIC_LIBC}"
-#LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GCC}"
-#LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GDB}"
-#LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_BFD}"
-
-PKGV = "${ELT_VER_MAIN}"
-PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_GCC}"
-PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_GDB}"
-PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ELT_VER_BFD}"
-
-LIBDIR = "lib"
-LIBDIR_aarch64 = "lib64"
-
-do_install() {
-	install -d ${D}${prefix}/${ELT_TARGET_SYS}/bin
-	install -d ${D}${prefix}/${ELT_TARGET_SYS}/lib
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
-	install -d ${D}${libexecdir}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
-	install -d ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include
-
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${ELT_TARGET_SYS}/lib
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/* ${D}${gcclibdir}/${ELT_TARGET_SYS}/${ELT_VER_GCC}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
-
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-linaro-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
-
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ranlib,as,ar,objdump} ${D}${prefix}/${ELT_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${ELT_TARGET_SYS}/lib/ldscripts
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld*,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindir}
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
deleted file mode 100644
index 14e0826..0000000
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-PR = "r1"
-
-inherit cross
-
-PN = "external-linaro-toolchain-cross-${TARGET_ARCH}"
-BPN = "external-linaro-toolchain"
-
-INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_AUTOTOOLS_DEPS = "1"
-
-do_install() {
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
deleted file mode 100644
index 1c02a44..0000000
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ /dev/null
@@ -1,177 +0,0 @@
-INHIBIT_PACKAGE_DEBUG_SPLIT = "0"
-INHIBIT_PACKAGE_STRIP = "0"
-
-ALLOW_EMPTY_${PN}-utils = "1"
-ALLOW_EMPTY_ldd = "1"
-
-ALLOW_EMPTY_libstdc++ = "1"
-ALLOW_EMPTY_libgomp = "1"
-
-PR_append = ".arago36"
-
-PROVIDES += "virtual/libc-locale"
-
-RPROVIDES_${PN}-staticdev += "glibc-staticdev"
-
-PACKAGES := "${@oe.utils.str_filter_out('libgcc-dev', '${PACKAGES}', d)}"
-PACKAGES =+ "libgcc-dev"
-
-RDEPENDS_${PN}-utils = ""
-
-RDEPENDS_tzcode += "bash"
-RDEPENDS_ldd += "bash"
-RDEPENDS_libasan += "libstdc++"
-RDEPENDS_libubsan += "libstdc++"
-
-PKGV = "${ELT_VER_LIBC}"
-PKGV_glibc-thread-db = "${ELT_VER_LIBC}"
-
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
-FILES_${PN} += "\
-	${libdir}/bin \
-	${libdir}/locale \
-	${libdir}/gconv/gconv-modules \
-	${datadir}/zoneinfo \
-	${base_libdir}/libcrypt*.so.* \
-	${base_libdir}/libcrypt-*.so \
-	${base_libdir}/libc.so.* \
-	${libdir}/libc.so.* \
-	${base_libdir}/libc-*.so \
-	${base_libdir}/libm*.so.* \
-	${base_libdir}/libm-*.so \
-	${base_libdir}/ld*.so.* \
-	${base_libdir}/ld-*.so \
-	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread-*.so \
-	${base_libdir}/libresolv*.so.* \
-	${base_libdir}/libresolv-*.so \
-	${base_libdir}/librt*.so.* \
-	${base_libdir}/librt-*.so \
-	${base_libdir}/libutil*.so.* \
-	${base_libdir}/libutil-*.so \
-	${base_libdir}/libnsl*.so.* \
-	${base_libdir}/libnsl-*.so \
-	${base_libdir}/libnss_files*.so.* \
-	${base_libdir}/libnss_files-*.so \
-	${base_libdir}/libnss_compat*.so.* \
-	${base_libdir}/libnss_compat-*.so \
-	${base_libdir}/libnss_dns*.so.* \
-	${base_libdir}/libnss_dns-*.so \
-	${base_libdir}/libnss_nis*.so.* \
-	${base_libdir}/libnss_nisplus-*.so \
-	${base_libdir}/libnss_nisplus*.so.* \
-	${base_libdir}/libnss_nis-*.so \
-	${base_libdir}/libnss_hesiod*.so.* \
-	${base_libdir}/libnss_hesiod-*.so \
-	${base_libdir}/libdl*.so.* \
-	${base_libdir}/libdl-*.so \
-	${base_libdir}/libanl*.so.* \
-	${base_libdir}/libanl-*.so \
-	${base_libdir}/libBrokenLocale*.so.* \
-	${base_libdir}/libBrokenLocale-*.so \
-	${base_libdir}/libcidn*.so.* \
-	${base_libdir}/libcidn-*.so \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libpcprofile.so \
-"
-
-FILES_linux-libc-headers = ""
-
-FILES_linux-libc-headers-dev = "\
-	${includedir}/asm* \
-	${includedir}/linux \
-	${includedir}/mtd \
-	${includedir}/rdma \
-	${includedir}/scsi \
-	${includedir}/sound \
-	${includedir}/video \
-"
-
-FILES_libgcc-dev += "\
-	${libdir}/libgcc.a \
-"
-
-FILES_libstdc++-dev += "\
-	/include/c++ \
-"
-
-FILES_${PN}-dbg_remove = "${base_libdir}/debug"
-
-FILES_libstdc++-dbg = "\
-	${base_libdir}/debug/libstdc++*.* \
-"
-
-PRIVATE_LIBS_libstdc++-dbg = "libstdc++.so.6"
-
-FILES_libgomp-dev += "\
-	${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include/omp.h \
-	${libdir}/gcc/${ELT_TARGET_SYS} \
-"
-
-ELT_LIC_LIBC ?= ""
-ELT_LIC_GCC ?= ""
-ELT_LIC_RLE ?= ""
-ELT_LIC_GDB ?= ""
-ELT_LIC_BFD ?= ""
-ELT_LICENSE ?= "MIT"
-
-LICENSE = "${ELT_LICENSE}"
-LICENSE_ldd = "${ELT_LIC_LIBC}"
-LICENSE_glibc = "${ELT_LIC_LIBC}"
-LICENSE_glibc-thread-db = "${ELT_LIC_LIBC}"
-LICENSE_libgcc = "${ELT_LIC_RLE}"
-LICENSE_libgcc-dev = "${ELT_LIC_RLE}"
-LICENSE_libstdc++ = "${ELT_LIC_RLE}"
-LICENSE_libstdc++-dev = "${ELT_LIC_RLE}"
-LICENSE_libstdc++-staticdev = "${ELT_LIC_RLE}"
-LICENSE_gdbserver = "${ELT_LIC_GDB}"
-#LICENSE_binutils-dev = "${ELT_LIC_BFD}"
-
-do_install_append() {
-	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
-	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libc.so
-
-	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" ${D}${libdir}/libpthread.so
-	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libpthread.so
-
-	if [ -d ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir} ]; then
-		install -d ${D}${bindir}
-		cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir}/* ${D}${bindir}
-	fi
-
-	install -d ${D}${base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
-	install -d ${D}${sysconfdir}
-	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
-
-	install -d ${D}/include
-	install -d ${D}${includedir}
-	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}${includedir}
-	if [ ${ELT_TARGET_SYS} != ${TARGET_SYS} ]; then
-		ln -sf ${ELT_TARGET_SYS} ${D}${includedir}/c++/${ELT_VER_GCC}/${TARGET_SYS}
-	fi
-	ln -sf ../usr/include/c++ ${D}/include/c++
-
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include
-	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/include/omp.h ${D}${libdir}/gcc/${TARGET_SYS}/${ELT_VER_GCC}/include
-	if [ ${ELT_TARGET_SYS} != ${TARGET_SYS} ]; then
-		ln -sf ${TARGET_SYS} ${D}${libdir}/gcc/${ELT_TARGET_SYS}
-	fi
-
-	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/libgcc.a ${D}${libdir}
-	cp -a ${TOOLCHAIN_PATH}/${base_libdir}/gcc/${ELT_TARGET_SYS}/${ELT_VER_GCC}/crt*.o ${D}${libdir}
-}
-
-# Latest Linaro toolchain 2017.11 comes with glibc 2.25, while OE-Core provides 2.26
-# Need to override armmultilib from OE-Core here to not fail on new bits/pthreadtypes-arch.h
-# that did not exist in glibc 2.25
-do_install_armmultilib () {
-
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
-	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/sem.h  bits/semaphore.h bits/setjmp.h
-	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
-
-	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
-
-	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
-}
-- 
2.7.4


