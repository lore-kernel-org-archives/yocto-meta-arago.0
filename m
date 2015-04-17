Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DA98252A8D
	for <meta-arago@arago-project.org>;
	Fri, 17 Apr 2015 20:01:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3HK1mBD026513
	for <meta-arago@arago-project.org>; Fri, 17 Apr 2015 15:01:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3HK1llN027097
	for <meta-arago@arago-project.org>; Fri, 17 Apr 2015 15:01:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 17 Apr 2015 15:01:46 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3HK1koi001849;
	Fri, 17 Apr 2015 15:01:46 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YjCSQ-0007YB-Bi; Fri, 17 Apr 2015 16:01:46 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Apr 2015 16:01:44 -0400
Message-ID: <1429300904-28993-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: V2] matrix-gui-apps: add utilities demo apps for Keystone devices
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
X-List-Received-Date: Fri, 17 Apr 2015 20:01:49 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

The utilities demo includes PHP based utility apps to read/write I2C
EEPROM and Nand Flash, write root filesystem, and display SoC specific
info and statistics.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +++
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    7 ++--
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    7 ++--
 .../matrix/matrix-gui-utility-demos_2.0.bb         |   34 ++++++++++++++++++++
 4 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index a006c52..6c58b6f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -125,6 +125,10 @@ MATRIX_APPS_append_am180x-evm = "   \
     matrix-gui-pru-demos            \
 "
 
+MATRIX_APPS_append_keystone = " \
+    matrix-gui-utility-demos	\
+"
+
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_GUI}         \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 0d2d8c2..73e92ac 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 DEPENDS += "ca-certificates-native"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=http;branch=${BRANCH}"
-SRCREV = "200426006a3ae68bde9d7eb6a864da51fe07298c"
+SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
+SRCREV = "7a3fb05dfb49b144cb149b31cbc9d452975ddfcd"
 BRANCH = "master"
-INC_PR = "r31"
+INC_PR = "r32"
+
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 787a934..250694d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.11"
+PR = "${INC_PR}.12"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -15,7 +15,7 @@ inherit allarch
 S = "${WORKDIR}/git"
 
 # List of submenus to build packages for
-SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu"
+SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu utilities_submenu"
 
 do_install(){
     install -d ${D}${MATRIX_APP_DIR}
@@ -26,7 +26,7 @@ do_install(){
     done
 }
 
-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera"
+PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera  ${PN}-utility"
 
 # Make sure app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images"
@@ -47,3 +47,4 @@ FILES_${PN}-usb = "${MATRIX_APP_DIR}/usb_submenu/*"
 FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
 FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
 FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
+FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
new file mode 100644
index 0000000..2c4890d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Keystone utility app demo descriptions for Matrix v2"
+HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/utilities_apps"
+
+do_install_prepend(){
+   install -d ${D}${MATRIX_BASE_DIR}/html-apps/
+   cp -rf ${S}/utility_eeprom/eeprom ${D}${MATRIX_BASE_DIR}/html-apps/
+   cp -rf ${S}/utility_flash/flash ${D}${MATRIX_BASE_DIR}/html-apps/
+   cp -rf ${S}/utility_filesystem/filesystem ${D}${MATRIX_BASE_DIR}/html-apps/
+   cp -rf ${S}/utility_info/info ${D}${MATRIX_BASE_DIR}/html-apps/
+   cp -rf ${S}/utility_stats/stats ${D}${MATRIX_BASE_DIR}/html-apps/
+}
+
+do_install_append(){
+    rm ${D}${MATRIX_APP_DIR}/utility_eeprom/eeprom-utility.php
+    rm ${D}${MATRIX_APP_DIR}/utility_flash/flash-utility.php
+    rm ${D}${MATRIX_APP_DIR}/utility_filesystem/filesystem-utility.php
+    rm ${D}${MATRIX_APP_DIR}/utility_info/info-utility.php
+    rm ${D}${MATRIX_APP_DIR}/utility_stats/stats-utility.php
+}
+
+# Make sure utility submenu and app images has been installed.
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-utility"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/html-apps/ \
+                ${MATRIX_BASE_DIR}/apps/ \
+"
-- 
1.7.9.5


