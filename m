Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C725952A38
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E3CD820BF4;
	Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DRuCKcfWRDec; Tue, 16 May 2017 02:38:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B956F200CD;
	Tue, 16 May 2017 02:38:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0298C1624C3;
	Mon, 15 May 2017 22:38:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 May 2017 22:38:06 -0400
Message-Id: <1494902286-53913-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494902286-53913-1-git-send-email-denis@denix.org>
References: <1494902286-53913-1-git-send-email-denis@denix.org>
Subject: [morty/master][WIP][PATCH 2/2] toolchain*: do not override bindir and libdir for cross-canadian packages
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
X-List-Received-Date: Tue, 16 May 2017 02:38:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

While this changes where toolchain binaries reside in the devkit sysroot, and
resulting in paths like /usr/bin/arm-linux-gnueabi/arm-linux-gnueabihf-gcc,
it aligns us better with upstream and the code that tries to re-use cross
toolchains for different libc setups (e.g. glibc, uclibc and musl) by setting
up a series of symlinks. And the longer paths can be easily handled by PATH
variable in the devkit environemtn setup script.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc        |  4 ----
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc     |  1 -
 .../recipes-core/meta/external-linaro-sdk-toolchain.bb         |  7 +------
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb    | 10 +++++-----
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index f225b60..00e963e 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -8,10 +8,6 @@ LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
 TOOLCHAIN_SYS := "${TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
 
-bindir_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-bindir_pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
-
 PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 20a6517..6271986 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -23,7 +23,6 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "externa
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-linaro-sdk-toolchain"
 
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
-bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # Set up runtime preferences
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index 618d784..ff2598e 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -2,7 +2,7 @@ inherit cross-canadian
 
 require external-linaro-bfd-version.inc
 
-PR = "r6"
+PR = "r7"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
@@ -33,12 +33,7 @@ PACKAGES = "\
 	binutils-cross-canadian-arm \
 "
 
-# Don't need the extra target triplet in the new SDK dir structure
-bindir = "${exec_prefix}/bin"
-libdir = "${exec_prefix}/lib"
-libexecdir = "${exec_prefix}/libexec"
 datadir = "${exec_prefix}/share"
-
 gcclibdir = "${libdir}/gcc"
 
 # New Linaro toolchain misses these binaries, comment out for now
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 8457d6d..fa53970 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,5 +1,5 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
-TOOLCHAIN_HOST_TASK += "packagegroup-arago-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
@@ -10,7 +10,7 @@ inherit toolchain-scripts
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r33"
+PR = "r34"
 
 XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
@@ -39,7 +39,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' >> $script
 	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' >> $script
 	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $script
-	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$PATH' >> $script
+	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >> $script
 	echo 'export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
@@ -83,8 +83,8 @@ arago_sdk_fixup () {
 	rm -rf ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/python*
 
 	# Do some extra setup work due to new structure
-	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
+	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+	lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
 	tcv=`ls -1 $lexec|head -1`
 	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
 	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-- 
2.7.4


