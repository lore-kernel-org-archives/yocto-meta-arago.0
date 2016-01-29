Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0740752A2A
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFANnr001741
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFANke019094
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMKa028688;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgo-0001od-Lc; Fri, 29 Jan 2016 10:10:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:16 -0500
Message-ID: <1454080219-6927-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
References: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] matrix-gui-video-analytics-demos: Add demo and submenu
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:24 -0000
Content-Type: text/plain

* This matrix demo enables access to the
  qt-opencv-opencl-opengl-multithreaded application

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |  5 +++-
 .../matrix/matrix-gui-video-analytics-demos_2.0.bb | 29 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 132b81a..6fdaccd 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.14"
+PR = "${INC_PR}.15"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -31,6 +31,7 @@ SUBMENUS = " arm_submenu \
              utilities_submenu \
              mc_demo_submenu \
              opencl_submenu \
+             videoanalytics_submenu \
 "
 
 do_install(){
@@ -60,6 +61,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-utility \
               ${PN}-mc-demo \
               ${PN}-opencl \
+              ${PN}-videoanalytics \
 "
 
 # Make sure app images has been installed
@@ -84,3 +86,4 @@ FILES_${PN}-camera = "${MATRIX_APP_DIR}/camera_submenu/*"
 FILES_${PN}-utility = "${MATRIX_APP_DIR}/utilities_submenu/*"
 FILES_${PN}-mc-demo = "${MATRIX_APP_DIR}/mc_demo_submenu/*"
 FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
+FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
new file mode 100644
index 0000000..54b70dd
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Video Analytics demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/videoanalytics_apps"
+
+# Make sure video analytics submenu and app images has been installed
+VIDEO_ANALYTICS_DEMO_RDEPENDS += " \
+    matrix-gui-apps-images \
+    matrix-gui-submenus-videoanalytics \
+"
+
+PACKAGES = "matrix-video-analytics-opencv-opencl-opengl-demo \
+"
+
+RDEPENDS_matrix-video-analytics-opencv-opencl-opengl-demo = " \
+    ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
+    qt-opencv-opencl-opengl-multithreaded \
+"
+
+# Split the matrix files by demos
+FILES_matrix-video-analytics-opencv-opencl-opengl-demo = " \
+    ${MATRIX_APP_DIR}/videoanalytics_opencv_opencl_opengl_demo/* \
+"
-- 
1.9.1


