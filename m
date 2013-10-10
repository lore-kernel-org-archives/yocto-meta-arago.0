Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 81B3752A64
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF3jsX001931
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF3jvW008906
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 10:03:45 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r9AF3ieC015135	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 10:03:45 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9AG2RdN016889	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:02:27 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9AG2Rvt016888	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 17:02:27 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 17:02:17 +0100
Message-ID: <1381420942-16810-7-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381420942-16810-1-git-send-email-r-monk@ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 06/11] ti-connectivity/hostap-daemon-wl18xx: Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:47 -0000
Content-Type: text/plain

   * Add v r8.a7.02 engineering release hostap daemon
   * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with ES 2.1 WL8
      * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx module
      * OMAP5432x-xx-x1-xx
   * Rebase config patch to match new release (which configures default SSID and channel)
   * Bump PR

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   21 +++++++++++---------
 ...8.a6.01.bb => hostap-daemon-wl18xx_r8.a7.02.bb} |    8 +++++---
 2 files changed, 17 insertions(+), 12 deletions(-)
 copy meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-r5.sp4.01 => hostap-daemon-wl18xx-r8.a7.02}/0001-hostapd-change-conf-file-for-better-oob-startup.patch (67%)
 copy meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a6.01.bb => hostap-daemon-wl18xx_r8.a7.02.bb} (79%)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
similarity index 67%
copy from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
copy to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
index 562970e..a355d8b 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-r5.sp4.01/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx-r8.a7.02/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -1,6 +1,6 @@
-From 66b55f187843bca53cb3b7ef9c8fcd434a72f768 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Thu, 21 Feb 2013 03:55:22 -0800
+From 5aa31444740dff3d3f6f93c5f9361019873d0737 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Tue, 3 Sep 2013 12:26:48 +0100
 Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
 
 Change the default channel to 6 and change the ssid to a more
@@ -8,13 +8,16 @@ meaningful name.
 
 Upstream-status: inappropriate [SDK specific patch]
 
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
+Copied from Eyal Reizer Patch from r8.a6.01, updated patch for
+latest version for conf file.
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
 ---
  hostapd/hostapd.conf |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index f71a881..00843aa 100644
+index 9001d16..a871977 100644
 --- a/hostapd/hostapd.conf
 +++ b/hostapd/hostapd.conf
 @@ -83,7 +83,7 @@ ctrl_interface_group=0
@@ -23,10 +26,10 @@ index f71a881..00843aa 100644
  # SSID to be used in IEEE 802.11 management frames
 -ssid=test
 +ssid=TexasInstruments_0001
- 
- # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
- # Set as needed to indicate country in which device is operating.
-@@ -107,7 +107,7 @@ hw_mode=g
+ # Alternative formats for configuring SSID
+ # (double quoted string, hexdump, printf-escaped string)
+ #ssid2="test"
+@@ -112,7 +112,7 @@ hw_mode=g
  # channel will need to be configured separately with iwconfig.
  # When set to 0, automatic channel selection will be engaged. A channel
  # will be selected from the desired hw_mode.
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
similarity index 79%
copy from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
copy to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
index e232b32..734a798 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a7.02.bb
@@ -6,7 +6,9 @@ require hostap.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
-PR_append = "b+gitr${SRCPV}"
+COMPATIBLE_MACHINE = "(omap-a15)"
+
+PR_append = "c+gitr${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 
@@ -14,8 +16,8 @@ FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 # of hostap
 PV = "2.0-devel-ti"
 
-# Tag: ol_r8.a6.01
-SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
+# Tag: ol_r8.a7.02
+SRCREV = "4dda294a5186f3efb437ae0898a6df71655843ef"
 
 PROVIDES += "hostap-daemon"
 RPROVIDES_${PN} += "hostap-daemon"
-- 
1.7.9.5


