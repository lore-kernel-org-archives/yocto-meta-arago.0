Return-Path: <aravindbr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2086552A00
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 20:58:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24KwLWE024801
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:58:21 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24KwLJH022549
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:58:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 14:58:21 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24KwKB7016006;
	Tue, 4 Mar 2014 14:58:21 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 15:58:19 -0500
Message-ID: <1393966699-23026-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-pktlib: provides ti pktlib recipe for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 20:58:22 -0000
Content-Type: text/plain

-TI packet library user space library

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-pktlib/ti-pktlib_git.bb         |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-pktlib/ti-pktlib_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-pktlib/ti-pktlib_git.bb b/meta-arago-extras/recipes-bsp/ti-pktlib/ti-pktlib_git.bb
new file mode 100644
index 0000000..1fac9ab
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-pktlib/ti-pktlib_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "TI PKTLIB"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+DEPENDS="ti-csl ti-rm ti-qmss-lib ti-cppi-lib"
+COMPATIBLE_MACHINE = "keystone"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/pktlib.git;protocol=git;branch=${BRANCH}"
+
+# Corresponds to DEV.PKTLIB.2.0.0.11
+SRCREV = "9f613bea325f8b1cd728b203a29ebb8c5b368d98"
+PV = "2.0.0.11"
+PR = "r0"
+
+ALLOW_EMPTY_${PN} = "1"
+
+S = "${WORKDIR}/git//ti/runtime/pktlib"
+
+do_compile () {
+#   Now build the pktlib in the updated directory
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


