Return-Path: <aravindbr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C20A45208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 18:12:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24ICimB020292
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 12:12:44 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24IChKw026885
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 12:12:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 12:12:43 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dlep33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24ICh8e032212;
	Tue, 4 Mar 2014 12:12:43 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 13:12:41 -0500
Message-ID: <1393956761-15235-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-qmss: provides ti queue manager sub system recipe for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 18:12:44 -0000
Content-Type: text/plain

- TI QMSS Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-qmss/ti-qmss-bin.bb             |   33 ++++++++++++++++++++
 .../recipes-bsp/ti-qmss/ti-qmss-lib.bb             |   20 ++++++++++++
 meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss.inc  |    9 ++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-bin.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-lib.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-bin.bb b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-bin.bb
new file mode 100644
index 0000000..2f4de33
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-bin.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI QMSS LLD unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="ti-csl ti-rm ti-cppi-lib ti-qmss-lib"
+
+include ti-qmss.inc
+
+PR = "r0"
+
+DEVICELIST = "k2h k2k"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/qmss"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S}	
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+      done
+    done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" QMSS_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+    done
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-lib.bb b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-lib.bb
new file mode 100644
index 0000000..aa72825
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss-lib.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI QMSS LLD library"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-csl ti-rm"
+
+include ti-qmss.inc
+
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/qmss"
+
+do_compile () {
+#   Now build the lld	
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss.inc b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss.inc
new file mode 100644
index 0000000..5675b62
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-qmss/ti-qmss.inc
@@ -0,0 +1,9 @@
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git;destsuffix=git/ti/drv/qmss;protocol=git;branch=${BRANCH}"
+
+# commit ID corresponding to DEV.QMSS_LLD.02.00.00.18
+SRCREV = "9f80224bf705888a4f4348c8bed054bdae84ef94"
+PV = "02.00.00.18"
-- 
1.7.9.5


