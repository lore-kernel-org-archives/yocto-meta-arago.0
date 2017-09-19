Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EA942529E3
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 08:26:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JKngpU026780
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 15:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505854182;
	bh=CdWlxunJx3OLC2M8Thk6nswaMqsluwxsPk0GCsA8f2I=;
	h=From:To:CC:Subject:Date;
	b=iV8lcsCNP/21tg6l/DA06uY7O5Wqrcf/TYRYZtzwKkpABIkiMVGjtUZ3HiiSftQrc
	tLVPPnaNakH7Nzcbe/t0OQfMgvLsvJGNph4eZajvmEhSefBsA6/Lp5X1tXniWW6xFo
	HR+J8CcYDeTomhQfHnaKPDYOYMeOJr2np39j+Ohc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JKngWj005947
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 15:49:42 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 15:49:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 15:49:42 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JKngQf023295;
	Tue, 19 Sep 2017 15:49:42 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Sep 2017 16:49:31 -0400
Message-ID: <1505854171-9145-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH] ti-pdk-build-rtos: updated the version to 1.0.0.6
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
X-List-Received-Date: Wed, 20 Sep 2017 08:26:25 -0000
Content-Type: text/plain

* Also added the pruss linker command files for linux user space

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index 0807983..b59f8ca 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.05A"
+PV = "01.00.00.06"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.05A"
-PDK_BUILD_SRCREV = "3a7a42bcd85388b24fe83401fb284ce22d7b2978"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.06"
+PDK_BUILD_SRCREV = "67986fbcef0b37428587a3d50d68d81f935f0c30"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
@@ -55,6 +55,7 @@ do_install_append_ti33x() {
     install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     
 }
 
@@ -69,6 +70,7 @@ do_install_append_ti43x() {
     install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU0_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     
 }
 
@@ -104,6 +106,9 @@ do_install_append_am57xx-evm() {
     install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
+
 }
 
 do_install_append_am57xx-hs-evm() {
@@ -178,6 +183,7 @@ do_install_append_k2g() {
     install -m 0755 pruss/PRU0_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV2_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/PRU1_REV2_to_C66.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss    
+    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


