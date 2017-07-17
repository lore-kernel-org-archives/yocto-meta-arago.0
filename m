Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1A1785299E
	for <meta-arago@arago-project.org>;
	Mon, 17 Jul 2017 22:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 043EE208FB;
	Mon, 17 Jul 2017 22:02:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id X19djc-c711X; Mon, 17 Jul 2017 22:02:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D7B8B208E7;
	Mon, 17 Jul 2017 22:02:36 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 619A2161D53;
	Mon, 17 Jul 2017 18:02:36 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 17 Jul 2017 18:02:36 -0400
Message-Id: <1500328956-131421-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] toolchain*: fix use of Linaro toolchain as cross-canadian packages
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
X-List-Received-Date: Mon, 17 Jul 2017 22:02:41 -0000

Previous commit cd35c1d9bf34e0f592828aefaa0770ff0be68ece attempted to unify
location of binaries in the devkit and align those with how internal toolchain
installs them. Unfortunately, it doesn't work that well for prebuilt Linaro
toolchain and still requires overriding their corresponding bindir, libdir and
libexecdir variables. Instead, add a conditional check to arago_sdk_fixup()
to use the correct libexecdir depending on TOOLCHAIN_TYPE.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc          | 1 +
 .../recipes-core/meta/external-linaro-sdk-toolchain.bb              | 6 +++++-
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb         | 6 +++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 6271986..20a6517 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -23,6 +23,7 @@ PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "externa
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-linaro-sdk-toolchain"
 
 # Special case for gdb to be built as part of canadian-cross-sdk, instead of packaged from external toolchain
+bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 # Set up runtime preferences
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index ff2598e..92f3fd7 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -2,7 +2,7 @@ inherit cross-canadian
 
 require external-linaro-bfd-version.inc
 
-PR = "r7"
+PR = "r8"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
@@ -33,6 +33,10 @@ PACKAGES = "\
 	binutils-cross-canadian-arm \
 "
 
+# Don't need the extra target triplet in the new SDK dir structure
+bindir = "${exec_prefix}/bin"
+libdir = "${exec_prefix}/lib"
+libexecdir = "${exec_prefix}/libexec"
 datadir = "${exec_prefix}/share"
 gcclibdir = "${libdir}/gcc"
 
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 96fc6bf..3ea63ec 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -84,7 +84,11 @@ arago_sdk_fixup () {
 
 	# Do some extra setup work due to new structure
 	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
+	if [ "${TOOLCHAIN_TYPE}" = "internal" ]; then
+		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
+	else
+		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
+	fi
 	tcv=`ls -1 $lexec|head -1`
 	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
 	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-- 
2.7.4


