Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41B5C3DA40
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36482.1688678620887979669
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FC3940C8A;
	Thu,  6 Jul 2023 21:23:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbVmiKf38D64; Thu,  6 Jul 2023 21:23:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B24440C88;
	Thu,  6 Jul 2023 21:23:39 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CAD97163BF1;
	Thu,  6 Jul 2023 17:23:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH 4/6] meta-arago: remove external toolchain support
Date: Thu,  6 Jul 2023 21:23:33 +0000
Message-Id: <20230706212335.1893675-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212335.1893675-1-denis@denix.org>
References: <20230706212335.1893675-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14788

From: Denys Dmytriyenko <denys@konsulko.com>

As meta-arago has moved away from using an external toolchain due to high
maintenance burden, among other reasons, let's remove the corresponding
support and related customizations.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/toolchain-arm.inc     | 112 ---------------
 .../distro/include/toolchain-external.inc     |   4 -
 .../meta/external-arm-toolchain.bbappend      |  36 -----
 .../meta/external-arm-bfd-version.inc         |   8 --
 .../meta/external-arm-sdk-toolchain.bb        | 131 ------------------
 .../meta/external-arm-toolchain.bbappend      |  73 ----------
 .../recipes-core/meta/files/SUPPORTED         |   1 -
 7 files changed, 365 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-arm.i=
nc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-exter=
nal.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-tool=
chain.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-bfd-=
version.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-sdk-=
toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-tool=
chain.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/files/SUPPORTED

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-arm.inc
deleted file mode 100644
index 47e1f846..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ /dev/null
@@ -1,112 +0,0 @@
-# Select external binary prebuilt Arm toolchain
-TCMODE =3D "external-arm"
-
-EAT_TARGET_SYS_ARMV5 ?=3D "arm-none-linux-gnueabi"
-EAT_TARGET_SYS_ARMV7 ?=3D "arm-none-linux-gnueabihf"
-EAT_TARGET_SYS_ARMV8 ?=3D "aarch64-none-linux-gnu"
-
-EAT_TARGET_SYS:arm =3D "${EAT_TARGET_SYS_ARMV5}"
-EAT_TARGET_SYS:armv7a =3D "${EAT_TARGET_SYS_ARMV7}"
-EAT_TARGET_SYS:aarch64 =3D "${EAT_TARGET_SYS_ARMV8}"
-
-TARGET_VENDOR =3D ""
-
-TOOLCHAIN_BASE ?=3D "/opt"
-TOOLCHAIN_PATH_ARMV5 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.2-ti2020.01-armv5=
-x86_64-${EAT_TARGET_SYS_ARMV5}"
-TOOLCHAIN_PATH_ARMV7 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-=
${EAT_TARGET_SYS_ARMV7}"
-TOOLCHAIN_PATH_ARMV8 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-=
${EAT_TARGET_SYS_ARMV8}"
-
-DEF_TOOLCHAIN_PATH:arm =3D "${TOOLCHAIN_PATH_ARMV5}"
-DEF_TOOLCHAIN_PATH:armv7a =3D "${TOOLCHAIN_PATH_ARMV7}"
-DEF_TOOLCHAIN_PATH:aarch64 =3D "${TOOLCHAIN_PATH_ARMV8}"
-
-TOOLCHAIN_PATH ?=3D "${DEF_TOOLCHAIN_PATH}"
-
-TOOLCHAIN_SYS :=3D "${EAT_TARGET_SYS}"
-TOOLCHAIN_PREFIX :=3D "${TOOLCHAIN_SYS}-"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "externa=
l-arm-toolchain"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-
-# Special case for gdb to be built as part of canadian-cross-sdk, instea=
d of packaged from external toolchain
-bindir:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${exec_prefi=
x}/bin"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set up runtime preferences
-PREFERRED_PROVIDER_libgcc =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_gcc-runtime =3D "external-arm-toolchain"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?=3D "arm-9.2%"
-SDKGDBVERSION ?=3D "9.2%"
-SDKBINUVERSION ?=3D "2.35%"
-SDKGLIBCVERSION ?=3D "2.32%"
-SDKLINUXLIBCVERSION ?=3D "5.10%"
-
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?=3D "${SDKGCCVERSION}=
"
-PREFERRED_VERSION_gdb-crosssdk-${SDK_SYS} ?=3D "${SDKGDBVERSION}"
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "${S=
DKGDBVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${SDKBINUVERSION}"
-
-PREFERRED_VERSION_nativesdk-gcc-runtime ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${SDKLINUXLIBCVERSI=
ON}"
-PREFERRED_VERSION_nativesdk-glibc ?=3D "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-locale ?=3D "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial ?=3D "${SDKGLIBCVERSION}"
-
-# Set target toolchain preferences to match Cross/SDK by default
-# Can be overwritten globally, if needed
-GCCVERSION ?=3D "arm-9.2%"
-GDBVERSION ?=3D "9.2%"
-BINUVERSION ?=3D "2.35%"
-GLIBCVERSION ?=3D "2.32%"
-
-PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
-PREFERRED_VERSION_gdb ?=3D "${GDBVERSION}"
-PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
-PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
-
-# Licenses set for main components of the toolchain:
-# (g)libc is always LGPL version 2 (or later)
-# gcc has switched from GPL version 2 (or later) to version 3 (or later)=
 after 4.2.1,
