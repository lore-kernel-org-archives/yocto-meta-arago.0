Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 578F452A82
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 315C4207BD;
	Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uNKOGtZhv7eT; Thu, 25 May 2017 19:01:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED62520BAF;
	Thu, 25 May 2017 19:01:41 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5871D161A52;
	Thu, 25 May 2017 15:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 May 2017 15:01:30 -0400
Message-Id: <1495738892-4367-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH v2 1/3] toolchain*: do not override bindir and libdir for cross-canadian packages
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
X-List-Received-Date: Thu, 25 May 2017 19:01:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

While this changes where toolchain binaries reside in the devkit sysroot, and
resulting in paths like /usr/bin/arm-linux-gnueabi/arm-linux-gnueabihf-gcc,
it aligns us better with upstream and the code that tries to re-use cross
toolchains for different libc setups (e.g. glibc, uclibc and musl) by setting
up a series of symlinks. And the longer paths can be easily handled by PATH
variable in the devkit environment setup script.

Also, make sdk_fixup() symlinks conditional for when their actual directories
are not yet avaialble.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc  |  4 ----
 .../conf/distro/include/toolchain-linaro.inc             |  1 -
 .../recipes-core/meta/external-linaro-sdk-toolchain.bb   |  7 +------
 .../recipes-core/meta/meta-toolchain-arago.bb            | 16 ++++++++--------
 4 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index a7505aa..bc6de77 100644
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
index 8457d6d..96fc6bf 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
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
@@ -83,13 +83,13 @@ arago_sdk_fixup () {
 	rm -rf ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/python*
 
 	# Do some extra setup work due to new structure
-	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
+	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+	lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
 	tcv=`ls -1 $lexec|head -1`
-	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
-	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
-	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
+	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
+	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
+	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
+	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
 	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
 	mkdir -p $tcpath
 	pushd $tcpath
-- 
2.7.4


