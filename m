Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 5C9DF52AC6
	for <meta-arago@arago-project.org>;
	Mon, 17 Aug 2015 22:52:28 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NT9006T70VCB9L0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Aug 2015 17:52:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=7-kBMe3LSNiluEdgXBYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 39D3C161B79;	Mon,
	17 Aug 2015 18:52:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2015 18:52:21 -0400
Message-id: <1439851943-29587-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH 1/3] toolchain: remove remaining deprecated Arago toolchain pieces
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
X-List-Received-Date: Mon, 17 Aug 2015 22:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-arago.inc        |  9 ---
 .../include/tclibc-external-arago-toolchain.inc    | 41 ------------
 .../conf/distro/include/tcmode-external-arago.inc  | 77 ----------------------
 3 files changed, 127 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-arago.inc
 delete mode 100644 meta-arago-extras/conf/distro/include/tclibc-external-arago-toolchain.inc
 delete mode 100644 meta-arago-extras/conf/distro/include/tcmode-external-arago.inc

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arago.inc b/meta-arago-distro/conf/distro/include/toolchain-arago.inc
deleted file mode 100644
index 45d2538..0000000
--- a/meta-arago-distro/conf/distro/include/toolchain-arago.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-# Select external binary prebuilt Arago toolchain
-TCMODE = "external-arago"
-TCLIBC = "external-arago-toolchain"
-
-#DEFAULTTUNE = "armv7at-neon"
-
-# Set some vars to help locate the toolchain automatically from PATH
-TOOLCHAIN_SYS := "arm-arago-linux-gnueabi"
-TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
diff --git a/meta-arago-extras/conf/distro/include/tclibc-external-arago-toolchain.inc b/meta-arago-extras/conf/distro/include/tclibc-external-arago-toolchain.inc
deleted file mode 100644
index 37dc0e8..0000000
--- a/meta-arago-extras/conf/distro/include/tclibc-external-arago-toolchain.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-#
-# external Arago eglibc specific configuration
-#
-
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
-
-# Add glibc overrides to the overrides for eglibc.
-LIBCOVERRIDE = ":libc-glibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
-
-PREFERRED_PROVIDER_virtual/libiconv ?= "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libintl ?= "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libc ?= "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libc-locale ?= "external-arago-toolchain"
-
-PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
-PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
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
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
-        return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
-    else:
-        return ''
diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
deleted file mode 100644
index 603dc5d..0000000
--- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-# Configuration to use an external Arago binary toolchain
-#
-
-EXTERNAL_TOOLCHAIN ?= "/usr/local/arago-2011.09/${TARGET_ARCH}"
-
-ARAGO_TARGET_SYS = "arm-arago-linux-gnueabi"
-TARGET_PREFIX = "${ARAGO_TARGET_SYS}-"
-
-# Need to use newer linux headers, as 2011.09 has too old ones for newer udev
-PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
-PREFERRED_PROVIDER_linux-libc-headers-dev = "linux-libc-headers"
-PREFERRED_PROVIDER_virtual/linux-libc-headers = "linux-libc-headers"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-arago-toolchain"
-PREFERRED_PROVIDER_libgcc = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libc = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libintl = "external-arago-toolchain"
-PREFERRED_PROVIDER_virtual/libiconv = "external-arago-toolchain"
-PREFERRED_PROVIDER_glibc-thread-db = "external-arago-toolchain"
-PREFERRED_PROVIDER_gdbserver = "external-arago-toolchain"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
-#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arago-sdk-toolchain"
-
-# Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
-bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-GCCVERSION ?= "4.5%"
-SDKGCCVERSION ?= "4.5%"
-BINUVERSION ?= "2.20%"
-EGLIBCVERSION ?= "2.12%"
-SDKLINUXLIBCVERSION ?= "3.10"
-
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-initial ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-cross-intermediate ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
-PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
-PREFERRED_VERSION_eglibc ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-locale ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_cross-localedef-native ?= "${EGLIBCVERSION}"
-
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
-
-DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
-			libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
-			libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \
-			libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
-			libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
-			libc-posix-wchar-io"
-
-ENABLE_BINARY_LOCALE_GENERATION = "0"
-GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
-- 
2.2.0


