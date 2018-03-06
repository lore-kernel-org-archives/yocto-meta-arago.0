Return-Path: <sjmolfetta@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1EB0452975
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 17:20:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26HJTPu007222
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 11:19:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520356769;
	bh=9XheSuukADIot2IFKP16s1iGxNpl8t3hV6AnHO0QMOA=;
	h=From:To:CC:Subject:Date;
	b=juNBBgsAlKk35yBGsh30UvTE7AB1HQwpE/XdmGJhvem1b5XqGveOtRvGOU8LXqVmW
	K1e9gPydKfD2T1SXqKTrrkDTV6TtgTI61POKnHK81jHp1lMAdjXqiiKK3NADgGOWP0
	3xSt4zuKpV2YVsSOMRO280Ieh6cFWnBLtykGoYfg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26HJTUu005003
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 11:19:29 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 11:19:28 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 11:19:28 -0600
Received: from houapbldadm.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26HJSNM019689;
	Tue, 6 Mar 2018 11:19:28 -0600
From: Stephen Molfetta <sjmolfetta@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Mar 2018 11:19:24 -0600
Message-ID: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][master][PATCH] dra7xx: pdk: updating build install step
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
X-List-Received-Date: Tue, 06 Mar 2018 17:20:11 -0000
Content-Type: text/plain

DRA7xx PDK introduced a new build-related file and needs to install
this file into the package location
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index b028e8c..3e8157d 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 require recipes-ti/includes/ti-paths.inc
 
 PV = "01.00.00.08"
-PR = "r0"
+PR = "r1"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
@@ -153,6 +153,7 @@ do_install_append_am57xx-hs-evm() {
 }
 
 do_install_append_dra7xx() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
@@ -165,6 +166,7 @@ do_install_append_dra7xx() {
     install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
     install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
 
+    install -m 0755 dra7xx/linkcmd.xdt ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/dra7xx
     install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
     install -m 0755 tda2xx/config_tda2xx_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
@@ -175,7 +177,6 @@ do_install_append_dra7xx() {
     install -m 0755 tda2ex/config_tda2ex_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
     install -m 0755 tda2ex/config_tda2ex_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
     install -m 0755 tda2ex/mem_segment_definition_1024mb_bios.xs ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2ex
-
 }
 
 do_install_append_keystone() {
-- 
2.7.4


