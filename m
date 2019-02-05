Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3DA4B520EA
	for <meta-arago@arago-project.org>;
	Tue,  5 Feb 2019 16:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6550940B37;
	Tue,  5 Feb 2019 16:53:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TPodRiwJtH9U; Tue,  5 Feb 2019 16:53:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45BEB40A18;
	Tue,  5 Feb 2019 16:53:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E244116A78D;
	Tue,  5 Feb 2019 11:53:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2019 11:53:21 -0500
Message-Id: <1549385601-8621-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] FIXME: external-arm-toolchain: convert to bbappend with fixes
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
X-List-Received-Date: Tue, 05 Feb 2019 16:53:38 -0000

Having it as a recipe seems to conflict with meta-linaro layer.
Remove once upstreamed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...oolchain.bb => external-arm-toolchain.bbappend} | 387 ---------------------
 1 file changed, 387 deletions(-)
 rename meta-arago-extras/recipes-core/meta/{external-arm-toolchain.bb => external-arm-toolchain.bbappend} (42%)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
similarity index 42%
rename from meta-arago-extras/recipes-core/meta/external-arm-toolchain.bb
rename to meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 9bc6fae..eff8211 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -1,64 +1,14 @@
-require recipes-core/glibc/glibc-package.inc
-
-INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
 ALLOW_EMPTY_ldd = "1"
 
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
 	file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
 	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
 "
 
 PROVIDES += "\
-	linux-libc-headers \
-	virtual/${TARGET_PREFIX}gcc \
-	virtual/${TARGET_PREFIX}g++ \
-	virtual/${TARGET_PREFIX}gcc-initial \
-	virtual/${TARGET_PREFIX}binutils \
-	virtual/${TARGET_PREFIX}libc-for-gcc \
-	virtual/${TARGET_PREFIX}compilerlibs \
-	virtual/libc \
-	virtual/libintl \
-	virtual/libiconv \
-	virtual/crypt \
-        glibc-mtrace \
-	glibc-thread-db \
-	glibc \
-	libc-mtrace \
-	gcc-runtime \
-	libgcc \
-	libg2c \
-	libg2c-dev \
-	libssp \
-	libssp-dev \
-	libssp-staticdev \
-	libgfortran \
-	libgfortran-dev \
-	libgfortran-staticdev \
-	libmudflap \
-	libmudflap-dev \
-	libgomp \
-	libgomp-dev \
-	libgomp-staticdev \
-	libitm \
-	libitm-dev \
-	libitm-staticdev \
-	libquadmath \
-	libquadmath-dev \
-	libquadmath-staticdev \
-	virtual/linux-libc-headers \
-	libgcov-dev \
 	virtual/libc-locale \
 "
 
