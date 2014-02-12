Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6A51752972
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 22:14:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CMEpAC002636
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 16:14:51 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CMEpEp016541
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 16:14:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Feb 2014 16:14:51 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s1CMEp96032413;
	Wed, 12 Feb 2014 16:14:51 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Feb 2014 17:14:49 -0500
Message-ID: <1392243289-10398-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-rm: provides ti resouce manager recipe for KeyStone devices
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
X-List-Received-Date: Wed, 12 Feb 2014 22:14:52 -0000
Content-Type: text/plain

- TI Resource Manager Low Level Driver

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc    |    7 ++++
 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   45 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
 create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
new file mode 100644
index 0000000..96da467
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
@@ -0,0 +1,7 @@
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=dc61631b65360e6beb73b6c337800afc"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
+SRCREV = "3a73cfe015214ff0401639f85fa5e52ea610e59d"
diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
new file mode 100644
index 0000000..7c8dad0
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "TI Resource Manager Low Level Driver"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r0"
+DEPENDS="ti-ipc"
+LLD-NAME="rm"
+
+include ti-rm.inc
+
+S = "${WORKDIR}/git"
+LLD-BLD-DIR="${S}/ti/drv"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
+                    ${bindir}/rmLinuxClientTest_*.out \
+                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
+
+do_configure () {
+#   tweak the directory structure to LLD way
+    cd ${S}
+    mkdir -p ${LLD-BLD-DIR}
+    cd ${LLD-BLD-DIR}
+    ln -s ${S} ${LLD-NAME}
+}
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    cd ${LLD-BLD-DIR}/${LLD-NAME}   
+    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME}
+    make -f makefile_armv7 lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME}
+    make -f makefile_armv7 lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2h RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=yes	
+    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME}
+    make -f makefile_armv7 lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME}
+    make -f makefile_armv7 lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=k2k RM_SRC_DIR=${LLD-BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=yes	
+}
+
+do_install () {
+    install -d ${D}/${includedir}/ti/drv/${LLD-NAME}
+    install -d ${D}/${libdir}
+    install -d ${D}/${bindir}	
+    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}/${libdir} INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE=k2h
+    make -f makefile_armv7 install installbin installbin_test INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}/${libdir} INSTALL_BIN_BASE_DIR=${D}/${bindir} DEVICE=k2k	
+}
-- 
1.7.9.5


