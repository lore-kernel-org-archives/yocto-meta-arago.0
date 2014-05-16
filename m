Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3D72552997
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:49:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GInw6n002607
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:49:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GInwfQ021532
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:49:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 13:49:58 -0500
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s4GInwwH020196;
	Fri, 16 May 2014 13:49:58 -0500
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 May 2014 14:49:56 -0400
Message-ID: <1400266196-9047-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH] ti-transportnetlib-ipsecmgr: provides ti-ipsecmgr for ti KeyStone devices
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
X-List-Received-Date: Fri, 16 May 2014 18:49:59 -0000
Content-Type: text/plain

- TI ipsecmgr library collections

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
 .../ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb |   52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb

diff --git a/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb b/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb
new file mode 100644
index 0000000..7a73c3f
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "IPSec Manager"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://ipsecmgr_snoop.h;md5=9ac68c91483a0ab7a9b1fb79622f2487" 
+
+BRANCH="master"
+SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
+#Commit ID corresponding to DEV.IPSECMGR.01.00.00.01
+SRCREV = "fa51fbd4ad849627e02f2404edfa5be44043551a"
+PR     = "r0"
+PV     = "01.00.00.01"
+
+DEPENDS = "virtual/kernel"
+DEPENDS += "libnl-xfrm"
+
+ALLOW_EMPTY_${PN} = "1"
+ 
+S = "${WORKDIR}/git"
+LIB_BUILD_DIR = "${S}/build"
+MODULE_BUILD_DIR = "${S}/src/module"
+LIB_INC_DIR = "${S}/"
+UTILS_LIB_INC_DIR = "${S}/utils/iface/"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+
+do_compile() {
+    cd ${LIB_BUILD_DIR}
+    make clean;
+    make all;
+
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    cd ${MODULE_BUILD_DIR}
+    make KDIR="${STAGING_KERNEL_DIR}" clean
+    make KDIR="${STAGING_KERNEL_DIR}"
+}
+
+do_install() {
+    install -d ${D}${libdir}/
+    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_snoop.a ${D}${libdir}/
+    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_ipc.a ${D}${libdir}/
+    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_syslog.a ${D}${libdir}/
+    install -d ${D}${includedir}/
+    install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
+    install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
+
+    cd ${MODULE_BUILD_DIR}
+    make KDIR="${STAGING_KERNEL_DIR}" INSTALL_MOD_PATH="${D}" install
+}
+
+PACKAGE_STRIP = "no"
+
-- 
1.7.9.5


