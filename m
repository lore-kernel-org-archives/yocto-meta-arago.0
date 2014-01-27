Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DB9605298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 20:21:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RKLH3M031865
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:17 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKLHbC019962
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 14:21:16 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0RKLFHb006617;	Mon, 27 Jan 2014 14:21:16 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jan 2014 22:19:44 +0200
Message-ID: <1390853985-8457-2-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390853985-8457-1-git-send-email-yanivma@ti.com>
References: <1390853985-8457-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] hostap-daemon-wl18xx: fix conf file
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
X-List-Received-Date: Mon, 27 Jan 2014 20:21:18 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Revert change of interface name to back to wlan0, to support OOB scripts.
- Update to latest version.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
index aee4531..c89dd4c 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -1,18 +1,20 @@
-From 0649cc8f954a957a32180dc714ab4226503c5a66 Mon Sep 17 00:00:00 2001
+From 6e7fd68f1b21813c8df49bfc4d808f41baacc01a Mon Sep 17 00:00:00 2001
 From: Yaniv Mahani <yanivma@ti.com>
 Date: Wed, 27 Nov 2013 13:43:55 +0200
 Subject: [PATCH] hostapd change conf file for better oob startup
 
 Changed some of the default parameters
+
+Signed-off-by: Yaniv Mahani <yanivma@ti.com>
 ---
- hostapd/hostapd.conf |  726 +++++++-------------------------------------------
- 1 file changed, 89 insertions(+), 637 deletions(-)
+ hostapd/hostapd.conf |  724 ++++++--------------------------------------------
+ 1 file changed, 88 insertions(+), 636 deletions(-)
 
 diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index f26f310..162fc28 100644
+index f26f310..5e7b115 100644
 --- a/hostapd/hostapd.conf
 +++ b/hostapd/hostapd.conf
-@@ -1,9 +1,23 @@
+@@ -1,5 +1,19 @@
  ##### hostapd configuration file ##############################################
  # Empty lines and lines starting with # are ignored
 +#
@@ -32,11 +34,6 @@ index f26f310..162fc28 100644
 
  # AP netdevice name (without 'ap' postfix, i.e., wlan0 uses wlan0ap for
  # management frames); ath0 for madwifi
--interface=wlan0
-+interface=wlan1
-
- # In case of madwifi, atheros, and nl80211 driver interfaces, an additional
- # configuration parameter, bridge, may be used to notify hostapd if the
 @@ -22,7 +36,7 @@ interface=wlan0
  # default: hostap). nl80211 is used with all Linux mac80211 drivers.
  # Use driver=none if building hostapd as a standalone RADIUS server that does
-- 
1.7.9


