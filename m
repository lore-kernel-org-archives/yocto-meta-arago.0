Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 16BE9529D1
	for <meta-arago@arago-project.org>;
	Fri, 10 Feb 2017 18:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFDAA20B2C;
	Fri, 10 Feb 2017 18:16:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e0jdeGYwoDin; Fri, 10 Feb 2017 18:16:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C5F232099C;
	Fri, 10 Feb 2017 18:16:40 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 043C316236E;
	Fri, 10 Feb 2017 13:16:40 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 10 Feb 2017 13:16:39 -0500
Message-Id: <1486750599-84841-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] HACK: FIXME: packagegroups: disable barcode-roi demo for now
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
X-List-Received-Date: Fri, 10 Feb 2017 18:16:42 -0000

It pulls in cmem, which is currently broken.

This reverts commit 3956718f52623c92b4a3a0a9b752c52c18db6aa6.
This reverts commit bede5f969b825df8c2368d8650c9d911c6c66198.
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb  | 19 +------------------
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb   |  9 +--------
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb |  8 +-------
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index f64a591..848492c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r63"
+PR = "r62"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -61,18 +61,6 @@ MATRIX_OPENCL_APPS_append_dra7xx = " \
     matrix-machinevision-demo-dlp3dscanner \
 "
 
-MATRIX_OPENCV_ARM_ONLY_APPS = " \
-     matrix-machinevision-demo-barcoderoi \
-"
-
-MATRIX_OPENCV_OPENCL_APPS = " \
-    matrix-machinevision-demo-barcoderoi-f2f \
-"
-
-MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
-     matrix-machinevision-demo-barcoderoi \
-"
-
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_ti33x = "        \
@@ -88,8 +76,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-pm-demos-governor    \
                                     \
     matrix-gui-ethernet-demos       \
-                                    \
-    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -105,8 +91,6 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
-                                    \
-    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -142,5 +126,4 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_APPS}        \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCL_APPS}",'',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index cded1aa..9bb62fc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,19 +11,12 @@ MULTIMEDIA = ""
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo-src \
     image-gallery-src \
-    barcode-roi-src \
 "
 
-MULTIMEDIA_append_ti33x = " barcode-roi-src"
-
-MULTIMEDIA_append_omap-a15 = " barcode-roi-src"
-
 MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
 "
 
-MULTIMEDIA_append_keystone = " barcode-roi-src"
-
 #Demo doesn't work on 3.14
 # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 3c72bf0..e77f66d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -14,12 +14,6 @@ MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
-MULTIMEDIA_append_ti33x = " barcode-roi-dev"
-MULTIMEDIA_append_ti43x = " barcode-roi-dev"
-MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
-
-MULTIMEDIA_append_keystone = " barcode-roi-dev"
-
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
-- 
2.7.4


