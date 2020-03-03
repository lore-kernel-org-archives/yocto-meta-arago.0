Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 321775298B
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2020 23:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 45D1440C2C;
	Tue,  3 Mar 2020 23:41:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pfUA8jK-vn-V; Tue,  3 Mar 2020 23:41:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1FAA0409F0;
	Tue,  3 Mar 2020 23:41:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 711F916BA7B;
	Tue,  3 Mar 2020 18:41:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  3 Mar 2020 18:41:09 -0500
Message-Id: <1583278869-39993-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] matrix: remove all references to outdated gitorious.org homepage
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
X-List-Received-Date: Tue, 03 Mar 2020 23:43:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Couple entries are correct, but HOMEPAGE field is unnecessary anyway.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb         | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb  | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb      | 1 -
 .../recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb            | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb    | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb          | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb  | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb           | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb     | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb  | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb   | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb        | 1 -
 .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb            | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb         | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb     | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb   | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb         | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb        | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb        | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb        | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb   | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb         | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb      | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb        | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb    | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb       | 1 -
 .../recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb          | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb                  | 1 -
 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb              | 1 -
 34 files changed, 34 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 0d4d867..3f4cf80 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "3D demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
index c77a665..61cc908 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Analytics demo descriptions for Matrix v2"
-HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
index f422bc8..a1c46ca 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Image package for Matrix GUI v2 Applications"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
index ba587df..bdb446d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Arm Benchmarks Applications for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
index 482991f..745a477 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Various Demo Browsers for Matrix v2"
-HOMEPAGE = "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 9c99b46..44f66d0 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Simple Qt web display using webengine"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=75a9adc782a6df0d3a5419743e9a9f18"
 SECTION = "multimedia"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
index c105c6f..835ba9e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Camera loopback application for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index 5937c6d..1b2c47e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Clock setting descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 5ed3705..7029df5 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Cryptography demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
index b3094b2..5dee50b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Display control descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
index e716f78..4949775 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Ethernet example applications"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
index 2f2ed54..d9c6adb 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Power management helper scripts"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
index 9f96be1..295db8c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Demo helper scripts for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index 2ffb3d1..9d9cc89 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "HMI demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 091f8ee..51810b4 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Machine vision demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
index 8a74335..340c514 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Keystone multi-core demo descriptions for Matrix v2"
-HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 07240f2..701dd20 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Multimedia demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
index b645d89..aba9214 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "OpenCL demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
index 85baf9c..6411c45 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Oprofile demo applications for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index f0fad03..0116f5e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Power management demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
index 0a09e33..e95409d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "PRU demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
index e0ff0ca..081bde7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Qt4 demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index cdc9824..f9b1e8f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Qt5 demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
index a84e5c1..80f5a1f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Settings demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 082f3a2..dce4021 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Submenu packages for Matrix GUI v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index 37d730e..e8ad27e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Deep learning vision demo descriptions for Matrix v2"
-HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
index 49b85ed..99fd395 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Touch demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
index 506a884..404b037 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "USB demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
index 2c4890d..83e10ba 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Keystone utility app demo descriptions for Matrix v2"
-HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
index 91d5d58..1dd0d95 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "V4l2 demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
index 54b70dd..b979168 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Video Analytics demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
index 0b1cec5..b5060ac 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Wifi demo descriptions for Matrix v2"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 82f9d07..c5e35ad 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Matrix GUI Application launcher"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix-gui-v2/"
 
 LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 90f6ac5..9e214f4 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Simple Application to force a screen refresh"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=75a9adc782a6df0d3a5419743e9a9f18"
 SECTION = "multimedia"
-- 
2.7.4


