Return-Path: <aravindbr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BED0852AA8
	for <meta-arago@arago-project.org>;
	Sat, 22 Feb 2014 01:07:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1M17k4a007729
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 19:07:46 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1M17kkw030927
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 19:07:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Feb 2014 19:07:45 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dlep33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s1M17jJA011171;
	Fri, 21 Feb 2014 19:07:45 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Feb 2014 20:07:41 -0500
Message-ID: <1393031261-5360-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH v2] ti-rm: provides ti resouce manager recipe for KeyStone devices
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
X-List-Received-Date: Sat, 22 Feb 2014 01:07:46 -0000
Content-Type: text/plain

- TI Resource Manager Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>

---
Changes from last patch:
* Removed ti-rm.inc file
* Added destsuffix in the SRCURI to clone RM git under git/ti/drv/rm folder
* Removed the symbolic link workaround
* Added PV
* Added for loop for multiple devices and choices for the test binaries
---
---
 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
new file mode 100755
index 0000000..761a722
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "TI Resource Manager Low Level Driver"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
+SRCREV = "3a73cfe015214ff0401639f85fa5e52ea610e59d"
+PR = "r0"
+PV = "02.00.00.08"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-ipc"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
+                    ${bindir}/rmLinuxClientTest_*.out \
+                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
+
+DEVICELIST = " k2h \
+               k2k \
+"
+
+CHOICELIST = " yes \
+               no  \
+"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/rm"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} RM_SRC_DIR=${S}
+    for device in ${DEVICELIST}
+    do
+      for choice in ${CHOICELIST}
+      do
+        make -f makefile_armv7 tests IPC_DEVKIT_INSTALL_PATH=${STAGING_INCDIR} PDK_INSTALL_PATH=${BASEDIR} DEVICE="$device" USEDYNAMIC_LIB="$choice"
+      done
+    done	
+}
+
+do_install () {
+	install -d ${D}/${includedir}/ti/drv/rm
+    install -d ${D}/${libdir}
+    install -d ${D}/${bindir}	
+    for device in ${DEVICELIST}
+    do	
+      make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}/${libdir} INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE="$device"
+    done	
+}
-- 
1.7.9.5


