Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ADBC4529CF
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 19:19:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PJJNti007225
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:19:23 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PJJM97004434
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:19:23 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 13:19:22 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1PJJMwd023388	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 13:19:22 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 Feb 2016 14:18:59 -0500
Message-ID: <1456427939-8796-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Re-enable dual camera demo on AM4
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
X-List-Received-Date: Thu, 25 Feb 2016 19:19:23 -0000
Content-Type: text/plain

The dual camera demo stopped working when Wayland/DRM-based graphics support
was introduced on AM4 and therefore this demo was disabled. This demo does not
work with Wayland/DRM-based graphics system because it invokes DRM APIs to
demonstrate DRM mode setings and overlay operations and those operations
are denied because there should be only one DRM master.

The simple solution is to update the demo script to run this QT5-based demo
program over linuxfb platform and therefore there is not another DRM master
running.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh         | 9 +++++----
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb  | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
index 9bf560b..151b13b 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
@@ -1,12 +1,13 @@
 #!/bin/bash
 
-/etc/init.d/matrix-gui-2.0 stop
+/etc/init.d/weston stop
+sleep 1
 
 echo 0 > /sys/class/graphics/fbcon/cursor_blink
 
-dual_camera
+dual_camera -platform linuxfb
 
 echo 1 > /sys/class/graphics/fbcon/cursor_blink
 
-/etc/init.d/matrix-gui-2.0 start
-
+/etc/init.d/weston start
+sleep 1
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 43bf00d..1b1a146 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r12"
+PR = "r13"
 
 BRANCH = "drm"
 SRCREV = "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
-- 
1.9.1


