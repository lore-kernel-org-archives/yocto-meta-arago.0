Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id EC3EB52A50
	for <meta-arago@arago-project.org>;
	Thu, 11 Aug 2016 13:02:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7BD26Qo017540
	for <meta-arago@arago-project.org>; Thu, 11 Aug 2016 08:02:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7BD26sR031039
	for <meta-arago@arago-project.org>; Thu, 11 Aug 2016 08:02:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 11 Aug 2016 08:02:05 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7BD25p0001363	for <meta-arago@arago-project.org>;
	Thu, 11 Aug 2016 08:02:06 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Aug 2016 09:02:01 -0400
Message-ID: <1470920521-45858-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dual-camera-demo: Restore dual_camera_qt.sh per DRM atomic mode change
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
X-List-Received-Date: Thu, 11 Aug 2016 13:02:08 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
index 5774a06..4802337 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
@@ -5,7 +5,7 @@ sleep 1
 
 echo 0 > /sys/class/graphics/fbcon/cursor_blink
 
-dual_camera 1 -platform linuxfb
+dual_camera -platform linuxfb
 
 echo 1 > /sys/class/graphics/fbcon/cursor_blink
 
-- 
1.9.1


