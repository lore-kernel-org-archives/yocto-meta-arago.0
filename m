Return-Path: <aravindbr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B82AC52972
	for <meta-arago@arago-project.org>;
	Thu,  6 Mar 2014 17:17:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s26HHpNO013465
	for <meta-arago@arago-project.org>; Thu, 6 Mar 2014 11:17:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s26HHprw025104
	for <meta-arago@arago-project.org>; Thu, 6 Mar 2014 11:17:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 6 Mar 2014 11:17:50 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s26HHo0b002071;
	Thu, 6 Mar 2014 11:17:50 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Mar 2014 12:17:48 -0500
Message-ID: <1394126268-31984-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH v2] ti-trace-framework: provides ti traceframework recipe for KeyStone devices
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
X-List-Received-Date: Thu, 06 Mar 2014 17:17:53 -0000
Content-Type: text/plain

-TI TraceFramework user space library

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
* traceframework version update to 1.1.1.1
* added support for k2h k2h DEVICE for examples
---
---
 .../ti-trace-framework/ti-trace-framework_git.bb   |   43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb
new file mode 100644
index 0000000..9437c44
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-trace-framework/ti-trace-framework_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "TI Trace Framework library"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
+
+# Below commit ID corresponds to DEV.TFWK-01.01.01.01
+SRCREV = "ecf42063f3302f8b27442963ea9adbe21229e2d3"
+PR = "r0"
+PV = "01.01.01.01"
+
+COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+DEPENDS ="ti-cuia"
+
+DEVICELIST = ""
+DEVICELIST_append_tci6614-evm = "c6614"
+DEVICELIST_append_keystone    = "k2k k2h"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/tfw*.out \
+                    ${bindir}/*.txt"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/instrumentation/traceframework"
+
+do_install() {
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D} CUIA_INSTALL_DIR=${STAGING_INCDIR}
+    done
+}
+
+do_compile () {
+#   making the library
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR} CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}
+#   make the test application
+    for device in ${DEVICELIST}
+    do
+      make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" TFW_INC_DIR=${BASEDIR} TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D} CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}
+    done
+}
-- 
1.7.9.5


