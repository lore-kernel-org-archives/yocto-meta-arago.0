Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 33F94529FD
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 14:39:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KEd6x0028884
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505918346;
	bh=aBCQ3G/XdAMhFOsp4rGeJgsYx6oCN0DWVZZ2oyH4AYk=;
	h=From:To:CC:Subject:Date;
	b=WaeWPToAj+0vCP8DPqSQgqpltjameWgSZ+GJezn6j0hJHXSiMNZ+6JbPsRBQdrIty
	MlpEUbQ4I39VqIb0ibNXPukQveAY+AWHQXIjFfbxmcFxmtiuT8y1rKdL6U7LhVbG2Y
	1WlZG8CGnGxQOg8xUc2Tut9eyGmwPeLCDomUzwNw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KEd6bv001336
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:39:06 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 09:39:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 09:39:05 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KEd5H4003728;
	Wed, 20 Sep 2017 09:39:05 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 10:39:01 -0400
Message-ID: <1505918341-15928-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] icss-emac-lld*: update to version 01.00.00.08
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
X-List-Received-Date: Wed, 20 Sep 2017 14:39:06 -0000
Content-Type: text/plain

* Add icss-emac-lld-rtos to build firmware binaries
* Add k2g support for linux user space
* Cleanup to remove TARGET from oe_runmake

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../icss-emac-lld/icss-emac-lld-01.00.00.inc       |  6 ++--
 .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 28 ++++++++++++++++++
 .../icss-emac-lld/icss-emac-lld-test_git.bb        | 34 +++++++++++++---------
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  5 ++--
 4 files changed, 54 insertions(+), 19 deletions(-)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

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
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
new file mode 100644
index 0000000..06ee279
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
@@ -0,0 +1,28 @@
+inherit ti-pdk
+require icss-emac-lld-01.00.00.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " osal-rtos \
+                   pruss-lld-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+LIMSOCS_ti33x = "am335x"
+LIMSOCS_ti43x = "am437x"
+LIMSOCS_am57xx-evm = "am571x am572x"
+LIMSOCS_k2g = "k2g"
+
+export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
index 6beafbf..375bfbc 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
@@ -1,47 +1,55 @@
 DESCRIPTION = "TI ICSS-EMAC low level driver tests"
 
-DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
+DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
 
 DEPENDS_append_ti33x = " starterware"
 DEPENDS_append_ti43x = " starterware"
 
 include icss-emac-lld-01.00.00.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
-
-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
 
 do_compile_am57xx-evm () {
 #   Build the tests
-    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
+    oe_runmake tests DEVICE="am571x"
     oe_runmake clean
-    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
+    oe_runmake tests DEVICE="am572x"
 }
 
 do_compile_ti33x () {
 #   Build the tests
-    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
+    oe_runmake tests DEVICE="am335x"
 }
 
 do_compile_ti43x () {
 #   Build the tests
-    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
+    oe_runmake tests DEVICE="am437x"
+}
+
+do_compile_k2g-evm () {
+#   Build the tests
+    oe_runmake tests DEVICE="k2g"
 }
 
 do_install_am57xx-evm () {
 #   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x"
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x"
 }
 
 do_install_ti33x () {
 #   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x"
 }
 
 do_install_ti43x () {
 #   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x"
+}
+
+do_install_k2g-evm () {
+#   Install the binary
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="k2g"
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


