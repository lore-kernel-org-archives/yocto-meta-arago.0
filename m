Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1D6AA529DE
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93A5940C0F;
	Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VBcLI7JsJ5Td; Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7008740BD2;
	Wed,  6 Nov 2019 19:02:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AE488170490;
	Wed,  6 Nov 2019 14:02:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:16 -0500
Message-Id: <1573066944-48181-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573066944-48181-1-git-send-email-denys@ti.com>
References: <1573066944-48181-1-git-send-email-denys@ti.com>
Subject: [RFC][PATCH 1/9] packagegroup-arago-cross-canadian: deprecate in favor of upstream packagegroup-cross-canadian
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
X-List-Received-Date: Wed, 06 Nov 2019 19:03:55 -0000

Upstream meta-environment already provides standard site-config and version
files, keep our own environment-setup for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...bbappend => packagegroup-cross-canadian.bbappend} |  0
 .../recipes-core/meta/meta-toolchain-arago.bb        |  8 +-------
 .../packagegroup-arago-cross-canadian.bb             | 20 --------------------
 3 files changed, 1 insertion(+), 27 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-cross-canadian.bbappend => packagegroup-cross-canadian.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 065531e..03d18a3 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,6 +1,6 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
 TOOLCHAIN_HOST_TASK += "nativesdk-buildtools-perl-dummy"
-TOOLCHAIN_HOST_TASK += "packagegroup-arago-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
@@ -113,14 +113,8 @@ arago_sdk_fixup () {
 }
 
 fakeroot create_sdk_files() {
-	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
-
 	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup
 
-	# Add version information
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
-
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
 	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
deleted file mode 100644
index b89c5d0..0000000
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Host Arago SDK package for cross canadian toolchain"
-PN = "packagegroup-arago-cross-canadian-${MACHINE}"
-PR = "r7"
-
-inherit cross-canadian packagegroup
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-
-# Use indirection to stop these being expanded prematurely
-BINUTILS = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-GCC = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-GDB = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-RDEPENDS_${PN} = "\
-    ${@all_multilib_tune_values(d, 'BINUTILS')} \
-    ${@all_multilib_tune_values(d, 'GCC')} \
-    ${@all_multilib_tune_values(d, 'GDB')} \
-    "
-
-#    meta-environment-${MACHINE}
-- 
2.7.4


