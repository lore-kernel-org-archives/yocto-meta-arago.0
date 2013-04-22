Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 85E4F52A3E
	for <meta-arago@arago-project.org>;
	Mon, 22 Apr 2013 17:27:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MHRLdW021143
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MHRLgx030172
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:21 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 12:27:21 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MHRGHB016775;
	Mon, 22 Apr 2013 12:27:20 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Apr 2013 12:27:11 -0500
Message-ID: <1366651633-27986-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366651633-27986-1-git-send-email-fcooper@ti.com>
References: <1366651633-27986-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] recipes: Split Matrix multimedia demos
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
X-List-Received-Date: Mon, 22 Apr 2013 17:27:22 -0000
Content-Type: text/plain

* Split multimedia demos into separate packages to allow machines to only include demos that
  they need.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |   20 ++++++++++--
 .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   32 ++++++++++++++++++-
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 348f48e..2d88723 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 inherit packagegroup
 
@@ -43,13 +43,20 @@ MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
     ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-    matrix-gui-multimedia-demos     \
+    matrix-multimedia-demo-aac \
+    matrix-multimedia-demo-h264dec      \
+    matrix-multimedia-demo-mpeg4aacdec   \
+    matrix-multimedia-demo-mpeg4dec     \
 "
 
 MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
     ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
-    matrix-gui-multimedia-demos     \
+    matrix-multimedia-demo-aac \
+    matrix-multimedia-demo-audiocapture \
+    matrix-multimedia-demo-h264dec      \
+    matrix-multimedia-demo-mpeg4aacdec   \
+    matrix-multimedia-demo-mpeg4dec     \
                                     \
     matrix-gui-clocks-275mhz        \
     matrix-gui-clocks-500mhz        \
@@ -66,7 +73,10 @@ MATRIX_APPS_append_ti33x = "        \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
-    matrix-gui-multimedia-demos     \
+    matrix-multimedia-demo-aac      \
+    matrix-multimedia-demo-h264dec  \
+    matrix-multimedia-demo-mpeg4aacdec \
+    matrix-multimedia-demo-mpeg4dec \
 "
 
 MATRIX_APPS_append_beagleboard = "  \
@@ -99,6 +109,8 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
     matrix-gui-wifi-battleship-demo \
+                                    \
+    matrix-multimedia-demo-audiocapture \
 "
 
 MATRIX_APPS_append_am180x-evm = "   \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 419e71f..55bed44 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -4,13 +4,41 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
 S = "${WORKDIR}/git/multimedia_apps"
 
 # Make sure multimedia submenu and app images has been installed
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-multimedia amsdk-av-files"
+MULTIMEDIA_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-multimedia amsdk-av-files"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+PACKAGES = "matrix-multimedia-demo-aac \
+            matrix-multimedia-demo-audiocapture \
+            matrix-multimedia-demo-h264dec      \
+            matrix-multimedia-demo-mpeg4aacdec   \
+            matrix-multimedia-demo-mpeg4dec     \
+"
+
+RDEPENDS_matrix-multimedia-demo-aac = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-audiocapture = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-h264dec      = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-mpeg4aacdec   = "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS_matrix-multimedia-demo-mpeg4dec     = "${MULTIMEDIA_RDEPENDS}"
+
+
+# Split the matrix files by multimedia demos
+FILES_matrix-multimedia-demo-aac = "${MATRIX_APP_DIR}/arm_multimedia_aacdec/*"
+FILES_matrix-multimedia-demo-audiocapture = "${MATRIX_APP_DIR}/arm_multimedia_audiocapture/*"
+FILES_matrix-multimedia-demo-h264dec      = "${MATRIX_APP_DIR}/arm_multimedia_h264dec/*"
+FILES_matrix-multimedia-demo-mpeg4aacdec   = "${MATRIX_APP_DIR}/arm_multimedia_mpeg4aacdec/*"
+FILES_matrix-multimedia-demo-mpeg4dec     = "${MATRIX_APP_DIR}/arm_multimedia_mpeg4dec/*"
+
+# Split the ${bindir} files by multimedia demos
+FILES_matrix-multimedia-demo-aac += "${bindir}/runAACDec.sh"
+FILES_matrix-multimedia-demo-audiocapture += "${bindir}/runAudioCapture.sh"
+FILES_matrix-multimedia-demo-h264dec      += "${bindir}/runH264Dec.sh"
+FILES_matrix-multimedia-demo-mpeg4aacdec   += "${bindir}/runMpeg4AacDec.sh"
+FILES_matrix-multimedia-demo-mpeg4dec     += "${bindir}/runMpeg4Dec.sh"
-- 
1.7.0.4


