Return-Path: <aravindbr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C159C52972
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 16:17:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s25GHmHq032208
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 10:17:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s25GHme6023604
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 10:17:48 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 5 Mar 2014 10:17:47 -0600
Received: from ares-ubuntu.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dlep33.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id s25GHlsp017514;
	Wed, 5 Mar 2014 10:17:47 -0600
From: Aravind Batni <aravindbr@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Mar 2014 11:17:45 -0500
Message-ID: <1394036265-9590-1-git-send-email-aravindbr@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Aravind Batni <aravindbr@ti.com>
Subject: [PATCH v2] ti-hplib: provides ti hplib recipe for ti KeyStone devices
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
X-List-Received-Date: Wed, 05 Mar 2014 16:17:50 -0000
Content-Type: text/plain

-TI hplib library and kernel module

Signed-off-by: Aravind Batni <aravindbr@ti.com>
---
* removed kernel RDEPENDS check
---
---
 .../recipes-bsp/ti-hplib/ti-hplib-lib_git.bb       |   29 +++++++++++++++++
 .../recipes-bsp/ti-hplib/ti-hplib-mod_git.bb       |   33 ++++++++++++++++++++
 .../recipes-bsp/ti-hplib/ti-hplib.inc              |    6 ++++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-lib_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-lib_git.bb
new file mode 100644
index 0000000..720ac83
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-lib_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "TI HPLIB"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "ti-csl ti-rm ti-qmss-lib ti-sa ti-pktlib"
+
+include ti-hplib.inc
+
+PR = "r0"
+S = "${WORKDIR}/git/ti/runtime/hplib"
+
+PACKAGES =+ "${PN}-test"
+FILES_${PN}-test = "${bindir}/*test*"
+
+CHOICELIST = "yes no"
+
+do_compile () {
+  for choice in ${CHOICELIST}
+  do
+    make -f makefile_armv7 clean lib tests PDK_INSTALL_PATH=${STAGING_INCDIR} HPLIB_SRC_DIR=${S} USEDYNAMIC_LIB=$choice
+  done
+}
+
+do_install () {
+     make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir}
+}
+
+
diff --git a/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb
new file mode 100644
index 0000000..e260252
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib-mod_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI High Performance Library kernel module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/module/COPYING.txt;md5=c1c4d3453cddc5b7f0ce84a277e66779"
+COMPATIBLE_MACHINE = "keystone-evm"
+
+DEPENDS = "ti-hplib-lib"
+
+include ti-hplib.inc
+
+PKG_${PN} = "kernel-module-${PN}"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "d"
+
+PKG_${PN} = "kernel-module-${PN}"
+
+S ="${WORKDIR}/git/ti/runtime/hplib/module"
+
+inherit module
+
+do_compile () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+    make KDIR=${STAGING_KERNEL_DIR} clean
+    make KDIR=${STAGING_KERNEL_DIR} PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+     make KDIR="${STAGING_KERNEL_DIR}" INSTALL_MOD_PATH="${D}" install
+}
+
+PACKAGE_STRIP = "no"
+
diff --git a/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib.inc b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib.inc
new file mode 100644
index 0000000..c7a767d
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hplib/ti-hplib.inc
@@ -0,0 +1,6 @@
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH}"
+
+# Below Commit ID corresponds to "DEV.HPLIB.01.00.00.06"
+SRCREV = "3afeeffd93f8ec7438329eca273db8bf8c7ff645"
+PV = "01.00.00.06"
-- 
1.7.9.5