-PV = "${EAT_VER_MAIN}"
-
-SRC_URI = "file://SUPPORTED"
-
 do_install() {
 	# Add stubs for files OE-core expects
 	install -d ${S}/nscd/
@@ -218,242 +168,12 @@ do_install() {
 	rmdir ${D}${sbindir} || true
 }
 
-# PACKAGES is split up according to the 'source' recipes/includes in OE-core
-# Stylistic differences are kept to make copy/pasting easier.
-
-# From gcc-runtime.inc
-
-PACKAGES =+ "\
-    libstdc++ \
-    libstdc++-precompile-dev \
-    libstdc++-dbg \
-    libstdc++-dev \
-    libstdc++-staticdev \
-    libg2c \
-    libg2c-dev \
-    libssp \
-    libssp-dev \
-    libssp-staticdev \
-    libmudflap \
-    libmudflap-dev \
-    libmudflap-staticdev \
-    libquadmath \
-    libquadmath-dev \
-    libquadmath-staticdev \
-    libgomp \
-    libgomp-dev \
-    libgomp-staticdev \
-    libatomic \
-    libatomic-dev \
-    libatomic-staticdev \
-    libitm \
-    libitm-dev \
-    libitm-staticdev \
-   "
-
-# From gcc-sanitizers.inc
-
-PACKAGES += "libasan libubsan liblsan libtsan"
-PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
-PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev libtsan-staticdev"
-
-# From libgfortran.inc:
-
-PACKAGES += "\
-    libgfortran \
-    libgfortran-dev \
-    libgfortran-staticdev \
-   "
-
-# libgcc.inc uses ${PN}, so replace that
-
-PACKAGES += "\
-    libgcc \
-    libgcc-dev \
-    libgcc-dbg \
-"
-
-# ... and the leftovers
-
-PACKAGES =+ "\
-        ${PN}-mtrace \
-	libgcov-dev \
-	linux-libc-headers \
-	linux-libc-headers-dev \
-"
-
-INSANE_SKIP_${PN}-dbg = "staticdev"
-INSANE_SKIP_${PN}-utils += "ldflags"
-INSANE_SKIP_libstdc++ += "ldflags"
-INSANE_SKIP_libgfortran += "ldflags"
-INSANE_SKIP_libgcc += "ldflags dev-deps"
-INSANE_SKIP_libgfortran += "ldflags dev-deps"
-INSANE_SKIP_libstdc++ += "ldflags dev-deps"
-INSANE_SKIP_libatomic += "ldflags"
-INSANE_SKIP_libasan += "ldflags"
-INSANE_SKIP_libubsan += "ldflags"
-INSANE_SKIP_libssp += "ldflags"
-INSANE_SKIP_libgomp += "ldflags"
-INSANE_SKIP_libitm += "ldflags"
-INSANE_SKIP_gdbserver += "ldflags"
-
-# OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
-RPROVIDES_${PN} = "glibc"
-# Add runtime provides for the other libc* packages as well
-RPROVIDES_${PN}-dev = "glibc-dev"
 RPROVIDES_${PN}-staticdev = "glibc-staticdev"
-RPROVIDES_${PN}-doc = "glibc-doc"
-RPROVIDES_${PN}-dbg = "glibc-dbg"
-RPROVIDES_${PN}-pic = "glibc-pic"
-RPROVIDES_${PN}-utils = "glibc-utils"
-RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
-
-PKG_${PN} = "glibc"
-PKG_${PN}-dev = "glibc-dev"
-PKG_${PN}-doc = "glibc-doc"
-PKG_${PN}-dbg = "glibc-dbg"
-PKG_${PN}-pic = "glibc-pic"
-PKG_${PN}-utils = "glibc-utils"
-PKG_${PN}-mtrace = "glibc-mtrace"
-PKG_${PN}-gconv = "glibc-gconv"
-PKG_${PN}-extra-nss = "glibc-extra-nss"
-PKG_${PN}-thread-db = "glibc-thread-db"
-PKG_${PN}-pcprofile = "glibc-pcprofile"
-PKG_${PN}-staticdev = "glibc-staticdev"
-
-PKGV_${PN} = "${EAT_VER_LIBC}"
-PKGV_${PN}-dev = "${EAT_VER_LIBC}"
-PKGV_${PN}-doc = "${EAT_VER_LIBC}"
-PKGV_${PN}-dbg = "${EAT_VER_LIBC}"
-PKGV_${PN}-pic = "${EAT_VER_LIBC}"
-PKGV_${PN}-utils = "${EAT_VER_LIBC}"
-PKGV_${PN}-mtrace = "${EAT_VER_LIBC}"
-PKGV_${PN}-gconv = "${EAT_VER_LIBC}"
-PKGV_${PN}-extra-nss = "${EAT_VER_LIBC}"
-PKGV_${PN}-thread-db = "${EAT_VER_LIBC}"
-PKGV_${PN}-pcprofile = "${EAT_VER_LIBC}"
-PKGV_${PN}-staticdev = "${EAT_VER_LIBC}"
-PKGV_catchsegv = "${EAT_VER_LIBC}"
-PKGV_glibc-extra-nss = "${EAT_VER_LIBC}"
-PKGV_glibc-thread-db = "${EAT_VER_LIBC}"
-
-PKGV_libmemusage = "${EAT_VER_LIBC}"
-PKGV_libsegfault = "${EAT_VER_LIBC}"
-PKGV_libsotruss = "${EAT_VER_LIBC}"
-PKGV_sln = "${EAT_VER_LIBC}"
-PKGV_nscd = "${EAT_VER_LIBC}"
-PKGV_ldd = "${EAT_VER_LIBC}"
-
-PKGV_libasan-dev = "${EAT_VER_GCC}"
-PKGV_libasan = "${EAT_VER_GCC}"
-PKGV_libasan-staticdev = "${EAT_VER_GCC}"
-PKGV_libatomic-dev = "${EAT_VER_GCC}"
-PKGV_libatomic = "${EAT_VER_GCC}"
-PKGV_libatomic-staticdev = "${EAT_VER_GCC}"
-PKGV_libg2c-dev = "${EAT_VER_GCC}"
-PKGV_libg2c = "${EAT_VER_GCC}"
-PKGV_libgcc-dev = "${EAT_VER_GCC}"
-PKGV_libgcc = "${EAT_VER_GCC}"
-PKGV_libgfortran-dev = "${EAT_VER_GCC}"
-PKGV_libgfortran = "${EAT_VER_GCC}"
-PKGV_libgfortran-staticdev = "${EAT_VER_GCC}"
-PKGV_libgomp-dev = "${EAT_VER_GCC}"
-PKGV_libgomp = "${EAT_VER_GCC}"
-PKGV_libgomp-staticdev = "${EAT_VER_GCC}"
-PKGV_libitm-dev = "${EAT_VER_GCC}"
-PKGV_libitm = "${EAT_VER_GCC}"
-PKGV_libitm-staticdev = "${EAT_VER_GCC}"
-PKGV_liblsan-dev = "${EAT_VER_GCC}"
-PKGV_liblsan = "${EAT_VER_GCC}"
-PKGV_liblsan-staticdev = "${EAT_VER_GCC}"
-PKGV_libmudflap-dev = "${EAT_VER_GCC}"
-PKGV_libmudflap = "${EAT_VER_GCC}"
-PKGV_libmudflap-staticdev = "${EAT_VER_GCC}"
-PKGV_libquadmath-dev = "${EAT_VER_GCC}"
-PKGV_libquadmath = "${EAT_VER_GCC}"
-PKGV_libquadmath-staticdev = "${EAT_VER_GCC}"
-PKGV_libssp-dev = "${EAT_VER_GCC}"
-PKGV_libssp = "${EAT_VER_GCC}"
-PKGV_libssp-staticdev = "${EAT_VER_GCC}"
-PKGV_libstdc++-dbg = "${EAT_VER_GCC}"
-PKGV_libstdc++-dev = "${EAT_VER_GCC}"
-PKGV_libstdc++ = "${EAT_VER_GCC}"
-PKGV_libstdc++-precompile-dev = "${EAT_VER_GCC}"
-PKGV_libstdc++-staticdev = "${EAT_VER_GCC}"
-PKGV_libtsan-dev = "${EAT_VER_GCC}"
-PKGV_libtsan = "${EAT_VER_GCC}"
-PKGV_libtsan-staticdev = "${EAT_VER_GCC}"
-PKGV_libubsan-dev = "${EAT_VER_GCC}"
-PKGV_libubsan = "${EAT_VER_GCC}"
-PKGV_libubsan-staticdev = "${EAT_VER_GCC}"
-
-PKGV_linux-libc-headers-dev = "${EAT_VER_KERNEL}"
-PKGV_linux-libc-headers = "${EAT_VER_KERNEL}"
-
-PKGV_gdbserver = "${EAT_VER_GDBSERVER}"
-
-ALLOW_EMPTY_${PN}-mtrace = "1"
-FILES_${PN}-mtrace = "${bindir}/mtrace"
-
-FILES_libgcov-dev = "${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
-
-FILES_libsegfault = "${base_libdir}/libSegFault*"
-
-FILES_catchsegv = "${bindir}/catchsegv"
-RDEPENDS_catchsegv = "libsegfault"
-
-FILES_libquadmath = "${libdir}/libquadmath*.so.*"
-SUMMARY_libquadmath = "GNU quad-precision math library"
-FILES_libquadmath-dev = "\
-    ${base_libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-    ${base_libdir}/libquadmath*.so \
-    ${base_libdir}/libquadmath.la \
-"
-SUMMARY_libquadmath-dev = "GNU quad-precision math library - development files"
-FILES_libquadmath-staticdev = "${base_libdir}/libquadmath.a"
-SUMMARY_libquadmath-staticdev = "GNU quad-precision math library - static development files"
-
-FILES_libatomic = "${base_libdir}/libatomic.so.*"
-FILES_libatomic-dev = "\
-    ${base_libdir}/libatomic.so \
-    ${base_libdir}/libatomic.la \
-"
-FILES_libatomic-staticdev = "${base_libdir}/libatomic.a"
-
-FILES_libasan = "${base_libdir}/libasan.so.*"
-FILES_libasan-dev = "\
-    ${base_libdir}/libasan.so \
-    ${base_libdir}/libasan.la \
-    ${base_libdir}/libsanitizer.spec \
-"
-FILES_libasan-staticdev = "${base_libdir}/libasan.a"
-
-FILES_libubsan = "${base_libdir}/libubsan.so.*"
-FILES_libubsan-dev = "\
-    ${base_libdir}/libubsan.so \
-    ${base_libdir}/libubsan.la \
-"
-FILES_libubsan-staticdev = "${base_libdir}/libubsan.a"
-
-FILES_liblsan = "${base_libdir}/liblsan.so.*"
-FILES_liblsan-dev = "\
-    ${base_libdir}/liblsan.so \
-    ${base_libdir}/liblsan.la \
-"
-FILES_libtsan-staticdev = "${base_libdir}/libtsan.a"
-
-FILES_libtsan = "${base_libdir}/libtsan.so.*"
-FILES_libtsan-dev = "\
-    ${base_libdir}/libtsan.so \
-    ${base_libdir}/libtsan.la \
-"
-FILES_libtsan-staticdev = "${base_libdir}/libtsan.a"
 
 FILES_libgcc = " \
     ${base_libdir}/libgcc_s.so.1 \
     ${base_libdir}/libgcc_s.so \
 "
-FILES_libgcc-dev = "${libdir}/libgcc_s.so"
 
 FILES_linux-libc-headers = ""
 FILES_linux-libc-headers-dev = "\
@@ -465,55 +185,6 @@ FILES_linux-libc-headers-dev = "\
 	${includedir}/sound \
 	${includedir}/video \
 "
-FILES_${PN} += "\
-	${libdir}/bin \
-	${libdir}/locale \
-	${libdir}/gconv/gconv-modules \
-	${datadir}/zoneinfo \
-	${base_libdir}/libcrypt*.so.* \
-	${base_libdir}/libcrypt-*.so \
-	${base_libdir}/libc.so.* \
-	${base_libdir}/libc-*.so \
-	${base_libdir}/libm.so.* \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libm-*.so \
-	${base_libdir}/ld*.so.* \
-	${base_libdir}/ld-*.so \
-	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread*.so \
-	${base_libdir}/libpthread-*.so \
-	${base_libdir}/libresolv*.so.* \
-	${base_libdir}/libresolv-*.so \
-	${base_libdir}/librt*.so.* \
-	${base_libdir}/librt-*.so \
-	${base_libdir}/libutil*.so.* \
-	${base_libdir}/libutil-*.so \
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
-	${base_libdir}/libthread_db*.so.* \
-	${base_libdir}/libthread_db-*.so \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libSegFault.so \
-	${base_libdir}/libpcprofile.so \
-    "
-
-FILES_${PN}-dbg += "${base_libdir}/debug"
 
 FILES_libstdc++ = "${base_libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
@@ -527,61 +198,3 @@ FILES_libstdc++-staticdev = "\
   ${base_libdir}/libsupc++.a"
 FILES_libstdc++-dbg = "\
   ${base_libdir}/debug/libstdc++.*"
-
-FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
-
-FILES_libssp = "${base_libdir}/libssp.so.*"
-FILES_libssp-dev = " \
-  ${base_libdir}/libssp*.so \
-  ${base_libdir}/libssp*_nonshared.a \
-  ${base_libdir}/libssp*.la \
-  ${base_libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
-FILES_libssp-staticdev = " \
-  ${base_libdir}/libssp*.a"
-
-FILES_libgfortran = "${base_libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
-  ${base_libdir}/libgfortran.so \
-  ${base_libdir}/libgfortran.spec"
-FILES_libgfortran-staticdev = " \
-  ${base_libdir}/libgfortran.a \
-  ${base_libdir}/libgfortranbegin.a"
-
-FILES_libmudflap = "${base_libdir}/libmudflap*.so.*"
-FILES_libmudflap-dev = "\
-  ${base_libdir}/libmudflap*.so \
-  ${base_libdir}/libmudflap*.a \
-  ${base_libdir}/libmudflap*.la"
-
-FILES_libitm = "${base_libdir}/libitm*${SOLIBS}"
-FILES_libitm-dev = "\
-  ${base_libdir}/libitm*${SOLIBSDEV} \
-  ${base_libdir}/libitm*.la \
-  ${base_libdir}/libitm.spec \
-  "
-FILES_libitm-staticdev = "\
-  ${base_libdir}/libitm*.a \
-  "
-
-FILES_libgomp = "${base_libdir}/libgomp*${SOLIBS}"
-FILES_libgomp-dev = "\
-  ${base_libdir}/libgomp*${SOLIBSDEV} \
-  ${base_libdir}/libgomp*.la \
-  ${base_libdir}/libgomp.spec \
-  ${base_libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-  "
-FILES_libgomp-staticdev = "\
-  ${base_libdir}/libgomp*.a \
-  "
-EAT_VER_MAIN ??= ""
-
-
-python () {
-    if not d.getVar("EAT_VER_MAIN", False):
-        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
-    import re
-    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
-    if notglibc:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
-}
-- 
2.7.4


