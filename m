Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2EA2452986
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:45:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIixva031951
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:44:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIixa6017907
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:44:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 13:44:59 -0500
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s4GIix7Q016060;
	Fri, 16 May 2014 13:44:59 -0500
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 14:44:55 -0400
Message-ID: <1400265895-8853-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-cppi: provides ti cppi recipe for KeyStone devices
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
X-List-Received-Date: Fri, 16 May 2014 18:45:00 -0000
Content-Type: text/plain

- TI CPPI Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-cppi/ti-cppi-bin.bb             |   34 ++++++++++++++++++++
 .../recipes-bsp/ti-cppi/ti-cppi-lib.bb             |   20 ++++++++++++
 meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi.inc  |    9 ++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-bin.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-lib.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-bin.bb b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-bin.bb
new file mode 100644
index 0000000..8590dcd
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-bin.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "TI CPPI LLD unit test and example binaries"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="ti-csl ti-rm ti-cppi-lib ti-qmss-lib"
+
+include ti-cppi.inc
+
+PR = "r0"
+S = "${WORKDIR}/git"
+
+DEVICELIST = "k2h k2k"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/cppi"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S}	
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+      done
+    done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" CPPI_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+    done
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-lib.bb b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-lib.bb
new file mode 100644
index 0000000..c92b546
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi-lib.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI CPPI LLD library"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-csl ti-rm ti-qmss-lib"
+
+include ti-cppi.inc
+
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/cppi"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} 
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi.inc b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi.inc
new file mode 100644
index 0000000..3bf27b8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-cppi/ti-cppi.inc
@@ -0,0 +1,9 @@
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/cppi/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/cppi-lld.git;destsuffix=git/ti/drv/cppi;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.CPPI_LLD.02.00.00.13"
+SRCREV = "fc85ebc584e6981c91a2e442f94aff284dc85151"
+PV = "02.00.00.13"
-- 
1.7.9.5


