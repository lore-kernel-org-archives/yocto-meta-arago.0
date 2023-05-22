Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10CDC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:38:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3155.1684780733645592973
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fcv+2H7T;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcpwC117421;
	Mon, 22 May 2023 13:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684780731;
	bh=quZ3yH1D9f/gmdLSszH3rew4b0y8hTjg1zLKmppBGHA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fcv+2H7TsMWieqvyU4N3Zl8vrlacjh8380VYvInL9mjzPAwjArb3N6HQCczm0kQQR
	 MpWXhz92IoB78m1depoBupNUfM/V7KO9P1TWSxFkLtxuvHNtwUuISz4DlWG+JE0yBf
	 BuIUXs7wtT7JOi0uHusfeWf5HftRSZzj0e4OMW+k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MIcpNt115278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 13:38:51 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 13:38:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 13:38:50 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MIcnoE092240;
	Mon, 22 May 2023 13:38:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master][PATCH 2/3] all: remove all external toolchain logic
Date: Mon, 22 May 2023 13:38:46 -0500
Message-ID: <20230522183847.3663294-3-rs@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 18:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14430

From: Randolph Sapp <rs@ti.com>

Remove all legacy external toolchain logic, packages, groups, etc. All
of this was required for the Arago SDK build target and is not necessary
moving forward. This build target can and should be replaced by the
Yocto Standard SDK build target:

	bitbake tisdk-default-image -c populate_sdk

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  13 -
 .../distro/include/branding-processor-sdk.inc |   2 -
 .../distro/include/toolchain-external.inc     |   4 -
 .../conf/distro/include/toolchain-gcc.inc     |  41 --
 .../distro/include/toolchain-internal.inc     |   4 -
 .../meta/meta-toolchain-arago-tisdk-server.bb |   7 -
 .../meta/meta-toolchain-arago-tisdk.bb        |   6 -
 .../meta/meta-toolchain-arago-tisdk.inc       |   8 -
 .../meta/meta-toolchain-arago-qte.bb          |  54 ---
 .../recipes-core/meta/meta-toolchain-arago.bb | 360 ------------------
 .../nativesdk-buildtools-perl-dummy.bbappend  |  23 --
 ...k-packagegroup-arago-qte-toolchain-host.bb |  11 -
 12 files changed, 533 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-external.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-internal.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 379b1d44..ed04602e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -137,16 +137,6 @@ ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
 
-# Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
-# Set some sane defaults, in case someone forgets to set them in local.conf
-TC_SANE_DEFAULT ?= "arm"
-TOOLCHAIN_TYPE ?= "internal"
-TOOLCHAIN_TYPE:omapl138 = "internal"
-TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"
-
-require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-
 # Enable basic stack and buffer overflow protections
 #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
 #TARGET_CPPFLAGS += "-fstack-protector"
@@ -179,6 +169,3 @@ ENTERPRISE_DISTRO = "1"
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
 LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
-
-# Do not package own copy of perl into devkit, rely on host one
-ASSUME_PROVIDED += "nativesdk-perl"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 25bb1b8c..f581dd93 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,5 +1,3 @@
-ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
-
 # Set CMEM reserved memory region
 RESERVE_CMEM = "${@bb.utils.contains('MACHINE_FEATURES','dsp','1','0',d)}"
 CMEM_BASE:omap-a15 ?= "a0000000"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-external.inc b/meta-arago-distro/conf/distro/include/toolchain-external.inc
