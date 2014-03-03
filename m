Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C6B455208C
	for <meta-arago@arago-project.org>;
	Mon,  3 Mar 2014 20:01:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s23K1Zej003243
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 14:01:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s23K1ZXD006932
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 14:01:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 14:01:35 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s23K1ZX9029004;	Mon, 3 Mar 2014 14:01:35 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Mar 2014 15:01:33 -0500
Message-ID: <1393876893-10013-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-demos: Recipes for Matrix demos for keystone 2 platforms
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
X-List-Received-Date: Mon, 03 Mar 2014 20:01:37 -0000
Content-Type: text/plain

- Recipes bring images and menus needed for keystone2 demos

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../matrix/matrix-gui-apps-ks2-git.inc             |   13 +++++
 .../matrix/matrix-gui-apps-ks2-images_2.0.bb       |   19 ++++++++
 .../recipes-core/matrix/matrix-gui-apps-ks2.inc    |   51 ++++++++++++++++++++
 .../matrix/matrix-gui-demos-demos_2.0.bb           |   18 +++++++
 .../matrix/matrix-gui-submenus-ks2_2.0.bb          |   38 +++++++++++++++
 .../matrix/matrix-gui-utility-demos_2.0.bb         |   18 +++++++
 6 files changed, 157 insertions(+)
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2.inc
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-demos-demos_2.0.bb
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
new file mode 100755
index 0000000..4a7b21d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-git.inc
@@ -0,0 +1,13 @@
+LICENSE = "CC-BY-SA"
+#By default all Matrix v2 applications use the same license.
+LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
+
+BRANCH ?= "master"
+# commit corresponds to DEV.MATRIX.APPS.01.00.00.02
+SRCREV = "7af0ec5ad5ca9464a981b1c9683ec66bb075331d"
+SRC_URI = "git://git.ti.com/keystone-demos/matrix-apps.git;protocol=git;branch=${BRANCH}"
+INC_PR = "r0"
+
+# Pull in the base package for installing matrix applications
+require matrix-gui-apps-ks2.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb
new file mode 100644
index 0000000..cf69d81
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2-images_2.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Images package for Matrix GUI v2 Applications for Keystone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+LICENSE = "CC-BY-SA"
+
+require matrix-gui-apps-ks2-git.inc
+require matrix-gui-paths.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/images"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+    cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
+}
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2.inc
new file mode 100755
index 0000000..fb3c866
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-ks2.inc
@@ -0,0 +1,51 @@
+require matrix-gui-paths.inc
+
+MATRIX_FILES_DIR ?= "${S}"
+
+# Append a generic function to the do_install step that will look in the
+# MATRIX_FILES_DIR for .desktop files and then:
+#   1.  Install all non-script files into the MATRIX_APP_DIR
+#   2.  Install all script files into ${bindir}
+do_install_append(){
+    cd ${MATRIX_FILES_DIR}
+    applist=`find . -name "*.desktop"`
+
+    for app in $applist
+    do
+        appdir=`dirname $app`
+        install -d ${D}${MATRIX_APP_DIR}/$appdir
+
+        # Get the matrix metadata
+        matrix_desktop=`find $appdir -type f -name  "*.desktop"`
+        for m in $matrix_desktop
+        do
+            install -m 0644 ${MATRIX_FILES_DIR}/$m ${D}${MATRIX_APP_DIR}/$appdir/
+        done
+
+        matrix_html=`find $appdir -type f -name  "*.html"`
+        for m in $matrix_html
+        do
+            install -m 0644 ${MATRIX_FILES_DIR}/$m ${D}${MATRIX_APP_DIR}/$appdir/
+        done
+
+        # Get the script files as executables
+        scripts=`find $appdir -type f -name "*.sh"`
+        for s in $scripts
+        do
+            install -m 0755 ${MATRIX_FILES_DIR}/$s ${D}${MATRIX_APP_DIR}/$appdir/
+        done
+        
+        # Get the cgi files as executables
+        matrix_cgi=`find $appdir -type f -name "*.cgi"`
+
+        for c in $matrix_cgi
+        do
+            install -d ${D}${MATRIX_APP_DIR}/$appdir/cgi-bin
+            install -m 0755 ${MATRIX_FILES_DIR}/$c ${D}${MATRIX_APP_DIR}/$c
+        done    
+    done
+
+    # Go back to the directory we started from in case there are
+    # other appends.
+    cd -
+}
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-demos-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-demos-demos_2.0.bb
new file mode 100755
index 0000000..eb89cca
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-demos-demos_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Demo description for Matrix v2"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+LICENSE = "CC-BY-SA"
+
+require matrix-gui-apps-ks2-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/demo_apps"
+
+PACKAGES += "${PN}-demos"
+
+# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
+RDEPENDS_${PN} += "matrix-gui-apps-ks2-images matrix-gui-submenus-ks2-demos"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb
new file mode 100755
index 0000000..2936ad1
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus-ks2_2.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Submenu packages for Matrix GUI v2 for Keystone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+LICENSE = "CC-BY-SA"
+
+require matrix-gui-apps-ks2-git.inc
+require matrix-gui-paths.inc
+
+# This package does not use a subdirectory as ${S} so we need to
+# reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+
+PR = "${INC_PR}.0"
+
+# These packages make submenus in matrix and are not architecture specific
+inherit allarch
+
+S = "${WORKDIR}/git"
+
+# List of submenus to build packages for
+SUBMENUS = "utilities_submenu demos_submenu"
+
+do_install(){
+    install -d ${D}${MATRIX_APP_DIR}
+
+    for x in ${SUBMENUS}
+    do
+        cp -rf ${S}/$x ${D}${MATRIX_APP_DIR}/
+    done
+}
+
+PACKAGES += "${PN}-utility ${PN}-demos"
+
+# Make sure app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-ks2-images"
+
+# Add the files for each submenu package
+FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
+FILES_${PN}-demos = "${MATRIX_APP_DIR}/demos_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
new file mode 100755
index 0000000..8f769e9
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Utility app demo descriptions for Matrix v2"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/matrix-apps.git"
+LICENSE = "CC-BY-SA"
+
+require matrix-gui-apps-ks2-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/utility_apps"
+
+PACKAGES += "${PN}-utility"
+
+# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
+RDEPENDS_${PN} += "matrix-gui-apps-ks2-images matrix-gui-submenus-ks2-utility"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.9.5


