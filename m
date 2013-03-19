Return-Path: <eyalr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 597055203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:46:04 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFjxUD013595
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:45:59 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFjwrE010541
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 21:15:58 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 21:15:58 +0530
Received: from user-VirtualBox.emea.dhcp.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r2JFjlfq025731;	Tue, 19 Mar 2013 21:15:57 +0530
From: Eyal Reizer <eyalr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 17:45:30 +0200
Message-ID: <1363707935-2749-3-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363707935-2749-2-git-send-email-eyalr@ti.com>
References: <1363707935-2749-2-git-send-email-eyalr@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/9] hostap-daemon-wl18xx: hostap-daemon for ti wilink8 release
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
X-List-Received-Date: Tue, 19 Mar 2013 15:46:04 -0000
Content-Type: text/plain

Add a new recipe for building the ti version of hostap-daemon
2.0-devel from release r8.a6.01

This package replace the wilink6 package which is provided by the
hostap-daemon recipe. Selection between the two is done using a
"WILINK_VERSION" switch added to arago.conf

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   40 ++++++++++++++++++++
 .../hostap/hostap-daemon-wl18xx_r8.a6.01.bb        |   22 +++++++++++
 .../recipes-connectivity/hostap/hostap.inc         |    2 +-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
new file mode 100644
index 0000000..824d250
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -0,0 +1,40 @@
+From f7c1b9d4e18dc650dd0b9da97a91f27f6a4bb5b7 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Sun, 17 Mar 2013 07:18:55 -0700
+Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
+
+Change the default channel to 6 and change the ssid to a more
+meaningful name.
+
+Upstream-status: inappropriate [SDK specific patch]
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ hostapd/hostapd.conf |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index f71a881..00843aa 100644
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
+@@ -107,7 +107,7 @@ hw_mode=g
+ # channel will need to be configured separately with iwconfig.
+ # When set to 0, automatic channel selection will be engaged. A channel
+ # will be selected from the desired hw_mode.
+-channel=1
++channel=6
+ 
+ # Automatic channel selection (ACS) whitelist
+ # (default: not set)
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
new file mode 100644
index 0000000..9c7ef6e
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
@@ -0,0 +1,22 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl18xx wlan and bluetooth module.
+
+require hostap.inc
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
+
+PR_append = "a+gitr${SRCREV}"
+
+FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
+
+# Add TI to the end to make it clear that this is a TI customized version
+# of hostap
+PV = "2.0-devel-ti"
+
+SRCREV = "ol_r8.a6.01"
+
+PROVIDES += "hostap-daemon"
+RPROVIDES += "hostap-daemon"
+RREPLACESi += "hostap-daemon"
+RCONFLICTS += "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 17d18a8..8f6488b 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -11,7 +11,7 @@ DEPENDS = "libnl openssl"
 # default
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r3"
+PR = "r4"
 
 inherit update-rc.d
 INITSCRIPT_NAME="hostapd"
-- 
1.7.9.5


