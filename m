Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 384B352AC1
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X00L3S8F4DMK0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:17 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D306326ABB; Fri,
	18 Jul 2014 14:52:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:52:01 -0400
Message-id: <1405709522-404-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 10/11] matrix-gui-apps: set more specific CC-BY-SA-3.0 license
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc          | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb    | 1 -
 .../recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb          | 1 -
 .../recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb              | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb         | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb   | 1 -
 .../recipes-core/matrix/matrix-gui-display-control_2.0.bb              | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb | 3 ++-
 .../recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb             | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb      | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb      | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb       | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb      | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb     | 1 -
 meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb     | 1 -
 19 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index e1c3023..b87b925 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "3D demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index c985859..1e18411 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -1,4 +1,4 @@
-LICENSE = "CC-BY-SA"
+LICENSE = "CC-BY-SA-3.0"
 #By default all Matrix v2 applications use the same license.
 LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
index 4d271c7..f422bc8 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Image package for Matrix GUI v2 Applications"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
index 484aafe..7aa185d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Arm Benchmarks Applications for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
index ae613fd..c105c6f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Camera loopback application for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index 5b80b90..5937c6d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Clock setting descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 92fc916..04b0825 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Cryptography demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
index a93c7b8..b3094b2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Display control descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
index 8a8459a..e716f78 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Ethernet example applications"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA & GPLv2+"
 
 require matrix-gui-apps-git.inc
 
+LICENSE = "CC-BY-SA-3.0 & GPLv2+"
+
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM} \
                      file://../../udhcpd_eth1.conf;beginline=1;endline=14;md5=70668b1ed5416406a61ef9abdd90d601 \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
index 55bed44..739e03f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Multimedia demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
index bc337ff..9630081 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Oprofile demo applications for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index a040deb..e174574 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Power management demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
index 3eb470c..0a09e33 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "PRU demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
index 6f6ad69..e0ff0ca 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Qt4 demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
index 6f51dba..faa64a3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Settings demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index d794277..cfbe124 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Submenu packages for Matrix GUI v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
index 0c58f17..6a1ecc8 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "USB demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
index b42c9f3..91d5d58 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "V4l2 demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
index 263ae91..0b1cec5 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Wifi demo descriptions for Matrix v2"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
-LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-- 
2.0.0


