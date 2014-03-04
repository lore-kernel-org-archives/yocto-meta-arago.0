Return-Path: <aravindbr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 415DA52986
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 22:23:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24MNUWE005457
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 16:23:30 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24MNUAX020862
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 16:23:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 16:23:30 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dlep32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s24MNT3q011073;
	Tue, 4 Mar 2014 16:23:30 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 17:23:27 -0500
Message-ID: <1393971807-17292-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-nwal: provides ti nwal library for KeyStone devices
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
X-List-Received-Date: Tue, 04 Mar 2014 22:23:31 -0000
Content-Type: text/plain

-TI network adaptation layer library

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../recipes-bsp/ti-nwal/ti-nwal_git.bb             |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-nwal/ti-nwal_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-nwal/ti-nwal_git.bb b/meta-arago-extras/recipes-bsp/ti-nwal/ti-nwal_git.bb
new file mode 100644
index 0000000..2b17c9d
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-nwal/ti-nwal_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI NWAL"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git;protocol=git;branch=${BRANCH}"
+# Below commit ID corresponds to DEV.NWAL.02.00.00.14
+SRCREV = "2152430bc35c34b74784e401a90b82e993bc03c7"
+PR = "r0"
+PV = "02.00.00.14"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS="ti-csl ti-rm ti-qmss-lib ti-hplib-lib ti-pa-lib ti-sa ti-pktlib"
+
+PACKAGES =+ "${PN}-test"
+FILES_${PN}-test = "${bindir}/*Test*"
+					
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/nwal"
+
+do_compile () {
+    for choice in ${CHOICELIST}
+    do
+      make -f makefile_armv7 clean lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} NWAL_INC_DIR=${BASEDIR} NWAL_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+    done
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
+}
-- 
1.7.9.5


