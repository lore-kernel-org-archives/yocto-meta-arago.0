Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0363852A08
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:01 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC00EF8UZNE980@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=i5kaQHlOvP_IAqFGZ5QA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 36E97161B54;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:34 -0400
Message-id: <1440030941-20751-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH 1/8] recipes: correct FILESEXTRAPATHS_append syntax
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend | 2 +-
 meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb   | 2 +-
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb        | 2 +-
 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 6bea43f..2296ccd 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
 
 PR_append = "-arago7"
 
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index 0348cb0..1151012 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880"
 
 PR_append = "d"
 
-FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
+FILESEXTRAPATHS_append := ":${THISDIR}/hostap-daemon"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
index dea4384..9e98080 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=36b27801447e0662ee0138d17fe93880 \
                     file://../README;md5=7f393579f8b109fe91f3b9765d26c7d3 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=8a3131126465e08eb6b8d17ea880e162"
 
-FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
+FILESEXTRAPATHS_append := ":${THISDIR}/wpa-supplicant"
 
 # Tag: R8.6
 SRCREV = "f80fe345acf103ba6882ac8396f19584ac184904"
diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
index 460de67..c846c18 100644
--- a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
+++ b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
@@ -3,7 +3,7 @@ require ${COREBASE}/meta/recipes-qt/qt4/qt4-embedded.inc
 
 PR = "${INC_PR}.3"
 
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-qt/qt4/qt4-${PV}:${COREBASE}/meta/recipes-qt/qt4/files:"
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}:${COREBASE}/meta/recipes-qt/qt4/qt4-${PV}:${COREBASE}/meta/recipes-qt/qt4/files"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.2.0


