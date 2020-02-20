Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AF90E52988
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG8aN081498
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226168;
	bh=nbrku9ni+J9lL6gxLQFPz51Au93CPyjxg3F9jsquZd0=;
	h=From:To:CC:Subject:Date;
	b=DXw7LzKEtrJQRUTKKBF4gZ3Sqoeuqjbu84Ok2LrjZiolEG1qppbGEgA1dxGsDCr1J
	dyHAZFED7uPGhV2uZ5Fj4ac62NY3rSQEyxSZ2aMLkjxSE+OOV1Y6nKV/ntGKn9pZsn
	8V2VMjsu6JwEXeXs0BuXp/ge2bEKRU85WlHrlczc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJG8JZ096954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:08 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pc017983;
	Thu, 20 Feb 2020 13:16:07 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:50 +0000
Message-ID: <20200220185458.26926-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 1/9] packagegroup-arago-cross-canadian: deprecate in favor of upstream packagegroup-cross-canadian
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:08 -0000
Content-Type: text/plain

Upstream meta-environment already provides standard site-config and version
files, keep our own environment-setup for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...d => packagegroup-cross-canadian.bbappend} |  0
 .../recipes-core/meta/meta-toolchain-arago.bb |  8 +-------
 .../packagegroup-arago-cross-canadian.bb      | 20 -------------------
 3 files changed, 1 insertion(+), 27 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-cross-canadian.bbappend => packagegroup-cross-canadian.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-canadian.bbappend
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 09678348..5a48d3e0 100644
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
index b89c5d01..00000000
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
2.17.1


