Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 99FA752A92
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:59:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99Nx1V4003134
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99Nx1nH016327
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:59:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:59:01 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99Nx0Zi012615	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:59:01 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0viRk013687	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:57:44 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0vicW013686	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:57:44 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:57:33 +0100
Message-ID: <1381366658-13630-7-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366658-13630-1-git-send-email-r-monk@ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] ti-connectivity/hostap-daemon-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Wed, 09 Oct 2013 23:59:03 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release hostap daemon
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
      * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx
   * Rebase config patch to match new release (which configures default SSID and channel)
   * Bump PR

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   43 ++++++++++++++++++++
 .../hostap/hostap-daemon-wl18xx_r8.a7.02.bb        |   25 ++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
new file mode 100644
index 0000000..a355d8b
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -0,0 +1,43 @@
+From 5aa31444740dff3d3f6f93c5f9361019873d0737 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Tue, 3 Sep 2013 12:26:48 +0100
+Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
+
+Change the default channel to 6 and change the ssid to a more
+meaningful name.
+
+Upstream-status: inappropriate [SDK specific patch]
+
+Copied from Eyal Reizer Patch from r8.a6.01, updated patch for
+latest version for conf file.
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ hostapd/hostapd.conf |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index 9001d16..a871977 100644
+--- a/hostapd/hostapd.conf
++++ b/hostapd/hostapd.conf
+@@ -83,7 +83,7 @@ ctrl_interface_group=0
+ ##### IEEE 802.11 related configuration #######################################
+ 
+ # SSID to be used in IEEE 802.11 management frames
+-ssid=test
++ssid=TexasInstruments_0001
+ # Alternative formats for configuring SSID
+ # (double quoted string, hexdump, printf-escaped string)
+ #ssid2="test"
+@@ -112,7 +112,7 @@ hw_mode=g
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
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
new file mode 100644
index 0000000..734a798
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
@@ -0,0 +1,25 @@
+# This is a TI specific version of the hostap-daemon recipe for use with the
+# wl18xx wlan and bluetooth module.
+
+require hostap.inc
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
+
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PR_append = "c+gitr${SRCPV}"
+
+FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
+
+# Add TI to the end to make it clear that this is a TI customized version
+# of hostap
+PV = "2.0-devel-ti"
+
+# Tag: ol_r8.a7.02
+SRCREV = "4dda294a5186f3efb437ae0898a6df71655843ef"
+
+PROVIDES += "hostap-daemon"
+RPROVIDES_${PN} += "hostap-daemon"
+RREPLACES_${PN} += "hostap-daemon"
+RCONFLICTS_${PN} += "hostap-daemon"
-- 
1.7.9.5


