Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E5829529D5
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Cg1cA000330
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83Cg1OW020089
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:01 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhj031656;
	Wed, 3 Sep 2014 07:42:00 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:24 +0530
Message-ID: <1409748091-12617-6-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 05/12] hostap-daemon-wl18xx: Update recipe to ol_r8.a9.14 version
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:03 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

- Changed git sources to git.ti.com
    - Updated Defconfig.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 ...daemon-wl18xx_r8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} | 8 ++++----
 .../recipes-connectivity/hostap/hostap-daemon/defconfig           | 2 +-
 meta-arago-extras/recipes-connectivity/hostap/hostap.inc          | 7 +++----
 3 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.10.bb => hostap-daemon-wl18xx_r8.a9.14.bb} (79%)

diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
similarity index 79%
rename from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
index cd5d8d3..3981b78 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
@@ -6,7 +6,7 @@ require hostap.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
-PR_append = "b+gitr${SRCPV}"
+PR_append = "c+gitr${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 
@@ -14,9 +14,9 @@ FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 # of hostap
 PV = "2.0-devel-ti"
 
-# Tag: ol_r8.a8.10
-SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
-BRANCH = "mbss_suspend"
+# Tag: ol_r8.a9.14
+SRCREV = "281f5adb8eb7ee9e9220546c0227696b02aab332"
+BRANCH = "single_hostap_dfs_dynamic"
 
 PROVIDES += "hostap-daemon"
 RPROVIDES_${PN} += "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
index ccc0996..3ee35bc 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defconfig
@@ -52,7 +52,7 @@ CONFIG_LIBNL32=y
 # This version is an experimental implementation based on IEEE 802.11w/D1.0
 # draft and is subject to change since the standard has not yet been finalized.
 # Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
+CONFIG_IEEE80211W=y
 
 # Integrated EAP server
 #CONFIG_EAP=y
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 15e82d5..180fc01 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -1,5 +1,5 @@
 # This is a TI specific version of the hostap-daemon recipe for use with the
-# wl12xx wlan and bluetooth module.
+# wl18xx wlan module
 
 HOMEPAGE = "http://hostap.epitest.fi"
 DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
@@ -11,15 +11,14 @@ DEPENDS = "libnl openssl"
 # default
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r5"
+PR = "r6"
 
 inherit update-rc.d
 INITSCRIPT_NAME="hostapd"
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git;branch=${BRANCH} \
-           file://0001-hostapd-change-conf-file-for-better-oob-startup.patch;patchdir=.. \
+SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
 	       file://init"
 
-- 
2.0.1


