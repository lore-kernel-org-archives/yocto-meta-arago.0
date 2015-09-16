Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9A0C6529FA
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 18:45:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GIjKlV000783
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 13:45:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GIjKvZ029564
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 13:45:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 13:45:20 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GIjKln002559;
	Wed, 16 Sep 2015 13:45:20 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcHhn-0000BE-L7; Wed, 16 Sep 2015 14:45:19 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Sep 2015 14:45:17 -0400
Message-ID: <1442429117-656-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dual-camera-demo: Bump SRCREV
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
X-List-Received-Date: Wed, 16 Sep 2015 18:45:22 -0000
Content-Type: text/plain

* Fix for when only a single camera is available

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index bdbff3f..015a99c 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r10"
+PR = "r11"
 
 BRANCH = "drm"
-SRCREV = "6f2d9cb970e8b3248fa4a3cf458892380f538f98"
+SRCREV = "2e703d50f9f34391b3912b666a68b43a58d7ef28"
 
 SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
-- 
1.9.1


