Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 42836529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 04:50:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s164nxth030230
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 22:49:59 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s164nx9r007201
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 22:49:59 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 22:49:59 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s164nuYe020376;
	Wed, 5 Feb 2014 22:49:57 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 00:18:43 -0600
Message-ID: <1391667523-6450-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2] dual-camera-demo: Pull in latest commits of camera demo
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 04:50:00 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Switched from AUTOREV to the latest commit
Update do_install to reflect makefile changes.

 .../dual-camera-demo/dual-camera-demo_1.0.bb       |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 12f42e5..4e33d9d 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f88
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "af299a206482562ceae8aa690a8b6644a3e0a66e"
+SRCREV = "ee954e04b3efe160b3fabf5a8d640740ce1a7e85"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
 
@@ -19,7 +19,11 @@ inherit qt-provider
 
 # use the make targets already created in the Makefile.build files
 do_install() {
-    cd ${S} && make -f Makefile.build DESTDIR=${D} install_common
+    install -d ${D}/usr/bin
+    install -d ${D}${MATRIX_APP_DIR}/arm_multimedia_dual-camera
+    install dual_camera ${D}/usr/bin/dual_camera
+    install dual_camera.sh ${D}/usr/bin/dual_camera.sh
+    install matrix/* ${D}/${MATRIX_APP_DIR}/arm_multimedia_dual-camera
 }
 
 PACKAGES += "matrix-gui-apps-dual-camera"
-- 
1.7.0.4


