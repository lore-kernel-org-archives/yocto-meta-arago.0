Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7850FC54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 23:17:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.31897.1674602257502831867
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 15:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jR+DCqp9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30ONHa2c090474
	for <meta-arago@lists.yoctoproject.org>; Tue, 24 Jan 2023 17:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674602256;
	bh=eMBVcg6IsLeWWHJJOHtI9ZrPAAG8UW+I8eE6XYyy+Ps=;
	h=From:To:CC:Subject:Date;
	b=jR+DCqp9bMZk7I16mdMI0adM00w4Cp9FUKvre4S0xVU6UfV12xqtaUJ+WfNCPV8hU
	 R0+MHUJVSMExYZlV33EIk5FvJjixS2COda7DnEv++oPdE6IL+XcoSFW12vXa82Xoq5
	 FSg2uY9Qc03NTFcL4S8/ajtwOQhA2j0LKRKmnG8s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30ONHaNK092807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 24 Jan 2023 17:17:36 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 17:17:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 17:17:35 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30ONHale038418;
	Tue, 24 Jan 2023 17:17:36 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [PATCH] all: Remove excessive switches based on gpu
Date: Tue, 24 Jan 2023 17:17:33 -0600
Message-ID: <20230124231733.2219206-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Jan 2023 23:17:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14183

Everything that previously switched using the GPU machine feature should
instead switch based on the opengl distro feature to allow for software
rendering.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This is the part of my previous graphics overhaul patch that's not
dependent on my changes to meta-ti. Should be able to merge this without
any issue while I'm working on the other stuff.

Relates-to: LCPD-27817

 .../recipes-core/images/tisdk-core-bundle.inc        |  4 ++--
 .../recipes-core/images/tisdk-default-image.bb       | 12 +++++-------
 .../recipes-core/images/tisdk-thinlinux-image.bb     |  4 +---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb    |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb |  2 +-
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb  |  4 +---
 .../packagegroup-arago-tisdk-graphics.bb             |  4 +---
 .../packagegroup-arago-tisdk-gtk-sdk-target.bb       |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb    |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-hmi.bb    |  4 +---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb | 10 +++++-----
 ...packagegroup-arago-tisdk-multimedia-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-multimedia.bb           |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bb    |  4 +---
 .../packagegroup-arago-toolchain-tisdk-target.bb     |  6 +++---
 .../recipes-core/packagegroups/ti-analytics.bb       |  2 +-
 .../recipes-core/packagegroups/ti-demos.bb           |  2 +-
 .../recipes-core/packagegroups/ti-world.bb           | 10 +++++-----
 .../recipes-graphics/cairo/cairo_%.bbappend          |  3 ---
 .../gstreamer/gstreamer1.0-plugins-%.bbappend        |  6 ------
 .../matrix/matrix-gui-machinevision-demos_2.0.bb     |  2 +-
 .../matrix/matrix-gui-video-analytics-demos_2.0.bb   |  2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb            |  2 +-
 23 files changed, 37 insertions(+), 62 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 9da4b0d0..c7bd9629 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -31,8 +31,8 @@ DTB_FILTER:j721s2 = "j721s2"
 # List of target side images to build for the SDK
 TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
 
-TISDK_TOOLCHAIN = "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
-TOOLCHAIN_SUFFIX = "${@bb.utils.contains('MACHINE_FEATURES','gpu','-tisdk','-tisdk-server',d)}"
+TISDK_TOOLCHAIN = "${@bb.utils.contains('DISTRO_FEATURES','opengl','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
+TOOLCHAIN_SUFFIX = "${@bb.utils.contains('DISTRO_FEATURES','opengl','-tisdk','-tisdk-server',d)}"
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-amsdk-sdk-host \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 8cd10429..ffe78ec9 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,16 +5,14 @@ DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
 
 require arago-image.inc
 
-SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
-
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ti-test \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte','',d)} \
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
@@ -24,7 +22,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ti-analytics \
     ti-demos \
 "
@@ -51,7 +49,7 @@ EXTRABROWSERS = " \
 "
 
 PYTHON2APPS = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 8827ac16..1574fca3 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -5,8 +5,6 @@ DESCRIPTION = "Minimal bootable image with container to start the next\
 
 require arago-image.inc
 
-SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
-
 # Allow users to tack on additional packages as interesting.
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?= ""
 
