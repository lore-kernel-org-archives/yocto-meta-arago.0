Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0F02E52A1E
	for <meta-arago@arago-project.org>;
	Sun,  2 Mar 2014 23:22:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s22NMeZt006869
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 17:22:40 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s22NMeNd025341
	for <meta-arago@arago-project.org>; Sun, 2 Mar 2014 17:22:40 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 2 Mar 2014 17:22:40 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s22NMduo030064;	Sun, 2 Mar 2014 17:22:39 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 2 Mar 2014 18:22:38 -0500
Message-ID: <1393802558-7742-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-hyplnk: Add recipe for ti hyperlink low level driver
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
X-List-Received-Date: Sun, 02 Mar 2014 23:22:41 -0000
Content-Type: text/plain

- User space low level driver and test code for hyperlink
  peripheral

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb     |   38 ++++++++++++++++++++
 .../recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb     |   21 +++++++++++
 .../recipes-bsp/ti-hyplnk/ti-hyplnk.inc            |   10 ++++++
 3 files changed, 69 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
 create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
 create mode 100644 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc

diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
new file mode 100755
index 0000000..9938b18
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "TI HYPLNK low level driver test binaries"
+LICENSE = "TI BSD"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r0"
+DEPENDS="ti-csl ti-hyplnk-lib"
+
+include ti-hyplnk.inc
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/${LLDNAME}"
+
+DEVICELIST = " k2h \
+               k2k \
+"
+
+CHOICELIST = " yes \
+               no  \
+"
+
+do_compile () {
+	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} USEDYNAMIC_LIB="${choice}"
+		done
+	done
+}
+
+do_install () {
+    for device in ${DEVICELIST}
+	do
+	    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}" HYPLNK_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
+	done
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
new file mode 100755
index 0000000..03399c6
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "TI HYPLNK Low Level Driver"
+LICENSE = "TI BSD"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r0"
+DEPENDS="ti-csl"
+
+include ti-hyplnk.inc
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/${LLDNAME}"
+
+do_compile () {
+#   Now build the lld in the updated directory	
+    make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
new file mode 100644
index 0000000..26f22db
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
@@ -0,0 +1,10 @@
+LLDNAME="hyplnk"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.00.00.09
+SRCREV = "f88e31b60aa2b4d591d5a845361c7e56792eeda1"
+
+PV = "2.0.0"
\ No newline at end of file
-- 
1.7.9.5


