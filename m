Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 043F2529D8
	for <meta-arago@arago-project.org>;
	Wed, 11 Jun 2014 14:00:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5BE0cPh030123
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 09:00:38 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BE0cPi012025
	for <meta-arago@arago-project.org>; Wed, 11 Jun 2014 09:00:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Jun 2014 09:00:38 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BE0YUf028627;
	Wed, 11 Jun 2014 09:00:36 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Jun 2014 09:00:31 -0500
Message-ID: <1402495232-30133-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] dual-camera-demo: Grab latest commit and update Matrix files installation
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
X-List-Received-Date: Wed, 11 Jun 2014 14:00:41 -0000
Content-Type: text/plain

* Also switch to using license file for checksum
* Use latest commit that adds double buffering for pip.
* Double buffering reduces tearing.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 1f9b941..d21a0e5 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Qt Dual Camera Demo"
 HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
 SECTION = "multimedia"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f888286927eac06928"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "master"
-SRCREV = "a877c704eba77fc09aec54211b387b95e62e523b"
+SRCREV = "255808485bfd9bebd7f13ecd48704b6cc9ae0d69"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
 
@@ -20,15 +20,15 @@ inherit qt-provider
 # use the make targets already created in the Makefile.build files
 do_install() {
     install -d ${D}/usr/bin
-    install -d ${D}${MATRIX_APP_DIR}/arm_multimedia_dual-camera
+    install -d ${D}${MATRIX_APP_DIR}/dual-camera
     install dual_camera ${D}/usr/bin/dual_camera
     install dual_camera.sh ${D}/usr/bin/dual_camera.sh
-    install matrix/* ${D}/${MATRIX_APP_DIR}/arm_multimedia_dual-camera
+    install matrix/* ${D}/${MATRIX_APP_DIR}/dual-camera
 }
 
 PACKAGES += "matrix-gui-apps-dual-camera"
 
-RDEPENDS_matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-multimedia ${PN}"
+RDEPENDS_matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-camera ${PN}"
 
 # Add the matrix directory to the FILES
 FILES_${PN} = "/usr/bin/*"
-- 
1.7.0.4