@@ -14,7 +12,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     docker \
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b6fe62ab..0cd1b540 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -32,7 +32,7 @@ EXTRA_LIBS:append:dra7xx = " libulm-dev \
 "
 
 PDM_ANOMALY_PKG_DEV = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection-dev', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection-dev', '', d)} \
 "
 
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 07ae8b07..cb972078 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -66,7 +66,7 @@ UTILS:append:omapl138 = " ti-ipc-rtos-fw"
 
 UTILS:append:dra7xx = " \
                         ${UTILS_DSP} \
-                        ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-example-apps','',d)} \
+                        ${@bb.utils.contains('DISTRO_FEATURES','opengl','glsdk-example-apps','',d)} \
 "
 
 EXTRA_PACKAGES = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 093b2d3f..acb06558 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -4,9 +4,7 @@ PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 RDEPENDS:${PN} = "\
     libegl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 1d450600..381fa950 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -4,9 +4,7 @@ PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 GFX_WAYLAND = "\
     weston-init \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index 0bf3530d..030583e3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -4,9 +4,7 @@ PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 RDEPENDS:${PN} = "\
     gtk+3-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index 59b0461d..c2208380 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -4,9 +4,7 @@ PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 RDEPENDS:${PN} = "\
     gtk+3 \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index e16727c4..a8261bf2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -4,9 +4,7 @@ PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 HMI = " \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 3d9ebdf3..25b7fccd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -65,7 +65,7 @@ MATRIX_QT_APPS:append:ti43x = " \
 "
 
 MATRIX_TOUCH_APPS = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demos','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','matrix-gui-touch-demos','',d)} \
 "
 
 MATRIX_GPU_DEMOS = " \
@@ -151,7 +151,7 @@ MATRIX_APPS:append:omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
 "
 
-#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
+#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('DISTRO_FEATURES','opengl',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
 #                                \
 #
 
@@ -184,9 +184,9 @@ RDEPENDS:${PN} = "        \
     ${MATRIX_APPS}        \
     ${MATRIX_COMMON_APPS} \
     ${@bb.utils.contains('MACHINE_FEATURES','touchscreen',"${MATRIX_TOUCH_APPS}",'',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_QT_APPS}",'',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GPU_DEMOS}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GUI}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_QT_APPS}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GPU_DEMOS}",'',d)} \
     ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 62bcc0ea..8baab290 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -13,7 +13,7 @@ BARCODE_PKG = ""
 
 MULTIMEDIA = ""
 
-#    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
+#    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]}
 MULTIMEDIA:append:dra7xx = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 9d6767b0..d06fbb6f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -12,8 +12,8 @@ MULTIMEDIA = " \
 
 MULTIMEDIA:omapl138 = ""
 
-DUAL_CAMERA_DEMO = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'dual-camera-demo', '', d)}"
-IMAGE_GALLERY_DEMO = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'image-gallery', '', d)}"
+DUAL_CAMERA_DEMO = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dual-camera-demo', '', d)}"
+IMAGE_GALLERY_DEMO = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'image-gallery', '', d)}"
 
 MULTIMEDIA:append:ti43x = " \
     ${DUAL_CAMERA_DEMO} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 60d6e63c..a133e7e7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -4,9 +4,7 @@ PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup features_check
-
-REQUIRED_MACHINE_FEATURES = "gpu"
+inherit packagegroup
 
 #    qtdeclarative-examples
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index c64e1727..cdf54ecc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -18,11 +18,11 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 = ""
 
 RDEPENDS:${PN} = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-qte-toolchain-target','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-qte-toolchain-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics-sdk-target','',d)} \
     ${@['','packagegroup-arago-tisdk-opencl-sdk-target'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index e16e4d51..4c686c00 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -16,7 +16,7 @@ TENSORFLOW_DEMO = ""
 ANALYTICS = ""
 #ANALYTICS = " \
 #    ${TENSORFLOW_DEMO} \
-#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
+#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #"
 ANALYTICS:j7 = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 3fbf4199..7bccb4de 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-PDM_ANOMALY_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection', '', d)}"
+PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
 
 PDM_ANOMALY = ""
 PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 323d88ae..ec22d72e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -22,7 +22,7 @@ EXTRABROWSERS = " \
 "
 
 PYTHON2APPS = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
 
@@ -43,9 +43,9 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ti-test \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
     ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
@@ -55,7 +55,7 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
deleted file mode 100644
index 1de9aebb..00000000
--- a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append = ".arago1"
-
-PACKAGECONFIG:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
deleted file mode 100644
index 4a4986c3..00000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
-PACKAGECONFIG:remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR:append = ".0"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 16482003..6cb9ba6d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -29,7 +29,7 @@ RDEPENDS:matrix-machinevision-demo-dlp3dscanner = " \
 "
 
 RDEPENDS:matrix-machinevision-demo-dlp3dscanner:append:dra7xx = " \
-    ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d)]} \
+    ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d)]} \
 "
 
 RDEPENDS:matrix-machinevision-demo-barcoderoi = " \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
index d0cf5233..73fc4661 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
@@ -17,7 +17,7 @@ VIDEO_ANALYTICS_DEMO_RDEPENDS += " \
 PACKAGES = "matrix-video-analytics-opencv-opencl-opengl-demo \
 "
 
-#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
+#    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]}
 RDEPENDS:matrix-video-analytics-opencv-opencl-opengl-demo = " \
     ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 047e9dbd..b22f1151 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -58,7 +58,7 @@ do_install(){
 	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
 }
 
-GUIDEPS = "${@bb.utils.contains('MACHINE_FEATURES','gpu',"matrix-gui-browser refresh-screen",'',d)}"
+GUIDEPS = "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui-browser refresh-screen",'',d)}"
 
 RDEPENDS:${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.34.1


