Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0E5FD5208C
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 20:18:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24KIo48004195
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:18:50 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24KIo99026187
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:18:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 14:18:49 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24KInZ5020041;
	Tue, 4 Mar 2014 14:18:49 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 15:18:47 -0500
Message-ID: <1393964327-31812-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-trace-framework: provides ti traceframework recipe for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 20:18:51 -0000
Content-Type: text/plain

-TI TraceFramework user space library

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../ti-trace-framework/ti-trace-framework_git.bb   |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb
new file mode 100644
index 0000000..7fd9a01
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "TI Trace Framework library"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://traceframework.h;md5=da9b1c47cbce96bcdebd2a80970b820e"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.TFWK-01.01.00.00
+SRCREV = "123e61e727bffb1bd4f0a3ba0cdc5e4847bacf0d"
+PR = "r0"
+PV = "01.01.00.00"
+
+COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+DEPENDS ="ti-cuia"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/tfw*.out \
+                    ${bindir}/*.txt"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/instrumentation/traceframework"
+
+do_install () {
+      make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=c6614 TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D} CUIA_INSTALL_DIR=${STAGING_INCDIR}
+}
+
+do_compile () {
+      make -f makefile_armv7 clean lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE=c6614 TFW_INC_DIR=${BASEDIR} TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D} CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}
+}
-- 
1.7.9.5


