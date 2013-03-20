Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6D1F852AAD
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:05:57 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K25tDA023832
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:05:56 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25tqc022976
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:35:55 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:35:54 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epM026167;
	Wed, 20 Mar 2013 07:35:53 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:30 -0500
Message-ID: <1363745138-10288-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/17] wpa-supplicant: Split recipe
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
X-List-Received-Date: Wed, 20 Mar 2013 02:05:57 -0000
Content-Type: text/plain

* Split recipe to allow multiple versions of wpa-supplicant to exist.
* Rename recipe to match the actual version of the TI modified wpa-supplicant.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../defconfig                                      |    0
 .../{wpa-supplicant_git.bb => wpa-supplicant.inc}  |   15 +++++----------
 .../wpa-supplicant/wpa-supplicant_r5.sp4.01.bb     |   13 +++++++++++++
 3 files changed, 18 insertions(+), 10 deletions(-)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant => wpa-supplicant-r5.sp4.01}/defconfig (100%)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant_git.bb => wpa-supplicant.inc} (91%)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-r5.sp4.01/defconfig
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
similarity index 91%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 927a556..21ec6a3 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -5,10 +5,7 @@ DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
+
 DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -16,22 +13,19 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "ol_R5.SP4.01"
-PR = "r3+gitr${SRCPV}"
-# Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "2.0-devel-ti"
+PR = "r4"
 
 SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://defconfig \
            file://defaults-sane \
            file://wpa-supplicant.sh \
-           file://kill_wpa_supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://wpa_supplicant.conf \
            file://fi.epitest.hostap.WPASupplicant.service \
            file://fi.w1.wpa_supplicant1.service \
+           file://kill_wpa_supplicant.sh \
           "
 
 S = "${WORKDIR}/git/wpa_supplicant"
@@ -54,7 +48,6 @@ do_install () {
 	install -m 755 wpa_supplicant ${D}${sbindir}
 	install -m 755 wpa_passphrase ${D}${sbindir}
 	install -m 755 wpa_cli        ${D}${sbindir}
-	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh ${D}${sbindir}
 
 	install -d ${D}${docdir}/wpa_supplicant
 	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
@@ -93,6 +86,8 @@ do_install () {
 	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc
 	install -m 644 ${WORKDIR}/fi.epitest.hostap.WPASupplicant.service ${D}/usr/share/dbus-1/system-services
 	install -m 644 ${WORKDIR}/fi.w1.wpa_supplicant1.service ${D}/usr/share/dbus-1/system-services
+
+	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh ${D}${sbindir}
 }
 
 pkg_postinst_wpa-supplicant () {
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
new file mode 100644
index 0000000..e23f3df
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb
@@ -0,0 +1,13 @@
+# This is a TI specific version of the wpa-supplicant recipe for use with the
+# wl12xx wlan and bluetooth module.
+
+require wpa-supplicant.inc
+
+LICENSE = "GPLv2 | BSD"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://wpa_supplicant.c;beginline=1;endline=17;md5=8835156c8ab8cad6356ec7f39ebe3aba"
+
+
+SRCREV = "ol_R5.SP4.01"
+PR_append = "-a+gitr${SRCPV}"
-- 
1.7.0.4


