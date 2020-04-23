Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8BB3F52A52
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED83A40C35;
	Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nSvUOROfjUzs; Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0A6E40C34;
	Thu, 23 Apr 2020 23:57:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8B29A172A07;
	Thu, 23 Apr 2020 19:57:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Apr 2020 19:57:18 -0400
Message-Id: <1587686239-6605-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587686239-6605-1-git-send-email-denis@denix.org>
References: <1587686239-6605-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 4/5] tcmode-external-arm: this was overlayed temporarily before and is no longer needed
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
X-List-Received-Date: Thu, 23 Apr 2020 23:59:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/tcmode-external-arm.inc    | 113 ---------------------
 1 file changed, 113 deletions(-)
 delete mode 100644 meta-arago-extras/conf/distro/include/tcmode-external-arm.inc

diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc
deleted file mode 100644
index 4074d6d..0000000
--- a/meta-arago-extras/conf/distro/include/tcmode-external-arm.inc
+++ /dev/null
@@ -1,113 +0,0 @@
-#
-# Configuration to use an external Arm binary toolchain
-#
-
-EXTERNAL_TOOLCHAIN ?= "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
-
-TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
-PATH =. "${TOOLCHAIN_PATH_ADD}"
-
-EAT_TARGET_SYS_arm ?= "arm-linux-gnueabihf"
-EAT_TARGET_SYS_aarch64 ?= "aarch64-linux-gnu"
-EAT_TARGET_SYS = "${TARGET_SYS}"
-TARGET_PREFIX = "${EAT_TARGET_SYS}-"
-
-EAT_LIBDIR_arm = "lib"
-EAT_LIBDIR_aarch64 = "lib64"
-
-GCCMULTILIB_forcevariable = "--disable-multilib"
-IMAGE_LINGUAS_forcevariable = ""
-
-# Blacklist toolchain recipes as a belt-and-suspenders way to use the external toolchain
-PNBLACKLIST[glibc] = "Using external toolchain"
-PNBLACKLIST[libgcc] = "Using external toolchain"
-PNBLACKLIST[gcc-cross] = "Using external toolchain"
-PNBLACKLIST[gcc-runtime] = "Using external toolchain"
-
-PREFERRED_PROVIDER_linux-libc-headers = "external-arm-toolchain"
-PREFERRED_PROVIDER_linux-libc-headers-dev = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc = "external-arm-toolchain"
-PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libc = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libintl = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libiconv = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/crypt = "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc-thread-db = "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
-PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
-
-TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include "
-TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
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
-
-ERROR_QA[type] ?= "list"
-python toolchain_metadata_setup () {
-    import subprocess
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-
-    d = e.data
-    l = d.createCopy()
-    l.finalize()
-    oe_import(l)
-
-    external_toolchain = l.getVar('EXTERNAL_TOOLCHAIN', True)
-    if not external_toolchain or external_toolchain == 'UNDEFINED':
-        bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path to your arm toolchain")
-
-    if not os.path.exists(external_toolchain):
-        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist" % external_toolchain)
-
-    # The external toolchain may not have been built with the oe-core preferred
-    # gnu hash setting, so ensure that the corresponding sanity check is not an error.
-    error_qa = oe.data.typed_value('ERROR_QA', l)
-    if 'ldflags' in error_qa:
-        error_qa.remove('ldflags')
-        d.setVar('ERROR_QA', ' '.join(error_qa))
-}
-addhandler toolchain_metadata_setup
-
-def populate_toolchain_links(d):
-    import errno
-    import os
-    from glob import glob
-
-    d = d.createCopy()
-    d.finalize()
-
-    pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
-    files = glob(pattern)
-    if not files:
-        bb.fatal("Unable to populate toolchain binary symlinks")
-
-    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
-    bb.mkdirhier(bindir)
-    for f in files:
-        base = os.path.basename(f)
-        newpath = os.path.join(bindir, base)
-        try:
-            os.symlink(f, newpath)
-        except OSError as exc:
-            if exc.errno == errno.EEXIST:
-                break
-            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
-
-require conf/distro/include/external-arm-toolchain-versions.inc
-- 
2.7.4


