Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4A16C52975
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 15:15:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1RFESNs000806
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 09:14:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519744468;
	bh=YjDYxU11anRbLI31iWBp7w9aj1SBZfUiCgj80C31rTo=;
	h=From:To:Subject:Date;
	b=sXPB5nU/Srd4/7FGCmasABVt062tCgXD/1SgCtijGKT2Idg5UDOWB+/JSXatOfB+I
	trPYeMYXCHwVgXLyml0MnxPyh90XpjPZgR4Cejwt+FV79bS5sunWBj41B3WMDMaJxz
	GmBnJSvft9bg3Eb2lhtlbvzAbfHVrsO4IXb9qKEU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RFEStS031567
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 09:14:28 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 09:14:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 09:14:25 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RFEPpP021468
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 09:14:25 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Feb 2018 10:14:17 -0500
Message-ID: <1519744457-3844-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v3] ti-pdk-build-rtos: Installing newly added comp_paths.mk
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
X-List-Received-Date: Tue, 27 Feb 2018 15:15:01 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v3 - Updated PV and added 'PACKAGE_ARCH = "${MACHINE_ARCH}
 v2 - Updated the commit #
 v1 - installing the newly added file

 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index e1e8ccc..b028e8c 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.07"
+PV = "01.00.00.08"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.07"
-PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08"
+PDK_BUILD_SRCREV = "f68931ff82eb051fc026ae28b2555f3c581eb6b9"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -20,6 +20,7 @@ SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRAN
 SRCREV = "${PDK_BUILD_SRCREV}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
 
@@ -35,6 +36,7 @@ do_install() {
 
     install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
     install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
+    install -m 0755 comp_paths.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
 
     install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
-- 
1.9.1


