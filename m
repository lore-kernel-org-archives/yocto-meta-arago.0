Return-Path: <aravindbr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 38C3E52986
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:42:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIgHIc028607
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:42:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIgHBA008615
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:42:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 13:42:16 -0500
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s4GIgGYT013882;
	Fri, 16 May 2014 13:42:17 -0500
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 14:42:14 -0400
Message-ID: <1400265734-8795-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-netapi: provides ti-netapi recipe for ti KeyStone devices
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
X-List-Received-Date: Fri, 16 May 2014 18:42:18 -0000
Content-Type: text/plain

-TI netapi user space library and examples

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-netapi/ti-netapi-bin_git.bb     |   41 ++++++++++++++++++++
 .../recipes-bsp/ti-netapi/ti-netapi-lib_git.bb     |   23 +++++++++++
 .../recipes-bsp/ti-netapi/ti-netapi.inc            |    9 +++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-bin_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-lib_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-bin_git.bb b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-bin_git.bb
new file mode 100644
index 0000000..a06a9eb
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-bin_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "TI NETAPI test application"
+COMPATIBLE_MACHINE = "keystone"
+DEPENDS="ti-netapi-lib ti-transportnetlib-ipsecmgr"
+
+include ti-netapi.inc
+
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/runtime/netapi"
+
+CHOICELIST = " yes \
+               no  \
+"
+
+do_compile () {
+#   Build the netapi binaries
+    for choice in ${CHOICELIST}
+    do
+	  make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} USEDYNAMIC_LIB="$choice"
+    done 
+
+#   Now build the netapi appplications 
+    cd ${S}/applications/ipsec_offload/ipsecmgr/build
+    make clean app PDK_INSTALL_PATH=${STAGING_INCDIR}
+    
+    cd ${S}/applications/ipsec_offload/config-app/build
+    make clean app PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir}
+    
+    cd ${S}/applications/ipsec_offload/ipsecmgr/build
+    echo ${INSTALL_BIN_BASE_DIR}
+    echo ${INSTALL_INC_BASE_DIR}
+    make install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir}
+    
+    cd ${S}/applications/ipsec_offload/config-app/build
+    make install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-lib_git.bb
new file mode 100644
index 0000000..befad52
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi-lib_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "TI NETAPI Library"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-csl ti-rm ti-qmss-lib ti-cppi-lib ti-sa ti-hplib-lib ti-pktlib ti-nwal"
+
+NAME="netapi"
+
+include ti-netapi.inc
+
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/runtime/netapi"
+
+do_compile () {
+#   Now build the netapi
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi.inc b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi.inc
new file mode 100644
index 0000000..0b24103
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-netapi/ti-netapi.inc
@@ -0,0 +1,9 @@
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.NETAPI.01.00.00.10"
+SRCREV = "c0feddd60f2812f095436578534a90bdbd953d39"
+PV = "01.00.00.10"
-- 
1.7.9.5


