Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 37A9352A49
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7164E40BF6;
	Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cgvb6Wi45u5D; Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 59E8340C14;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BA37F17421A;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:31 -0400
Message-Id: <1568302717-46518-27-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 26/32] barcode-roi, packagegroups, matrix: require "dsp" machine feature
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:10 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb          | 12 +++++++-----
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb        | 12 +++++++-----
 .../recipes-apps/barcode-demo/barcode-roi_git.bb             |  4 ++++
 .../matrix/matrix-gui-machinevision-demos_2.0.bb             |  6 ++++--
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 2ab9dc7..45a0d23 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -6,29 +6,31 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+BARCODE_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'barcode-roi-src', '', d)}"
+
 MULTIMEDIA = ""
 
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo-src \
     image-gallery-src \
-    barcode-roi-src \
+    ${BARCODE_PKG} \
 "
 
-MULTIMEDIA_append_ti33x = " barcode-roi-src"
+MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
 
-MULTIMEDIA_append_am65xx = " barcode-roi-src"
+MULTIMEDIA_append_am65xx = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_omap-a15 = " \
     dual-camera-demo-src \
     image-gallery-src \
-    barcode-roi-src \
+    ${BARCODE_PKG} \
 "
 
 MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
 "
 
-MULTIMEDIA_append_keystone = " barcode-roi-src"
+MULTIMEDIA_append_keystone = " ${BARCODE_PKG}"
 
 #Demo doesn't work on 3.14
 # ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 50842ba..72d7740 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -6,6 +6,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+BARCODE_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'barcode-roi-dev', '', d)}"
+
 MULTIMEDIA = ""
 
 MULTIMEDIA_append_dra7xx = " \
@@ -14,15 +16,15 @@ MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
-MULTIMEDIA_append_ti33x = " barcode-roi-dev"
-MULTIMEDIA_append_ti43x = " barcode-roi-dev"
-MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
-MULTIMEDIA_append_am65xx = " barcode-roi-dev"
+MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
+MULTIMEDIA_append_ti43x = " ${BARCODE_PKG}"
+MULTIMEDIA_append_omap-a15 = " ${BARCODE_PKG}"
+MULTIMEDIA_append_am65xx = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
-    barcode-roi-dev \
+    ${BARCODE_PKG} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index d828ef7..051b83d 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -2,6 +2,10 @@ DESCRIPTION = "Barcode demo to detect region of interest"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://detect_barcode.cpp;beginline=1;endline=25;md5=babab64d39715b3671dd16bcb4f4917b"
 
+inherit machine_features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+
 DEPENDS += "opencv"
 
 PV = "01.00.00"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index cadfefa..091f8ee 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git/machinevision_apps"
 # Make sure machinevision submenu and app images has been installed
 MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevision"
 
+BARCODE_RDEPENDS = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'barcode-roi', '', d)}"
+
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
@@ -30,12 +32,12 @@ RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
 
 RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
     ${MACHINEVISION_RDEPENDS} \
-    barcode-roi \
+    ${BARCODE_RDEPENDS} \
 "
 
 RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f = " \
     ${MACHINEVISION_RDEPENDS} \
-    barcode-roi \
+    ${BARCODE_RDEPENDS} \
 "
 
 RDEPENDS_matrix-machinevision-demo-simplepeopletracking = " \
-- 
2.7.4


