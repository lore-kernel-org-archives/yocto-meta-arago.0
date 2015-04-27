Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3E4EB52AA5
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 19:20:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RJKoJP026695
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:20:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJKnou019689
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 14:20:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 14:20:49 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RJKnjM027328;
	Mon, 27 Apr 2015 14:20:49 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YmoaH-0007zt-0i; Mon, 27 Apr 2015 15:20:49 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Apr 2015 15:20:47 -0400
Message-ID: <1430162447-30710-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-apps: add multi-core demo apps for Keystone devices
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
X-List-Received-Date: Mon, 27 Apr 2015 19:20:51 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

The patch adds image processing and IPC multi-core demos for Keystone
devices.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    3 ++-
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 .../recipes-core/matrix/matrix-gui-mc-demos_2.0.bb |   19 +++++++++++++++++++
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    7 ++++---
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |    2 +-
 5 files changed, 28 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 6c58b6f..fd9ef70 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r37"
+PR = "r38"
 
 inherit packagegroup
 
@@ -127,6 +127,7 @@ MATRIX_APPS_append_am180x-evm = "   \
 
 MATRIX_APPS_append_keystone = " \
     matrix-gui-utility-demos	\
+    matrix-gui-mc-demos	\
 "
 
 RDEPENDS_${PN} = "        \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 73e92ac..ab566c9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 DEPENDS += "ca-certificates-native"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "7a3fb05dfb49b144cb149b31cbc9d452975ddfcd"
+SRCREV = "0b159d3e832b8d7d9ab46cdfbeef870c48476efc"
 BRANCH = "master"
-INC_PR = "r32"
+INC_PR = "r33"
 
 
 # Pull in the base package for installing matrix applications
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
new file mode 100644
index 0000000..79c7202
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Keystone multi-core demo descriptions for Matrix v2"
+HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/mc_demo_apps"
+
+# Make sure demo submenu and app images has been installed.
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-mc-demo"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/apps/ \
+		${bindir}/mc_demo_imageproc.sh \
+		${bindir}/mc_run_dsp.sh \
+		${bindir}/mc_demo_ipc.sh \
+"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 250694d..240ff74 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.12"
+PR = "${INC_PR}.13"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -15,7 +15,7 @@ inherit allarch
 S = "${WORKDIR}/git"
 
 # List of submenus to build packages for
-SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu utilities_submenu"
+SUBMENUS = "arm_submenu 3d_submenu cryptos_submenu display_submenu ethernet_submenu multimedia_submenu power_submenu pru_submenu qt4_submenu settings_submenu usb_submenu wifi_submenu oprofile_submenu utilities_submenu mc_demo_submenu"
 
 do_install(){
     install -d ${D}${MATRIX_APP_DIR}
@@ -26,7 +26,7 @@ do_install(){
     done
 }
 
-PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera  ${PN}-utility"
+PACKAGES += "${PN}-arm ${PN}-3d ${PN}-cryptos ${PN}-display ${PN}-ethernet ${PN}-multimedia ${PN}-power ${PN}-pru ${PN}-qt4 ${PN}-qt5 ${PN}-settings ${PN}-usb ${PN}-wifi ${PN}-oprofile ${PN}-camera  ${PN}-utility ${PN}-mc-demo"
 
 # Make sure app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images"
@@ -48,3 +48,4 @@ FILES_${PN}-wifi = "${MATRIX_APP_DIR}/wifi_submenu/*"
 FILES_${PN}-oprofile = "${MATRIX_APP_DIR}/oprofile_submenu/*"
 FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
 FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
+FILES_${PN}-mc-demo = "${MATRIX_APP_DIR}/mc_demo_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
index 82a9fb8..36ed64f 100755
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
@@ -225,7 +225,7 @@ compress.filetype          = ("text/plain", "text/html","text/javascript","text/
 #                            )
 
 #### CGI module
-cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi")
+cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi", ".out" => "" )
 #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
 #                               ".cgi" => "/usr/bin/perl" )
 #
-- 
1.7.9.5


