Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11325C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:38:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3157.1684780734191994412
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rjOxsS0B;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcpNL117417;
	Mon, 22 May 2023 13:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684780731;
	bh=zfuwQYf534XMwY9riEJ9Q1/5Svma1ivLvg9G0UspbPA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rjOxsS0BlBHg6QCXWX1+WP+O01rXV8oLjZs5lsyNiqq7558jerE+8zYVPXxBh1fjU
	 YuRArpcmcAZw6uP6JJaaZmAHV1S7i4Unn8/DrpVZ0HGIDU4WYhZ52sEnLuLtDMSv5b
	 Eg4ed5VeBrAqfjsq3q4h9JLp6oyODZlsfSZGCO8k=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MIcpZ0116878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 13:38:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 13:38:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 13:38:51 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcnoD092240;
	Mon, 22 May 2023 13:38:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master][PATCH 1/3] all: remove all external toolchain stuff
Date: Mon, 22 May 2023 13:38:45 -0500
Message-ID: <20230522183847.3663294-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522183847.3663294-1-rs@ti.com>
References: <20230522183847.3663294-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 18:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14431

From: Randolph Sapp <rs@ti.com>

Drop all of the external toolchain stuff. We don't need it anymore now
that everything can use the internal yocto compiler and multiarch has
been configured properly in meta-ti.

In addition to this, it squelches a warning that's been bothering me.
One of these files attempts to dynamically set it's package name and
bitbake wasn't expanding one of the required variables soon enough,
result in some garbage package with an unexpanded
'${SECONDARY_TARGET_ARCH}' in it's name.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../conf/distro/include/toolchain-arm.inc     | 118 ----------------
 .../external-arm-secondary-sdk-toolchain.bb   |   4 -
 .../meta/external-arm-toolchain.bbappend      |  36 -----
 .../packagegroup-cross-canadian.bbappend      |  10 --
 .../meta/external-arm-bfd-version.inc         |   8 --
 .../meta/external-arm-sdk-toolchain.bb        | 131 ------------------
 .../meta/external-arm-toolchain.bbappend      |  73 ----------
 7 files changed, 380 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-arm.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend

diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
deleted file mode 100644
index 9b76917d..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ /dev/null
@@ -1,118 +0,0 @@
-# Select external binary prebuilt Arm toolchain
-TCMODE = "external-arm"
-
-EAT_TARGET_SYS_ARMV5 ?= "arm-none-linux-gnueabi"
-EAT_TARGET_SYS_ARMV7 ?= "arm-none-linux-gnueabihf"
-EAT_TARGET_SYS_ARMV8 ?= "aarch64-none-linux-gnu"
-
-EAT_TARGET_SYS:arm = "${EAT_TARGET_SYS_ARMV5}"
-EAT_TARGET_SYS:armv7a = "${EAT_TARGET_SYS_ARMV7}"
-EAT_TARGET_SYS:aarch64 = "${EAT_TARGET_SYS_ARMV8}"
-
-SECONDARY_TARGET_ARCH = "invalid"
-SECONDARY_TARGET_ARCH:k3 = "armv7a"
-
-TARGET_VENDOR = ""
-
-TOOLCHAIN_BASE ?= "/opt"
-TOOLCHAIN_PATH_ARMV5 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-ti2020.01-armv5-x86_64-${EAT_TARGET_SYS_ARMV5}"
-TOOLCHAIN_PATH_ARMV7 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-${EAT_TARGET_SYS_ARMV7}"
-TOOLCHAIN_PATH_ARMV8 ?= "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-${EAT_TARGET_SYS_ARMV8}"
-
-DEF_TOOLCHAIN_PATH:arm = "${TOOLCHAIN_PATH_ARMV5}"
-DEF_TOOLCHAIN_PATH:armv7a = "${TOOLCHAIN_PATH_ARMV7}"
-DEF_TOOLCHAIN_PATH:aarch64 = "${TOOLCHAIN_PATH_ARMV8}"
-
-TOOLCHAIN_PATH ?= "${DEF_TOOLCHAIN_PATH}"
-
-TOOLCHAIN_SYS := "${EAT_TARGET_SYS}"
-TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-arm-toolchain"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-#PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
-
-# Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
-bindir:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set up runtime preferences
-PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
-PREFERRED_PROVIDER_gcc-runtime = "external-arm-toolchain"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "arm-9.2%"
-SDKGDBVERSION ?= "9.2%"
-SDKBINUVERSION ?= "2.35%"
-SDKGLIBCVERSION ?= "2.32%"
-SDKLINUXLIBCVERSION ?= "5.10%"
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
-GCCVERSION ?= "arm-9.2%"
-GDBVERSION ?= "9.2%"
-BINUVERSION ?= "2.35%"
-GLIBCVERSION ?= "2.32%"
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
-python external_arm_toolchain_license_handler () {
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-    d = e.data
-    ld = d.createCopy()
-    ld.finalize()
-
-    lc_libc = "LGPL-2.1"
-    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
-    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
-    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
-#    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
-
-    d.setVar('EAT_LIC_LIBC', lc_libc)
-    d.setVar('EAT_LIC_GCC', lc_gcc)
-    d.setVar('EAT_LIC_RLE', lc_rle)
-    d.setVar('EAT_LIC_GDB', lc_gdb)
-#    d.setVar('EAT_LIC_BFD', lc_bfd)
-
-    d.setVar('EAT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
-}
-addhandler external_arm_toolchain_license_handler
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
deleted file mode 100644
index 22a8aa0a..00000000
--- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-toolchain.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
-MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
-
-require recipes-core/meta/external-arm-sdk-toolchain.bb
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
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
-BRANCH = "ti-linux-5.10.y"
-SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
-
-KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "https"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
-
-PKGV:linux-libc-headers-dev = "5.10"
-PKGV:linux-libc-headers = "5.10"
-
-inherit kernel-arch pkgconfig multilib_header
-
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
-
-DEPENDS += "bison-native rsync-native"
-
-do_configure:append() {
-	cd ${WORKDIR}/git
-	oe_runmake allnoconfig
-}
-
-do_install:append() {
-	cd ${WORKDIR}/git
-	oe_runmake headers_install INSTALL_HDR_PATH=${B}${exec_prefix}
-
-	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
-
-	# The ..install.cmd conflicts between various configure runs
-	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
-}
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
deleted file mode 100644
index 46df17f9..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-PR:append = ".arago0"
-
-SECONDARY_TARGET_ARCH ?= "invalid"
-
-SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
-                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
-
-RDEPENDS:${PN}:append = " \
-    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', 'invalid', '', '${SECONDARY_TOOLCHAIN}', d)} \
-"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
deleted file mode 100644
index 1d8eed17..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
-
-def eat_get_bfd_version(d):
-    import subprocess,os,bb
-    if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
-        return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
-
-EAT_VER_BFD := "${@eat_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
deleted file mode 100644
index bbae8622..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
+++ /dev/null
@@ -1,131 +0,0 @@
-inherit cross-canadian
-
-require external-arm-bfd-version.inc
-
-PR = "r9"
-
-PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
-BPN = "external-arm-sdk-toolchain"
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
-INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps"
-INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
-INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
-
-PROVIDES = "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-PACKAGES = "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', '', d)} \
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
-FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
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
-FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
-	${bindir}/${TARGET_PREFIX}gdb \
-	${bindir}/${TARGET_PREFIX}gdbtui \
-	${datadir}/gdb/* \
-	${datadir}/info/* \
-	${datadir}/man/man1/${TARGET_PREFIX}* \
-"
-
-FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
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
-DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
-DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
-DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
-
-#LICENSE = "${ARG_LIC_LIBC}"
-#LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GCC}"
-#LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_GDB}"
-#LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${ARG_LIC_BFD}"
-
-PKGV = "${EAT_VER_MAIN}"
-PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
-PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
-PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
-
-LIBDIR = "lib"
-LIBDIR:aarch64 = "lib64"
-
-do_install() {
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
-	install -d ${D}${libexecdir}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/gdb', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/info', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datadir}/man/man1', '', d)}
-	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
-
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc_s.*,libsupc++.*} ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${bindir}
-	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
-
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/', '', d)}
-	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
-
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ranlib,as,ar,objdump} ${D}${prefix}/${EAT_TARGET_SYS}/bin
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld*,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindir}
-}
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
deleted file mode 100644
index 478ba2ba..00000000
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ /dev/null
@@ -1,73 +0,0 @@
-ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
-
-do_install:append() {
-	install -d ${D}${base_sbindir}
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
-	install -d ${D}${sysconfdir}
-	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
-
-	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
-		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
-		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
-		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
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
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
-}
-
-# Below FILES:* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
-# to enable native compile on the target
-FILES:libgcov-staticdev = "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgcov.a"
-
-FILES:libgfortran-dev = "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libcaf_single* \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
-"
-
-FILES:gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/sanitizer/*.h"
-
-# This is provided by gcc:
-#    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include
-FILES:libgcc-dev = "\
-    ${base_libdir}/libgcc*.so \
-    ${@oe.utils.conditional('BASETARGET_SYS', '${ORIG_TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
-    ${libdir}/${TARGET_SYS}/${BINV}* \
-    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
-    ${libdir}/gcc/${TARGET_SYS} \
-"
-
-FILES:libssp-dev = "\
-    ${libdir}/libssp*.so \
-    ${libdir}/libssp*_nonshared.a \
-    ${libdir}/libssp*.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/ssp \
-"
-
-FILES:libquadmath-dev = "\
-    ${libdir}/libquadmath*.so \
-    ${libdir}/libquadmath.la \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/quadmath* \
-"
-
-FILES:libgomp-dev = "\
-    ${libdir}/libgomp*${SOLIBSDEV} \
-    ${libdir}/libgomp*.la \
-    ${libdir}/libgomp.spec \
-    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
-"
-
-INSANE_SKIP:libgcc-dev += "staticdev"
-- 
2.40.1


