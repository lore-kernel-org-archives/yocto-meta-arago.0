Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id 0CFBE52A9C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:08 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so1047167obc.18
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nHGzpzctQOVlcAbrH4NkgoexpPkDyIYrr/nygN6ulFM=;
	b=yQBMXBplsouu4SUNQKH0yvIlDuzRDKbn7I29qfJQrA+2ZjepdjE1PCIg01LOJPkg/K
	AXra6eQg5k9CBDqPe56ZCdSjpCByxUBPy//SJ6juWLyrnzUDKNb33VoozOeaSIrlvojd
	fSbOjx0dIga2KFntKH7ZuqTYOtXJkDOX1fZOa7IXg52PIQC9/NHrkvhrij3eFI4WjGHu
	nxzEVRDm6BCG0vg0+S1o5EHkdHtcPNdPHuSShGbG41/mj6dvIMeyf6vivKYYMW7OmWTu
	0LNOsIJR50yv4ESLVB4s3zj7cPbFJasCbtVv5jmBIjDa3nCjvVRyOzVXt+p2Ilrs3JZb
	Eqaw==
X-Received: by 10.60.21.131 with SMTP id v3mr5786628oee.32.1359151088333;
	Fri, 25 Jan 2013 13:58:08 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.06
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:07 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:46 -0600
Message-Id: <1359150851-23602-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 06/31] hostapd: update for wlan r5_sp3 release
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:09 -0000

From: Eyal Reizer <eyalr@ti.com>

Update for the newer package released with wlan r5_sp3.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...d-change-conf-file-for-better-oob-startup.patch |   43 ++++++++------------
 .../hostap/hostap-daemon_git.bb                    |    8 ++--
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
index fa68357..9008310 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -1,49 +1,40 @@
-From 4c5fe9901219956fb754306a2093e78fb460bbdd Mon Sep 17 00:00:00 2001
+From 685a744a1dc46853185191eb46a7cae4d49f30d1 Mon Sep 17 00:00:00 2001
 From: Eyal Reizer <eyalr@ti.com>
-Date: Thu, 23 Jun 2011 10:13:44 +0300
+Date: Mon, 19 Nov 2012 09:47:39 +0200
 Subject: [PATCH] hostapd: change conf file for better sdk out of box startup
 
-The default hostapd.conf file that is fetched from upstream is using
-a band which is not supported by the 1271 chip.
-I am using this amend.inc in order to modify it to use g band and default
-channel 6 and change the ssid to a more meaningful name.
+Change the default channel to 6 and change the ssid to a more
+meaningful name.
 
 Upstream-status: inappropriate [SDK specific patch]
 
 Signed-off-by: Eyal Reizer <eyalr@ti.com>
 ---
- hostapd/hostapd.conf |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
+ hostapd/hostapd.conf |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index 6d7263a..bb27beb 100644
+index 494f7ca..9310ef4 100644
 --- a/hostapd/hostapd.conf
 +++ b/hostapd/hostapd.conf
 @@ -83,7 +83,7 @@ ctrl_interface_group=0
  ##### IEEE 802.11 related configuration #######################################
-
+ 
  # SSID to be used in IEEE 802.11 management frames
 -ssid=test
 +ssid=TexasInstruments_0001
-
+ 
  # Country code (ISO/IEC 3166-1). Used to set regulatory domain.
  # Set as needed to indicate country in which device is operating.
-@@ -99,14 +99,14 @@ ssid=test
-
- # Operation mode (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.11g,
- # Default: IEEE 802.11b
--hw_mode=a
-+hw_mode=g
-
- # Channel number (IEEE 802.11)
+@@ -105,7 +105,7 @@ hw_mode=g
  # (default: 0, i.e., not set)
- # Please note that some drivers (e.g., madwifi) do not use this value from
- # hostapd and the channel will need to be configuration separately with
- # iwconfig.
--channel=60
+ # Please note that some drivers do not use this value from hostapd and the
+ # channel will need to be configured separately with iwconfig.
+-channel=1
 +channel=6
-
+ 
  # Beacon interval in kus (1.024 ms) (default: 100; range 15..65535)
  beacon_int=100
---
-1.7.0.4
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
index 46414d8..3d2d014 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://hostap.epitest.fi"
 DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
 DEPENDS = "libnl openssl"
 
@@ -20,11 +20,11 @@ CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-PV = "0.7.3+0.8.0-rc-ti"
+PV = "2.0-devel-ti"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
-SRCREV = "ol_R5.00.18"
+SRCREV = "ol_R5.SP3.05"
 
 SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
 	file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
-- 
1.7.0.4


