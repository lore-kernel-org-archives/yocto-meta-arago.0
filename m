Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ECBC452972
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 21:33:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6VLXarP022016
	for <meta-arago@arago-project.org>; Thu, 31 Jul 2014 16:33:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6VLXaWg001299
	for <meta-arago@arago-project.org>; Thu, 31 Jul 2014 16:33:36 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 31 Jul 2014 16:33:36 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6VLXYlY031997;	Thu, 31 Jul 2014 16:33:35 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Aug 2014 00:28:35 +0300
Message-ID: <1406842115-5938-2-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406842115-5938-1-git-send-email-yanivma@ti.com>
References: <1406842115-5938-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wpa-supplicant-wl18xx: configuration files update
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
X-List-Received-Date: Thu, 31 Jul 2014 21:33:37 -0000
Content-Type: text/plain

- clean non releveant configuration flags.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../wpa-supplicant/p2p_supplicant.conf             |    3 +--
 .../wpa-supplicant/wpa_supplicant.conf             |    3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
index 2de8730..3bdc306 100755
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
@@ -3,12 +3,11 @@ update_config=0
 device_name=TI-SITARA-P2P
 device_type=1-0050F204-1
 config_methods=virtual_push_button physical_display keypad
-p2p_go_intent=0
+#p2p_go_intent=0
 country=US
 ##p2p_pref_chan=115:36 115:40
 driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
 p2p_go_max_inactivity=60
 p2p_go_ht40=1
-p2p_multi_chan=1
 disassoc_low_ack=1
 concurrent_sched_scan=1
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
index f144a38..4233eb2 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
@@ -59,6 +59,7 @@ driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
 # inactive stations.
 p2p_go_max_inactivity=60
 p2p_go_ht40=1
-p2p_multi_chan=1
 disassoc_low_ack=1
 concurrent_sched_scan=1
+p2p_disabled=1
+
-- 
1.7.9


