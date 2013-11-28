Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1F1A65296F
	for <meta-arago@arago-project.org>;
	Thu, 28 Nov 2013 11:40:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rASBeJAV010729
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rASBeJTw009395
	for <meta-arago@arago-project.org>; Thu, 28 Nov 2013 05:40:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Nov 2013 05:40:18 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rASBeIBh021592;	Thu, 28 Nov 2013 05:40:18 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Nov 2013 13:38:28 +0200
Message-ID: <1385638708-12051-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 11/14] arago-prefs: update default value for am335x for WILINK-8
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
X-List-Received-Date: Thu, 28 Nov 2013 11:40:20 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Also change the default supported WILINK version

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 24f3785..5c20a0f 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -92,7 +92,9 @@ PREFERRED_VERSION_bluez-hcidump = "2.2"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
 
-WILINK_VERSION = "WILINK-6"
+WILINK_VERSION = "WILINK-8"
+# For AM335x Wilink 8 is now the default version to be used
+WILINK_VERSION_ti33x = "WILINK-8"
 PREFERRED_PROVIDER_wl12xx-firmware = "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-firmware',d)}"
 PREFERRED_PROVIDER_ti-compat-wireless-wl12xx = "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-wl18xx','ti-compat-wireless-wl12xx',d)}"
 PREFERRED_PROVIDER_hostap-daemon = "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-wl18xx','hostap-daemon',d)}"
-- 
1.7.9


