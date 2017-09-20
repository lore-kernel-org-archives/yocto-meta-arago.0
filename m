Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C901252093
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:35:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KIZjcf005363
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505932545;
	bh=wDVePcRoL884nJYrTMDemmLRfCJA6LWjFgd6Dk8h+zI=;
	h=From:To:CC:Subject:Date;
	b=JXvcSb+xG6wAmjcOQ6ISSdc5bk2W3rRs3mn/HzeQvc3QC8ErW4p2Io6b2ON0Ds3eF
	aUoHFA1rS0PP/sDrS3yeE6b7a2Niplza8STLSTbsUK8pd+biwVydJR38pArGobUjGK
	YLwLxm7N3ENl0qxNq+GYmeyaxmw12W1FyYhUb4p8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KIZjtZ006276
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:35:45 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:35:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:35:45 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KIZiBY032510;
	Wed, 20 Sep 2017 13:35:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 14:35:42 -0400
Message-ID: <1505932542-5224-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH v2] icss-emac-lld*: update to version 01.00.00.08
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
X-List-Received-Date: Wed, 20 Sep 2017 18:35:46 -0000
Content-Type: text/plain

* Add k2g support for linux user space
* Add icss-emac-lld-rtos in DEPENDS to build firmware binaries
* Add ti-pdk-build-rtos in DEPENDS to consume firmware binaries
* Recipe cleanup: remove TARGET from oe_runmake; simplify compile
  and install tasks by leveraging TI_PDK_LIMIT_SOCS

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes:
* Exclude icss-emac-lld-rtos which has been sumbitted as a seperate patch
* Simplify compile and install tasks for icss-emac-lld-test

 .../icss-emac-lld/icss-emac-lld-01.00.00.inc       |  6 +--
 .../icss-emac-lld/icss-emac-lld-test_git.bb        | 49 +++++++---------------
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  5 +--
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
index 8e2ffd4..621219b 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
-ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
+ICSS_EMAC_LLD_SRCREV = "e689df18417236110590f7b290525a610d63f574"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "01.00.00.07C"
+PV = "01.00.00.08"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
index 6beafbf..204dbb3 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
@@ -1,47 +1,30 @@
 DESCRIPTION = "TI ICSS-EMAC low level driver tests"
 
-DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
+DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
 
 DEPENDS_append_ti33x = " starterware"
 DEPENDS_append_ti43x = " starterware"
 
 include icss-emac-lld-01.00.00.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
 
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
+DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
 
-do_compile_am57xx-evm () {
-#   Build the tests
-    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
-    oe_runmake clean
-    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
+do_compile () {
+    # Build the tests
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake tests DEVICE="$device"
+    done
 }
 
-do_compile_ti33x () {
-#   Build the tests
-    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
-}
-
-do_compile_ti43x () {
-#   Build the tests
-    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
-}
-
-do_install_am57xx-evm () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
-}
-
-do_install_ti33x () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
-}
-
-do_install_ti43x () {
-#   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
+do_install() {
+    # Install the binary
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+    done
 }
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
index b3be89b..bfa655d 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -4,13 +4,12 @@ DEPENDS="common-csl-ip pruss-lld osal"
 
 include icss-emac-lld-01.00.00.inc
 
-PR = "${INC_PR}.2"
-
-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
+PR = "${INC_PR}.0"
 
 TARGET_NAME_am57xx-evm = "SOC_AM572x"
 TARGET_NAME_ti33x = "SOC_AM335x"
 TARGET_NAME_ti43x = "SOC_AM437x"
+TARGET_NAME_k2g-evm = "SOC_K2G"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
 
-- 
1.9.1


