Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 57AA2529A6
	for <meta-arago@arago-project.org>;
	Tue,  5 Feb 2019 06:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4086F40951;
	Tue,  5 Feb 2019 06:54:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JyPqi2u_NVhd; Tue,  5 Feb 2019 06:54:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1390D40A35;
	Tue,  5 Feb 2019 06:54:25 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B57EF16A782;
	Tue,  5 Feb 2019 01:54:24 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2019 01:54:15 -0500
Message-Id: <1549349657-1654-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549349657-1654-1-git-send-email-denys@ti.com>
References: <1549349657-1654-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/4] conf, recipes: enable external arm toolchain by default
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
X-List-Received-Date: Tue, 05 Feb 2019 06:54:41 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |   2 +-
 .../conf/distro/include/toolchain-arm.inc          | 116 +++++++++++++++++++
 .../meta/external-arm-toolchain.bbappend           |  47 ++++++++
 .../recipes-devtools/gcc/gcc_%.bbappend            |   1 +
 .../include/tclibc-external-arm-toolchain.inc      |  38 ++++++
 .../recipes-core/meta/external-arm-bfd-version.inc |   8 ++
 .../meta/external-arm-sdk-toolchain.bb             | 128 +++++++++++++++++++++
 .../meta/external-arm-toolchain-cross.bb           |  19 +++
 8 files changed, 358 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/conf/distro/include/toolchain-arm.inc
 create mode 100644 meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
 create mode 100644 meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc
 create mode 100644 meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
 create mode 100644 meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
 create mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b1bb645..cd56b47 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -144,7 +144,7 @@ IMAGE_FSTYPES_remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') ==
 
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.conf
-TC_SANE_DEFAULT ?= "linaro"
+TC_SANE_DEFAULT ?= "arm"
 TOOLCHAIN_TYPE ?= "external"
 TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"
 
diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
new file mode 100644
index 0000000..15e9af2
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -0,0 +1,116 @@
+# Select external binary prebuilt Arm toolchain
+TCMODE = "external-arm"
+TCLIBC = "external-arm-toolchain"
+
+EAT_TARGET_SYS_ARMV5 ?= "arm-linux-gnueabi"
+EAT_TARGET_SYS_ARMV7 ?= "arm-linux-gnueabihf"
+EAT_TARGET_SYS_ARMV8 ?= "aarch64-linux-gnu"
+
+EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
+EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
+EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"
+
+SECONDARY_TARGET_ARCH = ""
+SECONDARY_TARGET_ARCH_k3 = "armv7a"
+
+TARGET_VENDOR = ""
+
+TOOLCHAIN_BASE ?= "/opt"
+TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-ti2019.00-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
+TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-2019.01-x86_64-${EAT_TARGET_SYS_ARMV7}"
+TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-8.2-2019.01-x86_64-${EAT_TARGET_SYS_ARMV8}"
+
+DEF_TOOLCHAIN_PATH_arm = "${TOOLCHAIN_PATH_ARMV5}"
+DEF_TOOLCHAIN_PATH_armv7a = "${TOOLCHAIN_PATH_ARMV7}"
+DEF_TOOLCHAIN_PATH_aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
+
+TOOLCHAIN_PATH ?= "${DEF_TOOLCHAIN_PATH}"
+
+TOOLCHAIN_SYS := "${EAT_TARGET_SYS}"
+TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
+
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-arm-toolchain"
+
+PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
+PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
+#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"
+
+# Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
+bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
+PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+# Set up runtime preferences
+PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
+PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
+
+# Set Cross and SDK toolchain preferences
+SDKGCCVERSION ?= "arm-8.2%"
+SDKGDBVERSION ?= "8.2"
+SDKBINUVERSION ?= "arm-2.30%"
+SDKGLIBCVERSION ?= "2.28%"
+SDKLINUXLIBCVERSION ?= "4.14%"
+
+PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_gdb-crosssdk-${SDK_SYS} ?= "${SDKGDBVERSION}"
+PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${SDKGDBVERSION}"
+PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
+
+PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
+
+# Set target toolchain preferences to match Cross/SDK by default
+# Can be overwritten globally, if needed
+GCCVERSION ?= "arm-8.2%"
+GDBVERSION ?= "8.2"
+BINUVERSION ?= "arm-2.30%"
+GLIBCVERSION ?= "2.28%"
+
+PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
+PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
+PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
+PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
+
+# Licenses set for main components of the toolchain:
+# (g)libc is always LGPL version 2 (or later)
+# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
+#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
+# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
+#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
+#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
+#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
+#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
+# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
+#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
+# binutils version 2.17 was the last one under GPL version 2 (or later), according
+#    to the published releases - http://ftp.gnu.org/gnu/binutils/
+
+python external_arm_toolchain_license_handler () {
+	if not isinstance(e, bb.event.ConfigParsed):
+		return
+	d = e.data
+	ld = d.createCopy()
+	ld.finalize()
+
+	lc_libc = "LGPL-2.1"
+	lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
+	lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
+	lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
+#	lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
+
+	d.setVar('EAT_LIC_LIBC', lc_libc)
+	d.setVar('EAT_LIC_GCC', lc_gcc)
+	d.setVar('EAT_LIC_RLE', lc_rle)
+	d.setVar('EAT_LIC_GDB', lc_gdb)
+#	d.setVar('EAT_LIC_BFD', lc_bfd)
+
+	d.setVar('EAT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
+}
+addhandler external_arm_toolchain_license_handler
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
new file mode 100644
index 0000000..8b947d1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -0,0 +1,47 @@
+# This is a rather hacky way to install custom linux-libc-headers
+# on top of the external-arm-toolchain, since simply depending
+# on linux-libc-headers creates circular dependencies now. Mostly
+# duplication of code from corresponding recipe.
+
+BRANCH = "ti-lsk-linux-4.14.y"
+SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
+
+PKGV_linux-libc-headers-dev = "4.14"
+PKGV_linux-libc-headers = "4.14"
+
+inherit kernel-arch pkgconfig multilib_header
+
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
+
+do_configure_append() {
+	cd ${WORKDIR}/git
+	oe_runmake allnoconfig
+}
+
+do_install_append() {
+	cd ${WORKDIR}/git
+	oe_runmake headers_install INSTALL_HDR_PATH=${B}${exec_prefix}
+
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
+}
+
+do_install_append_aarch64 () {
+        do_install_asm_armmultilib
+}
+
+do_install_append_arm () {
+	do_install_asm_armmultilib
+}
+
+do_install_asm_armmultilib () {
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
+	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
+}
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
index 4769d63..22a739e 100644
--- a/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_%.bbappend
@@ -1,4 +1,5 @@
 DEPENDS =+ "flex-native"
 
 EXTRA_DEPS = "${@['','external-linaro-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
+EXTRA_DEPS = "${@['','external-arm-toolchain-cross-${TARGET_ARCH}'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
 DEPENDS += "${EXTRA_DEPS}"
diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc
new file mode 100644
index 0000000..934b71b
--- /dev/null
+++ b/meta-arago-extras/conf/distro/include/tclibc-external-arm-toolchain.inc
@@ -0,0 +1,38 @@
+#
+# external Arm glibc specific configuration
+#
+
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
+
+# Add glibc overrides to the overrides for glibc.
+LIBCOVERRIDE = ":libc-glibc"
+OVERRIDES .= "${LIBCOVERRIDE}"
+
+PREFERRED_PROVIDER_virtual/libc-locale ?= "external-arm-toolchain"
+
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
+
+LIBC_DEPENDENCIES = "libsegfault \
+		     glibc \
+		     glibc-dbg \
+		     glibc-dev \
+		     glibc-utils \
+		     glibc-thread-db \
+		     ${@get_libc_locales_dependencies(d)}"
+
+LIBC_LOCALE_DEPENDENCIES = "\
+	glibc-localedata-i18n \
+	glibc-gconv-ibm850 \
+	glibc-gconv-cp1252 \
+	glibc-gconv-iso8859-1 \
+	glibc-gconv-iso8859-15 \
+	locale-base-en-us \
+	locale-base-en-gb"
+
+def get_libc_locales_dependencies(d):
+    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
+        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
+    else:
+        return ''
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
new file mode 100644
index 0000000..22f1033
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
@@ -0,0 +1,8 @@
+TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
+
+def eat_get_bfd_version(d):
+	import subprocess,os,bb
+	if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
+		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
+
+EAT_VER_BFD := "${@eat_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
new file mode 100644
index 0000000..45ae218
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
@@ -0,0 +1,128 @@
+inherit cross-canadian
+
+require external-arm-bfd-version.inc
+
+PR = "r8"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_SHLIBS = "1"
+
+# License applies to this recipe code, not the toolchain itself
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps"
+INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+
+PROVIDES = "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+PACKAGES = "\
+	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
+	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+"
+
+# Don't need the extra target triplet in the new SDK dir structure
+bindir = "${exec_prefix}/bin"
+libdir = "${exec_prefix}/lib"
+libexecdir = "${exec_prefix}/libexec"
+datadir = "${exec_prefix}/share"
+gcclibdir = "${libdir}/gcc"
+
+FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
+	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
+	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
+	${bindir}/${TARGET_PREFIX}gcov \
+	${bindir}/${TARGET_PREFIX}gcc* \
+	${bindir}/${TARGET_PREFIX}g++ \
+	${bindir}/${TARGET_PREFIX}cpp \
+	${libexecdir}/* \
+"
+
+FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+	${bindir}/${TARGET_PREFIX}gdb \
+	${bindir}/${TARGET_PREFIX}gdbtui \
+	${datadir}/gdb/* \
+	${datadir}/info/* \
+	${datadir}/man/man1/${TARGET_PREFIX}* \
+"
+
+FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
+	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
+	${prefix}/${EAT_TARGET_SYS}/bin/strip \
+	${prefix}/${EAT_TARGET_SYS}/bin/nm \
+	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
+	${prefix}/${EAT_TARGET_SYS}/bin/as \
+	${prefix}/${EAT_TARGET_SYS}/bin/ar \
+	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
+	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
+	${bindir}/${TARGET_PREFIX}ld* \
+	${bindir}/${TARGET_PREFIX}addr2line \
+	${bindir}/${TARGET_PREFIX}objcopy \
+	${bindir}/${TARGET_PREFIX}readelf \
+	${bindir}/${TARGET_PREFIX}strip \
+	${bindir}/${TARGET_PREFIX}nm \
+	${bindir}/${TARGET_PREFIX}ranlib \
+	${bindir}/${TARGET_PREFIX}gprof \
+	${bindir}/${TARGET_PREFIX}as \
+	${bindir}/${TARGET_PREFIX}c++filt \
+	${bindir}/${TARGET_PREFIX}ar \
+	${bindir}/${TARGET_PREFIX}strings \
+	${bindir}/${TARGET_PREFIX}objdump \
+	${bindir}/${TARGET_PREFIX}size \
+"
+
+DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
+DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
+DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
+
+#LICENSE = "${ARG_LIC_LIBC}"
+#LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GCC}"
+#LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GDB}"
+#LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_BFD}"
+
+PKGV = "${EAT_VER_MAIN}"
+PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
+PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
+PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
+
+LIBDIR = "lib"
+LIBDIR_aarch64 = "lib64"
+
+do_install() {
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	install -d ${D}${bindir}
+	install -d ${D}${libdir}
+	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	install -d ${D}${libexecdir}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
+	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
+
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
+
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
+	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
+
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ranlib,as,ar,objdump} ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld*,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindir}
+}
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
new file mode 100644
index 0000000..1ce9e06
--- /dev/null
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain-cross.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+PR = "r1"
+
+inherit cross
+
+PN = "external-arm-toolchain-cross-${TARGET_ARCH}"
+BPN = "external-arm-toolchain"
+
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
+do_install() {
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/
+	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${D}/${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/
+}
-- 
2.7.4