-#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg=
00003.html
-# libgcc and libstdc++ always had exceptions to GPL called Runtime Libra=
ry Exception, but
-#    it was based on GPL version 2 (or later), until new GPL version 3 (=
or later) exception
-#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/=
2009/msg00000.html
-#    and http://www.gnu.org/licenses/gcc-exception.html, which was sever=
al days after
-#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
-# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or lat=
er), according
-#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
-# binutils version 2.17 was the last one under GPL version 2 (or later),=
 according
-#    to the published releases - http://ftp.gnu.org/gnu/binutils/
-
-python external_arm_toolchain_license_handler () {
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-    d =3D e.data
-    ld =3D d.createCopy()
-    ld.finalize()
-
-    lc_libc =3D "LGPL-2.1"
-    lc_gcc =3D ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <=3D "4.2.=
1"]
-    lc_rle =3D ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exceptio=
n"][eat_get_gcc_version(ld) <=3D "4.3.3"]
-    lc_gdb =3D ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <=3D "6.6"=
]
-#    lc_bfd =3D ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <=3D "2.1=
7"]
-
-    d.setVar('EAT_LIC_LIBC', lc_libc)
-    d.setVar('EAT_LIC_GCC', lc_gcc)
-    d.setVar('EAT_LIC_RLE', lc_rle)
-    d.setVar('EAT_LIC_GDB', lc_gdb)
-#    d.setVar('EAT_LIC_BFD', lc_bfd)
-
-    d.setVar('EAT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc=
_gdb))
-}
-addhandler external_arm_toolchain_license_handler
diff --git a/meta-arago-distro/conf/distro/include/toolchain-external.inc=
 b/meta-arago-distro/conf/distro/include/toolchain-external.inc
