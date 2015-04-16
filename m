Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ED51852A60
	for <meta-arago@arago-project.org>;
	Thu, 16 Apr 2015 17:59:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3GHxAlW014506
	for <meta-arago@arago-project.org>; Thu, 16 Apr 2015 12:59:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3GHx9rD008988
	for <meta-arago@arago-project.org>; Thu, 16 Apr 2015 12:59:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Apr 2015 12:59:08 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3GHx8U2024431;
	Thu, 16 Apr 2015 12:59:08 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1Yio4C-00071H-AR; Thu, 16 Apr 2015 13:59:08 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Apr 2015 13:59:04 -0400
Message-ID: <1429207144-26952-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-apps: add utilities demo apps for Keystone devices
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
X-List-Received-Date: Thu, 16 Apr 2015 17:59:11 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

The utilities demo includes PHP based utility apps to read/write I2C
EEPROM and Nand Flash, write root filesystem, and display SoC specific
info and statistics.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 ++++
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |   13 ++++++++++---
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    7 ++++---
 3 files changed, 18 insertions(+), 6 deletions(-)

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
index 0d2d8c2..a060b1b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -5,10 +5,17 @@ LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 DEPENDS += "ca-certificates-native"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=http;branch=${BRANCH}"
-SRCREV = "200426006a3ae68bde9d7eb6a864da51fe07298c"
+SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
+SRCREV = "84ff9dee7923fd973f18a959174ce7d185a35e16"
 BRANCH = "master"
-INC_PR = "r31"
+INC_PR = "r32"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/matrix-patches:"
+SRC_URI += " \
+        file://0001-Keystone-utilities-apps-add-utilities-demo-app-for-K.patch;patchdir=${WORKDIR}/git \
+"
+
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
-- 
1.7.9.5


