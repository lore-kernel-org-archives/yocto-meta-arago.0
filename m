Return-Path: <yanivma@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 33C985298A
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2014 20:21:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RKLGOZ008788
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:16 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RKLG9G019945
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2014 14:21:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 14:21:16 -0600
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0RKLFHa006617;	Mon, 27 Jan 2014 14:21:15 -0600
From: Yaniv Mahani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jan 2014 22:19:43 +0200
Message-ID: <1390853985-8457-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] Wl18xx : recipes update - tag changed to ol_r8.a8.10
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
X-List-Received-Date: Mon, 27 Jan 2014 20:21:17 -0000
Content-Type: text/plain

From: Yaniv Machani <yanivma@ti.com>

Updated to latest release.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 ...08.bb => ti-compat-wireless-wl18xx_r8.a8.10.bb} |    4 ++--
 ...are_r8.a8.08.bb => wl18xx-firmware_r8.a8.10.bb} |    6 +++---
 ...8.a8.08.bb => hostap-daemon-wl18xx_r8.a8.10.bb} |    4 ++--
 ....a8.08.bb => wpa-supplicant-wl18xx_r8.a8.10.bb} |    4 ++--
 ...8.a8.08.bb => ti-wifi-utils-wl18xx_r8.a8.10.bb} |    6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-arago-extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-wl18xx_r8.a8.08.bb => ti-compat-wireless-wl18xx_r8.a8.10.bb} (98%)
 rename meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.08.bb => wl18xx-firmware_r8.a8.10.bb} (86%)
 rename meta-arago-extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.08.bb => hostap-daemon-wl18xx_r8.a8.10.bb} (92%)
 rename meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a8.08.bb => wpa-supplicant-wl18xx_r8.a8.10.bb} (94%)
 rename meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a8.08.bb => ti-wifi-utils-wl18xx_r8.a8.10.bb} (89%)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
similarity index 98%
rename from meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
rename to meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
index c377667..0e7281a 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
@@ -20,9 +20,9 @@ PV = "r8.a8.08"
 inherit module
 
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "a"
+PR_append = "b"
 
-# Tags: ol_r8.a8.08
+# Tags: ol_r8.a8.10
 SRCREV_wl18xx = "eaa1820c02dc076e6ad9254e9cb7a3bb0c17471b"
 SRCREV_compat = "5d80865281795f962e1400a95202bbd07dd763c0"
 SRCREV_compat-wireless = "23a0d62ea1a57327709a77f08d6265ec807a909f"
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
similarity index 86%
rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
index 759bf47..ba698ff 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 PACKAGE_ARCH = "all"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
 RREPLACES_${PN} += "wl12xx-firmware"
 RCONFLICTS_${PN} += "wl12xx-firmware"
 
-# Tag: ol_r8.a8.08
-SRCREV = "8e7f455e726f2bf92c568286a5cca510d7718dc1"
+# Tag: ol_r8.a8.10
+SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
 SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
            file://Makefile \
           "
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
similarity index 92%
rename from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.08.bb
rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
index 861c97b..acd3c29 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
@@ -6,7 +6,7 @@ require hostap.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e"
 
-PR_append = "a+gitr${SRCPV}"
+PR_append = "b+gitr${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 
@@ -14,7 +14,7 @@ FILESEXTRAPATHS_append := "${THISDIR}/hostap-daemon:"
 # of hostap
 PV = "2.0-devel-ti"
 
-# Tag: ol_r8.a8.08
+# Tag: ol_r8.a8.10
 SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
 
 PROVIDES += "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
similarity index 94%
rename from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
rename to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
index ec7a0c7..6340967 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
 
 FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
 
-# Tag: ol_r8.a8.08
+# Tag: ol_r8.a8.10
 SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
-PR_append = "a+gitr${SRCPV}"
+PR_append = "b+gitr${SRCPV}"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "2.0-devel-ti"
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
similarity index 89%
rename from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
rename to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
index 601b203..26faa6f 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.08.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a8.10.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "wl18xx-firmware"
 
-PR ="r0+gitr${SRCPV}"
+PR ="r1+gitr${SRCPV}"
 
-#Tag: ol_r8.a8.08
-SRCREV = "9627cb09b9de32b8ffcc32d3ce3e275b7c56d8e4"
+#Tag: ol_r8.a8.10
+SRCREV = "c50159d66af1786414b819ebcaa8b2571ae790a1"
 SRC_URI = "git://github.com/TI-OpenLink/18xx-ti-utils.git \
 "
 
-- 
1.7.9