deleted file mode 100644
index c48b09d4..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# Set some default toolchain location variables
-TOOLCHAIN_PATH ??=3D "/usr/local/sdk"
-TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/${TOOLCHAIN_SYS}"
-EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.b=
bappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbap=
pend
deleted file mode 100644
index ce22c453..00000000
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ /dev/null
@@ -1,36 +0,0 @@
-# This is a rather hacky way to install custom linux-libc-headers
-# on top of the external-arm-toolchain, since simply depending
-# on linux-libc-headers creates circular dependencies now. Mostly
-# duplication of code from corresponding recipe.
-
-BRANCH =3D "ti-linux-5.10.y"
-SRCREV =3D "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
-
-KERNEL_GIT_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel=
.git"
-KERNEL_GIT_PROTOCOL =3D "https"
-SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH}"
-
-PKGV:linux-libc-headers-dev =3D "5.10"
-PKGV:linux-libc-headers =3D "5.10"
-
-inherit kernel-arch pkgconfig multilib_header
-
-EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC}" HOSTCPP=3D"${BUILD_CPP}""
-
-DEPENDS +=3D "bison-native rsync-native"
-
-do_configure:append() {
-	cd ${WORKDIR}/git
-	oe_runmake allnoconfig
-}
-
-do_install:append() {
-	cd ${WORKDIR}/git
-	oe_runmake headers_install INSTALL_HDR_PATH=3D${B}${exec_prefix}
-
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
-
-	# The ..install.cmd conflicts between various configure runs
-	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version=
.inc b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
deleted file mode 100644
index 1d8eed17..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-TOOLCHAIN_PATH ??=3D "${STAGING_BINDIR_TOOLCHAIN}"
-
-def eat_get_bfd_version(d):
-    import subprocess,os,bb
-    if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGE=
T_PREFIX')+'as'):
-        return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.ge=
tVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=3Dsubprocess.STDOU=
T,stdout=3Dsubprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
-
-EAT_VER_BFD :=3D "${@eat_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolcha=
in.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
deleted file mode 100644
index bbae8622..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
+++ /dev/null
@@ -1,131 +0,0 @@
-inherit cross-canadian
-
-require external-arm-bfd-version.inc
-
-PR =3D "r9"
-
-PN =3D "external-arm-sdk-toolchain-${TARGET_ARCH}"
-BPN =3D "external-arm-sdk-toolchain"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_DEFAULT_DEPS =3D "1"
-EXCLUDE_FROM_SHLIBS =3D "1"
-
-# License applies to this recipe code, not the toolchain itself
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so sta=
ticdev file-rdeps"
-INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so fil=
e-rdeps"
-INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-s=
o file-rdeps"
-
-PROVIDES =3D "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${T=
RANSLATED_TARGET_ARCH}', '', d)} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-PACKAGES =3D "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${T=
RANSLATED_TARGET_ARCH}', '', d)} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-# Don't need the extra target triplet in the new SDK dir structure
-bindir =3D "${exec_prefix}/bin"
-libdir =3D "${exec_prefix}/lib"
-libexecdir =3D "${exec_prefix}/libexec"
-datadir =3D "${exec_prefix}/share"
-gcclibdir =3D "${libdir}/gcc"
-
-FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
-	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
-	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
-	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
-	${bindir}/${TARGET_PREFIX}gcov \
-	${bindir}/${TARGET_PREFIX}gcc* \
-	${bindir}/${TARGET_PREFIX}g++ \
-	${bindir}/${TARGET_PREFIX}cpp \
-	${libexecdir}/* \
-"
-
-FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${bindir}/${TARGET_PREFIX}gdb \
-	${bindir}/${TARGET_PREFIX}gdbtui \
-	${datadir}/gdb/* \
-	${datadir}/info/* \
-	${datadir}/man/man1/${TARGET_PREFIX}* \
-"
-
-FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
-	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
-	${prefix}/${EAT_TARGET_SYS}/bin/strip \
-	${prefix}/${EAT_TARGET_SYS}/bin/nm \
-	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
-	${prefix}/${EAT_TARGET_SYS}/bin/as \
-	${prefix}/${EAT_TARGET_SYS}/bin/ar \
-	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
-	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
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
-DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "The GNU cc=
 and gcc C compilers"
-DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb - GNU =
debugger"
-DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "A GNU=
 collection of binary utilities"
-
-#LICENSE =3D "${ARG_LIC_LIBC}"
-#LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GCC=
}"
-#LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GDB=
}"
-#LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LI=
C_BFD}"
-
-PKGV =3D "${EAT_VER_MAIN}"
-PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GCC}"
-PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GDB}"
-PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_BF=
D}"
-
-LIBDIR =3D "lib"
-LIBDIR:aarch64 =3D "lib64"
-
-do_install() {
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
-	install -d ${D}${libexecdir}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datad=
ir}/gdb', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datad=
ir}/info', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datad=
ir}/man/man1', '', d)}
-	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
-
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc=
_s.*,libsupc++.*} ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}=
${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${b=
indir}
-	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
-
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
-
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ran=
lib,as,ar,objdump} ${D}${prefix}/${EAT_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}=
/${EAT_TARGET_SYS}/lib/ldscripts
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld*,addr2line,objcopy,read=
elf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindi=
r}
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.b=
bappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbap=
pend
deleted file mode 100644
index 478ba2ba..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ /dev/null
@@ -1,73 +0,0 @@
-ORIG_TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('T=
ARGET_OS'), ''][d.getVar('TARGET_OS') =3D=3D ('' or 'custom')]}"
-
-do_install:append() {
-	install -d ${D}${base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/libc/${base_sbindir}/ldconfig=
 ${D}${base_sbindir}/
-	install -d ${D}${sysconfdir}
-	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
-
-	if [ ${EAT_TARGET_SYS} !=3D ${ORIG_TARGET_SYS} ]; then
-		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
-		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_T=
ARGET_SYS}
-		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET=
_SYS}
-		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
-	fi
-
-	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
-	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
-	ln -sf libitm.so.1 ${D}${libdir}/libitm.so
-	ln -sf libssp.so.0 ${D}${libdir}/libssp.so
-	ln -sf libstdc++.so.6 ${D}${libdir}/libstdc++.so
-	ln -sf libubsan.so.1 ${D}${libdir}/libubsan.so
-	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
-	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-}
-
-# Below FILES:* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move =
in ${libdir}/gcc
-# to enable native compile on the target
-FILES:libgcov-staticdev =3D "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/li=
bgcov.a"
-
-FILES:libgfortran-dev =3D "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libcaf_single* \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
-"
-
-FILES:gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_S=
YS}/${BINV}/include/sanitizer/*.h"
-
-# This is provided by gcc:
-#    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include
-FILES:libgcc-dev =3D "\
-    ${base_libdir}/libgcc*.so \
-    ${@oe.utils.conditional('BASETARGET_SYS', '${ORIG_TARGET_SYS}', '', =
'${libdir}/${BASETARGET_SYS}', d)} \
-    ${libdir}/${TARGET_SYS}/${BINV}* \
-    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
-    ${libdir}/gcc/${TARGET_SYS} \
-"
-
-FILES:libssp-dev =3D "\
-    ${libdir}/libssp*.so \
-    ${libdir}/libssp*_nonshared.a \
-    ${libdir}/libssp*.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/ssp \
-"
-
-FILES:libquadmath-dev =3D "\
-    ${libdir}/libquadmath*.so \
-    ${libdir}/libquadmath.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/quadmath* \
-"
-
-FILES:libgomp-dev =3D "\
-    ${libdir}/libgomp*${SOLIBSDEV} \
-    ${libdir}/libgomp*.la \
-    ${libdir}/libgomp.spec \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
-"
-
-INSANE_SKIP:libgcc-dev +=3D "staticdev"
diff --git a/meta-arago-extras/recipes-core/meta/files/SUPPORTED b/meta-a=
rago-extras/recipes-core/meta/files/SUPPORTED
deleted file mode 100644
index 9615075e..00000000
--- a/meta-arago-extras/recipes-core/meta/files/SUPPORTED
+++ /dev/null
@@ -1 +0,0 @@
-POSIX
--=20
2.25.1


