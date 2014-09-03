Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3C4C6529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83CgGhI004327
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CgGAx020326
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:15 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhq031656;
	Wed, 3 Sep 2014 07:42:14 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:31 +0530
Message-ID: <1409748091-12617-13-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 12/12] wpa-supplicant-wl18xx: configuration files update
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:17 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- clean non releveant configuration flags.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc             | 2 +-
 .../wpa-supplicant/wpa-supplicant/p2p_supplicant.conf                  | 3 +--
 .../wpa-supplicant/wpa-supplicant/wpa_supplicant.conf                  | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index c8611ea..e4be180 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -14,7 +14,7 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
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
2.0.1