deleted file mode 100644
index c48b09d4..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# Set some default toolchain location variables
-TOOLCHAIN_PATH ??= "/usr/local/sdk"
-TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/${TOOLCHAIN_SYS}"
-EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
deleted file mode 100644
index 78957364..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-# Select internal gcc toolchain to be built from sources
-TCMODE = "default"
-TCLIBC = "glibc"
-
-LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
-
-# Match some of the external vars
-TOOLCHAIN_SYS := "${TARGET_SYS}"
-TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "12%"
-SDKBINUVERSION ?= "2.40%"
-SDKGLIBCVERSION ?= "2.37%"
-
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
-
-PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
-
-# Set target toolchain preferences to match Cross/SDK by default
-# Can be overwritten globally, if needed
-GCCVERSION ?= "12%"
-BINUVERSION ?= "2.40%"
-GLIBCVERSION ?= "2.37%"
-
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-internal.inc b/meta-arago-distro/conf/distro/include/toolchain-internal.inc
deleted file mode 100644
index cbc3b53d..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-internal.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# No special handling is required for locating the internal toolchain, just re-use existing vars
-TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
-TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
-EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
deleted file mode 100644
index 3e781d06..00000000
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-tisdk-host"
-TOOLCHAIN_SUFFIX ?= "-tisdk-server"
-
-require meta-toolchain-arago-tisdk.inc
-require recipes-core/meta/meta-toolchain-arago.bb
-
-PR = "${INC_PR}.0"
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
deleted file mode 100644
index 4f272a52..00000000
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-TOOLCHAIN_SUFFIX ?= "-tisdk"
-
-require meta-toolchain-arago-tisdk.inc
-require recipes-core/meta/meta-toolchain-arago-qte.bb
-
-PR = "${INC_PR}.0"
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
deleted file mode 100644
index e8d389c5..00000000
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-toolchain-tisdk-target"
-TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev coreutils"
-
-INC_PR = "r5"
-
-toolchain_create_sdk_env_script:append() {
-    echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
-}
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
deleted file mode 100644
index 41dff492..00000000
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-# Qt Embedded toolchain
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
-TOOLCHAIN_SUFFIX ?= "-qte-sdk"
-
-require meta-toolchain-arago.bb
-
-PR = "r20"
-
-QT_MKSPECS_LOCATION = "${libdir}"
-QT_MKSPECS_DIR = "linux-oe-g++"
-
-toolchain_create_sdk_env_script:append() {
-	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
-	echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
-	echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
-	echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-	echo 'export OE_QMAKE_CC="$CC"' >> $script
-	echo 'export OE_QMAKE_CXX="$CXX"' >> $script
-	echo 'export OE_QMAKE_LINK="$CXX"' >> $script
-	echo 'export OE_QMAKE_AR="$AR"' >> $script
-	echo 'export OE_QMAKE_PREFIX_QT=${prefix}' >> $script
-	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
-	echo 'export OE_QMAKE_HOST_BINDIR_QT=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}' >> $script
-	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_UIC3=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic3${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_RCC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}rcc${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbuscpp2xml${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-	echo 'export OE_QMAKE_STRIP="echo"' >> $script
-	echo 'export QMAKESPEC=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/${QT_MKSPECS_DIR}' >> $script
-	echo 'export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}' >> $script
-	echo 'export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}' >> $script
-
-	#Adds qt.conf file that points qmake to properly locate Qt library and header files.
-	#This enables Qt Creator to work properly
-
-	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qt.conf"
-	touch $qt_conf
-	echo '[Paths]' >> $qt_conf
-	echo 'Prefix = $(OE_QMAKE_PREFIX_QT)' >> $qt_conf
-	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
-	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
-	echo 'HostPrefix = $(SDK_PATH_NATIVE)' >> $qt_conf
-	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
-	echo 'Sysroot = $(SDK_PATH_TARGET)' >> $qt_conf
-
-	# make a symbolic link to mkspecs for compatibility with Qt SDK and QTCreator
-	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-	(cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; ln -sf ../${REAL_MULTIMACH_TARGET_SYS}${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-}
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
deleted file mode 100644
index 5c1c3ad0..00000000
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ /dev/null
@@ -1,360 +0,0 @@
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host"
-TOOLCHAIN_HOST_TASK:append = " nativesdk-buildtools-perl-dummy"
-TOOLCHAIN_HOST_TASK:append = " packagegroup-cross-canadian-${MACHINE}"
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
-TOOLCHAIN_SUFFIX ?= "-sdk"
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
-TOOLCHAIN_CLEANUP_PACKAGES ?= ""
-SDKIMAGE_FEATURES = "package-management"
-SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
-
-inherit toolchain-scripts
-
-require recipes-core/meta/meta-toolchain.bb
-
-PR = "r35"
-
-# This function creates an environment-setup-script for use in a deployable SDK
-toolchain_create_sdk_env_script () {
-	# Create environment setup script
-	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
-	rm -f $script
-	touch $script
-	echo 'SDK_PATH="${SDKPATH}"' >> $script
-	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then' >> $script
-	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""' >> $script
-	echo '    exit 1' >> $script
-	echo 'else' >> $script
-	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
-	echo '        SDK_PATH="`dirname $BASH_SOURCE`"' >> $script
-	echo '    fi' >> $script
-	echo '    SDK_PATH=`readlink -f "$SDK_PATH"`' >> $script
-	echo '    export SDK_PATH' >> $script
-	echo 'fi' >> $script
-	echo 'export SDK_SYS=${SDK_SYS}' >> $script
-	echo 'export REAL_MULTIMACH_TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
-	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
-	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' >> $script
-	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' >> $script
-	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $script
-	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >> $script
-	echo 'export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET' >> $script
-	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK_PATH_TARGET${datadir}/pkgconfig' >> $script
-	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
-	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
-	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
-	printf 'export CXX="\x24{TOOLCHAIN_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' >> $script
-	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
-	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' >> $script
-	printf 'export LD="\x24{TOOLCHAIN_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' >> $script
-	printf 'export NM=\x24{TOOLCHAIN_PREFIX}nm\n' >> $script
-	printf 'export AS=\x24{TOOLCHAIN_PREFIX}as\n' >> $script
-	printf 'export AR=\x24{TOOLCHAIN_PREFIX}ar\n' >> $script
-	printf 'export RANLIB=\x24{TOOLCHAIN_PREFIX}ranlib\n' >> $script
-	printf 'export OBJCOPY=\x24{TOOLCHAIN_PREFIX}objcopy\n' >> $script
-	printf 'export OBJDUMP=\x24{TOOLCHAIN_PREFIX}objdump\n' >> $script
-	printf 'export STRIP=\x24{TOOLCHAIN_PREFIX}strip\n' >> $script
-	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script
-	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
-	echo 'export CFLAGS="$CPPFLAGS"' >> $script
-	echo 'export CXXFLAGS="$CPPFLAGS"' >> $script
-	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT=$SDK_PATH_NATIVE' >> $script
-	echo 'export OECORE_TARGET_SYSROOT=$SDK_PATH_TARGET' >> $script
-	echo 'export SDKTARGETSYSROOT=$SDK_PATH_TARGET' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH_NATIVE/usr/share/aclocal"' >> $script
-	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
-	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
-	echo 'export OECORE_BASELIB="${baselib}"' >> $script
-	echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
-	echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
-
-        # Borrowed from oe-core/meta/classes/toolchain-scripts.bbclass
-	cat >> $script <<EOF
-
-# Append environment subscripts
-if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
-    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
-	    . \$envfile
-    done
-fi
-if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
-    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
-	    . \$envfile
-    done
-fi
-EOF
-
-}
-
-SDK_POSTPROCESS_COMMAND:prepend = "arago_sdk_fixup; "
-
-arago_sdk_fixup () {
-	# Remove broken .la files
-	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
-		rm -f $i
-	done
-
-	cleanup_toolchain_packages
-
-	# Do some extra setup work due to new structure
-	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	if [ "${TOOLCHAIN_TYPE}" = "internal" ]; then
-		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
-	else
-		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
-	fi
-	tcv=`ls -1 $lexec|head -1`
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
-	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
-	mkdir -p $tcpath
-	( cd $tcpath; \
-		ln -s ${SDKTARGETSYSROOT}/include include; \
-		if [ "${TOOLCHAIN_BRAND}" != "arago" ]; then \
-			mkdir -p libc; \
-			cd libc; \
-		fi; \
-		mkdir -p usr; \
-		ln -s ${SDKTARGETSYSROOT}/lib lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/include usr/include; \
-	)
-}
-
-fakeroot create_sdk_files() {
-	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup
-
-	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-
-	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
-	# Escape special characters like '+' and '.' in the SDKPATH
-	escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
-	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
-}
-
-# Remove undesired packages that may be pulled into the toolchain by -dev
-# package dependencies.  This is usually GPLv3 components.
-cleanup_toolchain_packages() {
-	if [ "${TOOLCHAIN_CLEANUP_PACKAGES}" != "" ]
-	then
-		# Clean up the native side of the toolchain
-		opkg_dir="${SDK_OUTPUT}/${SDKPATHNATIVE}"
-		opkg_conf="${SDK_OUTPUT}/etc/opkg-sdk.conf"
-		opkg -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
-
-		# Clean up the target side of the toolchain
-		opkg_dir="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
-		opkg_conf="${opkg_dir}/etc/opkg/opkg.conf"
-		opkg -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
-
-		# Clean up empty directories from cleaned up packages
-		find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
-	fi
-}
-
-fakeroot archive_sdk() {
-	# Package it up
-	mkdir -p ${SDKDEPLOYDIR}
-	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar --owner=root --group=root -c . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
-}
-
-fakeroot create_shar() {
-	cat << "EOF" > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
-#!/bin/bash
-
-INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-
-if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
-	# Allow for installation of ix86 SDK on x86_64 host
-	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
-		echo "Error: Installation machine not supported!"
-		exit 1
-	fi
-fi
-
-DEFAULT_INSTALL_DIR="${SDKPATHINSTALL}"
-TMPSDKPATH="${SDKPATH}"
-SUDO_EXEC=""
-target_sdk_dir=""
-answer=""
-relocate=1
-savescripts=0
-verbose=0
-while getopts ":yd:DRS" OPT; do
-	case $OPT in
-	y)
-		answer="Y"
-		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
-		;;
-	d)
-		target_sdk_dir=$OPTARG
-		;;
-	D)
-		verbose=1
-		;;
-	R)
-		relocate=0
-		savescripts=1
-		;;
-	S)
-		savescripts=1
-		;;
-	*)
-		echo "Usage: $(basename $0) [-y] [-d <dir>]"
-		echo "  -y         Automatic yes to all prompts"
-		echo "  -d <dir>   Install the SDK to <dir>"
-		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
-		echo "  -S         Save relocation scripts"
-		echo "  -R         Do not relocate executables"
-		echo "  -D         use set -x to see what is going on"
-		exit 1
-		;;
-	esac
-done
-
-if [ $verbose = 1 ] ; then
-	set -x
-fi
-
-printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
-if [ "$target_sdk_dir" = "" ]; then
-	read target_sdk_dir
-	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
-else
-	echo "$target_sdk_dir"
-fi
-
-eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
-if [ -d "$target_sdk_dir" ]; then
-	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
-else
-	target_sdk_dir=$(readlink -m "$target_sdk_dir")
-fi
-
-if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
-	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
-	exit 1
-fi
-
-if [ -e "$target_sdk_dir/environment-setup*" ]; then
-	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
-	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
-
-	default_answer="n"
-else
-	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
-
-	default_answer="y"
-fi
-
-if [ "$answer" = "" ]; then
-	read answer
-	[ "$answer" = "" ] && answer="$default_answer"
-else
-	echo $answer
-fi
-
-if [ "$answer" != "Y" -a "$answer" != "y" ]; then
-	echo "Installation aborted!"
-	exit 1
-fi
-
-# Try to create the directory (this will not succeed if user doesn't have rights)
-mkdir -p $target_sdk_dir >/dev/null 2>&1
-
-# if don't have the right to access dir, gain by sudo 
-if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
-	SUDO_EXEC=$(which "sudo")
-	if [ -z $SUDO_EXEC ]; then
-		echo "No command 'sudo' found, please install sudo first. Abort!"
-		exit 1
-	fi
-
-	# test sudo could gain root right
-	$SUDO_EXEC pwd >/dev/null 2>&1
-	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
-
-	# now that we have sudo rights, create the directory
-	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
-fi
-
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
-
-printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir
-echo "done"
-
-printf "Setting it up..."
-# fix environment paths
-for env_setup_script in `ls $target_sdk_dir/environment-setup*`; do
-	$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g" -i $env_setup_script
-done
-
-# fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$target_sdk_dir/sysroots/${SDK_SYS}
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-if [ "$dl_path" = "" ] ; then
-	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
-	exit 1
-fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec file '{}' \;| grep "\(executable\|dynamically linked\|static-pie linked\)" | cut -f 1 -d ':')
-
-tdir=`mktemp -d`
-if [ x$tdir = x ] ; then
-	echo "SDK relocate failed, could not create a temporary directory"
-	exit 1
-fi
-echo "#!/bin/bash" > $tdir/relocate_sdk.sh
-echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
-$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
-$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
-rm -rf $tdir
-if [ $relocate = 1 ] ; then
-	$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
-	if [ $? -ne 0 ]; then
-		echo "SDK could not be set up. Relocate script failed. Abort!"
-		exit 1
-	fi
-fi
-
-# replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F":" '{print "\""$1"\""}'|$SUDO_EXEC xargs sed -i -e "s:$TMPSDKPATH:$target_sdk_dir:g"
-
-# change all symlinks pointing to ${SDKPATH}
-for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:") $l
-done
-
-# find out all perl scripts in $native_sysroot and modify them replacing the
-# host perl with SDK perl.
-for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
-	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
-		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
-done
-
-echo done
-
-# delete the relocating script, so that user is forced to re-run the installer
-# if he/she wants another location for the sdk
-if [ $savescripts = 0 ] ; then
-	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
-fi
-
-echo "SDK has been successfully set up and is ready to be used."
-
-exit 0
-
-MARKER:
-EOF
-	# append the SDK tarball
-	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
-
-	# delete the old tarball, we don't need it anymore
-	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
-}
diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
deleted file mode 100644
index b83e4e35..00000000
--- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-DUMMYPROVIDES += "\
-    nativesdk-perl-module-bytes \
-    nativesdk-perl-module-carp \
-    nativesdk-perl-module-constant \
-    nativesdk-perl-module-data-dumper \
-    nativesdk-perl-module-errno \
-    nativesdk-perl-module-exporter \
-    nativesdk-perl-module-file-basename \
-    nativesdk-perl-module-file-compare \
-    nativesdk-perl-module-file-copy \
-    nativesdk-perl-module-file-find \
-    nativesdk-perl-module-file-glob \
-    nativesdk-perl-module-file-spec \
-    nativesdk-perl-module-file-spec-unix \
-    nativesdk-perl-module-file-stat \
-    nativesdk-perl-module-getopt-long \
-    nativesdk-perl-module-io-file \
-    nativesdk-perl-module-overloading \
-    nativesdk-perl-module-posix \
-    nativesdk-perl-module-symbol \
-    nativesdk-perl-module-thread-queue \
-    nativesdk-perl-module-threads \
-"
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
deleted file mode 100644
index 4d2a98ad..00000000
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Host packages for Qt Embedded SDK"
-PR = "r10"
-LICENSE = "MIT"
-
-inherit packagegroup nativesdk
-
-RDEPENDS:${PN} = "\
-    nativesdk-packagegroup-arago-tisdk-host \
-    nativesdk-qtbase \
-    nativesdk-qttools \
-    "
-- 
2.40.1


