Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 342E852972
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 14:11:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2EB30M028582
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 08:11:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2EB3W8022819
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 08:11:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Dec 2013 08:11:02 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB2EB1KK008899;	Mon, 2 Dec 2013 08:11:02 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Dec 2013 16:09:07 +0200
Message-ID: <1385993347-3223-1-git-send-email-yanivma@ti.com>
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
X-List-Received-Date: Mon, 02 Dec 2013 14:11:04 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Modules compatibility issues with libnl were fixed.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 0aa019d..c159b9d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 inherit packagegroup
 
@@ -23,14 +23,11 @@ WLAN_COMMON = "\
     pulseaudio-module-bluetooth-device \
     eventdump \
     ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
+    wpa-supplicant \
+    crda \
+    hostap-daemon \
+    ti-wifi-utils \
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
 
@@ -42,8 +39,7 @@ WLAN_COMMON = "\
 #    ti-compat-bluetooth
 
 FIRMWARE_AND_DRIVERS = "\
-    bt-firmware \
-    bt-enable \
+    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver bt-firmware bt-enable' , '',d)}"
     wl12xx-firmware \
 "
 
-- 
1.7.9


