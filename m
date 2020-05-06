Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EBE8E52A05
	for <meta-arago@arago-project.org>;
	Wed,  6 May 2020 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D109140C2E;
	Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ixUvvAU5_yPP; Wed,  6 May 2020 22:35:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD77740C2D;
	Wed,  6 May 2020 22:35:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 45E88172F71;
	Wed,  6 May 2020 18:35:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  6 May 2020 18:35:50 -0400
Message-Id: <1588804551-10982-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588804551-10982-1-git-send-email-denis@denix.org>
References: <1588804551-10982-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/4] FIXME: packagegroups, matrix: also disable barcode-roi & qt-opencv-opencl-opengl
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
X-List-Received-Date: Wed, 06 May 2020 22:38:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Due to breakage with OpenCV 4.1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb         | 13 +++++++------
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       |  9 +++++----
 .../recipes-core/packagegroups/ti-analytics.bb              | 13 +++++++------
 .../matrix/matrix-gui-machinevision-demos_2.0.bb            |  7 ++++---
 .../matrix/matrix-gui-video-analytics-demos_2.0.bb          |  2 +-
 5 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 5cc4fa0..081cc92 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -6,9 +6,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-BARCODE_PKG = " \
-    ${@['','barcode-roi-src'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-"
+BARCODE_PKG = ""
+#BARCODE_PKG = " \
+#    ${@['','barcode-roi-src'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#"
 
 MULTIMEDIA = ""
 
@@ -28,9 +29,9 @@ MULTIMEDIA_append_omap-a15 = " \
 
 MULTIMEDIA_append_am65xx = " ${BARCODE_PKG}"
 
-MULTIMEDIA_append_dra7xx = " \
-    ${@['','qt-opencv-opencl-opengl-multithreaded-src'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
-"
+#MULTIMEDIA_append_dra7xx = " \
+#    ${@['','qt-opencv-opencl-opengl-multithreaded-src'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
+#"
 
 MULTIMEDIA_append_keystone = " ${BARCODE_PKG}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 1119d16..abc916f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -6,16 +6,17 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-BARCODE_PKG = " \
-    ${@['','barcode-roi-dev'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-"
+BARCODE_PKG = ""
+#BARCODE_PKG = " \
+#    ${@['','barcode-roi-dev'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#"
 
 MULTIMEDIA = ""
 
+#    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
 MULTIMEDIA_append_dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
-    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index 7b227fb..b2d7d3c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -16,12 +16,13 @@ TENSORFLOW_DEMO = ""
 #    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #"
 
-ANALYTICS = " \
-    ${ARMNN_PACKAGES} \
-    ${TENSORFLOW_DEMO} \
-    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
-    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-"
+ANALYTICS = ""
+#ANALYTICS = " \
+#    ${ARMNN_PACKAGES} \
+#    ${TENSORFLOW_DEMO} \
+#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
+#    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#"
 ANALYTICS_keystone = ""
 ANALYTICS_j7 = ""
 ANALYTICS_omapl138 = ""
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 25b1158..193da65 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -11,9 +11,10 @@ S = "${WORKDIR}/git/machinevision_apps"
 # Make sure machinevision submenu and app images has been installed
 MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevision"
 
-BARCODE_RDEPENDS = " \
-    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
-"
+BARCODE_RDEPENDS = ""
+#BARCODE_RDEPENDS = " \
+#    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
index 79aabd5..4c90050 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
@@ -17,9 +17,9 @@ VIDEO_ANALYTICS_DEMO_RDEPENDS += " \
 PACKAGES = "matrix-video-analytics-opencv-opencl-opengl-demo \
 "
 
+#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
 RDEPENDS_matrix-video-analytics-opencv-opencl-opengl-demo = " \
     ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
-    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 "
 
 # Split the matrix files by demos
-- 
2.7.4


