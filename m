Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B8DE252093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 21:49:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDLnKIG000407
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:49:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513201760;
	bh=/Oq+RGIr6rWImLg+A+lSWKJP229B6aGGuLjMHicXziM=;
	h=From:To:Subject:Date;
	b=V+gcNuxI95mGb9xGAybruw3jhdNXJpyQ+1vPumgXPfusKNhHxZ5B8h0rMXKkTB11i
	y1OaBxPHDnR6V74dHBeW7sJHahgs6I1RG8d5Gg5j5I+2z7637hmtvU0pK8pAD1ZMJK
	wv3h1Yxgz5lE7N1myeZoZtKbPDRQndohUNpi5NnI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLnKUD011838
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:49:20 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 15:49:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 15:49:19 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLnJOJ020896
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 15:49:19 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 16:49:18 -0500
Message-ID: <1513201758-22171-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] ti-pdk-build-rtos:Updating to version 1.0.0.7
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
X-List-Received-Date: Wed, 13 Dec 2017 21:49:21 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 44 +++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index b59f8ca..e1e8ccc 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,22 +4,22 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.06"
+PV = "01.00.00.07"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.06"
-PDK_BUILD_SRCREV = "67986fbcef0b37428587a3d50d68d81f935f0c30"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.07"
+PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PDK_BUILD_SRCREV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
 
 S = "${WORKDIR}/git/"
 
@@ -77,6 +77,7 @@ do_install_append_ti43x() {
 do_install_append_am57xx-evm() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 
     install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
@@ -93,6 +94,10 @@ do_install_append_am57xx-evm() {
     install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
     install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
+    install -m 0755 am574x/config_am574x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/config_am574x_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/config_am574x_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
+    install -m 0755 am574x/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am574x
     
     install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
     install -m 0755 pruss/lnk_c66_m4_REV1.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
@@ -148,6 +153,7 @@ do_install_append_am57xx-hs-evm() {
 do_install_append_dra7xx() {
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
 
     install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/
 
@@ -163,6 +169,11 @@ do_install_append_dra7xx() {
     install -m 0755 tda2xx/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -m 0755 tda3xx/config_tda3xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
     install -m 0755 tda3xx/config_tda3xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
+    install -m 0755 tda2ex/config_tda2ex.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+    install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
+
 }
 
 do_install_append_keystone() {
@@ -186,4 +197,29 @@ do_install_append_k2g() {
     install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
 }
 
+do_install_append_c66x() {
+    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_omapl1() {
+
+    install -m 0755 makerules/rules_674.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_ae9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
+}
+
+do_install_append_omapl137-evm() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+
+    install -m 0755 omapl137/config_omapl137_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+    install -m 0755 omapl137/config_omapl137_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl137
+}
+
+do_install_append_omapl138-lcdk() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+
+    install -m 0755 omapl138/config_omapl138_c674x.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+    install -m 0755 omapl138/config_omapl138_arm9.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/omapl138
+}
+
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


