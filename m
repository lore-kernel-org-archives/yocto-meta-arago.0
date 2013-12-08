Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BE9A252ABC
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2013 08:20:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB88KQMG025173
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:26 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB88KQxf011476
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2013 02:20:26 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 8 Dec 2013 02:20:26 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB88KJt6009163;	Sun, 8 Dec 2013 02:20:25 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 8 Dec 2013 10:18:15 +0200
Message-ID: <1386490696-16318-7-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386490696-16318-1-git-send-email-yanivma@ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] arago-tisdk-connectivity: Restored connectivity modules compilation
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
X-List-Received-Date: Sun, 08 Dec 2013 08:20:28 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Modules compatibility issues with libnl were fixed.
- Removed unused components

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 0aa019d..d7d2ef2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 inherit packagegroup
 
@@ -23,16 +23,12 @@ WLAN_COMMON = "\
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
-#    oppserver
 
 # netperf has non-standard license, needs verifying
 #    netperf
@@ -42,8 +38,7 @@ WLAN_COMMON = "\
 #    ti-compat-bluetooth
 
 FIRMWARE_AND_DRIVERS = "\
-    bt-firmware \
-    bt-enable \
+    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver bt-firmware bt-enable' , '',d)}"\
     wl12xx-firmware \
 "
 
-- 
1.7.9


