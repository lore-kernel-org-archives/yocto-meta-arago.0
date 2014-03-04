Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2487C52986
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 19:52:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24Jq5o1020849
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:52:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24Jq5Hp005914
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:52:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 13:52:04 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24Jq4U3012119;
	Tue, 4 Mar 2014 13:52:04 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 14:52:02 -0500
Message-ID: <1393962722-25323-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-pa: provides ti pa recipe for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 19:52:06 -0000
Content-Type: text/plain

- TI PA Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-pa/ti-pa-bin_git.bb             |   33 ++++++++++++++++++++
 .../recipes-bsp/ti-pa/ti-pa-lib_git.bb             |   20 ++++++++++++
 meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc      |   10 ++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
new file mode 100644
index 0000000..ecfffc2
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI PA LLD unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="ti-csl ti-pa-lib ti-cppi-lib ti-qmss-lib"
+
+include ti-pa.inc
+
+PR = "r0"
+
+DEVICELIST = "k2h k2k"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/pa"
+
+do_compile () {
+# Now build the lld unit test examples
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S}
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+      done
+    done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+    done
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
new file mode 100644
index 0000000..a549a99
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI PA LLD library"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-csl ti-rm"
+
+include ti-pa.inc
+
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/pa"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
new file mode 100644
index 0000000..134f1f2
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
@@ -0,0 +1,10 @@
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.PA_LLD.02.00.01.05"
+SRCREV = "a8f42102a60528c36720c211ea457eecf20f8481"
+PV = "02.00.01.05"
+SRCREV = "DEV.PA_LLD.02.00.01.05"
-- 
1.7.9.5


