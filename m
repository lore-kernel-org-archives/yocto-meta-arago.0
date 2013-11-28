Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DFBF0529E3
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:40:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBeUK1003928
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBeThv018005
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:40:29 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBeS3u031860;	Thu, 28 Nov 2013 05:40:29 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:38:38 +0200
Message-ID: <1385638718-12093-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 12/14] arago-tisdk-connectivity: Restored connectivity modules compilation
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
X-List-Received-Date: Thu, 28 Nov 2013 11:40:31 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Modules compatibility issues with libnl were fixed.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 0aa019d..2ef4353 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -23,14 +23,11 @@ WLAN_COMMON = "\
     pulseaudio-module-bluetooth-device \
     eventdump \
     ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
+    wpa-supplicant-wl18xx \
+    crda \
+    hostap-daemon-wl18xx \
+    ti-wifi-utils-wl18xx \
 "
-
-# TI/ECS versions of wpa-supplicant/crda/hostap/wifi-utils require older libnl,
-# which no longer exists
-#    wpa-supplicant
-#    crda
-#    hostap-daemon
-#    ti-wifi-utils
 # No bluetooth/bluetooth.h
 #    oppserver
 
@@ -44,7 +41,7 @@ WLAN_COMMON = "\
 FIRMWARE_AND_DRIVERS = "\
     bt-firmware \
     bt-enable \
-    wl12xx-firmware \
+    wl18xx-firmware \
 "
 
 BLUETOOTH_STACK = "\
-- 
1.7.9


