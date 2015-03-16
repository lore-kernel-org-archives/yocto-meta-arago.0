Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 1481F52099
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:38 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB007SPU6WMC70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=mDV3o1hIAAAA:8	a=6HjTBeQkAAAA:8 a=20KFwNOVAAAA:8
	a=FP58Ms26AAAA:8 a=3EnDGpFKAAAA:8	a=pGLkceISAAAA:8 a=6ohNodAXAAAA:8
	a=HhXPX4ryAAAA:8 a=QyXUC8HyAAAA:8	a=Vt2AcnKqAAAA:8 a=t7CeM3EgAAAA:8
	a=lzDhS8hmAAAA:8 a=iRxMQ_xzAAAA:8	a=QNLkpTEpAAAA:8 a=BCNR7KVqAAAA:8
	a=KKAkSRfTAAAA:8 a=lvqPFcUxqY3cpf4EeH8A:9	a=2sGDb5btA0BKiOsJ:21
	a=QxxzsKxMy6Agb3Ga:21 a=OaKnbhs_AuCGYEDJ:21	a=Sf_gFPzhefAA:10
	a=SCHdjdPuDoEA:10 a=i8ZbNWNg3c0A:10 a=q2ggEDntsuoA:10	a=AhTckCcozD0A:10
	a=OIzWo4VNxpQA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 52D5620190;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:51:58 -0400
Message-id: <1426546322-25230-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426546322-25230-1-git-send-email-denis@denix.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
X-Mailman-Approved-At: Mon, 16 Mar 2015 22:55:59 +0000
Subject: [PATCH 3/7] gcc: overlay old 4.7 versions of core and linaro gcc recipes
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to match gcc from the Linaro toolchain we use (2013.03), when it's built
from sources, while runtime is used prebuilt from the toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc |  146 +
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 +
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +
 .../gcc/gcc-4.7/100-uclibc-conf.patch              |   39 +
 .../gcc/gcc-4.7/200-uclibc-locale.patch            | 2810 ++++++++++++++++++++
 .../gcc/gcc-4.7/203-uclibc-locale-no__x.patch      |  235 ++
 .../gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch  |   54 +
 .../gcc/gcc-4.7/205-uclibc-locale-update.patch     |  521 ++++
 .../gcc/gcc-4.7/301-missing-execinfo_h.patch       |   15 +
 .../gcc/gcc-4.7/302-c99-snprintf.patch             |   15 +
 .../gcc/gcc-4.7/303-c99-complex-ugly-hack.patch    |   16 +
 .../gcc/gcc-4.7/304-index_macro.patch              |   30 +
 .../gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch  |   51 +
 .../gcc/gcc-4.7/306-libstdc++-namespace.patch      |   40 +
 .../recipes-devtools/gcc/gcc-4.7/64bithack.patch   |   63 +
 .../gcc/gcc-4.7/740-sh-pr24836.patch               |   31 +
 .../gcc/gcc-4.7/800-arm-bigendian.patch            |   36 +
 .../gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch          |   25 +
 .../gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch         |  165 ++
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 +
 .../gcc/gcc-4.7/avoid-oob-array-access.patch       |   45 +
 .../gcc/gcc-4.7/cpp-honor-sysroot.patch            |   40 +
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +
 .../gcc/gcc-4.7/disable-texinfo-5.patch            |  107 +
 .../gcc/gcc-4.7/disable_relax_pic_calls_flag.patch |   48 +
 .../recipes-devtools/gcc/gcc-4.7/disablesdt.patch  |   32 +
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |  428 +++
 .../gcc/gcc-4.7/fortran-cross-compile-hack.patch   |   32 +
 .../gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 +
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 +
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 +
 .../gcc/gcc-4.7/gcc-poison-dir-extend.patch        |   27 +
 .../gcc-4.7/gcc-poison-system-directories.patch    |  223 ++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 +
 .../gcc/gcc-4.7/libgcc-sjlj-check.patch            |   61 +
 .../recipes-devtools/gcc/gcc-4.7/libtool.patch     |   29 +
 .../gcc/gcc-4.7/mips64-default-n64.patch           |   19 +
 .../gcc/gcc-4.7/optional_libstdc.patch             |   86 +
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72 +
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++
 .../gcc/gcc-4.7/ppce5500-e6500-support.patch       |  713 +++++
 .../recipes-devtools/gcc/gcc-4.7/pr32219.patch     |   72 +
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 +
 .../gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch |   77 +
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |   87 +
 .../gcc/gcc-4.7/wcast-qual-PR55383.patch           |   43 +
 .../recipes-devtools/gcc/gcc-common.inc            |  124 +
 .../recipes-devtools/gcc/gcc-configure-common.inc  |  133 +
 .../recipes-devtools/gcc/gcc-linaro-4.7.inc        |   22 +
 .../gcc/gcc-linaro-4.7/64bithack.patch             |   27 +
 .../gcc/gcc-linaro-4.7/fix-g++-sysroot.patch       |   78 +
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   33 +
 .../gcc/gcc-linaro-4.7/optional_libstdc.patch      |   86 +
 .../use-defaults.h-and-t-oe-in-B.patch             |   80 +
 .../recipes-devtools/gcc/gcc-linaro-common-4.7.inc |    2 +
 .../recipes-devtools/gcc/gcc-multilib-config.inc   |  191 ++
 .../recipes-devtools/gcc/gcc-target.inc            |  154 ++
 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb  |    2 +
 .../recipes-devtools/gcc/gcc_linaro-4.7.bb         |    4 +
 60 files changed, 8949 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-target.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb

diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc
new file mode 100644
index 0000000..c201f49
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc
@@ -0,0 +1,146 @@
+require gcc-common.inc
+
+PR = "r20"
+
+# Third digit in PV should be incremented after a minor release
+# happens from this branch on gcc e.g. currently its 4.7.1
+# when 4.7.2 is releases and we bump SRCREV beyond the release
+# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
+# to reflect that change
+
+PV = "4.7.2"
+
+# BINV should be incremented after updating to a revision
+# after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
+# the value will be minor-release+1 e.g. if current minor release was
+# 4.7.1 then the value below will have 2 which will mean 4.7.2
+# which will be next minor release and so on.
+
+BINV = "4.7.2"
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
+
+DEPENDS =+ "mpfr gmp libmpc zlib"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
+
+LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                   file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
+
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+	   file://100-uclibc-conf.patch \
+           file://gcc-uclibc-locale-ctype_touplow_t.patch \
+           file://200-uclibc-locale.patch  \
+           file://203-uclibc-locale-no__x.patch; \
+           file://204-uclibc-locale-wchar_fix.patch; \
+           file://205-uclibc-locale-update.patch; \
+           file://301-missing-execinfo_h.patch  \
+           file://302-c99-snprintf.patch  \
+           file://303-c99-complex-ugly-hack.patch  \
+           file://304-index_macro.patch  \
+           file://305-libmudflap-susv3-legacy.patch  \
+           file://306-libstdc++-namespace.patch  \
+           file://740-sh-pr24836.patch  \
+           file://800-arm-bigendian.patch  \
+           file://gcc-poison-system-directories.patch \
+           file://gcc-poison-dir-extend.patch \
+           file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+	   file://64bithack.patch \
+	   file://optional_libstdc.patch \
+	   file://disable_relax_pic_calls_flag.patch \
+	   file://COLLECT_GCC_OPTIONS.patch \
+           file://use-defaults.h-and-t-oe-in-B.patch \
+	   file://ppc_with_cpu.patch \
+	   file://ppce5500-e6500-support.patch \
+	   file://rs6000-tables.patch \
+	   file://define_insn_reservation.patch \
+	   file://pr32219.patch \
+	   file://fortran-cross-compile-hack.patch \
+	   file://libgcc-sjlj-check.patch \
+	   file://cpp-honor-sysroot.patch \
+	   file://mips64-default-n64.patch \
+	   file://GLIBC_DYNAMIC_LINKER.patch \
+	   file://arm-hard-float-loader.patch \
+	   file://gcc-argument-list-too-long.patch \
+	   file://fix-g++-sysroot.patch \
+	   file://disablesdt.patch \
+	   file://libtool.patch \
+	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
+	   file://ppc_no_crtsavres.patch \
+	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
+	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
+	   file://use-ml-conf-files-from-B.patch \
+	   file://wcast-qual-PR55383.patch \
+	   file://disable-texinfo-5.patch \
+	   file://avoid-oob-array-access.patch \
+	  "
+SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
+SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# Language Overrides
+FORTRAN = ""
+JAVA = ""
+
+EXTRA_OECONF_BASE = " --enable-lto \
+			--enable-libssp \
+			--disable-bootstrap \
+			--disable-libmudflap \
+			--with-system-zlib \
+			--with-linker-hash-style=${LINKER_HASH_STYLE} \
+			--enable-linker-build-id \
+			--with-ppl=no \
+			--with-cloog=no \
+			--enable-checking=release \
+			--enable-cheaders=c_global \
+			MAKEINFO=missing "
+
+EXTRA_OECONF_INITIAL = "--disable-libmudflap \
+			--disable-libgomp \
+			--disable-libssp \
+			--disable-libquadmath \
+			--with-system-zlib \
+			--disable-lto \
+			--disable-plugin \
+			--enable-decimal-float=no"
+
+EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
+				--disable-libgomp \
+				--disable-libquadmath \
+				--with-system-zlib \
+				--disable-lto \
+				--disable-plugin \
+				--disable-libssp"
+
+EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
+
+EXTRA_OECONF_PATHS = " \ 
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
+                      --with-sysroot=${STAGING_DIR_TARGET} \ 
+                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+do_configure_prepend () {
+        # teach gcc to find correct target includedir when checking libc ssp support
+        mkdir -p ${B}/gcc
+        echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
+        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
+        cat >>${B}/gcc/defaults.h.new <<_EOF
+#ifndef STANDARD_STARTFILE_PREFIX_1
+#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
+#endif
+#ifndef STANDARD_STARTFILE_PREFIX_2
+#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
+#endif
+#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
+#endif /* ! GCC_DEFAULTS_H */
+_EOF
+        mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
+}
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
new file mode 100644
index 0000000..b6f8f94
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
@@ -0,0 +1,93 @@
+From b78f422ee83d279a83c62491b252cfec5b94e92a Mon Sep 17 00:00:00 2001
+From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Aug 2012 08:36:23 +0000
+Subject: [PATCH] 	* Makefile.in (vis_hide, gen-hide-list): Do not make
+ definitions 	depend on --enable-shared. 
+ ($(lib1asmfuncs-o)): Use %.vis files independent of 
+ --enable-shared. 	* static-object.mk
+ ($(base)$(objext), $(base).vis) 
+ ($(base)_s$(objext)): Use same rules for visibility
+ handling as in 	shared-object.mk.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@190588 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ libgcc/ChangeLog        |   10 ++++++++++
+ libgcc/Makefile.in      |   16 ++++------------
+ libgcc/static-object.mk |   10 ++++++++--
+ 3 files changed, 22 insertions(+), 14 deletions(-)
+
+Upstream-Status: Backport
+
+-Khem 
+05-Sep-2012
+
+Index: gcc-4_7-branch/libgcc/Makefile.in
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/Makefile.in	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/Makefile.in	2012-09-05 17:30:28.572998745 -0700
+@@ -362,6 +362,7 @@
+   ifneq ($(LIBUNWIND),)
+     install-libunwind = install-libunwind
+   endif
++endif
+ 
+ # For -fvisibility=hidden.  We need both a -fvisibility=hidden on
+ # the command line, and a #define to prevent libgcc2.h etc from
+@@ -385,11 +386,8 @@
+ gen-hide-list = echo > $@
+ endif
+ 
+-else
+-# Not enable_shared.
++ifneq ($(enable_shared),yes)
+ iterator = $(srcdir)/empty.mk $(patsubst %,$(srcdir)/static-object.mk,$(iter-items))
+-vis_hide =
+-gen-hide-list = echo > \$@
+ endif
+ 
+ LIB2ADD += enable-execute-stack.c
+@@ -438,7 +436,6 @@
+ 		       $(LIB2_DIVMOD_FUNCS))
+ 
+ # Build "libgcc1" (assembly) components.
+-ifeq ($(enable_shared),yes)
+ 
+ lib1asmfuncs-o = $(patsubst %,%$(objext),$(LIB1ASMFUNCS))
+ $(lib1asmfuncs-o): %$(objext): $(srcdir)/config/$(LIB1ASMSRC) %.vis
+@@ -450,14 +447,9 @@
+ lib1asmfuncs-s-o = $(patsubst %,%_s$(objext),$(LIB1ASMFUNCS))
+ $(lib1asmfuncs-s-o): %_s$(objext): $(srcdir)/config/$(LIB1ASMSRC)
+ 	$(gcc_s_compile) -DL$* -xassembler-with-cpp -c $<
+-libgcc-s-objects += $(lib1asmfuncs-s-o)
+-
+-else
++ifeq ($(enable_shared),yes)
+ 
+-lib1asmfuncs-o = $(patsubst %,%$(objext),$(LIB1ASMFUNCS))
+-$(lib1asmfuncs-o): %$(objext): $(srcdir)/config/$(LIB1ASMSRC)
+-	$(gcc_compile) -DL$* -xassembler-with-cpp -c $<
+-libgcc-objects += $(lib1asmfuncs-o)
++libgcc-s-objects += $(lib1asmfuncs-s-o)
+ 
+ endif
+ 
+Index: gcc-4_7-branch/libgcc/static-object.mk
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/static-object.mk	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/static-object.mk	2012-09-05 17:30:28.572998745 -0700
+@@ -24,7 +24,13 @@
+ endif
+ endif
+ 
+-$(base)$(objext): $o
+-	$(gcc_compile) -c -xassembler-with-cpp $<
++$(base)$(objext): $o $(base).vis
++	$(gcc_compile) -c -xassembler-with-cpp -include $*.vis $<
++
++$(base).vis: $(base)_s$(objext)
++	$(gen-hide-list)
++
++$(base)_s$(objext): $o
++	$(gcc_s_compile) -c -xassembler-with-cpp $<
+ 
+ endif
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
new file mode 100644
index 0000000..15034f7
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
@@ -0,0 +1,49 @@
+From 935475158f45b9c55a54647543c0402b4b3043ae Mon Sep 17 00:00:00 2001
+From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sun, 19 Aug 2012 15:11:40 +0000
+Subject: [PATCH] 	* crtstuff.c (USE_PT_GNU_EH_FRAME): Define for
+ systems using glibc 	even if inhibit_libc.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@190517 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ libgcc/ChangeLog  |    5 +++++
+ libgcc/crtstuff.c |   16 +++++++++++++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport
+
+-Khem 05-Sep-2012
+Index: gcc-4_7-branch/libgcc/crtstuff.c
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/crtstuff.c	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/crtstuff.c	2012-09-05 17:28:49.248994968 -0700
+@@ -1,7 +1,7 @@
+ /* Specialized bits of code needed to support construction and
+    destruction of file-scope objects in C++ code.
+    Copyright (C) 1991, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+-   2002, 2003, 2004, 2005, 2006, 2007, 2009, 2010, 2011
++   2002, 2003, 2004, 2005, 2006, 2007, 2009, 2010, 2011, 2012
+    Free Software Foundation, Inc.
+    Contributed by Ron Guilmette (rfg@monkeys.com).
+ 
+@@ -113,6 +113,20 @@
+ #  define USE_PT_GNU_EH_FRAME
+ # endif
+ #endif
++
++#if defined(OBJECT_FORMAT_ELF) \
++    && !defined(OBJECT_FORMAT_FLAT) \
++    && defined(HAVE_LD_EH_FRAME_HDR) \
++    && !defined(CRTSTUFFT_O) \
++    && defined(inhibit_libc) \
++    && (defined(__GLIBC__) || defined(__gnu_linux__) || defined(__GNU__))
++/* On systems using glibc, an inhibit_libc build of libgcc is only
++   part of a bootstrap process.  Build the same crt*.o as would be
++   built with headers present, so that it is not necessary to build
++   glibc more than once for the bootstrap to converge.  */
++# define USE_PT_GNU_EH_FRAME
++#endif
++
+ #if defined(EH_FRAME_SECTION_NAME) && !defined(USE_PT_GNU_EH_FRAME)
+ # define USE_EH_FRAME_REGISTRY
+ #endif
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch
new file mode 100644
index 0000000..b2981e0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/contrib/regression/objs-gcc.sh
+===================================================================
+--- gcc-4.6.0.orig/contrib/regression/objs-gcc.sh
++++ gcc-4.6.0/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+Index: gcc-4.6.0/libjava/classpath/ltconfig
+===================================================================
+--- gcc-4.6.0.orig/libjava/classpath/ltconfig
++++ gcc-4.6.0/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | linux
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch
new file mode 100644
index 0000000..df22c54
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch
@@ -0,0 +1,2810 @@
+Upstream-Status: Pending
+
+Index: gcc-4_7-branch/libstdc++-v3/acinclude.m4
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/acinclude.m4	2012-04-10 10:19:50.395337128 -0700
++++ gcc-4_7-branch/libstdc++-v3/acinclude.m4	2012-04-10 10:30:37.327368356 -0700
+@@ -1924,6 +1924,9 @@
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -2085,6 +2088,40 @@
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      AC_MSG_RESULT(uclibc)
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++      AC_SUBST(glibcxx_MOFILES)
++      AC_SUBST(glibcxx_POFILES)
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c++locale_internal.h	2012-04-10 10:30:37.327368356 -0700
+@@ -0,0 +1,63 @@
++// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ -*-
++
++// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++// Written by Jakub Jelinek <jakub@redhat.com>
++
++#include <bits/c++config.h>
++#include <clocale>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning clean this up
++#endif
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++
++extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
++extern "C" __typeof(strcoll_l) __strcoll_l;
++extern "C" __typeof(strftime_l) __strftime_l;
++extern "C" __typeof(strtod_l) __strtod_l;
++extern "C" __typeof(strtof_l) __strtof_l;
++extern "C" __typeof(strtold_l) __strtold_l;
++extern "C" __typeof(strxfrm_l) __strxfrm_l;
++extern "C" __typeof(newlocale) __newlocale;
++extern "C" __typeof(freelocale) __freelocale;
++extern "C" __typeof(duplocale) __duplocale;
++extern "C" __typeof(uselocale) __uselocale;
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++extern "C" __typeof(iswctype_l) __iswctype_l;
++extern "C" __typeof(towlower_l) __towlower_l;
++extern "C" __typeof(towupper_l) __towupper_l;
++extern "C" __typeof(wcscoll_l) __wcscoll_l;
++extern "C" __typeof(wcsftime_l) __wcsftime_l;
++extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
++extern "C" __typeof(wctype_l) __wctype_l;
++#endif
++
++#endif // GLIBC 2.3 and later
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.cc	2012-04-10 10:30:37.327368356 -0700
+@@ -0,0 +1,160 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <cerrno>  // For errno
++#include <locale>
++#include <stdexcept>
++#include <langinfo.h>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
++#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
++#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
++#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
++#define __strtof_l(S, E, L)         strtof((S), (E))
++#define __strtod_l(S, E, L)         strtod((S), (E))
++#define __strtold_l(S, E, L)        strtold((S), (E))
++#warning should dummy __newlocale check for C|POSIX ?
++#define __newlocale(a, b, c)        NULL
++#define __freelocale(a)             ((void)0)
++#define __duplocale(a)              __c_locale()
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  float __f = __strtof_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __f;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  double __d = __strtod_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __d;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __ld;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  void
++  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* __s,
++				    __c_locale __old)
++  {
++    __cloc = __newlocale(1 << LC_ALL, __s, __old);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    if (!__cloc)
++      {
++	// This named locale is not supported by the underlying OS.
++	__throw_runtime_error(__N("locale::facet::_S_create_c_locale "
++			      "name not valid"));
++      }
++#endif
++  }
++
++  void
++  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
++  {
++    if (_S_get_c_locale() != __cloc)
++      __freelocale(__cloc);
++  }
++
++  __c_locale
++  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
++  { return __duplocale(__cloc); }
++} // namespace std
++
++namespace __gnu_cxx
++{
++  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
++    {
++      "LC_CTYPE",
++      "LC_NUMERIC",
++      "LC_TIME",
++      "LC_COLLATE",
++      "LC_MONETARY",
++      "LC_MESSAGES",
++#if _GLIBCXX_NUM_CATEGORIES != 0
++      "LC_PAPER",
++      "LC_NAME",
++      "LC_ADDRESS",
++      "LC_TELEPHONE",
++      "LC_MEASUREMENT",
++      "LC_IDENTIFICATION"
++#endif
++    };
++}
++
++namespace std
++{
++  const char* const* const locale::_S_categories = __gnu_cxx::category_names;
++}  // namespace std
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.h	2012-04-10 10:30:37.327368356 -0700
+@@ -0,0 +1,117 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifndef _C_LOCALE_H
++#define _C_LOCALE_H 1
++
++#pragma GCC system_header
++
++#include <cstring>              // get std::strlen
++#include <cstdio>               // get std::snprintf or std::sprintf
++#include <clocale>
++#include <langinfo.h>		// For codecvt
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this
++#endif
++#ifdef __UCLIBC_HAS_LOCALE__
++#include <iconv.h>		// For codecvt using iconv, iconv_t
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#include <libintl.h> 		// For messages
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning what is _GLIBCXX_C_LOCALE_GNU for
++#endif
++#define _GLIBCXX_C_LOCALE_GNU 1
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix categories
++#endif
++// #define _GLIBCXX_NUM_CATEGORIES 6
++#define _GLIBCXX_NUM_CATEGORIES 0
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++namespace __gnu_cxx
++{
++  extern "C" __typeof(uselocale) __uselocale;
++}
++#endif
++
++namespace std
++{
++#ifdef __UCLIBC_HAS_XLOCALE__
++  typedef __locale_t		__c_locale;
++#else
++  typedef int*			__c_locale;
++#endif
++
++  // Convert numeric value of type _Tv to string and return length of
++  // string.  If snprintf is available use it, otherwise fall back to
++  // the unsafe sprintf which, in general, can be dangerous and should
++  // be avoided.
++  template<typename _Tv>
++    int
++    __convert_from_v(char* __out,
++		     const int __size __attribute__ ((__unused__)),
++		     const char* __fmt,
++#ifdef __UCLIBC_HAS_XCLOCALE__
++		     _Tv __v, const __c_locale& __cloc, int __prec)
++    {
++      __c_locale __old = __gnu_cxx::__uselocale(__cloc);
++#else
++		     _Tv __v, const __c_locale&, int __prec)
++    {
++# ifdef __UCLIBC_HAS_LOCALE__
++      char* __old = std::setlocale(LC_ALL, NULL);
++      char* __sav = new char[std::strlen(__old) + 1];
++      std::strcpy(__sav, __old);
++      std::setlocale(LC_ALL, "C");
++# endif
++#endif
++
++      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++
++#ifdef __UCLIBC_HAS_XCLOCALE__
++      __gnu_cxx::__uselocale(__old);
++#elif defined __UCLIBC_HAS_LOCALE__
++      std::setlocale(LC_ALL, __sav);
++      delete [] __sav;
++#endif
++      return __ret;
++    }
++}
++
++#endif
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/codecvt_members.cc	2012-04-10 10:30:37.327368356 -0700
+@@ -0,0 +1,308 @@
++// std::codecvt implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.5 - Template class codecvt
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <cstdlib>  // For MB_CUR_MAX
++#include <climits>  // For MB_LEN_MAX
++#include <bits/c++locale_internal.h>
++
++namespace std
++{
++  // Specializations.
++#ifdef _GLIBCXX_USE_WCHAR_T
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_out(state_type& __state, const intern_type* __from,
++	 const intern_type* __from_end, const intern_type*& __from_next,
++	 extern_type* __to, extern_type* __to_end,
++	 extern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // wcsnrtombs is *very* fast but stops if encounters NUL characters:
++    // in case we fall back to wcrtomb and then continue, in a loop.
++    // NB: wcsnrtombs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const intern_type* __from_chunk_end = wmemchr(__from_next, L'\0',
++						      __from_end - __from_next);
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	const size_t __conv = wcsnrtombs(__to_next, &__from_next,
++					 __from_chunk_end - __from_next,
++					 __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // wcrtomb.
++	    for (; __from < __from_next; ++__from)
++	      __to_next += wcrtomb(__to_next, *__from, &__tmp_state);
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    extern_type __buf[MB_LEN_MAX];
++	    __tmp_state = __state;
++	    const size_t __conv = wcrtomb(__buf, *__from_next, &__tmp_state);
++	    if (__conv > static_cast<size_t>(__to_end - __to_next))
++	      __ret = partial;
++	    else
++	      {
++		memcpy(__to_next, __buf, __conv);
++		__state = __tmp_state;
++		__to_next += __conv;
++		++__from_next;
++	      }
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_in(state_type& __state, const extern_type* __from,
++	const extern_type* __from_end, const extern_type*& __from_next,
++	intern_type* __to, intern_type* __to_end,
++	intern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we store a L'\0' and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from_next, '\0',
++								  __from_end
++								  - __from_next));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	size_t __conv = mbsnrtowcs(__to_next, &__from_next,
++				   __from_chunk_end - __from_next,
++				   __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (;; ++__to_next, __from += __conv)
++	      {
++		__conv = mbrtowc(__to_next, __from, __from_end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __from_next = __from;
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    // It is unclear what to return in this case (see DR 382).
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    if (__to_next < __to_end)
++	      {
++		// XXX Probably wrong for stateful encodings
++		__tmp_state = __state;
++		++__from_next;
++		*__to_next++ = L'\0';
++	      }
++	    else
++	      __ret = partial;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_encoding() const throw()
++  {
++    // XXX This implementation assumes that the encoding is
++    // stateless and is either single-byte or variable-width.
++    int __ret = 0;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    if (MB_CUR_MAX == 1)
++      __ret = 1;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_max_length() const throw()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    // XXX Probably wrong for stateful encodings.
++    int __ret = MB_CUR_MAX;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_length(state_type& __state, const extern_type* __from,
++	    const extern_type* __end, size_t __max) const
++  {
++    int __ret = 0;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we advance past it and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++
++    // A dummy internal buffer is needed in order for mbsnrtocws to consider
++    // its fourth parameter (it wouldn't with NULL as first parameter).
++    wchar_t* __to = static_cast<wchar_t*>(__builtin_alloca(sizeof(wchar_t)
++							   * __max));
++    while (__from < __end && __max)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from, '\0',
++								  __end
++								  - __from));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __end;
++
++	const extern_type* __tmp_from = __from;
++	size_t __conv = mbsnrtowcs(__to, &__from,
++				   __from_chunk_end - __from,
++				   __max, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (__from = __tmp_from;; __from += __conv)
++	      {
++		__conv = mbrtowc(NULL, __from, __end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __state = __tmp_state;
++	    __ret += __from - __tmp_from;
++	    break;
++	  }
++	if (!__from)
++	  __from = __from_chunk_end;
++
++	__ret += __from - __tmp_from;
++	__max -= __conv;
++
++	if (__from < __end && __max)
++	  {
++	    // XXX Probably wrong for stateful encodings
++	    __tmp_state = __state;
++	    ++__from;
++	    ++__ret;
++	    --__max;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++#endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/collate_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/collate_members.cc	2012-04-10 10:30:37.327368356 -0700
+@@ -0,0 +1,80 @@
++// std::collate implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#endif
++
++namespace std
++{
++  // These are basically extensions to char_traits, and perhaps should
++  // be put there instead of here.
++  template<>
++    int
++    collate<char>::_M_compare(const char* __one, const char* __two) const
++    {
++      int __cmp = __strcoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<char>::_M_transform(char* __to, const char* __from,
++				size_t __n) const
++    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    int
++    collate<wchar_t>::_M_compare(const wchar_t* __one,
++				 const wchar_t* __two) const
++    {
++      int __cmp = __wcscoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* __from,
++				   size_t __n) const
++    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++#endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/ctype_members.cc	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,300 @@
++// std::ctype implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __wctype_l(S, L)           wctype((S))
++#define __towupper_l(C, L)         towupper((C))
++#define __towlower_l(C, L)         towlower((C))
++#define __iswctype_l(C, M, L)      iswctype((C), (M))
++#endif
++
++namespace std
++{
++  // NB: The other ctype<char> specializations are in src/locale.cc and
++  // various /config/os/* files.
++  template<>
++    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
++    : ctype<char>(0, false, __refs)
++    {
++      if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	{
++	  this->_S_destroy_c_locale(this->_M_c_locale_ctype);
++	  this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  this->_M_toupper = this->_M_c_locale_ctype->__ctype_toupper;
++	  this->_M_tolower = this->_M_c_locale_ctype->__ctype_tolower;
++	  this->_M_table = this->_M_c_locale_ctype->__ctype_b;
++#endif
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  ctype<wchar_t>::__wmask_type
++  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
++  {
++    __wmask_type __ret;
++    switch (__m)
++      {
++      case space:
++	__ret = __wctype_l("space", _M_c_locale_ctype);
++	break;
++      case print:
++	__ret = __wctype_l("print", _M_c_locale_ctype);
++	break;
++      case cntrl:
++	__ret = __wctype_l("cntrl", _M_c_locale_ctype);
++	break;
++      case upper:
++	__ret = __wctype_l("upper", _M_c_locale_ctype);
++	break;
++      case lower:
++	__ret = __wctype_l("lower", _M_c_locale_ctype);
++	break;
++      case alpha:
++	__ret = __wctype_l("alpha", _M_c_locale_ctype);
++	break;
++      case digit:
++	__ret = __wctype_l("digit", _M_c_locale_ctype);
++	break;
++      case punct:
++	__ret = __wctype_l("punct", _M_c_locale_ctype);
++	break;
++      case xdigit:
++	__ret = __wctype_l("xdigit", _M_c_locale_ctype);
++	break;
++      case alnum:
++	__ret = __wctype_l("alnum", _M_c_locale_ctype);
++	break;
++      case graph:
++	__ret = __wctype_l("graph", _M_c_locale_ctype);
++	break;
++      default:
++	__ret = __wmask_type();
++      }
++    return __ret;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_toupper(wchar_t __c) const
++  { return __towupper_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towupper_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_tolower(wchar_t __c) const
++  { return __towlower_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towlower_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  bool
++  ctype<wchar_t>::
++  do_is(mask __m, wchar_t __c) const
++  {
++    // Highest bitmask in ctype_base == 10, but extra in "C"
++    // library for blank.
++    bool __ret = false;
++    const size_t __bitmasksize = 11;
++    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++      if (__m & _M_bit[__bitcur]
++	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++	{
++	  __ret = true;
++	  break;
++	}
++    return __ret;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
++  {
++    for (; __lo < __hi; ++__vec, ++__lo)
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	mask __m = 0;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__iswctype_l(*__lo, _M_wmask[__bitcur], _M_c_locale_ctype))
++	    __m |= _M_bit[__bitcur];
++	*__vec = __m;
++      }
++    return __hi;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi && !this->do_is(__m, *__lo))
++      ++__lo;
++    return __lo;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_not(mask __m, const char_type* __lo, const char_type* __hi) const
++  {
++    while (__lo < __hi && this->do_is(__m, *__lo) != 0)
++      ++__lo;
++    return __lo;
++  }
++
++  wchar_t
++  ctype<wchar_t>::
++  do_widen(char __c) const
++  { return _M_widen[static_cast<unsigned char>(__c)]; }
++
++  const char*
++  ctype<wchar_t>::
++  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) const
++  {
++    while (__lo < __hi)
++      {
++	*__dest = _M_widen[static_cast<unsigned char>(*__lo)];
++	++__lo;
++	++__dest;
++      }
++    return __hi;
++  }
++
++  char
++  ctype<wchar_t>::
++  do_narrow(wchar_t __wc, char __dfault) const
++  {
++    if (__wc >= 0 && __wc < 128 && _M_narrow_ok)
++      return _M_narrow[__wc];
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    const int __c = wctob(__wc);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return (__c == EOF ? __dfault : static_cast<char>(__c));
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
++	    char* __dest) const
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    if (_M_narrow_ok)
++      while (__lo < __hi)
++	{
++	  if (*__lo >= 0 && *__lo < 128)
++	    *__dest = _M_narrow[*__lo];
++	  else
++	    {
++	      const int __c = wctob(*__lo);
++	      *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	    }
++	  ++__lo;
++	  ++__dest;
++	}
++    else
++      while (__lo < __hi)
++	{
++	  const int __c = wctob(*__lo);
++	  *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	  ++__lo;
++	  ++__dest;
++	}
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __hi;
++  }
++
++  void
++  ctype<wchar_t>::_M_initialize_ctype()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    wint_t __i;
++    for (__i = 0; __i < 128; ++__i)
++      {
++	const int __c = wctob(__i);
++	if (__c == EOF)
++	  break;
++	else
++	  _M_narrow[__i] = static_cast<char>(__c);
++      }
++    if (__i == 128)
++      _M_narrow_ok = true;
++    else
++      _M_narrow_ok = false;
++    for (size_t __j = 0;
++	 __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
++      _M_widen[__j] = btowc(__j);
++
++    for (size_t __k = 0; __k <= 11; ++__k)
++      {
++	_M_bit[__k] = static_cast<mask>(_ISbit(__k));
++	_M_wmask[__k] = _M_convert_to_wmask(_M_bit[__k]);
++      }
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++  }
++#endif //  _GLIBCXX_USE_WCHAR_T
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.cc	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,100 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix gettext stuff
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__dcgettext(const char *domainname,
++			     const char *msgid, int category);
++#undef gettext
++#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#else
++#undef gettext
++#define gettext(msgid) (msgid)
++#endif
++
++namespace std
++{
++  // Specializations.
++  template<>
++    string
++    messages<char>::do_get(catalog, int, int, const string& __dfault) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      const char* __msg = const_cast<const char*>(gettext(__dfault.c_str()));
++      __uselocale(__old);
++      return string(__msg);
++#elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      const char* __msg = gettext(__dfault.c_str());
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return string(__msg);
++#else
++      const char* __msg = gettext(__dfault.c_str());
++      return string(__msg);
++#endif
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    wstring
++    messages<wchar_t>::do_get(catalog, int, int, const wstring& __dfault) const
++    {
++# ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      __uselocale(__old);
++      return _M_convert_from_char(__msg);
++# elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return _M_convert_from_char(__msg);
++# else
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      return _M_convert_from_char(__msg);
++# endif
++    }
++#endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.h	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,118 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix prototypes for *textdomain funcs
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__textdomain(const char *domainname);
++extern "C" char *__bindtextdomain(const char *domainname,
++				  const char *dirname);
++#else
++#undef __textdomain
++#undef __bindtextdomain
++#define __textdomain(D)           ((void)0)
++#define __bindtextdomain(D,P)     ((void)0)
++#endif
++
++  // Non-virtual member functions.
++  template<typename _CharT>
++     messages<_CharT>::messages(size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
++     _M_name_messages(_S_get_c_name())
++     { }
++
++  template<typename _CharT>
++     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
++				size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
++     _M_name_messages(__s)
++     {
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       _M_name_messages = __tmp;
++     }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
++			   const char* __dir) const
++    {
++      __bindtextdomain(__s.c_str(), __dir);
++      return this->do_open(__s, __loc);
++    }
++
++  // Virtual member functions.
++  template<typename _CharT>
++    messages<_CharT>::~messages()
++    {
++      if (_M_name_messages != _S_get_c_name())
++	delete [] _M_name_messages;
++      _S_destroy_c_locale(_M_c_locale_messages);
++    }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::do_open(const basic_string<char>& __s,
++			      const locale&) const
++    {
++      // No error checking is done, assume the catalog exists and can
++      // be used.
++      __textdomain(__s.c_str());
++      return 0;
++    }
++
++  template<typename _CharT>
++    void
++    messages<_CharT>::do_close(catalog) const
++    { }
++
++   // messages_byname
++   template<typename _CharT>
++     messages_byname<_CharT>::messages_byname(const char* __s, size_t __refs)
++     : messages<_CharT>(__refs)
++     {
++       if (this->_M_name_messages != locale::facet::_S_get_c_name())
++	 delete [] this->_M_name_messages;
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       this->_M_name_messages = __tmp;
++
++       if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	 {
++	   this->_S_destroy_c_locale(this->_M_c_locale_messages);
++	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
++	 }
++     }
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/monetary_members.cc	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,692 @@
++// std::moneypunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning optimize this for uclibc
++#warning tailor for stub locale support
++#endif
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  // Construct and return valid pattern consisting of some combination of:
++  // space none symbol sign value
++  money_base::pattern
++  money_base::_S_construct_pattern(char __precedes, char __space, char __posn)
++  {
++    pattern __ret;
++
++    // This insanely complicated routine attempts to construct a valid
++    // pattern for use with monyepunct. A couple of invariants:
++
++    // if (__precedes) symbol -> value
++    // else value -> symbol
++
++    // if (__space) space
++    // else none
++
++    // none == never first
++    // space never first or last
++
++    // Any elegant implementations of this are welcome.
++    switch (__posn)
++      {
++      case 0:
++      case 1:
++	// 1 The sign precedes the value and symbol.
++	__ret.field[0] = sign;
++	if (__space)
++	  {
++	    // Pattern starts with sign.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[3] = symbol;
++	      }
++	    __ret.field[2] = space;
++	  }
++	else
++	  {
++	    // Pattern starts with sign and ends with none.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 2:
++	// 2 The sign follows the value and symbol.
++	if (__space)
++	  {
++	    // Pattern either ends with sign.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[1] = space;
++	    __ret.field[3] = sign;
++	  }
++	else
++	  {
++	    // Pattern ends with sign then none.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[1] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[1] = symbol;
++	      }
++	    __ret.field[2] = sign;
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 3:
++	// 3 The sign immediately precedes the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = sign;
++	    __ret.field[1] = symbol;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = sign;
++		__ret.field[3] = symbol;
++	      }
++	    else
++	      {
++		__ret.field[1] = sign;
++		__ret.field[2] = symbol;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      case 4:
++	// 4 The sign immediately follows the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = symbol;
++	    __ret.field[1] = sign;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = symbol;
++		__ret.field[3] = sign;
++	      }
++	    else
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = sign;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      default:
++	;
++      }
++    return __ret;
++  }
++
++  template<>
++    void
++    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale __cloc,
++						     const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == true
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    void
++    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale __cloc,
++						      const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, false>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == false
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    moneypunct<char, true>::~moneypunct()
++    { delete _M_data; }
++
++  template<>
++    moneypunct<char, false>::~moneypunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++							const char*)
++#else
++							const char* __name)
++#endif
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<wchar_t, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  try
++	    {
++	      mbstate_t __state;
++	      size_t __len = strlen(__cpossign);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++	      _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++	      _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++	      _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++	  catch (...)
++	    {
++	      delete _M_data;
++	      _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++	      __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++  void
++  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++						       const char*)
++#else
++                                                       const char* __name)
++#endif
++  {
++    if (!_M_data)
++      _M_data = new __moneypunct_cache<wchar_t, false>;
++
++    if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++          _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++          union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++          _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  try
++            {
++              mbstate_t __state;
++              size_t __len;
++              __len = strlen(__cpossign);
++              if (__len)
++                {
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++              _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++              _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++              _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++          catch (...)
++	    {
++	      delete _M_data;
++              _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++              __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++	                                                __pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++	                                                __nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++    moneypunct<wchar_t, true>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++
++  template<>
++    moneypunct<wchar_t, false>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++#endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/numeric_members.cc	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,160 @@
++// std::numpunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] = __num_base::_S_atoms_out[__i];
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] = __num_base::_S_atoms_in[__j];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(THOUSANDS_SEP,
++							__cloc));
++
++	  // Check for NULL, which implies no grouping.
++	  if (_M_data->_M_thousands_sep == '\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = "true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = "false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<char>::~numpunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<wchar_t>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
++	}
++      else
++	{
++	  // Named locale.
++	  // NB: In the GNU model wchar_t is always 32 bit wide.
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++
++	  if (_M_data->_M_thousands_sep == L'\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = L"true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = L"false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<wchar_t>::~numpunct()
++    { delete _M_data; }
++ #endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.cc	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,406 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __timepunct<char>::
++    _M_put(char* __s, size_t __maxlen, const char* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = strftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = '\0';
++    }
++
++  template<>
++    void
++    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = "%m/%d/%y";
++	  _M_data->_M_date_era_format = "%m/%d/%y";
++	  _M_data->_M_time_format = "%H:%M:%S";
++	  _M_data->_M_time_era_format = "%H:%M:%S";
++	  _M_data->_M_date_time_format = "";
++	  _M_data->_M_date_time_era_format = "";
++	  _M_data->_M_am = "AM";
++	  _M_data->_M_pm = "PM";
++	  _M_data->_M_am_pm_format = "";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = "Sunday";
++	  _M_data->_M_day2 = "Monday";
++	  _M_data->_M_day3 = "Tuesday";
++	  _M_data->_M_day4 = "Wednesday";
++	  _M_data->_M_day5 = "Thursday";
++	  _M_data->_M_day6 = "Friday";
++	  _M_data->_M_day7 = "Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = "Sun";
++	  _M_data->_M_aday2 = "Mon";
++	  _M_data->_M_aday3 = "Tue";
++	  _M_data->_M_aday4 = "Wed";
++	  _M_data->_M_aday5 = "Thu";
++	  _M_data->_M_aday6 = "Fri";
++	  _M_data->_M_aday7 = "Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = "January";
++	  _M_data->_M_month02 = "February";
++	  _M_data->_M_month03 = "March";
++	  _M_data->_M_month04 = "April";
++	  _M_data->_M_month05 = "May";
++	  _M_data->_M_month06 = "June";
++	  _M_data->_M_month07 = "July";
++	  _M_data->_M_month08 = "August";
++	  _M_data->_M_month09 = "September";
++	  _M_data->_M_month10 = "October";
++	  _M_data->_M_month11 = "November";
++	  _M_data->_M_month12 = "December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = "Jan";
++	  _M_data->_M_amonth02 = "Feb";
++	  _M_data->_M_amonth03 = "Mar";
++	  _M_data->_M_amonth04 = "Apr";
++	  _M_data->_M_amonth05 = "May";
++	  _M_data->_M_amonth06 = "Jun";
++	  _M_data->_M_amonth07 = "Jul";
++	  _M_data->_M_amonth08 = "Aug";
++	  _M_data->_M_amonth09 = "Sep";
++	  _M_data->_M_amonth10 = "Oct";
++	  _M_data->_M_amonth11 = "Nov";
++	  _M_data->_M_amonth12 = "Dec";
++	}
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  _M_data->_M_date_format = __nl_langinfo_l(D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __nl_langinfo_l(ERA_D_FMT, __cloc);
++	  _M_data->_M_time_format = __nl_langinfo_l(T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __nl_langinfo_l(ERA_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __nl_langinfo_l(D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __nl_langinfo_l(ERA_D_T_FMT,
++							     __cloc);
++	  _M_data->_M_am = __nl_langinfo_l(AM_STR, __cloc);
++	  _M_data->_M_pm = __nl_langinfo_l(PM_STR, __cloc);
++	  _M_data->_M_am_pm_format = __nl_langinfo_l(T_FMT_AMPM, __cloc);
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = __nl_langinfo_l(DAY_1, __cloc);
++	  _M_data->_M_day2 = __nl_langinfo_l(DAY_2, __cloc);
++	  _M_data->_M_day3 = __nl_langinfo_l(DAY_3, __cloc);
++	  _M_data->_M_day4 = __nl_langinfo_l(DAY_4, __cloc);
++	  _M_data->_M_day5 = __nl_langinfo_l(DAY_5, __cloc);
++	  _M_data->_M_day6 = __nl_langinfo_l(DAY_6, __cloc);
++	  _M_data->_M_day7 = __nl_langinfo_l(DAY_7, __cloc);
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = __nl_langinfo_l(ABDAY_1, __cloc);
++	  _M_data->_M_aday2 = __nl_langinfo_l(ABDAY_2, __cloc);
++	  _M_data->_M_aday3 = __nl_langinfo_l(ABDAY_3, __cloc);
++	  _M_data->_M_aday4 = __nl_langinfo_l(ABDAY_4, __cloc);
++	  _M_data->_M_aday5 = __nl_langinfo_l(ABDAY_5, __cloc);
++	  _M_data->_M_aday6 = __nl_langinfo_l(ABDAY_6, __cloc);
++	  _M_data->_M_aday7 = __nl_langinfo_l(ABDAY_7, __cloc);
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = __nl_langinfo_l(MON_1, __cloc);
++	  _M_data->_M_month02 = __nl_langinfo_l(MON_2, __cloc);
++	  _M_data->_M_month03 = __nl_langinfo_l(MON_3, __cloc);
++	  _M_data->_M_month04 = __nl_langinfo_l(MON_4, __cloc);
++	  _M_data->_M_month05 = __nl_langinfo_l(MON_5, __cloc);
++	  _M_data->_M_month06 = __nl_langinfo_l(MON_6, __cloc);
++	  _M_data->_M_month07 = __nl_langinfo_l(MON_7, __cloc);
++	  _M_data->_M_month08 = __nl_langinfo_l(MON_8, __cloc);
++	  _M_data->_M_month09 = __nl_langinfo_l(MON_9, __cloc);
++	  _M_data->_M_month10 = __nl_langinfo_l(MON_10, __cloc);
++	  _M_data->_M_month11 = __nl_langinfo_l(MON_11, __cloc);
++	  _M_data->_M_month12 = __nl_langinfo_l(MON_12, __cloc);
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = __nl_langinfo_l(ABMON_1, __cloc);
++	  _M_data->_M_amonth02 = __nl_langinfo_l(ABMON_2, __cloc);
++	  _M_data->_M_amonth03 = __nl_langinfo_l(ABMON_3, __cloc);
++	  _M_data->_M_amonth04 = __nl_langinfo_l(ABMON_4, __cloc);
++	  _M_data->_M_amonth05 = __nl_langinfo_l(ABMON_5, __cloc);
++	  _M_data->_M_amonth06 = __nl_langinfo_l(ABMON_6, __cloc);
++	  _M_data->_M_amonth07 = __nl_langinfo_l(ABMON_7, __cloc);
++	  _M_data->_M_amonth08 = __nl_langinfo_l(ABMON_8, __cloc);
++	  _M_data->_M_amonth09 = __nl_langinfo_l(ABMON_9, __cloc);
++	  _M_data->_M_amonth10 = __nl_langinfo_l(ABMON_10, __cloc);
++	  _M_data->_M_amonth11 = __nl_langinfo_l(ABMON_11, __cloc);
++	  _M_data->_M_amonth12 = __nl_langinfo_l(ABMON_12, __cloc);
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    __timepunct<wchar_t>::
++    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __wcsftime_l(__s, __maxlen, __format, __tm, _M_c_locale_timepunct);
++      const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = L'\0';
++    }
++
++  template<>
++    void
++    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<wchar_t>;
++
++#warning wide time stuff
++//       if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = L"%m/%d/%y";
++	  _M_data->_M_date_era_format = L"%m/%d/%y";
++	  _M_data->_M_time_format = L"%H:%M:%S";
++	  _M_data->_M_time_era_format = L"%H:%M:%S";
++	  _M_data->_M_date_time_format = L"";
++	  _M_data->_M_date_time_era_format = L"";
++	  _M_data->_M_am = L"AM";
++	  _M_data->_M_pm = L"PM";
++	  _M_data->_M_am_pm_format = L"";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = L"Sunday";
++	  _M_data->_M_day2 = L"Monday";
++	  _M_data->_M_day3 = L"Tuesday";
++	  _M_data->_M_day4 = L"Wednesday";
++	  _M_data->_M_day5 = L"Thursday";
++	  _M_data->_M_day6 = L"Friday";
++	  _M_data->_M_day7 = L"Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = L"Sun";
++	  _M_data->_M_aday2 = L"Mon";
++	  _M_data->_M_aday3 = L"Tue";
++	  _M_data->_M_aday4 = L"Wed";
++	  _M_data->_M_aday5 = L"Thu";
++	  _M_data->_M_aday6 = L"Fri";
++	  _M_data->_M_aday7 = L"Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = L"January";
++	  _M_data->_M_month02 = L"February";
++	  _M_data->_M_month03 = L"March";
++	  _M_data->_M_month04 = L"April";
++	  _M_data->_M_month05 = L"May";
++	  _M_data->_M_month06 = L"June";
++	  _M_data->_M_month07 = L"July";
++	  _M_data->_M_month08 = L"August";
++	  _M_data->_M_month09 = L"September";
++	  _M_data->_M_month10 = L"October";
++	  _M_data->_M_month11 = L"November";
++	  _M_data->_M_month12 = L"December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = L"Jan";
++	  _M_data->_M_amonth02 = L"Feb";
++	  _M_data->_M_amonth03 = L"Mar";
++	  _M_data->_M_amonth04 = L"Apr";
++	  _M_data->_M_amonth05 = L"May";
++	  _M_data->_M_amonth06 = L"Jun";
++	  _M_data->_M_amonth07 = L"Jul";
++	  _M_data->_M_amonth08 = L"Aug";
++	  _M_data->_M_amonth09 = L"Sep";
++	  _M_data->_M_amonth10 = L"Oct";
++	  _M_data->_M_amonth11 = L"Nov";
++	  _M_data->_M_amonth12 = L"Dec";
++	}
++#if 0
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  union { char *__s; wchar_t *__w; } __u;
++
++	  __u.__s = __nl_langinfo_l(_NL_WD_FMT, __cloc);
++	  _M_data->_M_date_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT, __cloc);
++	  _M_data->_M_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WAM_STR, __cloc);
++	  _M_data->_M_am = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WPM_STR, __cloc);
++	  _M_data->_M_pm = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
++	  _M_data->_M_am_pm_format = __u.__w;
++
++	  // Day names, starting with "C"'s Sunday.
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_1, __cloc);
++	  _M_data->_M_day1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_2, __cloc);
++	  _M_data->_M_day2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_3, __cloc);
++	  _M_data->_M_day3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_4, __cloc);
++	  _M_data->_M_day4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_5, __cloc);
++	  _M_data->_M_day5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_6, __cloc);
++	  _M_data->_M_day6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_7, __cloc);
++	  _M_data->_M_day7 = __u.__w;
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_1, __cloc);
++	  _M_data->_M_aday1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_2, __cloc);
++	  _M_data->_M_aday2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_3, __cloc);
++	  _M_data->_M_aday3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_4, __cloc);
++	  _M_data->_M_aday4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_5, __cloc);
++	  _M_data->_M_aday5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_6, __cloc);
++	  _M_data->_M_aday6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_7, __cloc);
++	  _M_data->_M_aday7 = __u.__w;
++
++	  // Month names, starting with "C"'s January.
++	  __u.__s = __nl_langinfo_l(_NL_WMON_1, __cloc);
++	  _M_data->_M_month01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_2, __cloc);
++	  _M_data->_M_month02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_3, __cloc);
++	  _M_data->_M_month03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_4, __cloc);
++	  _M_data->_M_month04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_5, __cloc);
++	  _M_data->_M_month05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_6, __cloc);
++	  _M_data->_M_month06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_7, __cloc);
++	  _M_data->_M_month07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_8, __cloc);
++	  _M_data->_M_month08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_9, __cloc);
++	  _M_data->_M_month09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_10, __cloc);
++	  _M_data->_M_month10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_11, __cloc);
++	  _M_data->_M_month11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_12, __cloc);
++	  _M_data->_M_month12 = __u.__w;
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_1, __cloc);
++	  _M_data->_M_amonth01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_2, __cloc);
++	  _M_data->_M_amonth02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_3, __cloc);
++	  _M_data->_M_amonth03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_4, __cloc);
++	  _M_data->_M_amonth04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_5, __cloc);
++	  _M_data->_M_amonth05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_6, __cloc);
++	  _M_data->_M_amonth06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_7, __cloc);
++	  _M_data->_M_amonth07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_8, __cloc);
++	  _M_data->_M_amonth08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_9, __cloc);
++	  _M_data->_M_amonth09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_10, __cloc);
++	  _M_data->_M_amonth10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_11, __cloc);
++	  _M_data->_M_amonth11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_12, __cloc);
++	  _M_data->_M_amonth12 = __u.__w;
++	}
++#endif // 0
++    }
++#endif
++}
+Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.h	2012-04-10 10:30:37.331368420 -0700
+@@ -0,0 +1,68 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t __refs)
++    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
++				     size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(__s)
++    {
++      char* __tmp = new char[std::strlen(__s) + 1];
++      std::strcpy(__tmp, __s);
++      _M_name_timepunct = __tmp;
++      _M_initialize_timepunct(__cloc);
++    }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::~__timepunct()
++    {
++      if (_M_name_timepunct != _S_get_c_name())
++	delete [] _M_name_timepunct;
++      delete _M_data;
++      _S_destroy_c_locale(_M_c_locale_timepunct);
++    }
+Index: gcc-4_7-branch/libstdc++-v3/configure
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/configure	2012-04-10 10:19:50.383337127 -0700
++++ gcc-4_7-branch/libstdc++-v3/configure	2012-04-10 10:30:37.347368481 -0700
+@@ -15736,6 +15736,9 @@
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -15990,6 +15993,78 @@
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      { $as_echo "$as_me:${as_lineno-$LINENO}: result: uclibc" >&5
++$as_echo "uclibc" >&6; }
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      # Extract the first word of "msgfmt", so it can be a program name with args.
++set dummy msgfmt; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_check_msgfmt+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$check_msgfmt"; then
++  ac_cv_prog_check_msgfmt="$check_msgfmt" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_check_msgfmt="yes"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt="no"
++fi
++fi
++check_msgfmt=$ac_cv_prog_check_msgfmt
++if test -n "$check_msgfmt"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $check_msgfmt" >&5
++$as_echo "$check_msgfmt" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++
++
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+Index: gcc-4_7-branch/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/include/c_compatibility/wchar.h	2012-04-10 10:19:50.303337124 -0700
++++ gcc-4_7-branch/libstdc++-v3/include/c_compatibility/wchar.h	2012-04-10 10:30:37.347368481 -0700
+@@ -101,7 +101,9 @@
+ using std::wmemcpy;
+ using std::wmemmove;
+ using std::wmemset;
++#if _GLIBCXX_HAVE_WCSFTIME
+ using std::wcsftime;
++#endif
+ 
+ #if _GLIBCXX_USE_C99
+ using std::wcstold;
+Index: gcc-4_7-branch/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/include/c_std/cwchar	2012-04-10 10:19:50.295337124 -0700
++++ gcc-4_7-branch/libstdc++-v3/include/c_std/cwchar	2012-04-10 10:30:37.347368481 -0700
+@@ -177,7 +177,9 @@
+   using ::wcscoll;
+   using ::wcscpy;
+   using ::wcscspn;
++#if _GLIBCXX_HAVE_WCSFTIME
+   using ::wcsftime;
++#endif
+   using ::wcslen;
+   using ::wcsncat;
+   using ::wcsncmp;
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch
new file mode 100644
index 0000000..c602e91
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch
@@ -0,0 +1,235 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm
+ extern "C" __typeof(wctype_l) __wctype_l;
+ #endif
+ 
++# define __nl_langinfo_l nl_langinfo_l
++# define __strcoll_l strcoll_l
++# define __strftime_l strftime_l
++# define __strtod_l strtod_l
++# define __strtof_l strtof_l
++# define __strtold_l strtold_l
++# define __strxfrm_l strxfrm_l
++# define __newlocale newlocale
++# define __freelocale freelocale
++# define __duplocale duplocale
++# define __uselocale uselocale
++
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l iswctype_l
++#  define __towlower_l towlower_l
++#  define __towupper_l towupper_l
++#  define __wcscoll_l wcscoll_l
++#  define __wcsftime_l wcsftime_l
++#  define __wcsxfrm_l wcsxfrm_l
++#  define __wctype_l wctype_l
++# endif
++
++#else
++# define __nl_langinfo_l(N, L)       nl_langinfo((N))
++# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++# define __strtod_l(S, E, L)         strtod((S), (E))
++# define __strtof_l(S, E, L)         strtof((S), (E))
++# define __strtold_l(S, E, L)        strtold((S), (E))
++# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++# warning should dummy __newlocale check for C|POSIX ?
++# define __newlocale(a, b, c)        NULL
++# define __freelocale(a)             ((void)0)
++# define __duplocale(a)              __c_locale()
++//# define __uselocale ?
++//
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l(C, M, L)       iswctype((C), (M))
++#  define __towlower_l(C, L)          towlower((C))
++#  define __towupper_l(C, L)          towupper((C))
++#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), (T))
++#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#  define __wctype_l(S, L)            wctype((S))
++# endif
++
+ #endif // GLIBC 2.3 and later
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,20 +39,6 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
+-#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
+-#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
+-#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
+-#define __strtof_l(S, E, L)         strtof((S), (E))
+-#define __strtod_l(S, E, L)         strtod((S), (E))
+-#define __strtold_l(S, E, L)        strtold((S), (E))
+-#warning should dummy __newlocale check for C|POSIX ?
+-#define __newlocale(a, b, c)        NULL
+-#define __freelocale(a)             ((void)0)
+-#define __duplocale(a)              __c_locale()
+-#endif
+-
+ namespace std
+ {
+   template<>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/collate_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+@@ -36,13 +36,6 @@
+ #include <locale>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
+-#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
+-#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
+-#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
+-#endif
+-
+ namespace std
+ {
+   // These are basically extensions to char_traits, and perhaps should
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -43,10 +43,6 @@
+ #warning tailor for stub locale support
+ #endif
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+-
+ namespace std
+ {
+   // Construct and return valid pattern consisting of some combination of:
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -41,9 +41,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -40,9 +40,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -38,13 +38,6 @@
+ #undef _LIBC
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __wctype_l(S, L)           wctype((S))
+-#define __towupper_l(C, L)         towupper((C))
+-#define __towlower_l(C, L)         towlower((C))
+-#define __iswctype_l(C, M, L)      iswctype((C), (M))
+-#endif
+-
+ namespace std
+ {
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+@@ -39,13 +39,10 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix gettext stuff
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__dcgettext(const char *domainname,
+-			     const char *msgid, int category);
+ #undef gettext
+-#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
+ #else
+-#undef gettext
+ #define gettext(msgid) (msgid)
+ #endif
+ 
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -36,15 +36,11 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__textdomain(const char *domainname);
+-extern "C" char *__bindtextdomain(const char *domainname,
+-				  const char *dirname);
+-#else
+-#undef __textdomain
+-#undef __bindtextdomain
+-#define __textdomain(D)           ((void)0)
+-#define __bindtextdomain(D,P)     ((void)0)
++#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#undef textdomain
++#undef bindtextdomain
++#define textdomain(D)           ((void)0)
++#define bindtextdomain(D,P)     ((void)0)
+ #endif
+ 
+   // Non-virtual member functions.
+@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const
+     messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
+ 			   const char* __dir) const
+     {
+-      __bindtextdomain(__s.c_str(), __dir);
++      bindtextdomain(__s.c_str(), __dir);
+       return this->do_open(__s, __loc);
+     }
+ 
+@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const
+     {
+       // No error checking is done, assume the catalog exists and can
+       // be used.
+-      __textdomain(__s.c_str());
++      textdomain(__s.c_str());
+       return 0;
+     }
+ 
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -68,6 +68,7 @@ namespace __gnu_cxx
+ {
+   extern "C" __typeof(uselocale) __uselocale;
+ }
++#define __uselocale uselocale
+ #endif
+ 
+ namespace std
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch
new file mode 100644
index 0000000..896d2a5
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -401,7 +401,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+@@ -556,7 +556,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -127,12 +127,25 @@ namespace std
+ 	{
+ 	  // Named locale.
+ 	  // NB: In the GNU model wchar_t is always 32 bit wide.
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be numeric
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# elif defined __UCLIBC_HAS_LOCALE__
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
+ 	  union { char *__s; wchar_t __w; } __u;
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
+ 	  _M_data->_M_decimal_point = __u.__w;
+ 
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
+ 	  _M_data->_M_thousands_sep = __u.__w;
++#endif
+ 
+ 	  if (_M_data->_M_thousands_sep == L'\0')
+ 	    _M_data->_M_grouping = "";
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch
new file mode 100644
index 0000000..743017b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch
@@ -0,0 +1,521 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,23 +39,20 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   template<>
+     void
+     __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  float __f = __strtof_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __f;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      float __f = __strtof_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __f;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -63,16 +60,13 @@ namespace std
+     __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  double __d = __strtod_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __d;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      double __d = __strtod_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __d;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -80,16 +74,13 @@ namespace std
+     __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __ld;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      long double __ld = __strtold_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __ld;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   void
+@@ -110,17 +101,18 @@ namespace std
+   void
+   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
+   {
+-    if (_S_get_c_locale() != __cloc)
++    if (__cloc && _S_get_c_locale() != __cloc)
+       __freelocale(__cloc);
+   }
+ 
+   __c_locale
+   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
+   { return __duplocale(__cloc); }
+-} // namespace std
+ 
+-namespace __gnu_cxx
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
++
+   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
+     {
+       "LC_CTYPE",
+@@ -138,9 +130,11 @@ namespace __gnu_cxx
+       "LC_IDENTIFICATION"
+ #endif
+     };
+-}
+ 
+-namespace std
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   const char* const* const locale::_S_categories = __gnu_cxx::category_names;
+-}  // namespace std
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -33,16 +33,20 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+   // various /config/os/* files.
+-  template<>
+     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
+     : ctype<char>(0, false, __refs)
+     {
+@@ -57,6 +61,8 @@ namespace std
+ #endif
+ 	}
+     }
++    ctype_byname<char>::~ctype_byname()
++    { }
+ 
+ #ifdef _GLIBCXX_USE_WCHAR_T
+   ctype<wchar_t>::__wmask_type
+@@ -138,17 +144,33 @@ namespace std
+   ctype<wchar_t>::
+   do_is(mask __m, wchar_t __c) const
+   {
+-    // Highest bitmask in ctype_base == 10, but extra in "C"
+-    // library for blank.
++    // The case of __m == ctype_base::space is particularly important,
++    // due to its use in many istream functions.  Therefore we deal with
++    // it first, exploiting the knowledge that on GNU systems _M_bit[5]
++    // is the mask corresponding to ctype_base::space.  NB: an encoding
++    // change would not affect correctness!
++
+     bool __ret = false;
+-    const size_t __bitmasksize = 11;
+-    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
+-      if (__m & _M_bit[__bitcur]
+-	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
+-	{
+-	  __ret = true;
+-	  break;
+-	}
++    if (__m == _M_bit[5])
++      __ret = __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
++    else
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__m & _M_bit[__bitcur])
++	    {
++	      if (__iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++		{
++		  __ret = true;
++		  break;
++		}
++	      else if (__m == _M_bit[__bitcur])
++		break;
++	    }
++      }
++
+     return __ret;
+   }
+ 
+@@ -290,4 +312,5 @@ namespace std
+ #endif
+   }
+ #endif //  _GLIBCXX_USE_WCHAR_T
+-}
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -53,12 +53,16 @@
+   template<typename _CharT>
+      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
+ 				size_t __refs)
+-     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
+-     _M_name_messages(__s)
++     : facet(__refs), _M_c_locale_messages(NULL),
++     _M_name_messages(NULL)
+      {
+-       char* __tmp = new char[std::strlen(__s) + 1];
+-       std::strcpy(__tmp, __s);
++       const size_t __len = std::strlen(__s) + 1;
++       char* __tmp = new char[__len];
++       std::memcpy(__tmp, __s, __len);
+        _M_name_messages = __tmp;
++
++       // Last to avoid leaking memory if new throws.
++       _M_c_locale_messages = _S_clone_c_locale(__cloc);
+      }
+ 
+   template<typename _CharT>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -206,7 +211,7 @@ namespace std
+ 	  }
+ 	break;
+       default:
+-	;
++	__ret = pattern();
+       }
+     return __ret;
+   }
+@@ -390,7 +395,9 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
++  	  char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
+ 	  setlocale(LC_ALL, __name);
+ #endif
+ 
+@@ -477,8 +484,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+ 	      __throw_exception_again;
+ 	    }
+@@ -498,8 +505,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+@@ -545,8 +552,11 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
+-	  setlocale(LC_ALL, __name);
++          char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
++          memcpy(__sav, __old, __llen);
++          setlocale(LC_ALL, __name);
+ #endif
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -633,8 +643,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+               __throw_exception_again;
+ 	    }
+@@ -653,8 +663,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -50,12 +50,21 @@
+     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
+ 				     size_t __refs)
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
+-    _M_name_timepunct(__s)
++    _M_name_timepunct(NULL)
+     {
+-      char* __tmp = new char[std::strlen(__s) + 1];
+-      std::strcpy(__tmp, __s);
++      const size_t __len = std::strlen(__s) + 1;
++      char* __tmp = new char[__len];
++      std::memcpy(__tmp, __s, __len);
+       _M_name_timepunct = __tmp;
+-      _M_initialize_timepunct(__cloc);
++
++      try
++	{ _M_initialize_timepunct(__cloc); }
++      catch(...)
++	{
++	  delete [] _M_name_timepunct;
++	  __throw_exception_again;
++	}
++
+     }
+ 
+   template<typename _CharT>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -39,21 +39,23 @@
+ #pragma GCC system_header
+ 
+ #include <cstring>              // get std::strlen
+-#include <cstdio>               // get std::snprintf or std::sprintf
++#include <cstdio>               // get std::vsnprintf or std::vsprintf
+ #include <clocale>
+ #include <langinfo.h>		// For codecvt
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix this
+ #endif
+-#ifdef __UCLIBC_HAS_LOCALE__
++#ifdef _GLIBCXX_USE_ICONV
+ #include <iconv.h>		// For codecvt using iconv, iconv_t
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-#include <libintl.h> 		// For messages
++#ifdef HAVE_LIBINTL_H
++#include <libintl.h>		// For messages
+ #endif
++#include <cstdarg>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning what is _GLIBCXX_C_LOCALE_GNU for
++// psm: used in os/gnu-linux/ctype_noninline.h
+ #endif
+ #define _GLIBCXX_C_LOCALE_GNU 1
+ 
+@@ -78,23 +80,25 @@ namespace std
+ #else
+   typedef int*			__c_locale;
+ #endif
+-
+-  // Convert numeric value of type _Tv to string and return length of
+-  // string.  If snprintf is available use it, otherwise fall back to
+-  // the unsafe sprintf which, in general, can be dangerous and should
++  // Convert numeric value of type double to string and return length of
++  // string.  If vsnprintf is available use it, otherwise fall back to
++  // the unsafe vsprintf which, in general, can be dangerous and should
+   // be avoided.
+-  template<typename _Tv>
+-    int
+-    __convert_from_v(char* __out,
+-		     const int __size __attribute__ ((__unused__)),
+-		     const char* __fmt,
+-#ifdef __UCLIBC_HAS_XCLOCALE__
+-		     _Tv __v, const __c_locale& __cloc, int __prec)
++    inline int
++    __convert_from_v(const __c_locale&
++#ifndef __UCLIBC_HAS_XCLOCALE__
++	__cloc __attribute__ ((__unused__))
++#endif
++		     ,
++		     char* __out,
++		     const int __size,
++		     const char* __fmt, ...)
+     {
++      va_list __args;
++#ifdef __UCLIBC_HAS_XCLOCALE__
++
+       __c_locale __old = __gnu_cxx::__uselocale(__cloc);
+ #else
+-		     _Tv __v, const __c_locale&, int __prec)
+-    {
+ # ifdef __UCLIBC_HAS_LOCALE__
+       char* __old = std::setlocale(LC_ALL, NULL);
+       char* __sav = new char[std::strlen(__old) + 1];
+@@ -103,7 +107,9 @@ namespace std
+ # endif
+ #endif
+ 
+-      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++      va_start(__args, __fmt);
++      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
++      va_end(__args);
+ 
+ #ifdef __UCLIBC_HAS_XCLOCALE__
+       __gnu_cxx::__uselocale(__old);
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -53,11 +53,14 @@ namespace std
+       const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = strftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+@@ -207,11 +210,14 @@ namespace std
+       const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -31,6 +31,9 @@
+ 
+ #include <bits/c++config.h>
+ #include <clocale>
++#include <cstdlib>
++#include <cstring>
++#include <cstddef>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning clean this up
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..9589822
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/boehm-gc/include/gc.h
+===================================================================
+--- gcc-4.6.0.orig/boehm-gc/include/gc.h
++++ gcc-4.6.0/boehm-gc/include/gc.h
+@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch
new file mode 100644
index 0000000..9becc15
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Index: gcc-4_7-branch/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/include/c_std/cstdio	2012-04-10 10:19:49.603337089 -0700
++++ gcc-4_7-branch/libstdc++-v3/include/c_std/cstdio	2012-04-10 10:30:59.863369565 -0700
+@@ -140,7 +140,7 @@
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch
new file mode 100644
index 0000000..d69c546
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: gcc-4_7-branch/libstdc++-v3/configure
+===================================================================
+--- gcc-4_7-branch.orig/libstdc++-v3/configure	2012-04-10 10:30:37.347368481 -0700
++++ gcc-4_7-branch/libstdc++-v3/configure	2012-04-10 10:31:22.787370652 -0700
+@@ -18767,6 +18767,9 @@
+     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #include <complex.h>
++#ifdef __UCLIBC__
++#error ugly hack to make sure configure test fails here for cross until uClibc supports the complex funcs
++#endif
+ int
+ main ()
+ {
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch
new file mode 100644
index 0000000..f103765
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/include/ext/rope
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/ext/rope
++++ gcc-4.6.0/libstdc++-v3/include/ext/rope
+@@ -54,6 +54,9 @@
+ #include <bits/gthr.h>
+ #include <tr1/functional>
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ # ifdef __GC
+ #   define __GC_CONST const
+ # else
+Index: gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/ext/ropeimpl.h
++++ gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
+@@ -49,6 +49,9 @@
+ #include <ext/memory> // For uninitialized_copy_n
+ #include <ext/numeric> // For power
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..10d09a7
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: gcc-4_7-branch/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4_7-branch.orig/libmudflap/mf-hooks2.c	2012-04-10 10:19:49.391337079 -0700
++++ gcc-4_7-branch/libmudflap/mf-hooks2.c	2012-04-10 10:31:53.191372119 -0700
+@@ -424,7 +424,7 @@
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -434,7 +434,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -444,7 +444,7 @@
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -453,7 +453,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -462,7 +462,7 @@
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch
new file mode 100644
index 0000000..e99bf96
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch
@@ -0,0 +1,40 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -32,7 +32,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+@@ -116,3 +117,4 @@
+ 	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
+ 	 }
+      }
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -33,7 +33,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+   template<typename _CharT>
+     __timepunct<_CharT>::__timepunct(size_t __refs)
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
+@@ -75,3 +76,4 @@
+       delete _M_data;
+       _S_destroy_c_locale(_M_c_locale_timepunct);
+     }
++}
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch
new file mode 100644
index 0000000..f475669
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch
@@ -0,0 +1,63 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+GCC has internal multilib handling code but it assumes a very specific rigid directory
+layout. The build system implementation of multilib layout is very generic and allows
+complete customisation of the library directories.
+
+This patch is a partial solution to allow any custom directories to be passed into gcc
+and handled correctly. It forces gcc to use the base_libdir (which is the current 
+directory, "."). We need to do this for each multilib that is configured as we don't
+know which compiler options may be being passed into the compiler. Since we have a compiler
+per mulitlib at this point that isn't an issue.
+
+The one problem is the target compiler is only going to work for the default multlilib at
+this point. Ideally we'd figure out which multilibs were being enabled with which paths
+and be able to patch these entries with a complete set of correct paths but this we
+don't have such code at this point. This is something the target gcc recipe should do 
+and override these platform defaults in its build config.
+
+RP 15/8/11
+
+Index: trunk/gcc/config/i386/t-linux64
+===================================================================
+--- trunk.orig/gcc/config/i386/t-linux64	2012-02-22 09:44:48.000000000 -0800
++++ trunk/gcc/config/i386/t-linux64	2012-02-22 12:31:01.836462957 -0800
+@@ -33,7 +33,6 @@
+ #
+ comma=,
+ MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
+-MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTIONS)))
+-MULTILIB_OSDIRNAMES = m64=../lib64
+-MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
+-MULTILIB_OSDIRNAMES+= mx32=../libx32
++MULTILIB_DIRNAMES = . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
++
+Index: trunk/gcc/config/mips/t-linux64
+===================================================================
+--- trunk.orig/gcc/config/mips/t-linux64	2012-02-22 09:44:58.000000000 -0800
++++ trunk/gcc/config/mips/t-linux64	2012-02-22 12:32:01.132465823 -0800
+@@ -17,5 +17,5 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+-MULTILIB_DIRNAMES = n32 32 64
+-MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+Index: trunk/gcc/config/rs6000/t-linux64
+===================================================================
+--- trunk.orig/gcc/config/rs6000/t-linux64	2012-02-22 09:44:54.000000000 -0800
++++ trunk/gcc/config/rs6000/t-linux64	2012-02-22 12:28:17.960454968 -0800
+@@ -27,9 +27,9 @@
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS        = m64/m32 msoft-float
+-MULTILIB_DIRNAMES       = 64 32 nof
++MULTILIB_DIRNAMES       = . . .
+ MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
+ MULTILIB_EXCEPTIONS     = m64/msoft-float
+ MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
+-MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
++MULTILIB_OSDIRNAMES	= ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch
new file mode 100644
index 0000000..1406f87
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+http://sourceforge.net/mailarchive/forum.php?thread_id=8959304&forum_id=5348
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24836
+
+Index: gcc-4_7-branch/gcc/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 10:22:05.787343661 -0700
++++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:32:18.415373343 -0700
+@@ -3065,7 +3065,7 @@
+ 	tls_first_minor=14
+ 	tls_as_opt="-m64 -Aesame --fatal-warnings"
+ 	;;
+-  sh-*-* | sh[34]-*-*)
++  sh-*-* | sh[34]*-*-*)
+     conftest_s='
+ 	.section ".tdata","awT",@progbits
+ foo:	.long	25
+Index: gcc-4_7-branch/gcc/configure
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure	2012-04-10 10:22:05.803343691 -0700
++++ gcc-4_7-branch/gcc/configure	2012-04-10 10:32:18.419373328 -0700
+@@ -23481,7 +23481,7 @@
+ 	tls_first_minor=14
+ 	tls_as_opt="-m64 -Aesame --fatal-warnings"
+ 	;;
+-  sh-*-* | sh[34]-*-*)
++  sh-*-* | sh[34]*-*-*)
+     conftest_s='
+ 	.section ".tdata","awT",@progbits
+ foo:	.long	25
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch
new file mode 100644
index 0000000..ac301bd
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending
+
+By Lennert Buytenhek <buytenh@wantstofly.org>
+Adds support for arm*b-linux* big-endian ARM targets
+
+See http://gcc.gnu.org/PR16350
+
+Index: gcc-4_7-branch/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-elf.h	2012-04-10 10:19:49.171337068 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-elf.h	2012-04-10 10:32:36.819374226 -0700
+@@ -48,7 +48,7 @@
+ 
+ #undef  MULTILIB_DEFAULTS
+ #define MULTILIB_DEFAULTS \
+-	{ "marm", "mlittle-endian", "mfloat-abi=hard", "mno-thumb-interwork" }
++	{ "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=hard", "mno-thumb-interwork" }
+ 
+ /* Now we define the strings used to build the spec file.  */
+ #undef  LIB_SPEC
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-04-10 10:19:49.159337069 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-04-10 10:32:36.823374222 -0700
+@@ -842,6 +842,11 @@
+ 	esac
+ 	tmake_file="${tmake_file} arm/t-arm"
+ 	case ${target} in
++	arm*b-*)
++		tm_defines="${tm_defines} TARGET_BIG_ENDIAN_DEFAULT=1"
++		;;
++	esac
++	case ${target} in
+ 	arm*-*-linux-*eabi)
+ 	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
+ 	    tmake_file="$tmake_file arm/t-arm-elf arm/t-bpabi arm/t-linux-eabi"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch
new file mode 100644
index 0000000..f598298
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+#This patck added --sysroot into COLLECT_GCC_OPTIONS which is used to
+#invoke collect2.
+
+Index: gcc-4_7-branch/gcc/gcc.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/gcc.c	2012-04-10 10:37:49.487389409 -0700
++++ gcc-4_7-branch/gcc/gcc.c	2012-04-10 10:38:50.831392259 -0700
+@@ -3995,6 +3995,15 @@
+ 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
+ 
+   first_time = TRUE;
++#ifdef HAVE_LD_SYSROOT
++  if (target_system_root_changed && target_system_root)
++    {
++      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
++      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
++      obstack_grow (&collect_obstack, "'", 1);
++      first_time = FALSE;
++    }
++#endif
+   for (i = 0; (int) i < n_switches; i++)
+     {
+       const char *const *args;
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
new file mode 100644
index 0000000..38c361e
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
@@ -0,0 +1,165 @@
+This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+relative to SYSTEMLIBS_DIR which can be set in generated headers
+This breaks the assumption of hardcoded multilib in gcc
+Change is only for the supported architectures in OE including
+SH, spart, alpha for possible future support (if any)
+
+Removes the do_headerfix task in metadata
+
+Signed-off-by: Khem Raj
+Upstream-Status: Inappropriate [OE configuration]
+
+Index: git/gcc/config/alpha/linux-elf.h
+===================================================================
+--- git.orig/gcc/config/alpha/linux-elf.h	2012-07-08 11:16:26.199320624 -0700
++++ git/gcc/config/alpha/linux-elf.h	2012-07-08 11:19:51.059330624 -0700
+@@ -24,8 +24,8 @@
+ #define EXTRA_SPECS \
+ { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
+ 
+-#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+ #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+Index: git/gcc/config/arm/linux-eabi.h
+===================================================================
+--- git.orig/gcc/config/arm/linux-eabi.h	2012-07-08 11:16:26.000000000 -0700
++++ git/gcc/config/arm/linux-eabi.h	2012-07-08 11:20:40.947333288 -0700
+@@ -62,7 +62,7 @@
+ /* Use ld-linux.so.3 so that it will be possible to run "classic"
+    GNU/Linux binaries on an EABI system.  */
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.3"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+Index: git/gcc/config/arm/linux-elf.h
+===================================================================
+--- git.orig/gcc/config/arm/linux-elf.h	2012-07-08 11:16:31.903320900 -0700
++++ git/gcc/config/arm/linux-elf.h	2012-07-08 11:21:37.619335646 -0700
+@@ -59,7 +59,7 @@
+ 
+ #define LIBGCC_SPEC "-lgcc"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #define LINUX_TARGET_LINK_SPEC  "%{h*} \
+    %{static:-Bstatic} \
+Index: git/gcc/config/i386/linux.h
+===================================================================
+--- git.orig/gcc/config/i386/linux.h	2012-07-08 11:16:26.267320627 -0700
++++ git/gcc/config/i386/linux.h	2012-07-08 11:23:26.727340361 -0700
+@@ -21,4 +21,4 @@
+ <http://www.gnu.org/licenses/>.  */
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+Index: git/gcc/config/i386/linux64.h
+===================================================================
+--- git.orig/gcc/config/i386/linux64.h	2012-07-08 11:16:26.267320627 -0700
++++ git/gcc/config/i386/linux64.h	2012-07-08 11:23:13.255340316 -0700
+@@ -28,6 +28,6 @@
+ #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
+ #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
+Index: git/gcc/config/mips/linux.h
+===================================================================
+--- git.orig/gcc/config/mips/linux.h	2012-07-08 11:16:26.307320629 -0700
++++ git/gcc/config/mips/linux.h	2012-07-08 11:23:56.063342214 -0700
+@@ -18,4 +18,4 @@
+ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
+Index: git/gcc/config/mips/linux64.h
+===================================================================
+--- git.orig/gcc/config/mips/linux64.h	2012-07-08 11:16:26.307320629 -0700
++++ git/gcc/config/mips/linux64.h	2012-07-08 11:24:52.207345073 -0700
+@@ -23,10 +23,10 @@
+ #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
+ #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
+-#define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld.so.1"
++#define GLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld.so.1"
++#define UCLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
+Index: git/gcc/config/rs6000/linux64.h
+===================================================================
+--- git.orig/gcc/config/rs6000/linux64.h	2012-07-08 11:16:26.335320630 -0700
++++ git/gcc/config/rs6000/linux64.h	2012-07-08 11:26:05.867348369 -0700
+@@ -358,10 +358,10 @@
+ #undef	LINK_OS_DEFAULT_SPEC
+ #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
+-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+ #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+Index: git/gcc/config/sh/linux.h
+===================================================================
+--- git.orig/gcc/config/sh/linux.h	2012-07-08 11:16:26.363320632 -0700
++++ git/gcc/config/sh/linux.h	2012-07-08 11:26:29.375350165 -0700
+@@ -45,7 +45,7 @@
+ 
+ #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef SUBTARGET_LINK_EMUL_SUFFIX
+ #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
+Index: git/gcc/config/sparc/linux.h
+===================================================================
+--- git.orig/gcc/config/sparc/linux.h	2012-07-08 11:16:26.371320632 -0700
++++ git/gcc/config/sparc/linux.h	2012-07-08 11:27:00.439351163 -0700
+@@ -84,7 +84,7 @@
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef  LINK_SPEC
+ #define LINK_SPEC "-m elf32_sparc -Y P,/usr/lib %{shared:-shared} \
+Index: git/gcc/config/sparc/linux64.h
+===================================================================
+--- git.orig/gcc/config/sparc/linux64.h	2012-07-08 11:16:26.371320632 -0700
++++ git/gcc/config/sparc/linux64.h	2012-07-08 11:27:23.571352396 -0700
+@@ -93,8 +93,8 @@
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #ifdef SPARC_BI_ARCH
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
new file mode 100644
index 0000000..dfa0d19
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
@@ -0,0 +1,48 @@
+This patch is still being discussed by probably is almost
+final version. We add the OE notion of multilib on top
+
+Upstream-Status: Backport [ adapted ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-04-30 15:28:31.891863845 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-04-30 15:37:11.531888994 -0700
+@@ -32,7 +32,8 @@
+   while (false)
+ 
+ /* We default to a soft-float ABI so that binaries can run on all
+-   target hardware.  */
++   target hardware.  If you override this to use the hard-float ABI then
++   change the setting of GLIBC_DYNAMIC_LINKER_DEFAULT as well.  */
+ #undef  TARGET_DEFAULT_FLOAT_ABI
+ #define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_SOFT
+ 
+@@ -59,10 +60,23 @@
+ #undef  SUBTARGET_EXTRA_LINK_SPEC
+ #define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION
+ 
+-/* Use ld-linux.so.3 so that it will be possible to run "classic"
+-   GNU/Linux binaries on an EABI system.  */
++/* GNU/Linux on ARM currently supports three dynamic linkers:
++   - ld-linux.so.2 - for the legacy ABI
++   - ld-linux.so.3 - for the EABI-derived soft-float ABI
++   - ld-linux-armhf.so.3 - for the EABI-derived hard-float ABI.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, but this can be overridden by changing both
++   GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
++
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
++#define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
++
++ #define GLIBC_DYNAMIC_LINKER \
++    "%{mfloat-abi=hard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
++     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
++     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
new file mode 100644
index 0000000..4ba707d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56308
+
+From 1e37e371d2cca3549b71a247bf79778aa1a9e1c4 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 21 Sep 2012 10:08:35 +0000
+Subject: [PATCH] 2012-09-21  Richard Guenther  <rguenther@suse.de>
+
+	PR middle-end/54638
+	Backport from mainline
+	2012-04-19  Richard Guenther  <rguenther@suse.de>
+
+	* ira-int.h (ira_allocno_object_iter_cond): Avoid out-of-bound
+	array access.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_7-branch@191605 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog | 9 +++++++++
+ gcc/ira-int.h | 9 +++++++--
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/ira-int.h b/gcc/ira-int.h
+index 9faabb5..771a368 100644
+--- a/gcc/ira-int.h
++++ b/gcc/ira-int.h
+@@ -1138,8 +1138,13 @@ static inline bool
+ ira_allocno_object_iter_cond (ira_allocno_object_iterator *i, ira_allocno_t a,
+ 			      ira_object_t *o)
+ {
+-  *o = ALLOCNO_OBJECT (a, i->n);
+-  return i->n++ < ALLOCNO_NUM_OBJECTS (a);
++  int n = i->n++;
++  if (n < ALLOCNO_NUM_OBJECTS (a))
++    {
++      *o = ALLOCNO_OBJECT (a, n);
++      return true;
++    }
++  return false;
+ }
+ 
+ /* Loop over all objects associated with allocno A.  In each
+-- 
+1.8.2.2
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch
new file mode 100644
index 0000000..7310677
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch
@@ -0,0 +1,40 @@
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location 
+rather than the --sysroot option specified on the commandline. If access to that directory is 
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix, 
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+Upstream-Status: Pending
+
+RP 2012/04/13
+
+Index: gcc-4_6-branch/gcc/gcc.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/gcc.c	2012-04-13 12:24:37.939671140 +0000
++++ gcc-4_6-branch/gcc/gcc.c	2012-04-13 12:24:54.439670688 +0000
+@@ -953,7 +953,7 @@
+                     %W{o*:--output-pch=%*}}%V}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
+Index: gcc-4_6-branch/gcc/cp/lang-specs.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/cp/lang-specs.h	2012-04-13 12:25:01.019670594 +0000
++++ gcc-4_6-branch/gcc/cp/lang-specs.h	2012-04-13 12:25:07.567670180 +0000
+@@ -64,5 +64,5 @@
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+    "%{!M:%{!MM:%{!E:\
+-    cc1plus -fpreprocessed %i %(cc1_options) %2\
++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
+     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
new file mode 100644
index 0000000..2b0ff67
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
@@ -0,0 +1,118 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From aab806a131efe9706396692ecc67d324371e39bc Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 22 Jun 2012 20:13:23 +0000
+Subject: [PATCH] 2012-06-22  Edmar Wienskoski  <edmar@freescale.com>
+
+	* config/rs6000/rs6000.md (define_attr "type"): New type popcnt.
+	(popcntb<mode>2): Add attribute type popcnt.
+	(popcntd<mode>2): Ditto.
+	* config/rs6000/power4.md (define_insn_reservation): Add type popcnt.
+	* config/rs6000/power5.md (define_insn_reservation): Ditto.
+	* config/rs6000/power7.md (define_insn_reservation): Ditto.
+	* config/rs6000/476.md (define_insn_reservation): Ditto.
+	* config/rs6000/power6.md (define_insn_reservation): New
+	reservation for popcnt instructions.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188901 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog               |   12 ++++++++++++
+ gcc/config/rs6000/476.md    |    2 +-
+ gcc/config/rs6000/power5.md |    2 +-
+ gcc/config/rs6000/power6.md |    5 +++++
+ gcc/config/rs6000/power7.md |    2 +-
+ gcc/config/rs6000/rs6000.md |   10 +++++++---
+ 6 files changed, 27 insertions(+), 6 deletions(-)
+
+Index: gcc-4_7-branch/gcc/config/rs6000/476.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/476.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/476.md	2012-07-06 19:50:30.078779999 -0700
+@@ -71,7 +71,7 @@
+    ppc476_i_pipe|ppc476_lj_pipe")
+ 
+ (define_insn_reservation "ppc476-complex-integer" 1
+-  (and (eq_attr "type" "cmp,cr_logical,delayed_cr,cntlz,isel,isync,sync,trap")
++  (and (eq_attr "type" "cmp,cr_logical,delayed_cr,cntlz,isel,isync,sync,trap,popcnt")
+        (eq_attr "cpu" "ppc476"))
+   "ppc476_issue,\
+    ppc476_i_pipe")
+Index: gcc-4_7-branch/gcc/config/rs6000/power5.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power5.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power5.md	2012-07-06 19:50:30.078779999 -0700
+@@ -142,7 +142,7 @@
+ ; Integer latency is 2 cycles
+ (define_insn_reservation "power5-integer" 2
+   (and (eq_attr "type" "integer,insert_dword,shift,trap,\
+-                        var_shift_rotate,cntlz,exts,isel")
++                        var_shift_rotate,cntlz,exts,isel,popcnt")
+        (eq_attr "cpu" "power5"))
+   "iq_power5")
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/power6.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power6.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power6.md	2012-07-06 19:50:30.078779999 -0700
+@@ -216,6 +216,11 @@
+        (eq_attr "cpu" "power6"))
+   "FXU_power6")
+ 
++(define_insn_reservation "power6-popcnt" 1
++  (and (eq_attr "type" "popcnt")
++       (eq_attr "cpu" "power6"))
++  "FXU_power6")
++
+ (define_insn_reservation "power6-insert" 1
+   (and (eq_attr "type" "insert_word")
+        (eq_attr "cpu" "power6"))
+Index: gcc-4_7-branch/gcc/config/rs6000/power7.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power7.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power7.md	2012-07-06 19:50:30.078779999 -0700
+@@ -150,7 +150,7 @@
+ ; FX Unit
+ (define_insn_reservation "power7-integer" 1
+   (and (eq_attr "type" "integer,insert_word,insert_dword,shift,trap,\
+-                        var_shift_rotate,exts,isel")
++                        var_shift_rotate,exts,isel,popcnt")
+        (eq_attr "cpu" "power7"))
+   "DU_power7,FXU_power7")
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:44:38.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:50:30.078779999 -0700
+@@ -144,7 +144,7 @@
+ 
+ ;; Define an insn type attribute.  This is used in function unit delay
+ ;; computations.
+-(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel"
++(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel,popcnt"
+   (const_string "integer"))
+ 
+ ;; Define floating point instruction sub-types for use with Xfpu.md
+@@ -2329,13 +2329,17 @@
+         (unspec:GPR [(match_operand:GPR 1 "gpc_reg_operand" "r")]
+                      UNSPEC_POPCNTB))]
+   "TARGET_POPCNTB"
+-  "popcntb %0,%1")
++  "popcntb %0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "popcnt")])
+ 
+ (define_insn "popcntd<mode>2"
+   [(set (match_operand:GPR 0 "gpc_reg_operand" "=r")
+ 	(popcount:GPR (match_operand:GPR 1 "gpc_reg_operand" "r")))]
+   "TARGET_POPCNTD"
+-  "popcnt<wd> %0,%1")
++  "popcnt<wd> %0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "popcnt")])
+ 
+ (define_expand "popcount<mode>2"
+   [(set (match_operand:GPR 0 "gpc_reg_operand" "")
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
new file mode 100644
index 0000000..d5c9165
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Pending
+
+gcc-4.8 is compatible with texinfo-5, so this is only temporary fix 
+(we don't need info files on target)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr gcc-4.7.2.orig/configure.ac gcc-4.7.2/configure.ac
+--- gcc-4.7.2.orig/configure.ac	2013-04-04 09:10:24.600848496 +0200
++++ gcc-4.7.2/configure.ac	2013-04-04 09:51:51.808031042 +0200
+@@ -3031,7 +3031,7 @@
+     # For an installed makeinfo, we require it to be from texinfo 4.7 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
+diff -uNr gcc-4.7.2.orig/gcc/configure.ac gcc-4.7.2/gcc/configure.ac
+--- gcc-4.7.2.orig/gcc/configure.ac	2013-04-04 09:10:30.523848931 +0200
++++ gcc-4.7.2/gcc/configure.ac	2013-04-04 09:52:16.111032826 +0200
+@@ -871,7 +871,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER(MAKEINFO, makeinfo, --version,
+   [GNU texinfo.* \([0-9][0-9.]*\)],
+-  [4.[7-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++  [4.[7-9]*|4.[1-9][0-9]*])
+ if test $gcc_cv_prog_makeinfo_modern = no; then
+   AC_MSG_WARN([
+ *** Makeinfo is missing or too old.
+diff -uNr gcc-4.7.2.orig/libgomp/configure.ac gcc-4.7.2/libgomp/configure.ac
+--- gcc-4.7.2.orig/libgomp/configure.ac	2010-12-06 01:50:04.000000000 +0100
++++ gcc-4.7.2/libgomp/configure.ac	2013-04-04 09:51:29.571029410 +0200
+@@ -129,7 +129,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ 
+diff -uNr gcc-4.7.2.orig/libiberty/configure.ac gcc-4.7.2/libiberty/configure.ac
+--- gcc-4.7.2.orig/libiberty/configure.ac	2011-08-22 18:54:02.000000000 +0200
++++ gcc-4.7.2/libiberty/configure.ac	2013-04-04 09:51:20.685028758 +0200
+@@ -84,6 +84,12 @@
+ 	    AC_MSG_WARN([
+ *** Makeinfo is too old. Info documentation will not be built.])
+ 	  ;;
++	  x*\ [[5-9]].* )
++	    MAKEINFO="@echo $MAKEINFO is too new, 5.0 or newer does not work; true"
++	    BUILD_INFO=
++	    AC_MSG_WARN([
++*** Makeinfo is too new. Info documentation will not be built.])
++	  ;;
+ 	esac
+ 	;;
+     esac
+diff -uNr gcc-4.7.2.orig/libitm/configure.ac gcc-4.7.2/libitm/configure.ac
+--- gcc-4.7.2.orig/libitm/configure.ac	2012-02-13 22:46:38.000000000 +0100
++++ gcc-4.7.2/libitm/configure.ac	2013-04-04 09:51:59.676031620 +0200
+@@ -140,7 +140,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ 
+diff -uNr gcc-4.7.2.orig/libquadmath/configure.ac gcc-4.7.2/libquadmath/configure.ac
+--- gcc-4.7.2.orig/libquadmath/configure.ac	2012-05-31 20:57:56.000000000 +0200
++++ gcc-4.7.2/libquadmath/configure.ac	2013-04-04 09:49:52.432022281 +0200
+@@ -48,7 +48,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+                    [GNU texinfo.* \([0-9][0-9.]*\)],
+-                   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++                   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ ACX_BUGURL([http://gcc.gnu.org/bugs.html])
+diff -uNr gcc-4.7.2.orig/libstdc++-v3/configure.ac gcc-4.7.2/libstdc++-v3/configure.ac
+--- gcc-4.7.2.orig/libstdc++-v3/configure.ac	2012-08-06 16:34:27.000000000 +0200
++++ gcc-4.7.2/libstdc++-v3/configure.ac	2013-04-04 09:49:57.483022652 +0200
+@@ -344,7 +344,7 @@
+ # that we can use it.
+ ACX_CHECK_PROG_VER([MAKEINFO], [makeinfo], [--version],
+ 		   [GNU texinfo.* \([0-9][0-9.]*\)],
+-		   [4.[4-9]*|4.[1-9][0-9]*|[5-9]*|[1-9][0-9]*])
++		   [4.[4-9]*|4.[1-9][0-9]*])
+ AM_CONDITIONAL(BUILD_INFO, test $gcc_cv_prog_makeinfo_modern = "yes")
+ 
+ # Check for doxygen
+diff -uNr gcc-4.7.2.orig/configure gcc-4.7.2/configure
+--- gcc-4.7.2.orig/configure	2013-04-04 10:23:58.009172414 +0200
++++ gcc-4.7.2/configure	2013-04-04 10:26:42.696184501 +0200
+@@ -7858,7 +7858,7 @@
+     # For an installed makeinfo, we require it to be from texinfo 4.7 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9]))' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch
new file mode 100644
index 0000000..bc01cd9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Inappropriate [configuration]
+
+GCC: disable MASK_RELAX_PIC_CALLS bit
+
+The new feature added after 4.3.3
+"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
+will cause cc1plus eat up all the system memory when build webkit-gtk.
+The function mips_get_pic_call_symbol keeps on recursively calling itself.
+Disable this feature to walk aside the bug.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Index: gcc-4_7-branch/gcc/configure
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure	2012-04-10 10:37:09.351387437 -0700
++++ gcc-4_7-branch/gcc/configure	2012-04-10 10:37:57.211389779 -0700
+@@ -25837,13 +25837,6 @@
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
+ $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
+ 
+Index: gcc-4_7-branch/gcc/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 10:37:09.339387366 -0700
++++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:37:57.215389769 -0700
+@@ -4027,13 +4027,6 @@
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
+ 
+     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
new file mode 100644
index 0000000..8946afc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
@@ -0,0 +1,32 @@
+We don't list dtrace in DEPENDS so we shouldn't be depending on this header. 
+It may or may not exist from preivous builds though. To be determinstic, disable
+sdt.h usage always. This avoids build failures if the header is removed after configure
+but before libgcc is compiled for example.
+
+RP 2012/8/7
+
+Upstream-Status: Inappropriate [hack]
+
+Index: git/gcc/configure
+===================================================================
+--- git.orig/gcc/configure	2012-08-07 21:18:42.319247701 +0000
++++ git/gcc/configure	2012-08-07 21:19:08.939247082 +0000
+@@ -26758,12 +26758,12 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+ $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+ have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-
+-fi
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#
++#fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+ $as_echo "$have_sys_sdt_h" >&6; }
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
new file mode 100644
index 0000000..aad234c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
@@ -0,0 +1,428 @@
+backport
+
+http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.7.2/gcc/configure.ac
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure.ac	2012-09-20 07:42:30.284941174 -0700
++++ gcc-4.7.2/gcc/configure.ac	2012-09-20 07:55:23.148970564 -0700
+@@ -118,6 +118,72 @@
+ 	local_prefix=/usr/local
+ fi
+ 
++AC_ARG_WITH([native-system-header-dir],
++  [  --with-native-system-header-dir=dir
++                          use dir as the directory to look for standard
++                          system header files in.  Defaults to /usr/include.],
++[
++ case ${with_native_system_header_dir} in
++ yes|no) AC_MSG_ERROR([bad value ${withval} given for --with-native-system-header-dir]) ;;
++ /* | [[A-Za-z]]:[[\\/]]*) ;;
++ *) AC_MSG_ERROR([--with-native-system-header-dir argument ${withval} must be an absolute directory]) ;;
++ esac
++ configured_native_system_header_dir="${withval}"
++], [configured_native_system_header_dir=])
++
++AC_ARG_WITH(build-sysroot,
++  [AS_HELP_STRING([--with-build-sysroot=sysroot],
++                  [use sysroot as the system root during the build])],
++  [if test x"$withval" != x ; then
++     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
++   fi],
++  [SYSROOT_CFLAGS_FOR_TARGET=])
++AC_SUBST(SYSROOT_CFLAGS_FOR_TARGET)
++
++AC_ARG_WITH(sysroot,
++[AS_HELP_STRING([[--with-sysroot[=DIR]]],
++ [search for usr/lib, usr/include, et al, within DIR])],
++[
++ case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
++ yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
++ *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
++ esac
++
++ TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
++ CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
++
++ if test "x$prefix" = xNONE; then
++  test_prefix=/usr/local
++ else
++  test_prefix=$prefix
++ fi
++ if test "x$exec_prefix" = xNONE; then
++  test_exec_prefix=$test_prefix
++ else
++  test_exec_prefix=$exec_prefix
++ fi
++ case ${TARGET_SYSTEM_ROOT} in
++ "${test_prefix}"|"${test_prefix}/"*|\
++ "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
++ '${prefix}'|'${prefix}/'*|\
++ '${exec_prefix}'|'${exec_prefix}/'*)
++   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
++   TARGET_SYSTEM_ROOT_DEFINE="$t"
++   ;;
++ esac
++], [
++ TARGET_SYSTEM_ROOT=
++ TARGET_SYSTEM_ROOT_DEFINE=
++ CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
++])
++AC_SUBST(TARGET_SYSTEM_ROOT)
++AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
++AC_SUBST(CROSS_SYSTEM_HEADER_DIR)
++
+ # Don't set gcc_gxx_include_dir to gxx_include_dir since that's only
+ # passed in by the toplevel make and thus we'd get different behavior
+ # depending on where we built the sources.
+@@ -149,7 +215,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+@@ -733,68 +801,6 @@
+ ], [enable_shared=yes])
+ AC_SUBST(enable_shared)
+ 
+-AC_ARG_WITH([native-system-header-dir],
+-  [  --with-native-system-header-dir=dir
+-                          use dir as the directory to look for standard
+-                          system header files in.  Defaults to /usr/include.],
+-[
+- case ${with_native_system_header_dir} in
+- yes|no) AC_MSG_ERROR([bad value ${withval} given for --with-native-system-header-dir]) ;;
+- /* | [[A-Za-z]]:[[\\/]]*) ;;
+- *) AC_MSG_ERROR([--with-native-system-header-dir argument ${withval} must be an absolute directory]) ;;
+- esac
+- configured_native_system_header_dir="${withval}"
+-], [configured_native_system_header_dir=])
+-
+-AC_ARG_WITH(build-sysroot, 
+-  [AS_HELP_STRING([--with-build-sysroot=sysroot],
+-                  [use sysroot as the system root during the build])],
+-  [if test x"$withval" != x ; then
+-     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
+-   fi],
+-  [SYSROOT_CFLAGS_FOR_TARGET=])
+-AC_SUBST(SYSROOT_CFLAGS_FOR_TARGET)
+-
+-AC_ARG_WITH(sysroot,
+-[AS_HELP_STRING([[--with-sysroot[=DIR]]],
+-		[search for usr/lib, usr/include, et al, within DIR])],
+-[
+- case ${with_sysroot} in
+- yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+- *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+- esac
+-   
+- TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
+- CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
+-	
+- if test "x$prefix" = xNONE; then
+-  test_prefix=/usr/local
+- else
+-  test_prefix=$prefix
+- fi
+- if test "x$exec_prefix" = xNONE; then
+-  test_exec_prefix=$test_prefix
+- else
+-  test_exec_prefix=$exec_prefix
+- fi
+- case ${TARGET_SYSTEM_ROOT} in
+- "${test_prefix}"|"${test_prefix}/"*|\
+- "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
+- '${prefix}'|'${prefix}/'*|\
+- '${exec_prefix}'|'${exec_prefix}/'*)
+-   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
+-   TARGET_SYSTEM_ROOT_DEFINE="$t"
+-   ;;
+- esac
+-], [
+- TARGET_SYSTEM_ROOT=
+- TARGET_SYSTEM_ROOT_DEFINE=
+- CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
+-])
+-AC_SUBST(TARGET_SYSTEM_ROOT)
+-AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
+-AC_SUBST(CROSS_SYSTEM_HEADER_DIR)
+-
+ AC_ARG_WITH(specs,
+   [AS_HELP_STRING([--with-specs=SPECS],
+                   [add SPECS to driver command-line processing])],
+Index: gcc-4.7.2/gcc/configure
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure	2012-09-20 07:42:30.284941174 -0700
++++ gcc-4.7.2/gcc/configure	2012-09-20 07:55:31.788970893 -0700
+@@ -757,10 +757,6 @@
+ REPORT_BUGS_TO
+ PKGVERSION
+ CONFIGURE_SPECS
+-CROSS_SYSTEM_HEADER_DIR
+-TARGET_SYSTEM_ROOT_DEFINE
+-TARGET_SYSTEM_ROOT
+-SYSROOT_CFLAGS_FOR_TARGET
+ enable_shared
+ enable_fixed_point
+ enable_decimal_float
+@@ -798,6 +794,10 @@
+ CFLAGS
+ CC
+ GENINSRC
++CROSS_SYSTEM_HEADER_DIR
++TARGET_SYSTEM_ROOT_DEFINE
++TARGET_SYSTEM_ROOT
++SYSROOT_CFLAGS_FOR_TARGET
+ target_subdir
+ host_subdir
+ build_subdir
+@@ -859,6 +859,9 @@
+ enable_option_checking
+ with_build_libsubdir
+ with_local_prefix
++with_native_system_header_dir
++with_build_sysroot
++with_sysroot
+ with_gxx_include_dir
+ with_cpp_install_dir
+ enable_generated_files_in_srcdir
+@@ -883,9 +886,6 @@
+ enable_objc_gc
+ with_dwarf2
+ enable_shared
+-with_native_system_header_dir
+-with_build_sysroot
+-with_sysroot
+ with_specs
+ with_pkgversion
+ with_bugurl
+@@ -1639,6 +1639,12 @@
+   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
+   --with-build-libsubdir=DIR  Directory where to find libraries for build system
+   --with-local-prefix=DIR specifies directory to put local include
++  --with-native-system-header-dir=dir
++                          use dir as the directory to look for standard
++                          system header files in.  Defaults to /usr/include.
++  --with-build-sysroot=sysroot
++                          use sysroot as the system root during the build
++  --with-sysroot[=DIR]    search for usr/lib, usr/include, et al, within DIR
+   --with-gxx-include-dir=DIR
+                           specifies directory to put g++ header files
+   --with-cpp-install-dir=DIR
+@@ -1651,12 +1657,6 @@
+   --with-as               arrange to use the specified as (full pathname)
+   --with-stabs            arrange to use stabs instead of host debug format
+   --with-dwarf2           force the default debug format to be DWARF 2
+-  --with-native-system-header-dir=dir
+-                          use dir as the directory to look for standard
+-                          system header files in.  Defaults to /usr/include.
+-  --with-build-sysroot=sysroot
+-                          use sysroot as the system root during the build
+-  --with-sysroot[=DIR]    search for usr/lib, usr/include, et al, within DIR
+   --with-specs=SPECS      add SPECS to driver command-line processing
+   --with-pkgversion=PKG   Use PKG in the version string in place of "GCC"
+   --with-bugurl=URL       Direct users to URL to report a bug
+@@ -3288,6 +3288,82 @@
+ 	local_prefix=/usr/local
+ fi
+ 
++
++# Check whether --with-native-system-header-dir was given.
++if test "${with_native_system_header_dir+set}" = set; then :
++  withval=$with_native_system_header_dir;
++ case ${with_native_system_header_dir} in
++ yes|no) as_fn_error "bad value ${withval} given for --with-native-system-header-dir" "$LINENO" 5 ;;
++ /* | [A-Za-z]:[\\/]*) ;;
++ *) as_fn_error "--with-native-system-header-dir argument ${withval} must be an absolute directory" "$LINENO" 5 ;;
++ esac
++ configured_native_system_header_dir="${withval}"
++
++else
++  configured_native_system_header_dir=
++fi
++
++
++
++# Check whether --with-build-sysroot was given.
++if test "${with_build_sysroot+set}" = set; then :
++  withval=$with_build_sysroot; if test x"$withval" != x ; then
++     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
++   fi
++else
++  SYSROOT_CFLAGS_FOR_TARGET=
++fi
++
++
++
++
++# Check whether --with-sysroot was given.
++if test "${with_sysroot+set}" = set; then :
++  withval=$with_sysroot;
++ case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
++ yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
++ *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
++ esac
++
++ TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
++ CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
++
++ if test "x$prefix" = xNONE; then
++  test_prefix=/usr/local
++ else
++  test_prefix=$prefix
++ fi
++ if test "x$exec_prefix" = xNONE; then
++  test_exec_prefix=$test_prefix
++ else
++  test_exec_prefix=$exec_prefix
++ fi
++ case ${TARGET_SYSTEM_ROOT} in
++ "${test_prefix}"|"${test_prefix}/"*|\
++ "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
++ '${prefix}'|'${prefix}/'*|\
++ '${exec_prefix}'|'${exec_prefix}/'*)
++   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
++   TARGET_SYSTEM_ROOT_DEFINE="$t"
++   ;;
++ esac
++
++else
++
++ TARGET_SYSTEM_ROOT=
++ TARGET_SYSTEM_ROOT_DEFINE=
++ CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
++
++fi
++
++
++
++
++
+ # Don't set gcc_gxx_include_dir to gxx_include_dir since that's only
+ # passed in by the toplevel make and thus we'd get different behavior
+ # depending on where we built the sources.
+@@ -3321,7 +3397,9 @@
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+@@ -7220,78 +7298,6 @@
+ 
+ 
+ 
+-# Check whether --with-native-system-header-dir was given.
+-if test "${with_native_system_header_dir+set}" = set; then :
+-  withval=$with_native_system_header_dir;
+- case ${with_native_system_header_dir} in
+- yes|no) as_fn_error "bad value ${withval} given for --with-native-system-header-dir" "$LINENO" 5 ;;
+- /* | [A-Za-z]:[\\/]*) ;;
+- *) as_fn_error "--with-native-system-header-dir argument ${withval} must be an absolute directory" "$LINENO" 5 ;;
+- esac
+- configured_native_system_header_dir="${withval}"
+-
+-else
+-  configured_native_system_header_dir=
+-fi
+-
+-
+-
+-# Check whether --with-build-sysroot was given.
+-if test "${with_build_sysroot+set}" = set; then :
+-  withval=$with_build_sysroot; if test x"$withval" != x ; then
+-     SYSROOT_CFLAGS_FOR_TARGET="--sysroot=$withval"
+-   fi
+-else
+-  SYSROOT_CFLAGS_FOR_TARGET=
+-fi
+-
+-
+-
+-
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
+- case ${with_sysroot} in
+- yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+- *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+- esac
+-
+- TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
+- CROSS_SYSTEM_HEADER_DIR='$(TARGET_SYSTEM_ROOT)$${sysroot_headers_suffix}$(NATIVE_SYSTEM_HEADER_DIR)'
+-
+- if test "x$prefix" = xNONE; then
+-  test_prefix=/usr/local
+- else
+-  test_prefix=$prefix
+- fi
+- if test "x$exec_prefix" = xNONE; then
+-  test_exec_prefix=$test_prefix
+- else
+-  test_exec_prefix=$exec_prefix
+- fi
+- case ${TARGET_SYSTEM_ROOT} in
+- "${test_prefix}"|"${test_prefix}/"*|\
+- "${test_exec_prefix}"|"${test_exec_prefix}/"*|\
+- '${prefix}'|'${prefix}/'*|\
+- '${exec_prefix}'|'${exec_prefix}/'*)
+-   t="$TARGET_SYSTEM_ROOT_DEFINE -DTARGET_SYSTEM_ROOT_RELOCATABLE"
+-   TARGET_SYSTEM_ROOT_DEFINE="$t"
+-   ;;
+- esac
+-
+-else
+-
+- TARGET_SYSTEM_ROOT=
+- TARGET_SYSTEM_ROOT_DEFINE=
+- CROSS_SYSTEM_HEADER_DIR='$(gcc_tooldir)/sys-include'
+-
+-fi
+-
+-
+-
+-
+-
+-
+ # Check whether --with-specs was given.
+ if test "${with_specs+set}" = set; then :
+   withval=$with_specs; CONFIGURE_SPECS=$withval
+@@ -18013,7 +18019,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18016 "configure"
++#line 18022 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -18119,7 +18125,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18122 "configure"
++#line 18128 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch
new file mode 100644
index 0000000..2773b42
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
+  used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
+  directory.
+
+Index: gcc-4_7-branch/libgfortran/configure
+===================================================================
+--- gcc-4_7-branch.orig/libgfortran/configure	2012-04-10 10:17:24.055330044 -0700
++++ gcc-4_7-branch/libgfortran/configure	2012-04-10 10:42:26.159402591 -0700
+@@ -12689,7 +12689,7 @@
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+Index: gcc-4_7-branch/libgfortran/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/libgfortran/configure.ac	2012-04-10 10:17:24.063330046 -0700
++++ gcc-4_7-branch/libgfortran/configure.ac	2012-04-10 10:42:26.159402591 -0700
+@@ -227,7 +227,7 @@
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..964c4bb
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+---
+ configure    |    2 +-
+ configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4_7-branch/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/configure.ac	2012-04-10 10:19:50.923337154 -0700
++++ gcc-4_7-branch/configure.ac	2012-04-10 10:19:54.911337344 -0700
+@@ -2825,7 +2825,7 @@
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+Index: gcc-4_7-branch/configure
+===================================================================
+--- gcc-4_7-branch.orig/configure	2012-04-10 10:19:50.911337153 -0700
++++ gcc-4_7-branch/configure	2012-04-10 10:19:54.915337349 -0700
+@@ -7368,7 +7368,7 @@
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..ff136e1
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Pending
+
+Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
+
+This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
+
+Other changes I had to do include:
+
+- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
+
+- passing the right CFLAGS to configure scripts as exported environment variables
+
+I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
+
+Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
+
+Paolo
+
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+        PR bootstrap/32009
+        PR bootstrap/32161
+
+	* configure.ac (CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Compute here.
+	* configure: Regenerate.
+
+	* Makefile.def: Define stage_libcflags for all bootstrap stages.
+	* Makefile.tpl (BOOT_LIBCFLAGS, STAGE2_LIBCFLAGS, STAGE3_LIBCFLAGS,
+	STAGE4_LIBCFLAGS): New.
+	(CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Subst from autoconf, without
+	$(SYSROOT_CFLAGS_FOR_TARGET) and $(DEBUG_PREFIX_CFLAGS_FOR_TARGET).
+	(BASE_TARGET_EXPORTS): Append them here to C{,XX}FLAGS.
+	(EXTRA_TARGET_FLAGS): Append them here to {LIB,}C{,XX}FLAGS.
+	(configure-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags
+	for target modules.  Don't export LIBCFLAGS.
+	(all-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags; pass
+	$(BASE_FLAGS_TO_PASS) where [+args+] was passed, and [+args+] after
+	the overridden CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
+	(invocations of `all'): Replace $(TARGET_FLAGS_TO_PASS) with
+	$(EXTRA_TARGET_FLAGS), $(FLAGS_TO_PASS) with $(EXTRA_HOST_FLAGS).
+	* Makefile.in: Regenerate.
+
+config:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* mh-ppc-darwin (BOOT_CFLAGS): Reenable.
+
+gcc:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* doc/install.texi: Correct references to CFLAGS, replacing them
+	with BOOT_CFLAGS.  Document flags used during bootstrap for
+	target libraries.
+
+
+---
+ Makefile.def           |   25 
+ Makefile.in            | 1845 ++++++++++++++++++++++++++++++-------------------
+ Makefile.tpl           |   91 +-
+ config/mh-ppc-darwin   |    3 
+ configure              |   36 
+ configure.ac           |   32 
+ gcc/Makefile.in        |    2 
+ gcc/configure          |    6 
+ gcc/configure.ac       |    3 
+ gcc/doc/install.texi   |   56 -
+ libiberty/Makefile.in  |  162 ++--
+ libiberty/configure    |   46 -
+ libiberty/configure.ac |   43 -
+ 13 files changed, 1454 insertions(+), 896 deletions(-)
+
+Index: gcc-4_7-branch/configure
+===================================================================
+--- gcc-4_7-branch.orig/configure	2012-04-10 10:22:05.807343683 -0700
++++ gcc-4_7-branch/configure	2012-04-10 10:37:24.243388086 -0700
+@@ -6695,6 +6695,38 @@
+ 
+ 
+ 
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" = x; then
++  CFLAGS_FOR_TARGET=$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
++  esac
++fi
++
++
++if test "x$CXXFLAGS_FOR_TARGET" = x; then
++  CXXFLAGS_FOR_TARGET=$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
++  esac
++fi
++
++
+ # Handle --with-headers=XXX.  If the value is not "yes", the contents of
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
new file mode 100644
index 0000000..70d3c53
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
@@ -0,0 +1,33 @@
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ gcc/Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -4553,7 +4553,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
++	headers="$(sort $(PLUGIN_HEADERS))"; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
+-- 
+1.7.10.2
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
new file mode 100644
index 0000000..7e03a3a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
@@ -0,0 +1,31 @@
+The LINK_SPEC for linux gets overwritten by linux-eabi.h which
+means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
+the option is not passed to linker when chosing march=armv4
+This patch redefines this in linux-eabi.h and reinserts it
+for eabi defaulting toolchains.
+
+We might want to send it upstream
+
+Upstream-Status: Pending
+
+-Khem
+Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-08-21 22:54:12.448453417 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-08-21 23:05:18.008478722 -0700
+@@ -78,10 +78,14 @@
+      %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
+      %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
++/* For armv4 we pass --fix-v4bx to linker to support EABI */
++#undef TARGET_FIX_V4BX_SPEC
++#define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC BE8_LINK_SPEC						\
++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC			\
+   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
+ 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch
new file mode 100644
index 0000000..607129a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending
+
+Add /sw/include and /opt/include based on the original
+zecke-no-host-includes.patch patch.  The original patch checked for
+/usr/include, /sw/include and /opt/include and then triggered a failure and
+aborted.
+
+Instead, we add the two missing items to the current scan.  If the user
+wants this to be a failure, they can add "-Werror=poison-system-directories".
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: gcc-4_7-branch/gcc/incpath.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/incpath.c	2012-04-10 10:37:09.343387385 -0700
++++ gcc-4_7-branch/gcc/incpath.c	2012-04-10 10:37:18.975387919 -0700
+@@ -371,7 +371,9 @@
+          {
+           if ((!strncmp (p->name, "/usr/include", 12))
+               || (!strncmp (p->name, "/usr/local/include", 18))
+-              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
++              || (!strncmp (p->name, "/sw/include", 11))
++              || (!strncmp (p->name, "/opt/include", 12)))
+             warning (OPT_Wpoison_system_directories,
+                      "include location \"%s\" is unsafe for "
+                      "cross-compilation",
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
new file mode 100644
index 0000000..82a55c9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
@@ -0,0 +1,223 @@
+Upstream-Status: Inappropriate [distribution: codesourcery]
+
+       gcc/
+       2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+       * c-incpath.c: Include toplev.h.
+       (merge_include_chains): Use warning instead of cpp_error for
+       system directory poisoning diagnostic.
+       * Makefile.in (c-incpath.o): Depend on toplev.h.
+       * gcc.c (LINK_COMMAND_SPEC): Pass
+       --error-poison-system-directories if
+       -Werror=poison-system-directories.
+
+       2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+       * common.opt (--Wno-poison-system-directories): New.
+       * doc/invoke.texi (-Wno-poison-system-directories): Document.
+       * c-incpath.c: Include flags.h.
+       (merge_include_chains): Check flag_poison_system_directories.
+       * gcc.c (LINK_COMMAND_SPEC): Pass --no-poison-system-directories
+       to linker if -Wno-poison-system-directories.
+       * Makefile.in (c-incpath.o): Depend on $(FLAGS_H).
+
+       2007-03-20  Daniel Jacobowitz  <dan@codesourcery.com>
+                   Joseph Myers  <joseph@codesourcery.com>
+       * configure.ac (--enable-poison-system-directories): New option.
+       * configure, config.in: Regenerate.
+       * c-incpath.c (merge_include_chains): If
+       ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of
+       /usr/include, /usr/local/include or /usr/X11R6/include.
+
+Index: gcc-4.7.2/gcc/common.opt
+===================================================================
+--- gcc-4.7.2.orig/gcc/common.opt	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/common.opt	2012-09-20 07:40:54.708937540 -0700
+@@ -582,6 +582,10 @@
+ Common Var(warn_padded) Warning
+ Warn when padding is required to align structure members
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one local variable shadows another
+Index: gcc-4.7.2/gcc/config.in
+===================================================================
+--- gcc-4.7.2.orig/gcc/config.in	2012-09-20 00:23:55.000000000 -0700
++++ gcc-4.7.2/gcc/config.in	2012-09-20 07:40:54.708937540 -0700
+@@ -144,6 +144,12 @@
+ #endif
+ 
+ 
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+Index: gcc-4.7.2/gcc/configure.ac
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure.ac	2012-09-20 07:30:27.000000000 -0700
++++ gcc-4.7.2/gcc/configure.ac	2012-09-20 07:40:54.708937540 -0700
+@@ -4989,6 +4989,16 @@
+                 [specify that runtime libraries should be
+                  installed in a compiler-specific directory])])
+ 
++AC_ARG_ENABLE([poison-system-directories],
++             AS_HELP_STRING([--enable-poison-system-directories],
++                            [warn for use of native system header directories]),,
++             [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++           [1],
++           [Define to warn for use of native system header directories])
++fi
++
+ # Substitute configuration variables
+ AC_SUBST(subdirs)
+ AC_SUBST(srcdir)
+Index: gcc-4.7.2/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.7.2.orig/gcc/doc/invoke.texi	2012-09-14 13:45:27.000000000 -0700
++++ gcc-4.7.2/gcc/doc/invoke.texi	2012-09-20 07:40:54.712937541 -0700
+@@ -260,6 +260,7 @@
+ -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
+ -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
+ -Wpointer-arith  -Wno-pointer-to-int-cast @gol
++-Wno-poison-system-directories @gol
+ -Wredundant-decls @gol
+ -Wreturn-type  -Wsequence-point  -Wshadow @gol
+ -Wsign-compare  -Wsign-conversion  -Wstack-protector @gol
+@@ -3879,6 +3880,14 @@
+  for most targets, it is made up of code and thus requires the stack
+  to be made executable in order for the program to work properly.
+ 
++@item -Wno-poison-system-directories
++@opindex Wno-poison-system-directories
++Do not warn for @option{-I} or @option{-L} options using system
++directories such as @file{/usr/include} when cross compiling.  This
++option is intended for use in chroot environments when such
++directories contain the correct headers and libraries for the target
++system rather than the host.
++
+ @item -Wfloat-equal
+ @opindex Wfloat-equal
+ @opindex Wno-float-equal
+Index: gcc-4.7.2/gcc/gcc.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/gcc.c	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/gcc.c	2012-09-20 07:40:54.716937541 -0700
+@@ -673,6 +673,8 @@
+     %{flto} %{flto=*} %l " LINK_PIE_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
++    %{Wno-poison-system-directories:--no-poison-system-directories}\
++    %{Werror=poison-system-directories:--error-poison-system-directories}\
+     %{static:} %{L*} %(mfwrap) %(link_libgcc) %o\
+     %{fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
+     %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
+Index: gcc-4.7.2/gcc/incpath.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/incpath.c	2012-01-26 15:34:58.000000000 -0800
++++ gcc-4.7.2/gcc/incpath.c	2012-09-20 07:40:54.716937541 -0700
+@@ -361,6 +361,24 @@
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[QUOTE]; p; p = p->next)
++         {
++          if ((!strncmp (p->name, "/usr/include", 12))
++              || (!strncmp (p->name, "/usr/local/include", 18))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++            warning (OPT_Wpoison_system_directories,
++                     "include location \"%s\" is unsafe for "
++                     "cross-compilation",
++                     p->name);
++         }
++    }
++#endif
+ }
+ 
+ /* Use given -I paths for #include "..." but not #include <...>, and
+Index: gcc-4.7.2/gcc/Makefile.in
+===================================================================
+--- gcc-4.7.2.orig/gcc/Makefile.in	2012-08-06 07:34:27.000000000 -0700
++++ gcc-4.7.2/gcc/Makefile.in	2012-09-20 07:40:54.716937541 -0700
+@@ -2065,7 +2065,7 @@
+ 
+ incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
+ 		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h $(TARGET_H) \
+-		$(MACHMODE_H)
++		$(MACHMODE_H) $(FLAGS_H) toplev.h
+ 
+ CFLAGS-prefix.o += -DPREFIX=\"$(prefix)\" -DBASEVER=$(BASEVER_s)
+ prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h prefix.h \
+Index: gcc-4.7.2/gcc/configure
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure	2012-09-20 07:30:27.000000000 -0700
++++ gcc-4.7.2/gcc/configure	2012-09-20 07:41:08.548938066 -0700
+@@ -914,6 +914,7 @@
+ with_system_zlib
+ enable_maintainer_mode
+ enable_version_specific_runtime_libs
++enable_poison_system_directories
+ enable_plugin
+ enable_libquadmath_support
+ with_linker_hash_style
+@@ -1627,6 +1628,8 @@
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be installed
+                           in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --disable-libquadmath-support
+                           disable libquadmath support for Fortran
+@@ -18010,7 +18013,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18013 "configure"
++#line 18016 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -18116,7 +18119,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18119 "configure"
++#line 18122 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -27129,6 +27132,19 @@
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Substitute configuration variables
+ 
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch
new file mode 100644
index 0000000..1648b3b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Pending
+
+Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -41,13 +41,22 @@
+ 
+ #include <clocale>
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ #define _GLIBCXX_NUM_CATEGORIES 0
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 
++#ifdef __UCLIBC__
++  typedef __ctype_touplow_t*	__c_locale;
++#else
+   typedef int*			__c_locale;
++#endif
+ 
+   // Convert numeric value of type double and long double to string and
+   // return length of string.  If vsnprintf is available use it, otherwise
+Index: gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -34,6 +34,11 @@
+ 
+ // Information as gleaned from /usr/include/ctype.h
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+@@ -42,7 +47,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+   struct ctype_base
+   {
+     // Non-standard typedefs.
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t*	__to_type;
++#else
+     typedef const int* 		__to_type;
++#endif
+ 
+     // NB: Offsets into ctype<char>::_M_table force a particular size
+     // on the mask type. Because of this, we don't use an enum.
+Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
+@@ -264,5 +264,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
+ #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
+ #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
+   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
++#ifdef __UCLIBC__
++// This is because __c_locale is of type __ctype_touplow_t* which is short on uclibc. for glibc its int*
++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
++#else
+ _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
++#endif
+ #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch
new file mode 100644
index 0000000..c2fe792
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch
@@ -0,0 +1,61 @@
+ac_fn_c_try_compile doesnt seem to keep the intermediate files
+which are needed for sjlj test to pass since it greps into the
+generated file. So we run the compiler command using AC_TRY_COMMAND
+which then generates the needed .s file
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: trunk/libgcc/configure
+===================================================================
+--- trunk.orig/libgcc/configure	2012-03-01 22:59:10.112444433 -0800
++++ trunk/libgcc/configure	2012-03-01 22:59:50.424446325 -0800
+@@ -4525,17 +4525,19 @@
+ }
+ 
+ _ACEOF
+-CFLAGS_hold=$CFLAGS
+-CFLAGS="--save-temps -fexceptions"
+ libgcc_cv_lib_sjlj_exceptions=unknown
+-if ac_fn_c_try_compile; then :
++if { ac_try='${CC-cc} -fexceptions -S conftest.c -o conftest.s 1>&5'
++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }; }; then
+   if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
+     libgcc_cv_lib_sjlj_exceptions=yes
+   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
+     libgcc_cv_lib_sjlj_exceptions=no
+   fi
+ fi
+-CFLAGS=$CFLAGS_hold
+ rm -f conftest*
+ 
+ fi
+Index: trunk/libgcc/configure.ac
+===================================================================
+--- trunk.orig/libgcc/configure.ac	2012-03-01 22:59:10.128444406 -0800
++++ trunk/libgcc/configure.ac	2012-03-01 22:59:50.428446373 -0800
+@@ -209,16 +209,14 @@
+   bar();
+ }
+ ])])
+-CFLAGS_hold=$CFLAGS
+-CFLAGS="--save-temps -fexceptions"
+ libgcc_cv_lib_sjlj_exceptions=unknown
+-AS_IF([ac_fn_c_try_compile],
+-  [if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
++if AC_TRY_COMMAND(${CC-cc} -fexceptions -S conftest.c -o conftest.s 1>&AS_MESSAGE_LOG_FD); then
++  if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
+     libgcc_cv_lib_sjlj_exceptions=yes
+   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
+     libgcc_cv_lib_sjlj_exceptions=no
+-  fi])
+-CFLAGS=$CFLAGS_hold
++  fi
++fi
+ rm -f conftest*
+ ])
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch
new file mode 100644
index 0000000..9580b23
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch
@@ -0,0 +1,29 @@
+libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
+when running on am x86_64 build host.
+
+This patch stops this speading to libdir in the libstdc++.la file within libtool.
+Aguably, it shouldn't be passing this into libtool in the first place but
+for now this resolves the nastiest problems this causes.
+
+func_normal_abspath would resolve an empty path to `pwd` so we need
+to filter the zero case.
+
+RP 2012/8/24
+
+Upstream-Status: Pending
+
+Index: git/ltmain.sh
+===================================================================
+--- git.orig/ltmain.sh	2012-08-24 11:45:58.597087961 +0000
++++ git/ltmain.sh	2012-08-24 12:18:37.961042581 +0000
+@@ -6359,6 +6359,10 @@
+ 	func_warning "ignoring multiple \`-rpath's for a libtool library"
+ 
+       install_libdir="$1"
++      if test -n "$install_libdir"; then
++	func_normal_abspath "$install_libdir"
++	install_libdir=$func_normal_abspath_result
++      fi
+ 
+       oldlibs=
+       if test -z "$rpath"; then
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
new file mode 100644
index 0000000..a42569e
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
@@ -0,0 +1,19 @@
+MIPS64 defaults to n32 ABI, this patch makes it
+so that it defaults to N64 ABI
+
+Upstream-Status: Inappropriate [OE config specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-04-22 19:30:21.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-04-22 21:09:57.783403173 -0700
+@@ -1750,7 +1750,7 @@
+ mips64*-*-linux* | mipsisa64*-*-linux*)
+ 	tm_file="dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h ${tm_file} mips/gnu-user.h mips/gnu-user64.h mips/linux64.h"
+ 	tmake_file="${tmake_file} mips/t-linux64"
+-	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_N32"
++	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_64"
+ 	case ${target} in
+ 		mips64el-st-linux-gnu)
+ 			tm_file="${tm_file} mips/st.h"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch
new file mode 100644
index 0000000..6e7536b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++ 
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc 
+driver. This patch adds such an option which only disables the -lstdc++.
+
+A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to 
+do this officially, the likely answer is don't build libstdc++ separately.
+
+RP 29/6/10
+
+Index: gcc-4_7-branch/gcc/cp/g++spec.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/cp/g++spec.c	2012-04-10 10:17:24.647330074 -0700
++++ gcc-4_7-branch/gcc/cp/g++spec.c	2012-04-10 10:37:49.479389235 -0700
+@@ -127,6 +127,7 @@
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+Index: gcc-4_7-branch/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4_7-branch.orig/gcc/doc/invoke.texi	2012-04-10 10:37:09.343387385 -0700
++++ gcc-4_7-branch/gcc/doc/invoke.texi	2012-04-10 10:37:49.483389340 -0700
+@@ -194,7 +194,7 @@
+ -fno-pretty-templates @gol
+ -frepo  -fno-rtti  -fstats  -ftemplate-depth=@var{n} @gol
+ -fno-threadsafe-statics -fuse-cxa-atexit  -fno-weak  -nostdinc++ @gol
+--fno-default-inline  -fvisibility-inlines-hidden @gol
++-nostdlib++ -fno-default-inline  -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
+ -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
+ -Wdelete-non-virtual-dtor -Wnarrowing -Wnoexcept @gol
+@@ -445,7 +445,7 @@
+ @gccoptlist{@var{object-file-name}  -l@var{library} @gol
+ -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
+ -s  -static  -static-libgcc  -static-libstdc++ -shared  @gol
+--shared-libgcc  -symbolic @gol
++-shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}}
+ 
+@@ -9438,6 +9438,11 @@
+ libc.  These entry points should be supplied through some other
+ mechanism when this option is specified.
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
+ @cindex @option{-lgcc}, use with @option{-nostdlib}
+ @cindex @option{-nostdlib} and unresolved references
+ @cindex unresolved references and @option{-nostdlib}
+Index: gcc-4_7-branch/gcc/c-family/c.opt
+===================================================================
+--- gcc-4_7-branch.orig/gcc/c-family/c.opt	2012-04-10 10:17:24.667330076 -0700
++++ gcc-4_7-branch/gcc/c-family/c.opt	2012-04-10 10:37:49.483389340 -0700
+@@ -1171,6 +1171,10 @@
+ C++ ObjC++
+ Do not search standard system include directories for C++
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+Index: gcc-4_7-branch/gcc/gcc.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/gcc.c	2012-04-10 10:37:09.343387385 -0700
++++ gcc-4_7-branch/gcc/gcc.c	2012-04-10 10:37:49.487389409 -0700
+@@ -681,6 +681,7 @@
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov}\
+     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
+ #endif
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
new file mode 100644
index 0000000..92a5d9e
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj
+
+Source-url: http://gcc.gnu.org/ml/gcc-patches/2012-05/msg01362.html
+
+Currently, powerpc-linux gcc -Os -mno-multiple uses out-of-linux gpr
+save and restore functions when saving/restoring just one gpr.  That's
+quite silly since the function call requires more instructions and is
+slower than an inline save/restore.  The only case where it might win
+is when no fprs are restored and the restore function can tear down
+the frame and exit (also loading up lr on ppc64).  I guess that's how
+GP_SAVE_INLINE came to be like it is, ie. it's optimised for the
+common case using ldm in the prologue and no fprs.  Still, it isn't
+difficult to choose the best combination in all cases, but it does
+mean different logic is needed for restores.  I could have implemented
+GP_RESTORE_INLINE and FP_RESORE_INLINE macros but it seemed simpler to
+just move everything into the one place the macros are invoked.  AIX
+and Darwin register cutoff doesn't change with this patch.
+
+This patch also enables out-of-line restores in cases that were
+previously disabled due to using inline saves.
+
+Bootstrapped and regression tested powerpc-linux.  OK to apply?
+
+	* aix.h (FP_SAVE_INLINE, GP_SAVE_INLINE): Delete.
+	* darwin.h (FP_SAVE_INLINE, GP_SAVE_INLINE): Delete.
+	* sysv4.h (FP_SAVE_INLINE, GP_SAVE_INLINE, V_SAVE_INLINE): Delete.
+	* config/rs6000/rs6000.c (V_SAVE_INLINE): Delete.
+	(rs6000_savres_strategy): Reimplement GP/FP/V_SAVE_INLINE logic.
+	For ELF targets, use out-of-line restores for -Os and any number
+	of regs if the restore exits, and out-of-line gp save for two or
+	more regs.  Use save_reg_p to test for holes in reg restore set.
+	Replace "#if" with "if".
+
+Index: gcc-4_7-branch/gcc/config/rs6000/aix.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/aix.h	2012-09-07 12:35:35.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/aix.h	2012-09-07 15:27:55.215290315 -0700
+@@ -207,11 +207,6 @@
+   { "link_syscalls",            LINK_SYSCALLS_SPEC },			\
+   { "link_libg",                LINK_LIBG_SPEC }
+ 
+-/* Define cutoff for using external functions to save floating point.  */
+-#define FP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) == 62 || (FIRST_REG) == 63)
+-/* And similarly for general purpose registers.  */
+-#define GP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) < 32)
+-
+ #define PROFILE_HOOK(LABEL)   output_profile_hook (LABEL)
+ 
+ /* No version of AIX fully supports AltiVec or 64-bit instructions in
+Index: gcc-4_7-branch/gcc/config/rs6000/darwin.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/darwin.h	2012-09-07 12:35:35.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/darwin.h	2012-09-07 15:27:55.223290316 -0700
+@@ -173,16 +173,6 @@
+   (RS6000_ALIGN (crtl->outgoing_args_size, 16)		\
+    + (STACK_POINTER_OFFSET))
+ 
+-/* Define cutoff for using out-of-line functions to save registers.
+-   Currently on Darwin, we implement FP and GPR out-of-line-saves plus the
+-   special routine for 'save everything'.  */
+-
+-#undef FP_SAVE_INLINE
+-#define FP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) > 60 && (FIRST_REG) < 64)
+-
+-#undef GP_SAVE_INLINE
+-#define GP_SAVE_INLINE(FIRST_REG) ((FIRST_REG) > 29 && (FIRST_REG) < 32)
+-
+ /* Darwin uses a function call if everything needs to be saved/restored.  */
+ 
+ #undef WORLD_SAVE_P
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
new file mode 100644
index 0000000..5ca12a6
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
@@ -0,0 +1,752 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 7630308303ea21c318bd57c35590fc4f249a30d8 Mon Sep 17 00:00:00 2001
+From: hainque <hainque@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 16 May 2012 08:43:41 +0000
+Subject: [PATCH]         * config/rs6000/rs6000-opts.h (enum processor_type):
+ Add         PROCESSOR_PPC8548.         *
+ config/rs6000/rs6000-cpus.def: Reference it for cpu="8548".
+         * config/rs6000/rs6000.md (cpu attribute
+ definition): Add ppc8548.         * config/rs6000/8540.md:
+ indicate that the units/patterns apply to         ppc8548
+ as well.
+
+        * config/rs6000/rs6000.c (rs6000_option_override_internal): Rename
+        default_cpu into implicit_cpu, conveying what --with-cpu was passed at
+        configure time. Treat implicit_cpu as have_CPU. Pick defaults for SPE
+        related flags,  check that what is queried is supported by the selected
+        configuration. Rework the single/double_float and MASK_STRING resets to
+        hit for all the E500 cores (854x + E500MC variants). Select the ppc8540
+        costs for PROCESSOR_PPC8548 as well.
+        (rs6000_issue_rate): case CPU_PPC8548 together with CPU_PPC8540.
+        (rs6000_use_sched_lookahead): Likewise, rewriting function as a case
+        statement instead of a sequence of ifs.
+
+        * config/rs6000/rs6000.h (TARGET_E500): Remove.
+        (TARGET_NO_LWSYNC): Adjust accordingly.
+        * config/rs6000/e500.h (TARGET_E500): Remove.
+        (CHECK_E500_OPTIONS): Adjust accordingly.
+        * config/rs6000/eabispe.h (SUBSUBTARGET_OVERRIDE_OPTIONS): Remove.
+        (TARGET_DEFAULT): Reformat definition to match the one in linuxspe.h.
+        * config/rs6000/linuxspe.h: Likewise.
+        * config/rs6000/vxworks.h: Remove bogus TARGET_E500 overrides and
+        superfluous comments.
+        * config/rs6000/e500-double.h: Remove.
+
+        * config.gcc (pick a default with_cpu): For powerpc*-*-*spe*,
+        default to with_cpu=8548 if --enable-e500-double, and to 8540
+        otherwise.
+        (set misc flags section): For powerpc*|rs6000*, remove inclusion
+        of e500-double.h for --enable-e500-double.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@187581 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                     |   37 +++++++++
+ gcc/config.gcc                    |   12 +--
+ gcc/config/rs6000/8540.md         |   50 ++++++------
+ gcc/config/rs6000/e500-double.h   |   24 ------
+ gcc/config/rs6000/e500.h          |   10 +--
+ gcc/config/rs6000/eabispe.h       |   17 +---
+ gcc/config/rs6000/linuxspe.h      |   16 +---
+ gcc/config/rs6000/rs6000-cpus.def |    3 +-
+ gcc/config/rs6000/rs6000-opts.h   |    1 +
+ gcc/config/rs6000/rs6000.c        |  155 +++++++++++++++++++++++--------------
+ gcc/config/rs6000/rs6000.h        |    7 +-
+ gcc/config/rs6000/rs6000.md       |    2 +-
+ gcc/config/rs6000/rtems.h         |   14 ----
+ gcc/config/rs6000/vxworks.h       |   11 ---
+ 14 files changed, 178 insertions(+), 181 deletions(-)
+
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-07-06 19:44:38.000000000 -0700
+@@ -2876,6 +2876,13 @@
+     mips*-*-vxworks)
+       with_arch=mips2
+       ;;
++    powerpc*-*-*spe*)
++      if test x$enable_e500_double = xyes; then
++         with_cpu=8548
++      else
++         with_cpu=8540
++      fi       
++      ;;
+     sparc-leon*-*)
+       with_cpu=v8;
+       ;;
+@@ -3564,11 +3571,6 @@
+ 		c_target_objs="${c_target_objs} rs6000-c.o"
+ 		cxx_target_objs="${cxx_target_objs} rs6000-c.o"
+ 		tmake_file="rs6000/t-rs6000 ${tmake_file}"
+-
+-                if test x$enable_e500_double = xyes
+-                then
+-                        tm_file="$tm_file rs6000/e500-double.h"
+-                fi
+ 		;;
+ 
+ 	sh[123456ble]*-*-* | sh-*-*)
+Index: gcc-4_7-branch/gcc/config/rs6000/8540.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/8540.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/8540.md	2012-07-06 19:44:38.466780001 -0700
+@@ -87,18 +87,18 @@
+   (and (eq_attr "type" "integer,insert_word,insert_dword,cmp,compare,\
+                         delayed_compare,var_delayed_compare,fast_compare,\
+                         shift,trap,var_shift_rotate,cntlz,exts,isel")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ (define_insn_reservation "ppc8540_two" 1
+   (and (eq_attr "type" "two")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ (define_insn_reservation "ppc8540_three" 1
+   (and (eq_attr "type" "three")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+@@ -106,13 +106,13 @@
+ ;; Branch.  Actually this latency time is not used by the scheduler.
+ (define_insn_reservation "ppc8540_branch" 1
+   (and (eq_attr "type" "jmpreg,branch,isync")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_bu,ppc8540_retire")
+ 
+ ;; Multiply
+ (define_insn_reservation "ppc8540_multiply" 4
+   (and (eq_attr "type" "imul,imul2,imul3,imul_compare")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -122,57 +122,57 @@
+ ;; time.
+ (define_insn_reservation "ppc8540_divide" 14
+   (and (eq_attr "type" "idiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*13")
+ 
+ ;; CR logical
+ (define_insn_reservation "ppc8540_cr_logical" 1
+   (and (eq_attr "type" "cr_logical,delayed_cr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_bu,ppc8540_retire")
+ 
+ ;; Mfcr
+ (define_insn_reservation "ppc8540_mfcr" 1
+   (and (eq_attr "type" "mfcr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Mtcrf
+ (define_insn_reservation "ppc8540_mtcrf" 1
+   (and (eq_attr "type" "mtcr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Mtjmpr
+ (define_insn_reservation "ppc8540_mtjmpr" 1
+   (and (eq_attr "type" "mtjmpr,mfjmpr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Loads
+ (define_insn_reservation "ppc8540_load" 3
+   (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,\
+ 			load_l,sync")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Stores.
+ (define_insn_reservation "ppc8540_store" 3
+   (and (eq_attr "type" "store,store_ux,store_u,store_c")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Simple FP
+ (define_insn_reservation "ppc8540_simple_float" 1
+   (and (eq_attr "type" "fpsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; FP
+ (define_insn_reservation "ppc8540_float" 4
+   (and (eq_attr "type" "fp")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -180,44 +180,44 @@
+ ;; because of the result automata will be huge.
+ (define_insn_reservation "ppc8540_float_vector_divide" 29
+   (and (eq_attr "type" "vecfdiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*28")
+ 
+ ;; Brinc
+ (define_insn_reservation "ppc8540_brinc" 1
+   (and (eq_attr "type" "brinc")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Simple vector
+ (define_insn_reservation "ppc8540_simple_vector" 1
+   (and (eq_attr "type" "vecsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Simple vector compare
+ (define_insn_reservation "ppc8540_simple_vector_compare" 1
+   (and (eq_attr "type" "veccmpsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Vector compare
+ (define_insn_reservation "ppc8540_vector_compare" 1
+   (and (eq_attr "type" "veccmp")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; evsplatfi evsplati
+ (define_insn_reservation "ppc8540_vector_perm" 1
+   (and (eq_attr "type" "vecperm")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Vector float
+ (define_insn_reservation "ppc8540_float_vector" 4
+   (and (eq_attr "type" "vecfloat")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -226,25 +226,25 @@
+ ;; of miu_stage3 here because we use the average latency time.
+ (define_insn_reservation "ppc8540_vector_divide" 14
+   (and (eq_attr "type" "vecdiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*13")
+ 
+ ;; Complex vector.
+ (define_insn_reservation "ppc8540_complex_vector" 4
+   (and (eq_attr "type" "veccomplex")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+ ;; Vector load
+ (define_insn_reservation "ppc8540_vector_load" 3
+   (and (eq_attr "type" "vecload")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Vector store
+ (define_insn_reservation "ppc8540_vector_store" 3
+   (and (eq_attr "type" "vecstore")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+Index: gcc-4_7-branch/gcc/config/rs6000/e500-double.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/e500-double.h	2012-07-05 23:49:07.000000000 -0700
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,24 +0,0 @@
+-/* Target definitions for E500 with double precision FP.
+-   Copyright (C) 2004, 2006, 2007, 2011 Free Software Foundation, Inc.
+-   Contributed by Aldy Hernandez (aldyh@redhat.com).
+-
+-   This file is part of GCC.
+-
+-   GCC is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU General Public License as published
+-   by the Free Software Foundation; either version 3, or (at your
+-   option) any later version.
+-
+-   GCC is distributed in the hope that it will be useful, but WITHOUT
+-   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+-   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
+-   License for more details.
+-
+-   You should have received a copy of the GNU General Public License
+-   along with GCC; see the file COPYING3.  If not see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#undef  SUB3TARGET_OVERRIDE_OPTIONS
+-#define SUB3TARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 2;
+Index: gcc-4_7-branch/gcc/config/rs6000/e500.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/e500.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/e500.h	2012-07-06 19:44:38.466780001 -0700
+@@ -19,7 +19,6 @@
+ 
+ #undef TARGET_SPE_ABI
+ #undef TARGET_SPE
+-#undef TARGET_E500
+ #undef TARGET_FPRS
+ #undef TARGET_E500_SINGLE
+ #undef TARGET_E500_DOUBLE
+@@ -27,21 +26,20 @@
+ 
+ #define TARGET_SPE_ABI rs6000_spe_abi
+ #define TARGET_SPE rs6000_spe
+-#define TARGET_E500 (rs6000_cpu == PROCESSOR_PPC8540)
+ #define TARGET_FPRS (rs6000_float_gprs == 0)
+ #define TARGET_E500_SINGLE (TARGET_HARD_FLOAT && rs6000_float_gprs == 1)
+ #define TARGET_E500_DOUBLE (TARGET_HARD_FLOAT && rs6000_float_gprs == 2)
+ #define CHECK_E500_OPTIONS						\
+   do {									\
+-    if (TARGET_E500 || TARGET_SPE || TARGET_SPE_ABI			\
++    if (TARGET_SPE || TARGET_SPE_ABI					\
+ 	|| TARGET_E500_SINGLE || TARGET_E500_DOUBLE)			\
+       {									\
+ 	if (TARGET_ALTIVEC)						\
+-	  error ("AltiVec and E500 instructions cannot coexist");	\
++	  error ("AltiVec and SPE instructions cannot coexist");	\
+ 	if (TARGET_VSX)							\
+-	  error ("VSX and E500 instructions cannot coexist");		\
++	  error ("VSX and SPE instructions cannot coexist");		\
+ 	if (TARGET_64BIT)						\
+-	  error ("64-bit E500 not supported");				\
++	  error ("64-bit SPE not supported");				\
+ 	if (TARGET_HARD_FLOAT && TARGET_FPRS)				\
+ 	  error ("E500 and FPRs not supported");			\
+       }									\
+Index: gcc-4_7-branch/gcc/config/rs6000/eabispe.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/eabispe.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/eabispe.h	2012-07-06 19:44:38.466780001 -0700
+@@ -21,21 +21,8 @@
+    <http://www.gnu.org/licenses/>.  */
+ 
+ #undef  TARGET_DEFAULT
+-#define TARGET_DEFAULT (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_EABI	\
+-  | MASK_STRICT_ALIGN)
+-
+-#undef  SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_cpu_index) \
+-    rs6000_cpu = PROCESSOR_PPC8540; \
+-  if (!global_options_set.x_rs6000_spe_abi) \
+-    rs6000_spe_abi = 1; \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 1; \
+-  if (!global_options_set.x_rs6000_spe) \
+-    rs6000_spe = 1; \
+-  if (target_flags & MASK_64BIT) \
+-    error ("-m64 not supported in this configuration")
++#define TARGET_DEFAULT \
++  (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN | MASK_EABI)
+ 
+ #undef  ASM_DEFAULT_SPEC
+ #define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
+Index: gcc-4_7-branch/gcc/config/rs6000/linuxspe.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/linuxspe.h	2012-07-05 23:52:14.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/linuxspe.h	2012-07-06 19:44:38.466780001 -0700
+@@ -22,20 +22,8 @@
+ 
+ /* Override rs6000.h and sysv4.h definition.  */
+ #undef	TARGET_DEFAULT
+-#define	TARGET_DEFAULT (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN)
+-
+-#undef  SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_cpu_index) \
+-    rs6000_cpu = PROCESSOR_PPC8540; \
+-  if (!global_options_set.x_rs6000_spe_abi) \
+-    rs6000_spe_abi = 1; \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 1; \
+-  if (!global_options_set.x_rs6000_spe) \
+-    rs6000_spe = 1; \
+-  if (target_flags & MASK_64BIT) \
+-    error ("-m64 not supported in this configuration")
++#define TARGET_DEFAULT \
++  (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN)
+ 
+ #undef  ASM_DEFAULT_SPEC
+ #define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:44:38.000000000 -0700
+@@ -76,8 +76,7 @@
+ RS6000_CPU ("823", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT)
+ RS6000_CPU ("8540", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
+ 	    | MASK_ISEL)
+-/* 8548 has a dummy entry for now.  */
+-RS6000_CPU ("8548", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
++RS6000_CPU ("8548", PROCESSOR_PPC8548, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
+ 	    | MASK_ISEL)
+ RS6000_CPU ("a2", PROCESSOR_PPCA2,
+ 	    POWERPC_BASE_MASK | MASK_PPC_GFXOPT | MASK_POWERPC64 | MASK_POPCNTB
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:44:38.000000000 -0700
+@@ -49,6 +49,7 @@
+    PROCESSOR_PPC7400,
+    PROCESSOR_PPC7450,
+    PROCESSOR_PPC8540,
++   PROCESSOR_PPC8548,
+    PROCESSOR_PPCE300C2,
+    PROCESSOR_PPCE300C3,
+    PROCESSOR_PPCE500MC,
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.c	2012-07-06 19:43:53.194780001 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.c	2012-07-06 19:44:38.000000000 -0700
+@@ -2597,7 +2597,10 @@
+ {
+   bool ret = true;
+   bool have_cpu = false;
+-  const char *default_cpu = OPTION_TARGET_CPU_DEFAULT;
++
++  /* The default cpu requested at configure time, if any.  */
++  const char *implicit_cpu = OPTION_TARGET_CPU_DEFAULT;
++
+   int set_masks;
+   int cpu_index;
+   int tune_index;
+@@ -2616,11 +2619,6 @@
+     warning (0, "-malign-power is not supported for 64-bit Darwin;"
+ 	     " it is incompatible with the installed C and C++ libraries");
+ 
+-  if (global_options_set.x_rs6000_spe_abi
+-      && rs6000_spe_abi
+-      && !TARGET_SPE_ABI)
+-    error ("not configured for SPE ABI");
+-
+   /* Numerous experiment shows that IRA based loop pressure
+      calculation works better for RTL loop invariant motion on targets
+      with enough (>= 32) registers.  It is an expensive optimization.
+@@ -2656,7 +2654,8 @@
+   /* Process the -mcpu=<xxx> and -mtune=<xxx> argument.  If the user changed
+      the cpu in a target attribute or pragma, but did not specify a tuning
+      option, use the cpu for the tuning option rather than the option specified
+-     with -mtune on the command line.  */
++     with -mtune on the command line.  Process a '--with-cpu' configuration
++     request as an implicit --cpu.  */
+   if (rs6000_cpu_index >= 0)
+     {
+       cpu_index = rs6000_cpu_index;
+@@ -2669,10 +2668,12 @@
+     }
+   else
+     {
+-      if (!default_cpu)
+-	default_cpu = (TARGET_POWERPC64 ? "powerpc64" : "powerpc");
++      const char *default_cpu =
++        (implicit_cpu ? implicit_cpu
++         : (TARGET_POWERPC64 ? "powerpc64" : "powerpc"));
+ 
+       rs6000_cpu_index = cpu_index = rs6000_cpu_name_lookup (default_cpu);
++      have_cpu = implicit_cpu != 0;
+     }
+ 
+   gcc_assert (cpu_index >= 0);
+@@ -2703,6 +2704,42 @@
+   gcc_assert (tune_index >= 0);
+   rs6000_cpu = processor_target_table[tune_index].processor;
+ 
++  /* Pick defaults for SPE related control flags.  Do this early to make sure
++     that the TARGET_ macros are representative ASAP.  */
++  {
++    int spe_capable_cpu =
++      (rs6000_cpu == PROCESSOR_PPC8540
++       || rs6000_cpu == PROCESSOR_PPC8548);
++
++    if (!global_options_set.x_rs6000_spe_abi)
++      rs6000_spe_abi = spe_capable_cpu;
++
++    if (!global_options_set.x_rs6000_spe)
++      rs6000_spe = spe_capable_cpu;
++
++    if (!global_options_set.x_rs6000_float_gprs)
++      rs6000_float_gprs =
++        (rs6000_cpu == PROCESSOR_PPC8540 ? 1
++         : rs6000_cpu == PROCESSOR_PPC8548 ? 2
++         : 0);
++  }
++
++  if (global_options_set.x_rs6000_spe_abi
++      && rs6000_spe_abi
++      && !TARGET_SPE_ABI)
++    error ("not configured for SPE ABI");
++
++  if (global_options_set.x_rs6000_spe
++      && rs6000_spe
++      && !TARGET_SPE)
++    error ("not configured for SPE instruction set");
++
++  if (main_target_opt != NULL
++      && ((main_target_opt->x_rs6000_spe_abi != rs6000_spe_abi)
++          || (main_target_opt->x_rs6000_spe != rs6000_spe)
++          || (main_target_opt->x_rs6000_float_gprs != rs6000_float_gprs)))
++    error ("target attribute or pragma changes SPE ABI");
++
+   if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3
+       || rs6000_cpu == PROCESSOR_PPCE500MC || rs6000_cpu == PROCESSOR_PPCE500MC64)
+     {
+@@ -2938,35 +2975,44 @@
+   SUB3TARGET_OVERRIDE_OPTIONS;
+ #endif
+ 
+-  if (TARGET_E500 || rs6000_cpu == PROCESSOR_PPCE500MC
+-      || rs6000_cpu == PROCESSOR_PPCE500MC64)
++  /* For the E500 family of cores, reset the single/double FP flags to let us
++     check that they remain constant across attributes or pragmas.  Also,
++     clear a possible request for string instructions, not supported and which
++     we might have silently queried above for -Os. 
++
++     For other families, clear ISEL in case it was set implicitly.
++  */
++
++  switch (rs6000_cpu)
+     {
+-      /* The e500 and e500mc do not have string instructions, and we set
+-	 MASK_STRING above when optimizing for size.  */
+-      if ((target_flags & MASK_STRING) != 0)
+-	target_flags = target_flags & ~MASK_STRING;
+-    }
+-  else if (global_options_set.x_rs6000_cpu_index)
+-    {
+-      /* For the powerpc-eabispe configuration, we set all these by
+-	 default, so let's unset them if we manually set another
+-	 CPU that is not the E500.  */
+-      if (main_target_opt != NULL
+-	  && ((main_target_opt->x_rs6000_spe_abi != rs6000_spe_abi)
+-	      || (main_target_opt->x_rs6000_spe != rs6000_spe)
+-	      || (main_target_opt->x_rs6000_float_gprs != rs6000_float_gprs)))
+-	error ("target attribute or pragma changes SPE ABI");
+-      else
+-	{
+-	  if (!global_options_set.x_rs6000_spe_abi)
+-	    rs6000_spe_abi = 0;
+-	  if (!global_options_set.x_rs6000_spe)
+-	    rs6000_spe = 0;
+-	  if (!global_options_set.x_rs6000_float_gprs)
+-	    rs6000_float_gprs = 0;
+-	}
+-      if (!(target_flags_explicit & MASK_ISEL))
++    case PROCESSOR_PPC8540:
++    case PROCESSOR_PPC8548:
++    case PROCESSOR_PPCE500MC:
++    case PROCESSOR_PPCE500MC64:
++
++      rs6000_single_float = TARGET_E500_SINGLE || TARGET_E500_DOUBLE;
++      rs6000_double_float = TARGET_E500_DOUBLE;
++
++      target_flags &= ~MASK_STRING;
++
++      break;
++
++    default:
++
++      if (have_cpu && !(target_flags_explicit & MASK_ISEL))
+ 	target_flags &= ~MASK_ISEL;
++
++      break;
++    }
++
++  if (main_target_opt)
++    {
++      if (main_target_opt->x_rs6000_single_float != rs6000_single_float)
++	error ("target attribute or pragma changes single precision floating "
++	       "point");
++      if (main_target_opt->x_rs6000_double_float != rs6000_double_float)
++	error ("target attribute or pragma changes double precision floating "
++	       "point");
+     }
+ 
+   /* Detect invalid option combinations with E500.  */
+@@ -3193,6 +3239,7 @@
+ 	break;
+ 
+       case PROCESSOR_PPC8540:
++      case PROCESSOR_PPC8548:
+ 	rs6000_cost = &ppc8540_cost;
+ 	break;
+ 
+@@ -3265,26 +3312,6 @@
+       && rs6000_single_float == 0 && rs6000_double_float == 0)
+     rs6000_single_float = rs6000_double_float = 1;
+ 
+-  /* Reset single and double FP flags if target is E500. */
+-  if (TARGET_E500) 
+-  {
+-    rs6000_single_float = rs6000_double_float = 0;
+-    if (TARGET_E500_SINGLE)
+-      rs6000_single_float = 1; 
+-    if (TARGET_E500_DOUBLE)
+-      rs6000_single_float = rs6000_double_float = 1;
+-  }
+-
+-  if (main_target_opt)
+-    {
+-      if (main_target_opt->x_rs6000_single_float != rs6000_single_float)
+-	error ("target attribute or pragma changes single precision floating "
+-	       "point");
+-      if (main_target_opt->x_rs6000_double_float != rs6000_double_float)
+-	error ("target attribute or pragma changes double precision floating "
+-	       "point");
+-    }
+-
+   /* If not explicitly specified via option, decide whether to generate indexed
+      load/store instructions.  */
+   if (TARGET_AVOID_XFORM == -1)
+@@ -22816,6 +22843,7 @@
+   case CPU_PPC750:
+   case CPU_PPC7400:
+   case CPU_PPC8540:
++  case CPU_PPC8548:
+   case CPU_CELL:
+   case CPU_PPCE300C2:
+   case CPU_PPCE300C3:
+@@ -22846,11 +22874,18 @@
+ static int
+ rs6000_use_sched_lookahead (void)
+ {
+-  if (rs6000_cpu_attr == CPU_PPC8540)
+-    return 4;
+-  if (rs6000_cpu_attr == CPU_CELL)
+-    return (reload_completed ? 8 : 0);
+-  return 0;
++  switch (rs6000_cpu_attr)
++    {
++    case CPU_PPC8540:
++    case CPU_PPC8548:
++      return 4;
++
++    case CPU_CELL:
++      return (reload_completed ? 8 : 0);
++
++    default:
++      return 0;
++    }
+ }
+ 
+ /* We are choosing insn from the ready queue.  Return nonzero if INSN can be chosen.  */
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.h	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.h	2012-07-06 19:44:38.000000000 -0700
+@@ -457,7 +457,6 @@
+ 
+ #define TARGET_SPE_ABI 0
+ #define TARGET_SPE 0
+-#define TARGET_E500 0
+ #define TARGET_ISEL64 (TARGET_ISEL && TARGET_POWERPC64)
+ #define TARGET_FPRS 1
+ #define TARGET_E500_SINGLE 0
+@@ -500,11 +499,11 @@
+ 				      || TARGET_ALTIVEC			 \
+ 				      || TARGET_VSX)))
+ 
++/* E500 cores only support plain "sync", not lwsync.  */
++#define TARGET_NO_LWSYNC (rs6000_cpu == PROCESSOR_PPC8540 \
++			  || rs6000_cpu == PROCESSOR_PPC8548)
+ 
+ 
+-/* E500 processors only support plain "sync", not lwsync.  */
+-#define TARGET_NO_LWSYNC TARGET_E500
+-
+ /* Which machine supports the various reciprocal estimate instructions.  */
+ #define TARGET_FRES	(TARGET_HARD_FLOAT && TARGET_PPC_GFXOPT \
+ 			 && TARGET_FPRS && TARGET_SINGLE_FLOAT)
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:44:38.000000000 -0700
+@@ -166,7 +166,7 @@
+ ;; Processor type -- this attribute must exactly match the processor_type
+ ;; enumeration in rs6000.h.
+ 
+-(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
++(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
+   (const (symbol_ref "rs6000_cpu_attr")))
+ 
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/rtems.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rtems.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rtems.h	2012-07-06 19:44:38.470780001 -0700
+@@ -55,17 +55,3 @@
+ #undef  SUBSUBTARGET_EXTRA_SPECS
+ #define SUBSUBTARGET_EXTRA_SPECS \
+   { "cpp_os_rtems",		CPP_OS_RTEMS_SPEC }
+-
+-#undef SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS                                     \
+-  do {                                                                    \
+-   if (TARGET_E500)                                                       \
+-      {                                                                   \
+-        if (TARGET_HARD_FLOAT && !global_options_set.x_rs6000_float_gprs) \
+-          rs6000_float_gprs = 1;                                          \
+-        if (rs6000_float_gprs != 0 && !global_options_set.x_rs6000_spe)   \
+-          rs6000_spe = 1;                                                 \
+-        if (rs6000_spe && !global_options_set.x_rs6000_spe_abi)           \
+-          rs6000_spe_abi = 1;                                             \
+-      }                                                                   \
+-  } while(0)
+Index: gcc-4_7-branch/gcc/config/rs6000/vxworks.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/vxworks.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/vxworks.h	2012-07-06 19:44:38.470780001 -0700
+@@ -122,19 +122,8 @@
+ 
+ #undef  ABI_STACK_BOUNDARY
+ 
+-/* Make -mcpu=8540 imply SPE.  ISEL is automatically enabled, the
+-   others must be done by hand.  Handle -mrtp.  Disable -fPIC
+-   for -mrtp - the VxWorks PIC model is not compatible with it.  */
+ #undef SUBSUBTARGET_OVERRIDE_OPTIONS
+ #define SUBSUBTARGET_OVERRIDE_OPTIONS		\
+-  do {						\
+-    if (TARGET_E500)				\
+-      {						\
+-	rs6000_spe = 1;				\
+-	rs6000_spe_abi = 1;			\
+-	rs6000_float_gprs = 1;			\
+-      }						\
+-						\
+   if (!global_options_set.x_g_switch_value)	\
+     g_switch_value = SDATA_DEFAULT_SIZE;	\
+   VXWORKS_OVERRIDE_OPTIONS;			\
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
new file mode 100644
index 0000000..e3341fc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
@@ -0,0 +1,713 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From b770074cee13445eba1bf4e99649c5ceac9a4b5a Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 5 Jun 2012 16:05:16 +0000
+Subject: [PATCH] 2012-06-01  Edmar Wienskoski  <edmar@freescale.com>
+
+	* config/rs6000/e5500.md: New file.
+	* config/rs6000/e6500.md: New file.
+	* config/rs6000/rs6000.c (processor_costs): Add new costs for
+	e5500 and e6500.
+	(rs6000_option_override_internal): Altivec and Spe options not
+	allowed with e5500. Spe options not allowed with e6500. Increase
+	move inline limit for e5500 and e6500. Disable string instructions
+	for e5500 and e6500. Enable branch targets alignment for e5500 and
+	e6500. Initialize rs6000_cost for e5500 and e6500.
+	(rs6000_adjust_cost): Add extra scheduling cycles between compare
+	and brnach for e5500 and e6500.
+	(rs6000_issue_rate): Set issue rate for e5500 and e6500.
+	* config/rs6000/rs6000-cpus.def: Add cpu definitions for e5500 and
+	e6500.
+	* config/rs6000/rs6000.h (ASM_CPU_SPEC): Add e5500 and e6500.
+	* config/rs6000/rs6000.md (define_attr "cpu"): Add ppce5500 and
+	ppce6500.
+	Include e5500.md and e6500.md.
+	* config/rs6000/rs6000-opt.h (processor_type): Add
+	PROCESSOR_PPCE5500 and PROCESSOR_PPCE6500.
+	* config.gcc (cpu_is_64bit): Add new cores e5500, e6500.
+	(powerpc*-*-*): Add new cores e5500, e6500.
+	* doc/invoke.texi: (item -mcpu): Add e5500 and e6500 to list of cpus.
+
+gcc/testsuite
+2012-06-01  Edmar Wienskoski  <edmar@freescale.com>
+
+	* gcc.dg/tree-ssa/vector-3.c: Adjust regular expression.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188244 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                            |   26 ++++
+ gcc/config.gcc                           |    6 +-
+ gcc/config/rs6000/e5500.md               |  176 ++++++++++++++++++++++++
+ gcc/config/rs6000/e6500.md               |  213 ++++++++++++++++++++++++++++++
+ gcc/config/rs6000/rs6000-cpus.def        |    4 +
+ gcc/config/rs6000/rs6000-opts.h          |    2 +
+ gcc/config/rs6000/rs6000.c               |   68 +++++++++-
+ gcc/config/rs6000/rs6000.h               |    2 +
+ gcc/config/rs6000/rs6000.md              |    4 +-
+ gcc/doc/invoke.texi                      |   12 +-
+ gcc/testsuite/ChangeLog                  |    4 +
+ gcc/testsuite/gcc.dg/tree-ssa/vector-3.c |    2 +-
+ 12 files changed, 506 insertions(+), 13 deletions(-)
+ create mode 100644 gcc/config/rs6000/e5500.md
+ create mode 100644 gcc/config/rs6000/e6500.md
+
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-07-06 19:53:26.350779999 -0700
+@@ -413,7 +413,7 @@
+ 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h"
+ 	need_64bit_hwint=yes
+ 	case x$with_cpu in
+-	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[34567]|xpower6x|xrs64a|xcell|xa2|xe500mc64)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[34567]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
+ 		cpu_is_64bit=yes
+ 		;;
+ 	esac
+@@ -3361,8 +3361,8 @@
+ 			| 401 | 403 | 405 | 405fp | 440 | 440fp | 464 | 464fp \
+ 			| 476 | 476fp | 505 | 601 | 602 | 603 | 603e | ec603e \
+ 			| 604 | 604e | 620 | 630 | 740 | 750 | 7400 | 7450 \
+-			| a2 | e300c[23] | 854[08] | e500mc | e500mc64 | titan\
+-			| 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
++			| a2 | e300c[23] | 854[08] | e500mc | e500mc64 | e5500 | e6500 \
++			| titan | 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
+ 				# OK
+ 				;;
+ 			*)
+Index: gcc-4_7-branch/gcc/config/rs6000/e5500.md
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/gcc/config/rs6000/e5500.md	2012-07-06 19:53:26.350779999 -0700
+@@ -0,0 +1,176 @@
++;; Pipeline description for Freescale PowerPC e5500 core.
++;;   Copyright (C) 2012 Free Software Foundation, Inc.
++;;   Contributed by Edmar Wienskoski (edmar@freescale.com)
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify it
++;; under the terms of the GNU General Public License as published
++;; by the Free Software Foundation; either version 3, or (at your
++;; option) any later version.
++;;
++;; GCC is distributed in the hope that it will be useful, but WITHOUT
++;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++;; License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++;;
++;; e5500 64-bit SFX(2), CFX, LSU, FPU, BU
++;; Max issue 3 insns/clock cycle (includes 1 branch)
++
++(define_automaton "e5500_most,e5500_long")
++(define_cpu_unit "e5500_decode_0,e5500_decode_1" "e5500_most")
++
++;; SFX.
++(define_cpu_unit "e5500_sfx_0,e5500_sfx_1" "e5500_most")
++
++;; CFX.
++(define_cpu_unit "e5500_cfx_stage0,e5500_cfx_stage1" "e5500_most")
++
++;; Non-pipelined division.
++(define_cpu_unit "e5500_cfx_div" "e5500_long")
++
++;; LSU.
++(define_cpu_unit "e5500_lsu" "e5500_most")
++
++;; FPU.
++(define_cpu_unit "e5500_fpu" "e5500_long")
++
++;; BU.
++(define_cpu_unit "e5500_bu" "e5500_most")
++
++;; The following units are used to make the automata deterministic.
++(define_cpu_unit "present_e5500_decode_0" "e5500_most")
++(define_cpu_unit "present_e5500_sfx_0" "e5500_most")
++(presence_set "present_e5500_decode_0" "e5500_decode_0")
++(presence_set "present_e5500_sfx_0" "e5500_sfx_0")
++
++;; Some useful abbreviations.
++(define_reservation "e5500_decode"
++    "e5500_decode_0|e5500_decode_1+present_e5500_decode_0")
++(define_reservation "e5500_sfx"
++   "e5500_sfx_0|e5500_sfx_1+present_e5500_sfx_0")
++
++;; SFX.
++(define_insn_reservation "e5500_sfx" 1
++  (and (eq_attr "type" "integer,insert_word,insert_dword,delayed_compare,\
++	shift,cntlz,exts")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx")
++
++(define_insn_reservation "e5500_sfx2" 2
++  (and (eq_attr "type" "cmp,compare,fast_compare,trap")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx")
++
++(define_insn_reservation "e5500_delayed" 2
++  (and (eq_attr "type" "var_shift_rotate,var_delayed_compare")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx*2")
++
++(define_insn_reservation "e5500_two" 2
++  (and (eq_attr "type" "two")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_decode+e5500_sfx,e5500_sfx")
++
++(define_insn_reservation "e5500_three" 3
++  (and (eq_attr "type" "three")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,(e5500_decode+e5500_sfx)*2,e5500_sfx")
++
++;; SFX - Mfcr.
++(define_insn_reservation "e5500_mfcr" 4
++  (and (eq_attr "type" "mfcr")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx_0*4")
++
++;; SFX - Mtcrf.
++(define_insn_reservation "e5500_mtcrf" 1
++  (and (eq_attr "type" "mtcr")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx_0")
++
++;; SFX - Mtjmpr.
++(define_insn_reservation "e5500_mtjmpr" 1
++  (and (eq_attr "type" "mtjmpr,mfjmpr")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_sfx")
++
++;; CFX - Multiply.
++(define_insn_reservation "e5500_multiply" 4
++  (and (eq_attr "type" "imul")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_cfx_stage0,e5500_cfx_stage1")
++
++(define_insn_reservation "e5500_multiply_i" 5
++  (and (eq_attr "type" "imul2,imul3,imul_compare")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_cfx_stage0,\
++   e5500_cfx_stage0+e5500_cfx_stage1,e5500_cfx_stage1")
++
++;; CFX - Divide.
++(define_insn_reservation "e5500_divide" 16
++  (and (eq_attr "type" "idiv")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_cfx_stage0+e5500_cfx_div,\
++   e5500_cfx_div*15")
++
++(define_insn_reservation "e5500_divide_d" 26
++  (and (eq_attr "type" "ldiv")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_cfx_stage0+e5500_cfx_div,\
++   e5500_cfx_div*25")
++
++;; LSU - Loads.
++(define_insn_reservation "e5500_load" 3
++  (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,\
++			load_l,sync")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_lsu")
++
++(define_insn_reservation "e5500_fpload" 4
++  (and (eq_attr "type" "fpload,fpload_ux,fpload_u")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_lsu")
++
++;; LSU - Stores.
++(define_insn_reservation "e5500_store" 3
++  (and (eq_attr "type" "store,store_ux,store_u,store_c")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_lsu")
++
++(define_insn_reservation "e5500_fpstore" 3
++  (and (eq_attr "type" "fpstore,fpstore_ux,fpstore_u")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_lsu")
++
++;; FP.
++(define_insn_reservation "e5500_float" 7
++  (and (eq_attr "type" "fpsimple,fp,fpcompare,dmul")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_fpu")
++
++(define_insn_reservation "e5500_sdiv" 20
++  (and (eq_attr "type" "sdiv")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_fpu*20")
++
++(define_insn_reservation "e5500_ddiv" 35
++  (and (eq_attr "type" "ddiv")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_fpu*35")
++
++;; BU.
++(define_insn_reservation "e5500_branch" 1
++  (and (eq_attr "type" "jmpreg,branch,isync")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_bu")
++
++;; BU - CR logical.
++(define_insn_reservation "e5500_cr_logical" 1
++  (and (eq_attr "type" "cr_logical,delayed_cr")
++       (eq_attr "cpu" "ppce5500"))
++  "e5500_decode,e5500_bu")
+Index: gcc-4_7-branch/gcc/config/rs6000/e6500.md
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/gcc/config/rs6000/e6500.md	2012-07-06 19:53:26.354779999 -0700
+@@ -0,0 +1,213 @@
++;; Pipeline description for Freescale PowerPC e6500 core.
++;;   Copyright (C) 2012 Free Software Foundation, Inc.
++;;   Contributed by Edmar Wienskoski (edmar@freescale.com)
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify it
++;; under the terms of the GNU General Public License as published
++;; by the Free Software Foundation; either version 3, or (at your
++;; option) any later version.
++;;
++;; GCC is distributed in the hope that it will be useful, but WITHOUT
++;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++;; License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++;;
++;; e6500 64-bit SFX(2), CFX, LSU, FPU, BU, VSFX, VCFX, VFPU, VPERM
++;; Max issue 3 insns/clock cycle (includes 1 branch)
++
++(define_automaton "e6500_most,e6500_long,e6500_vec")
++(define_cpu_unit "e6500_decode_0,e6500_decode_1" "e6500_most")
++
++;; SFX.
++(define_cpu_unit "e6500_sfx_0,e6500_sfx_1" "e6500_most")
++
++;; CFX.
++(define_cpu_unit "e6500_cfx_stage0,e6500_cfx_stage1" "e6500_most")
++
++;; Non-pipelined division.
++(define_cpu_unit "e6500_cfx_div" "e6500_long")
++
++;; LSU.
++(define_cpu_unit "e6500_lsu" "e6500_most")
++
++;; FPU.
++(define_cpu_unit "e6500_fpu" "e6500_long")
++
++;; BU.
++(define_cpu_unit "e6500_bu" "e6500_most")
++
++;; Altivec unit
++(define_cpu_unit "e6500_vec,e6500_vecperm" "e6500_vec")
++
++;; The following units are used to make the automata deterministic.
++(define_cpu_unit "present_e6500_decode_0" "e6500_most")
++(define_cpu_unit "present_e6500_sfx_0" "e6500_most")
++(presence_set "present_e6500_decode_0" "e6500_decode_0")
++(presence_set "present_e6500_sfx_0" "e6500_sfx_0")
++
++;; Some useful abbreviations.
++(define_reservation "e6500_decode"
++    "e6500_decode_0|e6500_decode_1+present_e6500_decode_0")
++(define_reservation "e6500_sfx"
++   "e6500_sfx_0|e6500_sfx_1+present_e6500_sfx_0")
++
++;; SFX.
++(define_insn_reservation "e6500_sfx" 1
++  (and (eq_attr "type" "integer,insert_word,insert_dword,delayed_compare,\
++	shift,cntlz,exts")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++(define_insn_reservation "e6500_sfx2" 2
++  (and (eq_attr "type" "cmp,compare,fast_compare,trap")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++(define_insn_reservation "e6500_delayed" 2
++  (and (eq_attr "type" "var_shift_rotate,var_delayed_compare")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx*2")
++
++(define_insn_reservation "e6500_two" 2
++  (and (eq_attr "type" "two")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_decode+e6500_sfx,e6500_sfx")
++
++(define_insn_reservation "e6500_three" 3
++  (and (eq_attr "type" "three")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,(e6500_decode+e6500_sfx)*2,e6500_sfx")
++
++;; SFX - Mfcr.
++(define_insn_reservation "e6500_mfcr" 4
++  (and (eq_attr "type" "mfcr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx_0*4")
++
++;; SFX - Mtcrf.
++(define_insn_reservation "e6500_mtcrf" 1
++  (and (eq_attr "type" "mtcr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx_0")
++
++;; SFX - Mtjmpr.
++(define_insn_reservation "e6500_mtjmpr" 1
++  (and (eq_attr "type" "mtjmpr,mfjmpr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++;; CFX - Multiply.
++(define_insn_reservation "e6500_multiply" 4
++  (and (eq_attr "type" "imul")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0,e6500_cfx_stage1")
++
++(define_insn_reservation "e6500_multiply_i" 5
++  (and (eq_attr "type" "imul2,imul3,imul_compare")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0,\
++   e6500_cfx_stage0+e6500_cfx_stage1,e6500_cfx_stage1")
++
++;; CFX - Divide.
++(define_insn_reservation "e6500_divide" 16
++  (and (eq_attr "type" "idiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0+e6500_cfx_div,\
++   e6500_cfx_div*15")
++
++(define_insn_reservation "e6500_divide_d" 26
++  (and (eq_attr "type" "ldiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0+e6500_cfx_div,\
++   e6500_cfx_div*25")
++
++;; LSU - Loads.
++(define_insn_reservation "e6500_load" 3
++  (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,\
++			load_l,sync")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_fpload" 4
++  (and (eq_attr "type" "fpload,fpload_ux,fpload_u")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_vecload" 4
++  (and (eq_attr "type" "vecload")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++;; LSU - Stores.
++(define_insn_reservation "e6500_store" 3
++  (and (eq_attr "type" "store,store_ux,store_u,store_c")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_fpstore" 3
++  (and (eq_attr "type" "fpstore,fpstore_ux,fpstore_u")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_vecstore" 4
++  (and (eq_attr "type" "vecstore")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++;; FP.
++(define_insn_reservation "e6500_float" 7
++  (and (eq_attr "type" "fpsimple,fp,fpcompare,dmul")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu")
++
++(define_insn_reservation "e6500_sdiv" 20
++  (and (eq_attr "type" "sdiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu*20")
++
++(define_insn_reservation "e6500_ddiv" 35
++  (and (eq_attr "type" "ddiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu*35")
++
++;; BU.
++(define_insn_reservation "e6500_branch" 1
++  (and (eq_attr "type" "jmpreg,branch,isync")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_bu")
++
++;; BU - CR logical.
++(define_insn_reservation "e6500_cr_logical" 1
++  (and (eq_attr "type" "cr_logical,delayed_cr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_bu")
++
++;; VSFX.
++(define_insn_reservation "e6500_vecsimple" 1
++  (and (eq_attr "type" "vecsimple,veccmp")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VCFX.
++(define_insn_reservation "e6500_veccomplex" 4
++  (and (eq_attr "type" "veccomplex")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VFPU.
++(define_insn_reservation "e6500_vecfloat" 6
++  (and (eq_attr "type" "vecfloat")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VPERM.
++(define_insn_reservation "e6500_vecperm" 2
++  (and (eq_attr "type" "vecperm")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vecperm")
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:53:26.354779999 -0700
+@@ -87,6 +87,10 @@
+ 	    | MASK_ISEL)
+ RS6000_CPU ("e500mc64", PROCESSOR_PPCE500MC64,
+ 	    POWERPC_BASE_MASK | MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL)
++RS6000_CPU ("e5500", PROCESSOR_PPCE5500, POWERPC_BASE_MASK | MASK_POWERPC64
++	    | MASK_PPC_GFXOPT | MASK_ISEL)
++RS6000_CPU ("e6500", PROCESSOR_PPCE6500, POWERPC_7400_MASK | MASK_POWERPC64
++	    | MASK_MFCRF | MASK_ISEL)
+ RS6000_CPU ("860", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT)
+ RS6000_CPU ("970", PROCESSOR_POWER4,
+ 	    POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64)
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:53:26.354779999 -0700
+@@ -54,6 +54,8 @@
+    PROCESSOR_PPCE300C3,
+    PROCESSOR_PPCE500MC,
+    PROCESSOR_PPCE500MC64,
++   PROCESSOR_PPCE5500,
++   PROCESSOR_PPCE6500,
+    PROCESSOR_POWER4,
+    PROCESSOR_POWER5,
+    PROCESSOR_POWER6,
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.c	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.c	2012-07-06 19:53:26.354779999 -0700
+@@ -755,6 +755,44 @@
+   1,			/* prefetch streams /*/
+ };
+ 
++/* Instruction costs on PPCE5500 processors.  */
++static const
++struct processor_costs ppce5500_cost = {
++  COSTS_N_INSNS (5),    /* mulsi */
++  COSTS_N_INSNS (5),    /* mulsi_const */
++  COSTS_N_INSNS (4),    /* mulsi_const9 */
++  COSTS_N_INSNS (5),    /* muldi */
++  COSTS_N_INSNS (14),   /* divsi */
++  COSTS_N_INSNS (14),   /* divdi */
++  COSTS_N_INSNS (7),    /* fp */
++  COSTS_N_INSNS (10),   /* dmul */
++  COSTS_N_INSNS (36),   /* sdiv */
++  COSTS_N_INSNS (66),   /* ddiv */
++  64,			/* cache line size */
++  32,			/* l1 cache */
++  128,			/* l2 cache */
++  1,			/* prefetch streams /*/
++};
++
++/* Instruction costs on PPCE6500 processors.  */
++static const
++struct processor_costs ppce6500_cost = {
++  COSTS_N_INSNS (5),    /* mulsi */
++  COSTS_N_INSNS (5),    /* mulsi_const */
++  COSTS_N_INSNS (4),    /* mulsi_const9 */
++  COSTS_N_INSNS (5),    /* muldi */
++  COSTS_N_INSNS (14),   /* divsi */
++  COSTS_N_INSNS (14),   /* divdi */
++  COSTS_N_INSNS (7),    /* fp */
++  COSTS_N_INSNS (10),   /* dmul */
++  COSTS_N_INSNS (36),   /* sdiv */
++  COSTS_N_INSNS (66),   /* ddiv */
++  64,			/* cache line size */
++  32,			/* l1 cache */
++  128,			/* l2 cache */
++  1,			/* prefetch streams /*/
++};
++
+ /* Instruction costs on AppliedMicro Titan processors.  */
+ static const
+ struct processor_costs titan_cost = {
+@@ -2741,13 +2779,19 @@
+     error ("target attribute or pragma changes SPE ABI");
+ 
+   if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3
+-      || rs6000_cpu == PROCESSOR_PPCE500MC || rs6000_cpu == PROCESSOR_PPCE500MC64)
++      || rs6000_cpu == PROCESSOR_PPCE500MC || rs6000_cpu == PROCESSOR_PPCE500MC64
++      || rs6000_cpu == PROCESSOR_PPCE5500)
+     {
+       if (TARGET_ALTIVEC)
+ 	error ("AltiVec not supported in this target");
+       if (TARGET_SPE)
+ 	error ("SPE not supported in this target");
+     }
++  if (rs6000_cpu == PROCESSOR_PPCE6500)
++    {
++      if (TARGET_SPE)
++	error ("SPE not supported in this target");
++    }
+ 
+   /* Disable Cell microcode if we are optimizing for the Cell
+      and not optimizing for size.  */
+@@ -2842,7 +2886,9 @@
+      user's opinion, though.  */
+   if (rs6000_block_move_inline_limit == 0
+       && (rs6000_cpu == PROCESSOR_PPCE500MC
+-	  || rs6000_cpu == PROCESSOR_PPCE500MC64))
++	  || rs6000_cpu == PROCESSOR_PPCE500MC64
++	  || rs6000_cpu == PROCESSOR_PPCE5500
++	  || rs6000_cpu == PROCESSOR_PPCE6500))
+     rs6000_block_move_inline_limit = 128;
+ 
+   /* store_one_arg depends on expand_block_move to handle at least the
+@@ -2989,6 +3035,8 @@
+     case PROCESSOR_PPC8548:
+     case PROCESSOR_PPCE500MC:
+     case PROCESSOR_PPCE500MC64:
++    case PROCESSOR_PPCE5500:
++    case PROCESSOR_PPCE6500:
+ 
+       rs6000_single_float = TARGET_E500_SINGLE || TARGET_E500_DOUBLE;
+       rs6000_double_float = TARGET_E500_DOUBLE;
+@@ -3033,7 +3081,9 @@
+ 				 || rs6000_cpu == PROCESSOR_POWER6
+ 				 || rs6000_cpu == PROCESSOR_POWER7
+ 				 || rs6000_cpu == PROCESSOR_PPCE500MC
+-				 || rs6000_cpu == PROCESSOR_PPCE500MC64);
++				 || rs6000_cpu == PROCESSOR_PPCE500MC64
++				 || rs6000_cpu == PROCESSOR_PPCE5500
++				 || rs6000_cpu == PROCESSOR_PPCE6500);
+ 
+   /* Allow debug switches to override the above settings.  These are set to -1
+      in rs6000.opt to indicate the user hasn't directly set the switch.  */
+@@ -3256,6 +3306,14 @@
+ 	rs6000_cost = &ppce500mc64_cost;
+ 	break;
+ 
++      case PROCESSOR_PPCE5500:
++	rs6000_cost = &ppce5500_cost;
++	break;
++
++      case PROCESSOR_PPCE6500:
++	rs6000_cost = &ppce6500_cost;
++	break;
++
+       case PROCESSOR_TITAN:
+ 	rs6000_cost = &titan_cost;
+ 	break;
+@@ -22304,6 +22362,8 @@
+                  || rs6000_cpu_attr == CPU_PPC750
+                  || rs6000_cpu_attr == CPU_PPC7400
+                  || rs6000_cpu_attr == CPU_PPC7450
++                 || rs6000_cpu_attr == CPU_PPCE5500
++                 || rs6000_cpu_attr == CPU_PPCE6500
+                  || rs6000_cpu_attr == CPU_POWER4
+                  || rs6000_cpu_attr == CPU_POWER5
+ 		 || rs6000_cpu_attr == CPU_POWER7
+@@ -22849,6 +22909,8 @@
+   case CPU_PPCE300C3:
+   case CPU_PPCE500MC:
+   case CPU_PPCE500MC64:
++  case CPU_PPCE5500:
++  case CPU_PPCE6500:
+   case CPU_TITAN:
+     return 2;
+   case CPU_RIOS2:
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.h	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.h	2012-07-06 19:53:26.358779999 -0700
+@@ -168,6 +168,8 @@
+ %{mcpu=e300c3: -me300} \
+ %{mcpu=e500mc: -me500mc} \
+ %{mcpu=e500mc64: -me500mc64} \
++%{mcpu=e5500: -me5500} \
++%{mcpu=e6500: -me6500} \
+ %{maltivec: -maltivec} \
+ %{mvsx: -mvsx %{!maltivec: -maltivec} %{!mcpu*: %(asm_cpu_power7)}} \
+ -many"
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:52:32.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:53:26.358779999 -0700
+@@ -166,7 +166,7 @@
+ ;; Processor type -- this attribute must exactly match the processor_type
+ ;; enumeration in rs6000.h.
+ 
+-(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
++(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,ppce5500,ppce6500,power4,power5,power6,power7,cell,ppca2,titan"
+   (const (symbol_ref "rs6000_cpu_attr")))
+ 
+ 
+@@ -194,6 +194,8 @@
+ (include "e300c2c3.md")
+ (include "e500mc.md")
+ (include "e500mc64.md")
++(include "e5500.md")
++(include "e6500.md")
+ (include "power4.md")
+ (include "power5.md")
+ (include "power6.md")
+Index: gcc-4_7-branch/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4_7-branch.orig/gcc/doc/invoke.texi	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/doc/invoke.texi	2012-07-06 19:53:26.362779999 -0700
+@@ -16565,11 +16565,13 @@
+ @samp{603e}, @samp{604}, @samp{604e}, @samp{620}, @samp{630}, @samp{740},
+ @samp{7400}, @samp{7450}, @samp{750}, @samp{801}, @samp{821}, @samp{823},
+ @samp{860}, @samp{970}, @samp{8540}, @samp{a2}, @samp{e300c2},
+-@samp{e300c3}, @samp{e500mc}, @samp{e500mc64}, @samp{ec603e}, @samp{G3},
+-@samp{G4}, @samp{G5}, @samp{titan}, @samp{power}, @samp{power2}, @samp{power3},
+-@samp{power4}, @samp{power5}, @samp{power5+}, @samp{power6}, @samp{power6x},
+-@samp{power7}, @samp{common}, @samp{powerpc}, @samp{powerpc64}, @samp{rios},
+-@samp{rios1}, @samp{rios2}, @samp{rsc}, and @samp{rs64}.
++@samp{e300c3}, @samp{e500mc}, @samp{e500mc64}, @samp{e5500},
++@samp{e6500}, @samp{ec603e}, @samp{G3}, @samp{G4}, @samp{G5},
++@samp{titan}, @samp{power}, @samp{power2}, @samp{power3},
++@samp{power4}, @samp{power5}, @samp{power5+}, @samp{power6},
++@samp{power6x}, @samp{power7}, @samp{common}, @samp{powerpc},
++@samp{powerpc64}, @samp{rios}, @samp{rios1}, @samp{rios2}, @samp{rsc},
++and @samp{rs64}.
+ 
+ @option{-mcpu=common} selects a completely generic processor.  Code
+ generated under this option will run on any POWER or PowerPC processor.
+Index: gcc-4_7-branch/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c	2012-07-06 19:53:26.362779999 -0700
+@@ -14,7 +14,7 @@
+ 
+ /* We should be able to optimize this to just "return 0.0;" */
+ /* { dg-final { scan-tree-dump-times "BIT_FIELD_REF" 0 "optimized"} } */
+-/* { dg-final { scan-tree-dump-times "0.0" 1 "optimized"} } */
++/* { dg-final { scan-tree-dump-times "0\\\.0" 1 "optimized"} } */
+ 
+ /* { dg-final { cleanup-tree-dump "optimized" } } */
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch
new file mode 100644
index 0000000..bea2063
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch
@@ -0,0 +1,72 @@
+Upstream-Status:Backport
+Hi,
+
+As suggested by richi.
+regtested on i686-linux-gnu with all default languages and no regressions.
+Ok for trunk?
+
+gcc/ChangeLog
+2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	PR target/32219
+	* varasm.c (default_binds_local_p_1): Weak data is not local.
+
+gcc/testsuite/ChangeLog
+2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
+
+	PR target/32219
+	* gcc.dg/visibility-21.c: New test.
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
+ gcc/varasm.c                         |    8 ++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
+
+Index: gcc-4_7-branch/gcc/testsuite/gcc.dg/visibility-21.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/gcc/testsuite/gcc.dg/visibility-21.c	2012-04-10 10:39:38.083396738 -0700
+@@ -0,0 +1,14 @@
++/* PR target/32219 */
++/* { dg-do run } */
++/* { dg-require-visibility "" } */
++/* { dg-options "-fPIC" { target fpic } } */
++
++extern void f() __attribute__((weak,visibility("hidden")));
++extern int puts( char const* );
++int main()
++{
++	if (f)
++		f();
++	return 0;
++}
++
+Index: gcc-4_7-branch/gcc/varasm.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/varasm.c	2012-04-10 10:17:24.127330049 -0700
++++ gcc-4_7-branch/gcc/varasm.c	2012-04-10 10:39:38.087396414 -0700
+@@ -6937,6 +6937,10 @@
+   /* Static variables are always local.  */
+   else if (! TREE_PUBLIC (exp))
+     local_p = true;
++  /* hidden weak can't be overridden by something non-local, all
++     that is possible is that it is not defined at all. */
++  else if (DECL_WEAK (exp))
++    local_p = false;
+   /* A variable is local if the user has said explicitly that it will
+      be.  */
+   else if ((DECL_VISIBILITY_SPECIFIED (exp)
+@@ -6950,11 +6954,6 @@
+      local.  */
+   else if (DECL_VISIBILITY (exp) != VISIBILITY_DEFAULT)
+     local_p = true;
+-  /* Default visibility weak data can be overridden by a strong symbol
+-     in another module and so are not local.  */
+-  else if (DECL_WEAK (exp)
+-	   && !resolved_locally)
+-    local_p = false;
+   /* If PIC, then assume that any global name can be overridden by
+      symbols resolved from other modules.  */
+   else if (shlib)
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
new file mode 100644
index 0000000..5b8064b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
@@ -0,0 +1,135 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 98da658b6944d0bf54beb10001e567d8b8922666 Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 6 Jun 2012 18:09:18 +0000
+Subject: [PATCH] 2012-06-06  Edmar Wienskoski  <edmar@freescale.com>
+
+	* config/rs6000/rs6000-tables.opt: Regenerated.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188274 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                       |    4 +++
+ gcc/config/rs6000/rs6000-tables.opt |   58 +++++++++++++++++++----------------
+ 2 files changed, 36 insertions(+), 26 deletions(-)
+
+Index: git/gcc/config/rs6000/rs6000-tables.opt
+===================================================================
+--- git.orig/gcc/config/rs6000/rs6000-tables.opt	2012-07-06 20:54:29.000000000 -0700
++++ git/gcc/config/rs6000/rs6000-tables.opt	2012-07-06 20:58:12.436646819 -0700
+@@ -126,80 +126,86 @@
+ Enum(rs6000_cpu_opt_value) String(e500mc64) Value(32)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(860) Value(33)
++Enum(rs6000_cpu_opt_value) String(e5500) Value(33)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(970) Value(34)
++Enum(rs6000_cpu_opt_value) String(e6500) Value(34)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(cell) Value(35)
++Enum(rs6000_cpu_opt_value) String(860) Value(35)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(common) Value(36)
++Enum(rs6000_cpu_opt_value) String(970) Value(36)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(ec603e) Value(37)
++Enum(rs6000_cpu_opt_value) String(cell) Value(37)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G3) Value(38)
++Enum(rs6000_cpu_opt_value) String(common) Value(38)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G4) Value(39)
++Enum(rs6000_cpu_opt_value) String(ec603e) Value(39)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G5) Value(40)
++Enum(rs6000_cpu_opt_value) String(G3) Value(40)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(titan) Value(41)
++Enum(rs6000_cpu_opt_value) String(G4) Value(41)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power) Value(42)
++Enum(rs6000_cpu_opt_value) String(G5) Value(42)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power2) Value(43)
++Enum(rs6000_cpu_opt_value) String(titan) Value(43)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power3) Value(44)
++Enum(rs6000_cpu_opt_value) String(power) Value(44)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power4) Value(45)
++Enum(rs6000_cpu_opt_value) String(power2) Value(45)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power5) Value(46)
++Enum(rs6000_cpu_opt_value) String(power3) Value(46)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power5+) Value(47)
++Enum(rs6000_cpu_opt_value) String(power4) Value(47)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power6) Value(48)
++Enum(rs6000_cpu_opt_value) String(power5) Value(48)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power6x) Value(49)
++Enum(rs6000_cpu_opt_value) String(power5+) Value(49)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power7) Value(50)
++Enum(rs6000_cpu_opt_value) String(power6) Value(50)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(powerpc) Value(51)
++Enum(rs6000_cpu_opt_value) String(power6x) Value(51)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(powerpc64) Value(52)
++Enum(rs6000_cpu_opt_value) String(power7) Value(52)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios) Value(53)
++Enum(rs6000_cpu_opt_value) String(powerpc) Value(53)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios1) Value(54)
++Enum(rs6000_cpu_opt_value) String(powerpc64) Value(54)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios2) Value(55)
++Enum(rs6000_cpu_opt_value) String(rios) Value(55)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rsc) Value(56)
++Enum(rs6000_cpu_opt_value) String(rios1) Value(56)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rsc1) Value(57)
++Enum(rs6000_cpu_opt_value) String(rios2) Value(57)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rs64) Value(58)
++Enum(rs6000_cpu_opt_value) String(rsc) Value(58)
++
++EnumValue
++Enum(rs6000_cpu_opt_value) String(rsc1) Value(59)
++
++EnumValue
++Enum(rs6000_cpu_opt_value) String(rs64) Value(60)
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch
new file mode 100644
index 0000000..212c263
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch
@@ -0,0 +1,77 @@
+Upstream-Status: Pending
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+---
+ gcc/Makefile.in  |    2 +-
+ gcc/configure    |    4 ++--
+ gcc/configure.ac |    4 ++--
+ gcc/mkconfig.sh  |    4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+Index: gcc-4_7-branch/gcc/Makefile.in
+===================================================================
+--- gcc-4_7-branch.orig/gcc/Makefile.in	2012-04-10 10:37:09.347387424 -0700
++++ gcc-4_7-branch/gcc/Makefile.in	2012-04-10 10:39:24.019393881 -0700
+@@ -481,7 +481,7 @@
+ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+Index: gcc-4_7-branch/gcc/configure
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure	2012-04-10 10:37:57.211389779 -0700
++++ gcc-4_7-branch/gcc/configure	2012-04-10 10:39:24.027393938 -0700
+@@ -11692,8 +11692,8 @@
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+Index: gcc-4_7-branch/gcc/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 10:37:57.215389769 -0700
++++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:39:24.027393938 -0700
+@@ -1699,8 +1699,8 @@
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+Index: gcc-4_7-branch/gcc/mkconfig.sh
+===================================================================
+--- gcc-4_7-branch.orig/gcc/mkconfig.sh	2012-04-10 10:17:24.383330061 -0700
++++ gcc-4_7-branch/gcc/mkconfig.sh	2012-04-10 10:39:24.027393938 -0700
+@@ -78,7 +78,7 @@
+     if [ $# -ge 1 ]; then
+ 	echo '#ifdef IN_GCC' >> ${output}T
+ 	for file in "$@"; do
+-	    if test x"$file" = x"defaults.h"; then
++	    if test x"$file" = x"./defaults.h"; then
+ 		postpone_defaults_h="yes"
+ 	    else
+ 		echo "# include \"$file\"" >> ${output}T
+@@ -104,7 +104,7 @@
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
new file mode 100644
index 0000000..4d22924
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
@@ -0,0 +1,87 @@
+Use the multilib config files from ${B} instead of using the ones from ${S}
+so that the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: gcc-4.7.2/gcc/configure
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure
++++ gcc-4.7.2/gcc/configure
+@@ -11717,10 +11717,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -11731,6 +11741,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
+Index: gcc-4.7.2/gcc/configure.ac
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure.ac
++++ gcc-4.7.2/gcc/configure.ac
+@@ -1701,10 +1701,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -1715,6 +1725,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
new file mode 100644
index 0000000..7c5bbe7
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
@@ -0,0 +1,43 @@
+This is a backport from gcc bugzilla
+
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55383
+
+fixes wrong warning behavior which has no workaround
+other than disabling the warning
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.7.2/gcc/c-typeck.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/c-typeck.c	2012-09-13 10:04:44.000000000 -0700
++++ gcc-4.7.2/gcc/c-typeck.c	2013-03-10 23:09:17.610899536 -0700
+@@ -4557,7 +4557,7 @@
+     /* There are qualifiers present in IN_OTYPE that are not present
+        in IN_TYPE.  */
+     warning_at (loc, OPT_Wcast_qual,
+-		"cast discards %q#v qualifier from pointer target type",
++		"cast discards %qv qualifier from pointer target type",
+ 		discarded);
+ 
+   if (added || discarded)
+Index: gcc-4.7.2/gcc/testsuite/c-c++-common/Wcast-qual-1.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/testsuite/c-c++-common/Wcast-qual-1.c	2011-04-07 14:47:38.000000000 -0700
++++ gcc-4.7.2/gcc/testsuite/c-c++-common/Wcast-qual-1.c	2013-03-10 23:15:45.610894589 -0700
+@@ -85,11 +85,11 @@
+ void
+ f4 (void * const **bar)
+ {
+-  const void ***p9 = (const void ***) bar; /* { dg-warning "cast" } */
++  const void ***p9 = (const void ***) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   void * const **p11 = (void * const **) bar;
+-  void ** const *p13 = (void ** const *) bar; /* { dg-warning "cast" } */
++  void ** const *p13 = (void ** const *) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   const void * const **p15 = (const void * const **) bar; /* { dg-warning "cast" } */
+-  const void ** const *p17 = (const void ** const *) bar; /* { dg-warning "cast" } */
++  const void ** const *p17 = (const void ** const *) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   void * const * const * p19 = (void * const * const *) bar;
+   const void * const * const *p21 = (const void * const * const *) bar;
+ }
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
new file mode 100644
index 0000000..a5daa01
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
@@ -0,0 +1,124 @@
+DESCRIPTION = "The GNU cc and gcc C compilers."
+HOMEPAGE = "http://www.gnu.org/software/gcc/"
+SECTION = "devel"
+LICENSE = "GPL"
+
+NATIVEDEPS = ""
+
+inherit autotools gettext
+
+def get_gcc_fpu_setting(bb, d):
+    if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
+        return "--with-float=hard"
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+        return "--with-float=soft"
+    if d.getVar('TARGET_FPU', True) in [ 'ppc-efd' ]:
+        return "--enable-e500_double"
+    return ""
+
+get_gcc_fpu_setting[vardepvalue] = "${@get_gcc_fpu_setting(bb, d)}"
+
+def get_gcc_mips_plt_setting(bb, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
+        return "--with-mips-plt"
+    return ""
+
+def get_gcc_multiarch_setting(bb, d):
+    target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    multiarch_options = {
+        "i586":    "--enable-targets=all",
+        "powerpc": "--enable-targets=powerpc64",
+        "sparc":   "--enable-targets=all",
+    }
+
+    if 'multiarch' in d.getVar('DISTRO_FEATURES', True).split() :
+        if target_arch in multiarch_options :
+            return multiarch_options[target_arch]
+    return ""
+
+# this is used by the multilib setup of gcc
+def get_tune_parameters(tune, d):
+    availtunes = d.getVar('AVAILTUNES', True)
+    if tune not in availtunes.split():
+        bb.error('The tune: %s is not one of the available tunes: %s', tune or None, availtunes)
+
+    localdata = bb.data.createCopy(d)
+    override = ':tune-' + tune
+    localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES', False) + override)
+    bb.data.update_data(localdata)
+
+    retdict = {}
+    retdict['tune'] = tune
+    retdict['ccargs'] = localdata.getVar('TUNE_CCARGS', True)
+    retdict['features'] = localdata.getVar('TUNE_FEATURES', True)
+    # BASELIB is used by the multilib code to change library paths
+    retdict['baselib'] = localdata.getVar('BASE_LIB', True) or localdata.getVar('BASELIB', True)
+    retdict['arch'] = localdata.getVar('TUNE_ARCH', True)
+    retdict['abiextension'] = localdata.getVar('ABIEXTENSION', True)
+    retdict['target_fpu'] = localdata.getVar('TARGET_FPU', True)
+    retdict['pkgarch'] = localdata.getVar('TUNE_PKGARCH', True)
+    retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
+    return retdict
+
+get_tune_parameters[vardepsexclude] = "AVAILTUNES"
+
+DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
+
+MIRRORS =+ "\
+${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
+${GNU_MIRROR}/gcc	ftp://gd.tuwien.ac.at/gnu/gcc/ \n \
+${GNU_MIRROR}/gcc	http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
+${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
+${GNU_MIRROR}/gcc	http://gcc.get-software.com/releases/ \n \
+"
+
+#
+# Set some default values
+#
+gcclibdir = "${libdir}/gcc"
+BINV = "${PV}"
+#S = "${WORKDIR}/gcc-${PV}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# SS means Shared Stamps directory
+SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}-${PR}"
+do_fetch[stamp-base] = "${SS}"
+do_unpack[stamp-base] = "${SS}"
+do_patch[stamp-base] = "${SS}"
+SSCLEAN = "${TMPDIR}/stamps/work-shared/gcc-[0-9]*-*"
+do_fetch[stamp-base-clean] = "${SSCLEAN}"
+do_unpack[stamp-base-clean] = "${SSCLEAN}"
+do_unpack[umask] = "022"
+do_patch[stamp-base-clean] = "${SSCLEAN}"
+
+# SW means Shared Work directory
+SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
+WORKDIR_task-unpack = "${SW}"
+WORKDIR_task-patch = "${SW}"
+
+target_includedir ?= "${includedir}"
+target_libdir ?= "${libdir}"
+target_base_libdir ?= "${base_libdir}"
+target_prefix ?= "${prefix}"
+
+CLEANFUNCS += "workshared_clean"
+# The do_clean should be exclusive since share ${S}
+do_clean[lockfiles] = "${SW}.clean.lock"
+
+python workshared_clean () {
+	"""clear the source directory"""
+	dir = d.expand("${SW}")
+	bb.note("Removing " + dir)
+	oe.path.remove(dir)
+
+	"""clear the the stamps in work-shared"""
+	dir = "%s.*" % bb.data.expand(d.getVarFlag('do_fetch', 'stamp-base', True), d)
+	bb.note("Removing " + dir)
+	oe.path.remove(dir)
+}
+
+# We need to ensure that for the shared work directory, the do_patch singatures match
+# The real WORKDIR location isn't a dependency for the shared workdir.
+src_patches[vardepsexclude] = "WORKDIR"
+should_apply[vardepsexclude] += "PN"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc
new file mode 100644
index 0000000..dc44cc9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc
@@ -0,0 +1,133 @@
+require gcc-multilib-config.inc
+#
+# Build the list of lanaguages to build.
+#
+# These can be overridden by the version specific .inc file.
+
+# Java (gcj doesn't work on all architectures)
+JAVA ?= ",java"
+JAVA_arm ?= ""
+JAVA_armeb ?= ""
+JAVA_mipsel ?= ""
+JAVA_sh3 ?= ""
+# gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
+FORTRAN ?= ",f77"
+LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
+# disable --enable-target-optspace for powerpc SPE
+# at -Os libgcc.so.1 creates references into
+# hidden symbols in libgcc.a which linker complains
+# when linking shared libraries further in the build like (gnutls)
+
+SPECIAL_ARCH_LIST = "powerpc"
+OPTSPACE = '${@base_contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}'
+
+EXTRA_OECONF_BASE ?= ""
+EXTRA_OECONF_PATHS ?= ""
+EXTRA_OECONF_INITIAL ?= ""
+EXTRA_OECONF_INTERMEDIATE ?= ""
+
+GCCMULTILIB ?= "--disable-multilib"
+GCCTHREADS ?= "posix"
+
+EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
+                --with-gnu-ld \
+                --enable-shared \
+                --enable-languages=${LANGUAGES} \
+                --enable-threads=${GCCTHREADS} \
+                ${GCCMULTILIB} \
+                --enable-c99 \
+                --enable-long-long \
+                --enable-symvers=gnu \
+                --enable-libstdcxx-pch \
+                --program-prefix=${TARGET_PREFIX} \
+		--without-local-prefix \
+                ${OPTSPACE} \
+                ${EXTRA_OECONF_BASE} \
+                ${EXTRA_OECONF_FPU} \
+                ${EXTRA_OECONF_PATHS} \
+                ${@get_gcc_mips_plt_setting(bb, d)} \
+                ${@get_gcc_multiarch_setting(bb, d)}"
+
+export ac_cv_path_SED = 'sed'
+export gcc_cv_collect2_libs = 'none required'
+# We need to set gcc_cv_collect2_libs else there is cross-compilation badness
+# in the config.log files (which might not get generated until do_compile
+# hence being missed by the insane do_configure check).
+
+# Build uclibc compilers without cxa_atexit support
+EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
+EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atexit"
+
+EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+
+EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
+CPPFLAGS = ""
+
+# powerpc needs this to comply with the ABI
+EXTRA_OECONF_append_powerpc = " --with-long-double-128"
+EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
+
+# Used by configure to define additional values for FLAGS_FOR_TARGET -
+# passed to all the compilers.
+ARCH_FLAGS_FOR_TARGET = "${TARGET_CC_ARCH}"
+EXTRA_OEMAKE += "ARCH_FLAGS_FOR_TARGET='${ARCH_FLAGS_FOR_TARGET}'"
+
+SYSTEMHEADERS = "${target_includedir}"
+SYSTEMLIBS = "${target_base_libdir}/"
+SYSTEMLIBS1 = "${target_libdir}/"
+
+do_configure_prepend () {
+	# teach gcc to find correct target includedir when checking libc ssp support
+	mkdir -p ${B}/gcc
+	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
+	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
+	cat >>${B}/gcc/defaults.h.new <<_EOF
+#ifndef STANDARD_INCLUDE_DIR
+#define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
+#endif
+#ifndef STANDARD_STARTFILE_PREFIX_1
+#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
+#endif
+#ifndef STANDARD_STARTFILE_PREFIX_2
+#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
+#endif
+#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
+#endif /* ! GCC_DEFAULTS_H */
+_EOF
+	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
+}
+
+do_configure () {
+	# Setup these vars for cross building only
+	# ... because foo_FOR_TARGET apparently gets misinterpreted inside the
+	# gcc build stuff when the build is producing a cross compiler - i.e.
+	# when the 'current' target is the 'host' system, and the host is not
+	# the target (because the build is actually making a cross compiler!)
+	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
+		export CC_FOR_TARGET="${CC}"
+		export GCC_FOR_TARGET="${CC}"
+		export CXX_FOR_TARGET="${CXX}"
+		export AS_FOR_TARGET="${HOST_PREFIX}as"
+		export LD_FOR_TARGET="${HOST_PREFIX}ld"
+		export NM_FOR_TARGET="${HOST_PREFIX}nm"
+		export AR_FOR_TARGET="${HOST_PREFIX}ar"
+		export GFORTRAN_FOR_TARGET="gfortran"
+		export RANLIB_FOR_TARGET="${HOST_PREFIX}ranlib"
+	fi
+	export CC_FOR_BUILD="${BUILD_CC}"
+	export CXX_FOR_BUILD="${BUILD_CXX}"
+	export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
+	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
+	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
+	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
+	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
+	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
+
+	oe_runconf
+}
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc
new file mode 100644
index 0000000..c660ad4
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc
@@ -0,0 +1,22 @@
+require gcc-4.7.inc
+PV = "linaro-${BASEPV}"
+MMYY = "13.03"
+RELEASE = "20${MMYY}"
+PR = "r${RELEASE}"
+BINV = "4.7.3"
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-${PV}' ], d)}"
+
+SRC_URI = "http://releases.linaro.org/${MMYY}/components/toolchain/gcc-linaro/${BASEPV}/gcc-${PV}-${RELEASE}.tar.bz2 \
+	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+	   file://64bithack.patch \
+	   file://optional_libstdc.patch \
+	   file://use-defaults.h-and-t-oe-in-B.patch \
+	   file://fix-g++-sysroot.patch \
+	  "
+
+SRC_URI[md5sum] = "72e37ed0601f72e4d7e842d7e5373148"
+SRC_URI[sha256sum] = "b46960070614c72c21587f3294f88fc21896ac1aab8bd007ddc1731255daabeb"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}-${RELEASE}"
+B = "${WORKDIR}/gcc-${PV}-${RELEASE}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch
new file mode 100644
index 0000000..7a4ba4c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch
@@ -0,0 +1,27 @@
+This patch causes the GCC to install the libstc++ into lib as opposed to
+lib64 on X86_64 Linux targets. Usually the libstdc++ will be placed in lib64
+during the install step. Because that's where 64bit libs go for linux targets
+according to the FHS. If you don't like this but want to use linux as a target
+you have to patch the toolchain which is what 64bithack.patch attempts to do.
+One solution would be to have a distinctive OE target that doesn't support
+multilib and has 64bit libs under lib. The advantage over the current
+meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch provided by oe-core is that
+multilib upport is entirely disabled and MULTILIB_OSDIRNAMES is empty. This
+prevents a broken toolchain in case --enable-multilib gets used.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ken Werner <ken.werner@linaro.org>
+
+Index: gcc-linaro-4.7-2012.05/gcc/config.gcc
+===================================================================
+--- gcc-linaro-4.7-2012.05.orig/gcc/config.gcc
++++ gcc-linaro-4.7-2012.05/gcc/config.gcc
+@@ -1303,7 +1303,6 @@ x86_64-*-linux* | x86_64-*-kfreebsd*-gnu
+ 		tm_file="${tm_file} knetbsd-gnu.h"
+ 		;;
+ 	esac
+-	tmake_file="${tmake_file} i386/t-linux64"
+ 	x86_multilibs="${with_multilib_list}"
+ 	if test "$x86_multilibs" = "default"; then
+ 		x86_multilibs="m64,m32"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch
new file mode 100644
index 0000000..e6028d5
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch
@@ -0,0 +1,78 @@
+backport
+
+http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Refreshed for meta-linaro by Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+---
+ gcc/configure    |    8 +++++++-
+ gcc/configure.ac |    8 +++++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+--- gcc-linaro-4.7-2013.02.orig/gcc/configure
++++ gcc-linaro-4.7-2013.02/gcc/configure
+@@ -3322,11 +3322,13 @@ fi
+ 
+ gcc_gxx_include_dir_add_sysroot=0
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+ 
+ 
+@@ -7284,10 +7286,14 @@ fi
+ 
+ # Check whether --with-sysroot was given.
+ if test "${with_sysroot+set}" = set; then :
+   withval=$with_sysroot;
+  case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
+  yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+  *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+  esac
+ 
+  TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
+--- gcc-linaro-4.7-2013.02.orig/gcc/configure.ac
++++ gcc-linaro-4.7-2013.02/gcc/configure.ac
+@@ -147,11 +147,13 @@ fi
+ 
+ gcc_gxx_include_dir_add_sysroot=0
+ if test "${with_sysroot+set}" = set; then
+   gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
+   if test "${gcc_gxx_without_sysroot}"; then
+-    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    if test x${with_sysroot} != x/; then
++      gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    fi
+     gcc_gxx_include_dir_add_sysroot=1
+   fi
+ fi
+ 
+ AC_ARG_WITH(cpp_install_dir,
+@@ -784,10 +786,14 @@ AC_SUBST(SYSROOT_CFLAGS_FOR_TARGET)
+ AC_ARG_WITH(sysroot,
+ [AS_HELP_STRING([[--with-sysroot[=DIR]]],
+ 		[search for usr/lib, usr/include, et al, within DIR])],
+ [
+  case ${with_sysroot} in
++ /) ;;
++ */) with_sysroot=`echo $with_sysroot | sed 's,/$,,'` ;;
++ esac
++ case ${with_sysroot} in
+  yes) TARGET_SYSTEM_ROOT='${exec_prefix}/${target_noncanonical}/sys-root' ;;
+  *) TARGET_SYSTEM_ROOT=$with_sysroot ;;
+  esac
+    
+  TARGET_SYSTEM_ROOT_DEFINE='-DTARGET_SYSTEM_ROOT=\"$(TARGET_SYSTEM_ROOT)\"'
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..964c4bb
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+---
+ configure    |    2 +-
+ configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4_7-branch/configure.ac
+===================================================================
+--- gcc-4_7-branch.orig/configure.ac	2012-04-10 10:19:50.923337154 -0700
++++ gcc-4_7-branch/configure.ac	2012-04-10 10:19:54.911337344 -0700
+@@ -2825,7 +2825,7 @@
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+Index: gcc-4_7-branch/configure
+===================================================================
+--- gcc-4_7-branch.orig/configure	2012-04-10 10:19:50.911337153 -0700
++++ gcc-4_7-branch/configure	2012-04-10 10:19:54.915337349 -0700
+@@ -7368,7 +7368,7 @@
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch
new file mode 100644
index 0000000..fe157a8
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++ 
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc 
+driver. This patch adds such an option which only disables the -lstdc++.
+
+A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to 
+do this officially, the likely answer is don't build libstdc++ separately.
+
+RP 29/6/10
+
+Index: gcc-4.6.0/gcc/cp/g++spec.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/cp/g++spec.c
++++ gcc-4.6.0/gcc/cp/g++spec.c
+@@ -127,6 +127,7 @@ lang_specific_driver (struct cl_decoded_
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+Index: gcc-4.6.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.6.0.orig/gcc/doc/invoke.texi
++++ gcc-4.6.0/gcc/doc/invoke.texi
+@@ -193,7 +193,7 @@ in the following sections.
+ -fno-pretty-templates @gol
+ -frepo  -fno-rtti  -fstats  -ftemplate-depth=@var{n} @gol
+ -fno-threadsafe-statics -fuse-cxa-atexit  -fno-weak  -nostdinc++ @gol
+--fno-default-inline  -fvisibility-inlines-hidden @gol
++-nostdlib++ -fno-default-inline  -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
+ -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
+ -Wnoexcept -Wnon-virtual-dtor  -Wreorder @gol
+@@ -431,7 +431,7 @@ Objective-C and Objective-C++ Dialects}.
+ @gccoptlist{@var{object-file-name}  -l@var{library} @gol
+ -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
+ -s  -static  -static-libgcc  -static-libstdc++ -shared  @gol
+--shared-libgcc  -symbolic @gol
++-shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}}
+ 
+@@ -9069,6 +9069,11 @@ These entries are usually resolved by en
+ libc.  These entry points should be supplied through some other
+ mechanism when this option is specified.
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
+ @cindex @option{-lgcc}, use with @option{-nostdlib}
+ @cindex @option{-nostdlib} and unresolved references
+ @cindex unresolved references and @option{-nostdlib}
+Index: gcc-4.6.0/gcc/c-family/c.opt
+===================================================================
+--- gcc-4.6.0.orig/gcc/c-family/c.opt
++++ gcc-4.6.0/gcc/c-family/c.opt
+@@ -1111,6 +1111,10 @@ nostdinc++
+ C++ ObjC++
+ Do not search standard system include directories for C++
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+Index: gcc-4.6.0/gcc/gcc.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/gcc.c
++++ gcc-4.6.0/gcc/gcc.c
+@@ -666,6 +666,7 @@ proper position among the other output f
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov}\
+     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
+ #endif
+ 
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch
new file mode 100644
index 0000000..b4351ee
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Pending
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+---
+ gcc/Makefile.in  |    2 +-
+ gcc/configure    |    4 ++--
+ gcc/configure.ac |    4 ++--
+ gcc/mkconfig.sh  |    4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 7790915..3a0c34a 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -463,7 +463,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR)/limits.h ]
+ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index 82fa3e4..d4711b5 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -11227,8 +11227,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 844d8da..a960343 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1628,8 +1628,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
+index d56df8c..875d0f1 100644
+--- a/gcc/mkconfig.sh
++++ b/gcc/mkconfig.sh
+@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
+     if [ $# -ge 1 ]; then
+ 	echo '#ifdef IN_GCC' >> ${output}T
+ 	for file in "$@"; do
+-	    if test x"$file" = x"defaults.h"; then
++	    if test x"$file" = x"./defaults.h"; then
+ 		postpone_defaults_h="yes"
+ 	    else
+ 		echo "# include \"$file\"" >> ${output}T
+@@ -103,7 +103,7 @@ esac
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
+-- 
+1.7.1
+
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc
new file mode 100644
index 0000000..f9d6311
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc
@@ -0,0 +1,2 @@
+BASEPV = "4.7"
+PV = "linaro-${BASEPV}"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc
new file mode 100644
index 0000000..005aa6b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -0,0 +1,191 @@
+# following code modifies these definitions in the gcc config
+#    MULTILIB_OPTIONS
+#    MULTILIB_DIRNAMES
+#    MULTILIB_OSDIRNAMES
+#    GLIBC_DYNAMIC_LINKER32
+#    GLIBC_DYNAMIC_LINKER64
+#    GLIBC_DYNAMIC_LINKERX32
+#    GLIBC_DYNAMIC_LINKERN32
+#  For more information on use of these variables look at these files in the gcc source code
+#    gcc/config/i386/t-linux64
+#    gcc/config/mips/t-linux64
+#    gcc/config/rs6000/t-linux64
+#    gcc/config/i386/linux64.h
+#    gcc/config/mips/linux64.h
+#    gcc/config/rs6000/linux64.h
+
+python gcc_multilib_setup() {
+    import re
+    import shutil
+    import glob
+
+    srcdir = d.getVar('S', True)
+    builddir = d.getVar('B', True)
+    src_conf_dir = '%s/gcc/config' % srcdir
+    build_conf_dir = '%s/gcc/config' % builddir
+
+    bb.utils.remove(build_conf_dir, True)
+    ml_globs = ('%s/*/t-linux64' % src_conf_dir,
+                '%s/*/linux64.h' % src_conf_dir)
+
+    # copy the target multilib config files to ${B}
+    for ml_glob in ml_globs:
+        for fn in glob.glob(ml_glob):
+            rel_path = os.path.relpath(fn, src_conf_dir)
+            parent_dir = os.path.dirname(rel_path)
+            bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
+            bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
+
+    multilibs = (d.getVar('MULTILIB_VARIANTS', True) or '').split()
+    if not multilibs:
+        return
+
+    mlprefix = d.getVar('MLPREFIX', True)
+    pn = d.getVar('PN', True)
+    if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')):
+        return
+
+
+    def write_config(root, files, options, dirnames, osdirnames):
+        for ml_conf_file in files:
+            with open(root + '/' + ml_conf_file, 'r') as f:
+                filelines = f.readlines()
+                # recreate multilib configuration variables
+                substs = [
+                    (r'^(\s*(MULTILIB_OPTIONS\s*=).*)$', r'\2 %s' % '/'.join(options)),
+                    (r'^(\s*MULTILIB_OPTIONS\s*\+=.*)$', ''),
+                    (r'^(\s*(MULTILIB_DIRNAMES\s*=).*)$', r'\2 %s' % ' '.join(dirnames)),
+                    (r'^(\s*MULTILIB_DIRNAMES\s*\+=.*)$', ''),
+                    (r'^(\s*(MULTILIB_OSDIRNAMES\s*=).*)$', r'\2 %s' % ' '.join(osdirnames)),
+                    (r'^(\s*MULTILIB_OSDIRNAMES\s*\+=.*)$', ''),
+                ]
+
+                for (i, line) in enumerate(filelines):
+                    for subst in substs:
+                        line = re.sub(subst[0], subst[1], line)
+                    filelines[i] = line
+
+                with open(root + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
+
+    def write_headers(root, files, libdir32, libdir64, libdirx32, libdirn32):
+        def wrap_libdir(libdir):
+            if libdir.find('SYSTEMLIBS_DIR') != -1:
+                return libdir
+            else:
+                return '"/%s/"' % libdir
+
+        for ml_conf_file in files:
+            with open(root + '/' + ml_conf_file, 'r') as f:
+                filelines = f.readlines()
+
+                # replace lines like
+                # #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+                # by
+                # #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
+                # this is needed to put the correct dynamic loader path in the generated binaries
+                substs = [
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir64) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirx32) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirn32) + r'\3'),
+                ]
+
+                for (i, line) in enumerate(filelines):
+                    for subst in substs:
+                        line = re.sub(subst[0], subst[1], line)
+                    filelines[i] = line
+
+                with open(root + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
+
+
+    gcc_target_config_files = {
+        'x86_64'    : ['gcc/config/i386/t-linux64'],
+        'i586'      : ['gcc/config/i386/t-linux64'],
+        'mips'      : ['gcc/config/mips/t-linux64'],
+        'powerpc'   : ['gcc/config/rs6000/t-linux64'],
+    }
+
+    gcc_header_config_files = {
+        'x86_64'    : ['gcc/config/i386/linux64.h'],
+        'i586'      : ['gcc/config/i386/linux64.h'],
+        'mips'      : ['gcc/config/mips/linux64.h'],
+        'powerpc'   : ['gcc/config/rs6000/linux64.h'],
+    }
+
+    target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
+                    else d.getVar('TARGET_ARCH', True))
+    if target_arch not in gcc_target_config_files:
+        bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
+        return
+
+    libdir32 = 'SYSTEMLIBS_DIR'
+    libdir64 = 'SYSTEMLIBS_DIR'
+    libdirx32 = 'SYSTEMLIBS_DIR'
+    libdirn32 = 'SYSTEMLIBS_DIR'
+
+    target_config_files = gcc_target_config_files[target_arch]
+    header_config_files = gcc_header_config_files[target_arch]
+
+    ml_list = ['DEFAULTTUNE_MULTILIB_ORIGINAL' if mlprefix else 'DEFAULTTUNE']
+    mltunes = [('DEFAULTTUNE_virtclass-multilib-%s' % ml) for ml in multilibs]
+    if mlprefix:
+        mlindex = 0
+        for ml in multilibs:
+            if mlprefix.startswith(ml):
+                break
+            mlindex += 1
+
+        ml_list.extend(mltunes[:mlindex] + ['DEFAULTTUNE'] + mltunes[(mlindex + 1):])
+    else:
+        ml_list.extend(mltunes)
+
+    options = []
+    dirnames = []
+    osdirnames = []
+
+    for ml in ml_list:
+        tune = d.getVar(ml, True)
+        if not tune:
+            bb.warn("%s doesn't have a corresponding tune. Skipping..." % ml)
+            continue
+        tune_parameters = get_tune_parameters(tune, d)
+
+        tune_baselib = tune_parameters['baselib']
+        if not tune_baselib:
+            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
+            continue
+
+        if tune_baselib == 'lib64':
+            libdir64 = tune_baselib
+        elif tune_baselib == 'libx32':
+            libdirx32 = tune_baselib
+        elif tune_baselib == 'lib32':
+            libdirn32 = tune_baselib
+        elif tune_baselib == 'lib':
+            libdir32 = tune_baselib
+        else:
+            bb.error('Unknown libdir (%s) of the tune : %s' % (tune_baselib, tune))
+
+        # take out '-' and march='s from parameters
+        options.append(re.sub(r'march=[^ ]+ *', '',
+                            re.sub(r' +\-+', ' ',
+                                re.sub(r'^ *\-+', '', tune_parameters['ccargs']))))
+        if tune_baselib == 'lib':
+            dirnames.append('32')  # /lib => 32bit lib
+        else:
+            dirnames.append(tune_baselib.replace('lib', ''))
+        osdirnames.append('../' + tune_baselib)
+
+    write_config(builddir, target_config_files, options, dirnames, osdirnames)
+    write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
+}
+
+gcc_multilib_setup[cleandirs] = "${B}/gcc/config"
+
+EXTRACONFFUNCS += "gcc_multilib_setup"
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc-target.inc b/meta-arago-distro/recipes-devtools/gcc/gcc-target.inc
new file mode 100644
index 0000000..e1179ac
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc-target.inc
@@ -0,0 +1,154 @@
+GCCMULTILIB = "--enable-multilib"
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = " \
+    --with-sysroot=/ \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
+    --with-gxx-include-dir=${includedir}/c++/"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
+
+PACKAGES = "\
+  ${PN} ${PN}-plugins ${PN}-symlinks \
+  g++ g++-symlinks \
+  cpp cpp-symlinks \
+  g77 g77-symlinks \
+  gfortran gfortran-symlinks \
+  gcov gcov-symlinks \
+  ${PN}-plugin-dev \
+  ${PN}-doc \
+  ${PN}-dev \
+  ${PN}-dbg \
+"
+
+FILES_${PN} = "\
+  ${bindir}/${TARGET_PREFIX}gcc* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+"
+INSANE_SKIP_${PN} += "dev-so"
+
+FILES_${PN}-dbg += "\
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
+"
+FILES_${PN}-dev = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+"
+FILES_${PN}-plugin-dev = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
+"
+FILES_${PN}-symlinks = "\
+  ${bindir}/cc \
+  ${bindir}/gcc \
+  ${bindir}/gccbug \
+"
+
+FILES_${PN}-plugins = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
+"
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+FILES_g77 = "\
+  ${bindir}/${TARGET_PREFIX}g77 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
+"
+FILES_g77-symlinks = "\
+  ${bindir}/g77 \
+  ${bindir}/f77 \
+"
+FILES_gfortran = "\
+  ${bindir}/${TARGET_PREFIX}gfortran \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
+"
+FILES_gfortran-symlinks = "\
+  ${bindir}/gfortran \
+  ${bindir}/f95"
+
+FILES_cpp = "\
+  ${bindir}/${TARGET_PREFIX}cpp \
+  ${base_libdir}/cpp \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
+FILES_cpp-symlinks = "${bindir}/cpp"
+
+FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
+FILES_gcov-symlinks = "${bindir}/gcov"
+
+FILES_g++ = "\
+  ${bindir}/${TARGET_PREFIX}g++ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+"
+FILES_g++-symlinks = "\
+  ${bindir}/c++ \
+  ${bindir}/g++ \
+"
+
+
+FILES_${PN}-doc = "\
+  ${infodir} \
+  ${mandir} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
+"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-host
+
+	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
+	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
+	rmdir ${D}${includedir}
+	rm -rf ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+
+	# Hack around specs file assumptions
+	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
+
+	# Cleanup manpages..
+	rm -rf ${D}${mandir}/man7
+
+	cd ${D}${bindir}
+
+	# We care about g++ not c++
+	rm -f *c++
+
+	# We don't care about the gcc-<version> ones for this
+	rm -f *gcc-?.?*
+
+	# We use libiberty from binutils
+	find ${D}${libdir} -name libiberty.a | xargs rm -f
+	find ${D}${libdir} -name libiberty.h | xargs rm -f
+
+	# Not sure why we end up with these but we don't want them...
+	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
+
+	# Symlinks so we can use these trivially on the target
+	if [ -e ${TARGET_PREFIX}g77 ]; then
+		ln -sf ${TARGET_PREFIX}g77 g77 || true
+		ln -sf g77 f77 || true
+	fi
+	if [ -e ${TARGET_PREFIX}gfortran ]; then
+		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+		ln -sf gfortran f95 || true
+	fi
+	ln -sf ${TARGET_PREFIX}g++ g++
+	ln -sf ${TARGET_PREFIX}gcc gcc
+	ln -sf ${TARGET_PREFIX}cpp cpp
+	install -d ${D}${base_libdir}
+	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
+	ln -sf g++ c++
+	ln -sf gcc cc
+
+	chown -R root:root ${D}
+}
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb
new file mode 100644
index 0000000..00ebee0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb
@@ -0,0 +1,2 @@
+require gcc-${PV}.inc
+require gcc-target.inc
diff --git a/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb
new file mode 100644
index 0000000..23c52e1
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb
@@ -0,0 +1,4 @@
+require gcc-linaro-common-4.7.inc
+require gcc_${BASEPV}.bb
+
+DEPENDS =+ "gmp-native"
-- 
2.2.0


