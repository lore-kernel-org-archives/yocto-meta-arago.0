Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 9C6FF52A4B
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00LNU5RR5G20@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Lv5vsSpc c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=mDV3o1hIAAAA:8	a=xWBUmKVxDLjsvA8V_WsA:9
	a=SdFJryzBO2sA:10
	a=AlRxVAkrsTQA:10	a=3apA0SZgePsA:10 a=DCBRYAvlYssA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EC838161AC4;	Thu,
	2 Jul 2015 23:02:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:21 -0400
Message-id: <1435892533-6046-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/54] external-arago-toolchain: remove old gcc-4.5 based arago toolchain
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-arago-sdk-toolchain.bb           | 150 ------------
 .../recipes-core/meta/external-arago-toolchain.bb  | 261 ---------------------
 .../recipes-core/meta/external-arago-toolchain.inc |  76 ------
 .../meta/external-arago-toolchain/SUPPORTED        |   4 -
 4 files changed, 491 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain/SUPPORTED

diff --git a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
deleted file mode 100644
index 00685e4..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
+++ /dev/null
@@ -1,150 +0,0 @@
-inherit cross-canadian
-
-require external-arago-toolchain.inc
-
-PR = "r7"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_DEFAULT_DEPS = "1"
-EXCLUDE_FROM_SHLIBS = "1"
-
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "\
-	file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-"
-
-INSANE_SKIP_gcc-cross-canadian-arm = "dev-so staticdev"
-INSANE_SKIP_gdb-cross-canadian-arm = "dev-so"
-INSANE_SKIP_binutils-cross-canadian-arm = "dev-so staticdev"
-
-PROVIDES = "\
-	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
-	binutils-cross-canadian-arm \
-"
-
-PACKAGES = "\
-	gcc-cross-canadian-arm \
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'gdb-cross-canadian-arm', '', d)} \
-	binutils-cross-canadian-arm \
-"
-
-# Don't need the extra target triplet in the new SDK dir structure
-bindir = "${exec_prefix}/bin"
-libdir = "${exec_prefix}/lib"
-libexecdir = "${exec_prefix}/libexec"
-datadir = "${exec_prefix}/share"
-
-gcclibdir = "${libdir}/gcc"
-
-FILES_gcc-cross-canadian-arm = "\
-	${prefix}/${ARAGO_TARGET_SYS}/bin/cpp \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/cc \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/gccbug \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/g++ \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/gcov \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/gcc \
-	${prefix}/${ARAGO_TARGET_SYS}/lib/libstdc++.* \
-	${prefix}/${ARAGO_TARGET_SYS}/lib/libssp* \
-	${prefix}/${ARAGO_TARGET_SYS}/lib/libgcc_s.* \
-	${prefix}/${ARAGO_TARGET_SYS}/lib/libsupc++.* \
-	${gcclibdir}/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}/* \
-	${bindir}/${TARGET_PREFIX}gcov \
-	${bindir}/${TARGET_PREFIX}gccbug \
-	${bindir}/${TARGET_PREFIX}gcc \
-	${bindir}/${TARGET_PREFIX}g++ \
-	${bindir}/${TARGET_PREFIX}cpp \
-	${libexecdir}/* \
-"
-
-FILES_gdb-cross-canadian-arm = "\
-	${bindir}/${TARGET_PREFIX}gdb \
-	${bindir}/${TARGET_PREFIX}gdbtui \
-	${datadir}/gdb/* \
-	${datadir}/info/* \
-	${datadir}/man/man1/${TARGET_PREFIX}* \
-"
-
-FILES_binutils-cross-canadian-arm = "\
-	${prefix}/${ARAGO_TARGET_SYS}/bin/ld \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/addr2line \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/objcopy \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/readelf \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/strip \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/nm \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/ranlib \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/gprof \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/as \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/c++filt \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/ar \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/strings \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/objdump \
-	${prefix}/${ARAGO_TARGET_SYS}/bin/size \
-	${includedir}/*.h \
-	${libdir}/ldscripts/* \
-	${libdir}/libiberty.a \
-	${bindir}/${TARGET_PREFIX}ld \
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
-	${prefix}/i686-linux/* \
-"
-
-DESCRIPTION_gcc-cross-canadian-arm = "The GNU cc and gcc C compilers"
-DESCRIPTION_gdb-cross-canadian-arm = "gdb - GNU debugger"
-DESCRIPTION_binutils-cross-canadian-arm = "A GNU collection of binary utilities"
-
-LICENSE = "${ARG_LIC_LIBC}"
-LICENSE_gcc-cross-canadian-arm = "${ARG_LIC_GCC}"
-LICENSE_gdb-cross-canadian-arm = "${ARG_LIC_GDB}"
-LICENSE_binutils-cross-canadian-arm = "${ARG_LIC_BFD}"
-
-PKGV = "${ARG_VER_MAIN}"
-PKGV_gcc-cross-canadian-arm = "${ARG_VER_GCC}"
-PKGV_gdb-cross-canadian-arm = "${ARG_VER_GDB}"
-PKGV_binutils-cross-canadian-arm = "${ARG_VER_BFD}"
-
-do_install() {
-	install -d ${D}${prefix}/${ARAGO_TARGET_SYS}/bin
-	install -d ${D}${prefix}/${ARAGO_TARGET_SYS}/lib
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${libdir}/ldscripts
-	install -d ${D}${includedir}
-	install -d ${D}${libexecdir}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
-	install -d ${D}${gcclibdir}/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}/include
-	install -d ${D}${prefix}/i686-linux
-
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/bin/{cpp,cc,gccbug,g++,gcov,gcc} ${D}${prefix}/${ARAGO_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/lib/{libstdc++.*,libssp*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${ARAGO_TARGET_SYS}/lib
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}/* ${D}${gcclibdir}/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gccbug,gcc,g++,cpp} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
-
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
-
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/bin/{ld,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${prefix}/${ARAGO_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/include/*.h ${D}${includedir}
-	cp -a ${TOOLCHAIN_PATH}/lib/ldscripts/* ${D}${libdir}/ldscripts
-	cp -a ${TOOLCHAIN_PATH}/lib/libiberty.a ${D}${libdir}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/i686-linux/* ${D}${prefix}/i686-linux
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
deleted file mode 100644
index dff4393..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
+++ /dev/null
@@ -1,261 +0,0 @@
-require recipes-core/eglibc/eglibc-package.inc
-
-require external-arago-toolchain.inc
-
-PR = "r4"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "\
-	file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-"
-
-PACKAGE_NO_GCONV = "1"
-PACKAGE_NO_LOCALE = "1"
-
-ALLOW_EMPTY_libgcc = "1"
-ALLOW_EMPTY_libstdc++ = "1"
-
-INSANE_SKIP_libgcc = "True"
-INSANE_SKIP_libstdc++ = "True"
-INSANE_SKIP_glibc-utils = "True"
-INSANE_SKIP_glibc-dev = "True"
-INSANE_SKIP_gdbserver = "True"
-
-SRC_URI = "file://SUPPORTED"
-
-PROVIDES = "\
-	virtual/${TARGET_PREFIX}gcc \
-	virtual/${TARGET_PREFIX}g++ \
-	virtual/${TARGET_PREFIX}gcc-initial \
-	virtual/${TARGET_PREFIX}gcc-intermediate \
-	virtual/${TARGET_PREFIX}binutils \
-	virtual/${TARGET_PREFIX}libc-for-gcc \
-	virtual/${TARGET_PREFIX}compilerlibs \
-	virtual/libc \
-	virtual/libintl \
-	virtual/libiconv \
-	glibc-thread-db \
-	libgcc \
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', 'linux-libc-headers linux-libc-headers-dev', '', d)} \
-	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-arago-toolchain', 'gdbserver', '', d)} \
-	${@base_conditional('PREFERRED_PROVIDER_binutils-dev', 'external-arago-toolchain', 'binutils-dev', '', d)} \
-"
-
-DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', '', 'linux-libc-headers', d)}"
-RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
-PACKAGES_DYNAMIC += "glibc-gconv-*"
-PACKAGES_DYNAMIC += "glibc-locale-*"
-
-LEAD_SONAME = "libc.so.6"
-
-PACKAGES = "\
-	libgcc \
-	libgcc-dev \
-	libstdc++ \
-	libstdc++-dev \
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', 'linux-libc-headers-dev', '', d)} \
-	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-arago-toolchain', 'gdbserver', '', d)} \
-	${@base_conditional('PREFERRED_PROVIDER_binutils-dev', 'external-arago-toolchain', 'binutils-dev', '', d)} \
-	glibc-dbg \
-	glibc \
-	catchsegv \
-	sln \
-	nscd \
-	ldd \
-	localedef \
-	glibc-utils \
-	glibc-dev \
-	glibc-locale \
-	libsegfault \
-	glibc-extra-nss \
-	glibc-thread-db \
-	glibc-pcprofile \
-"
-
-FILES_glibc = "\
-	${sysconfdir} \
-	${libexecdir}/* \
-	${datadir}/zoneinfo \
-	/lib/libc* \
-	/lib/libm* \
-	/lib/ld* \
-	/lib/libpthread* \
-	/lib/libresolv* \
-	/lib/librt* \
-	/lib/libutil* \
-	/lib/libnsl* \
-	/lib/libnss_files* \
-	/lib/libnss_compat* \
-	/lib/libnss_dns* \
-	/lib/libdl* \
-	/lib/libanl* \
-	/lib/libBrokenLocale* \
-	/sbin/ldconfig \
-"
-
-FILES_glibc-dev = "\
-	${includedir} \
-	${libdir}/*.o \
-	${bindir}/rpcgen \
-	${libdir}/*.so \
-	${libdir}/*.a \
-"
-
-FILES_glibc-dbg += " ${libdir}/gconv/.debug ${libexecdir}/*/.debug ${base_libdir}/.debug ${libdir}/.debug"
-FILES_glibc-utils = "${bindir}/* ${sbindir}/*"
-FILES_glibc-extra-nss = "/lib/libnss*"
-FILES_glibc-gconv = "${libdir}/gconv/*"
-FILES_glibc-pcprofile = "/lib/libpcprofile.so"
-FILES_glibc-thread-db = "/lib/libthread_db*"
-
-FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
-FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
-
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-FILES_libstdc++-dev = "\
-	/include/c++ \
-	${libdir}/libstdc++.so \
-	${libdir}/libstdc++.la \
-	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
-	${libdir}/libsupc++.a \
-"
-
-FILES_binutils-dev = "\
-	${includedir}/ansidecl.h \
-	${includedir}/dis-asm.h \
-	${includedir}/bfdlink.h \
-	${includedir}/libiberty.h \
-	${includedir}/symcat.h \
-	${includedir}/bfd.h \
-	${libdir}/libbfd* \
-	${libdir}/libopcodes* \
-	${libdir}/libiberty* \
-"
-
-FILES_linux-libc-headers-dev = "\
-	${includedir}/asm* \
-	${includedir}/drm \
-	${includedir}/linux \
-	${includedir}/mtd \
-	${includedir}/rdma \
-	${includedir}/scsi \
-	${includedir}/sound \
-	${includedir}/video \
-"
-
-FILES_libsegfault = "/lib/libSegFault*"
-FILES_catchsegv = "${bindir}/catchsegv"
-RDEPENDS_catchsegv = "libsegfault"
-
-FILES_ldd = "${bindir}/ldd"
-FILES_nscd = "${sbindir}/nscd*"
-FILES_sln = "${base_sbindir}/sln"
-FILES_localedef = "${bindir}/localedef"
-FILES_gdbserver = "${bindir}/gdbserver"
-
-DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
-DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services"
-DESCRIPTION_ldd = "glibc: print shared library dependencies"
-DESCRIPTION_nscd = "glibc: name service cache daemon for passwd, group, and hosts"
-DESCRIPTION_sln = "glibc: create symbolic links between files"
-DESCRIPTION_localedef = "glibc: compile locale definition files"
-DESCRIPTION_gdbserver = "gdb: GNU debugger"
-DESCRIPTION_binutils-dev = "binutils: GNU collection of binary utilities"
-
-LICENSE = "${ARG_LIC_LIBC}"
-LICENSE_ldd = "${ARG_LIC_LIBC}"
-LICENSE_glibc = "${ARG_LIC_LIBC}"
-LICENSE_glibc-thread-db = "${ARG_LIC_LIBC}"
-LICENSE_libgcc = "${ARG_LIC_RLE}"
-LICENSE_libgcc-dev = "${ARG_LIC_RLE}"
-LICENSE_libstdc++ = "${ARG_LIC_RLE}"
-LICENSE_libstdc++-dev = "${ARG_LIC_RLE}"
-LICENSE_gdbserver = "${ARG_LIC_GDB}"
-LICENSE_binutils-dev = "${ARG_LIC_BFD}"
-
-PKG_${PN} = "eglibc"
-PKG_${PN}-dev = "eglibc-dev"
-PKG_${PN}-doc = "eglibc-doc"
-PKG_${PN}-dbg = "eglibc-dbg"
-PKG_${PN}-pic = "eglibc-pic"
-PKG_${PN}-utils = "eglibc-utils"
-PKG_${PN}-gconv = "eglibc-gconv"
-PKG_${PN}-extra-nss = "eglibc-extra-nss"
-PKG_${PN}-thread-db = "eglibc-thread-db"
-PKG_${PN}-pcprofile = "eglibc-pcprofile"
-
-PKGV = "${ARG_VER_LIBC}"
-#PKGV = "${ARG_VER_MAIN}"
-PKGV_libgcc = "${ARG_VER_GCC}"
-PKGV_libgcc-dev = "${ARG_VER_GCC}"
-PKGV_libstdc++ = "${ARG_VER_GCC}"
-PKGV_libstdc++-dev = "${ARG_VER_GCC}"
-PKGV_libc = "${ARG_VER_LIBC}"
-PKGV_glibc = "${ARG_VER_LIBC}"
-PKGV_glibc-dev = "${ARG_VER_LIBC}"
-PKGV_glibc-dbg = "${ARG_VER_LIBC}"
-PKGV_glibc-utils = "${ARG_VER_LIBC}"
-PKGV_glibc-gconv = "${ARG_VER_LIBC}"
-PKGV_glibc-extra-nss = "${ARG_VER_LIBC}"
-PKGV_glibc-thread-db = "${ARG_VER_LIBC}"
-PKGV_glibc-pcprofile = "${ARG_VER_LIBC}"
-PKGV_catchsegv = "${ARG_VER_LIBC}"
-PKGV_sln = "${ARG_VER_LIBC}"
-PKGV_nscd = "${ARG_VER_LIBC}"
-PKGV_ldd = "${ARG_VER_LIBC}"
-PKGV_localedef = "${ARG_VER_LIBC}"
-PKGV_libsegfault = "${ARG_VER_LIBC}"
-PKGV_linux-libc-headers-dev = "${ARG_VER_KERNEL}"
-PKGV_gdbserver = "${ARG_VER_GDB}"
-PKGV_binutils-dev = "${ARG_VER_BFD}"
-
-do_int_binutils() {
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/{libbfd*,libopcodes*,libiberty*} ${D}${libdir}
-}
-
-do_ext_binutils() {
-	rm -rf ${D}${includedir}/{ansidecl.h,dis-asm.h,bfdlink.h,libiberty.h,symcat.h,bfd.h}
-}
-
-do_install() {
-	install -d ${D}${sysconfdir}
-	install -d ${D}${bindir}
-	install -d ${D}${sbindir}
-	install -d ${D}${base_bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${base_libdir}
-	install -d ${D}${base_sbindir}
-	install -d ${D}${datadir}
-	install -d ${D}${includedir}
-	install -d ${D}/include
-
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${datadir}/* ${D}${datadir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_libdir}/{lib*,ld*} ${D}${base_libdir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${base_sbindir}/ldconfig ${D}${base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${bindir}/{gdbserver,gencat,getconf,getent,iconv,locale,mtrace,pcprofiledump,rpcgen,sprof,tzselect,xtrace} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${sbindir}/{iconvconfig,rpcinfo,zdump,zic} ${D}${sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${includedir}/{arpa,asm*,bits,drm,gnu,linux,mtd,net*,nfs,protocols,rdma,rpc*,scsi,sound,sys*,video,*.h} ${D}${includedir}
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}${libdir}/{?crt1.o,crt?.o,libBrokenLocale*,libanl*,libc.*,libc_*,libcrypt.*,libcidn.*,libdl.*,libg.*,libieee.*,libm.*,libmcheck.*,libnsl*,libnss*,libpthread*,libresolv*,librt*,libstdc*,libsupc*,libthread*,libutil*} ${D}${libdir}
-	rm -rf ${D}${base_libdir}/*.la
-	rm -rf ${D}${libdir}/*.la
-	rm -rf ${D}${includedir}/{zconf,zlib}.h
-
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
-	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-arago-toolchain', '', 'rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*', d)}
-
-	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/include/* ${D}/include
-	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-arago-toolchain', '', 'rm -rf ${D}${bindir}/gdbserver', d)}
-
-	${@base_conditional('PREFERRED_PROVIDER_binutils-dev', 'external-arago-toolchain', 'do_int_binutils', 'do_ext_binutils', d)}
-
-	sed -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so > ${D}${libdir}/temp
-	mv ${D}${libdir}/temp ${D}${libdir}/libc.so
-
-	sed -e "s# /lib# ../../lib#" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so > ${D}${libdir}/temp
-	mv ${D}${libdir}/temp ${D}${libdir}/libpthread.so
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc b/meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc
deleted file mode 100644
index da0d9ab..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc
+++ /dev/null
@@ -1,76 +0,0 @@
-def arg_get_main_version(d):
-	import os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/version'):
-		f = open(d.getVar('TOOLCHAIN_PATH', d, 1)+'/version', 'r')
-		l = f.readlines();
-		f.close();
-		for s in l:
-			if s.find('Version') > 0:
-				ver = s.split()[2]
-				return ver
-		return None
-
-def arg_get_gcc_version(d):
-	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'gcc'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'gcc', '-v'], stderr=subprocess.PIPE).communicate()[1].splitlines()[-1].split()[2]
-
-def arg_get_bfd_version(d):
-	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'as'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
-
-def arg_get_gdb_version(d):
-	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'gdb'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'gdb', '-v'],stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[-1]
-
-def arg_get_libc_version(d):
-	import os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)+'/lib/'):
-		for file in os.listdir(d.getVar('TOOLCHAIN_SYSPATH', d, 1)+'/lib/'):
-			if file.find('libc-') == 0:
-				return file[5:-3]
-		return None
-
-def arg_get_kernel_version(d):
-	import os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)+'/usr/include/linux/'):
-		f = open(d.getVar('TOOLCHAIN_SYSPATH', d, 1)+'/usr/include/linux/version.h', 'r')
-		l = f.readlines();
-		f.close();
-		for s in l:
-			if s.find('LINUX_VERSION_CODE') > 0:
-				ver = int(s.split()[2])
-				maj = ver / 65536
-				ver = ver % 65536
-				min = ver / 256
-				ver = ver % 256
-				return str(maj)+'.'+str(min)+'.'+str(ver)
-		return None
-
-ARG_VER_MAIN := "${@arg_get_main_version(d)}"
-ARG_VER_GCC := "${@arg_get_gcc_version(d)}"
-ARG_VER_BFD := "${@arg_get_bfd_version(d)}"
-ARG_VER_GDB := "${@arg_get_gdb_version(d)}"
-ARG_VER_LIBC := "${@arg_get_libc_version(d)}"
-ARG_VER_KERNEL := "${@arg_get_kernel_version(d)}"
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
-ARG_LIC_LIBC := "LGPLv2.1+"
-ARG_LIC_GCC := "${@["GPLv3+", "GPLv2+"][arg_get_gcc_version(d) <= "4.2.1"]}"
-ARG_LIC_RLE := "${@["GPLv3+ with GCC RLE", "GPLv2+ with GCC RLE"][arg_get_gcc_version(d) <= "4.3.3"]}"
-ARG_LIC_GDB := "${@["GPLv3+", "GPLv2+"][arg_get_gdb_version(d) <= "6.6"]}"
-ARG_LIC_BFD := "${@["GPLv3+", "GPLv2+"][arg_get_bfd_version(d) <= "2.17"]}"
diff --git a/meta-arago-extras/recipes-core/meta/external-arago-toolchain/SUPPORTED b/meta-arago-extras/recipes-core/meta/external-arago-toolchain/SUPPORTED
deleted file mode 100644
index fe9406a..0000000
--- a/meta-arago-extras/recipes-core/meta/external-arago-toolchain/SUPPORTED
+++ /dev/null
@@ -1,4 +0,0 @@
-en_GB.UTF-8 UTF-8
-en_GB ISO-8859-1
-en_US.UTF-8 UTF-8
-en_US ISO-8859-1
-- 
2.2.0


