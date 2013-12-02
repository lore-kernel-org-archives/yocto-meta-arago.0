Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 909FC52986
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 20:14:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2KEGYP011063
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 14:14:16 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2KEGfe004181
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 14:14:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Dec 2013 14:14:16 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	rB2KEFS4018052;	Mon, 2 Dec 2013 14:14:16 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Dec 2013 22:12:19 +0200
Message-ID: <1386015139-4852-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 11/14 v3] arago-prefs: update default value for am335x and am43x for WILINK-8
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
X-List-Received-Date: Mon, 02 Dec 2013 20:14:17 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Also change the default supported WILINK version

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
v3 changes-
Restored WILINK_VERSION to WILINK-6 as default. (undo from previous commits) 

 .../conf/distro/include/arago-prefs.inc            |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 24f3785..032c12b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -93,6 +93,9 @@ PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
 
 WILINK_VERSION = "WILINK-6"
+# For AM335x & AM43x Wilink 8 is now the default version to be used
+WILINK_VERSION_ti33x = "WILINK-8"
+WILINK_VERSION_ti43x = "WILINK-8" 
 PREFERRED_PROVIDER_wl12xx-firmware = "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-firmware',d)}"
 PREFERRED_PROVIDER_ti-compat-wireless-wl12xx = "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-wl18xx','ti-compat-wireless-wl12xx',d)}"
 PREFERRED_PROVIDER_hostap-daemon = "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-wl18xx','hostap-daemon',d)}"
-- 
1.7.9


