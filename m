Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B9AB952AB3
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:55:15 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EtD0s028459
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:55:14 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EtDGk011712
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 20:25:13 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 20:25:13 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EsxCh020052;
	Mon, 1 Apr 2013 20:25:11 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 09:54:46 -0500
Message-ID: <1364828095-28755-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364828095-28755-1-git-send-email-fcooper@ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/17 v2] hostap-daemon: Pull in old r5-00-18 recipe
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
X-List-Received-Date: Mon, 01 Apr 2013 14:55:16 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 hostap-daemon recipe with updated recipe name
  to add support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
None. Apart of new patchset.

 ...d-change-conf-file-for-better-oob-startup.patch |   49 ++++++++++++++++++++
 .../hostap/hostap-daemon_r5.00.18.bb               |   11 ++++
 2 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
new file mode 100644
index 0000000..fa68357
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.00.18/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -0,0 +1,49 @@
+From 4c5fe9901219956fb754306a2093e78fb460bbdd Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Thu, 23 Jun 2011 10:13:44 +0300
+Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
+
+The default hostapd.conf file that is fetched from upstream is using
+a band which is not supported by the 1271 chip.
+I am using this amend.inc in order to modify it to use g band and default
+channel 6 and change the ssid to a more meaningful name.
+
+Upstream-status: inappropriate [SDK specific patch]
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ hostapd/hostapd.conf |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index 6d7263a..bb27beb 100644
+--- a/hostapd/hostapd.conf
++++ b/hostapd/hostapd.conf
+@@ -83,7 +83,7 @@ ctrl_interface_group=0
+ ##### IEEE 802.11 related configuration #######################################
+
+ # SSID to be used in IEEE 802.11 management frames
+-ssid=test
++ssid=TexasInstruments_0001
+
+ # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
+ # Set as needed to indicate country in which device is operating.
+@@ -99,14 +99,14 @@ ssid=test
+
+ # Operation mode (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g,
+ # Default: IEEE 802.11b
+-hw_mode=a
++hw_mode=g
+
+ # Channel number (IEEE 802.11)
+ # (default: 0, i.e., not set)
+ # Please note that some drivers (e.g., madwifi) do not use this value from
+ # hostapd and the channel will need to be configuration separately with
+ # iwconfig.
+-channel=60
++channel=6
+
+ # Beacon interval in kus (1.024 ms) (default: 100; range 15..65535)
+ beacon_int=100
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb
new file mode 100644
index 0000000..aa6f5bb
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_r5.00.18.bb
@@ -0,0 +1,11 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+require hostap.inc
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58"
+
+PR_append = "a+gitr${SRCPV}"
+
+SRCREV = "ol_R5.00.18"
-- 
1.7.0.4


