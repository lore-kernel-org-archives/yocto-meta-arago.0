Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C7CA6529A9
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2014 23:57:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GNvixB028446
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:44 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNviMf003965
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 Jan 2014 17:57:44 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvfd3003746;
	Thu, 16 Jan 2014 17:57:42 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2014 19:19:06 -0600
Message-ID: <1389921550-8122-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/5] Remove Wilink 6 references from packagegroups and other recipes
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
X-List-Received-Date: Thu, 16 Jan 2014 23:57:46 -0000
Content-Type: text/plain

* Wilink 6 will no longer be supported in future SDKs.
* Remove references to Wilink 6 from various packagegroups and other recipes and
  use Wilink 8 packages by default.
---
 .../conf/distro/arago-source-ipk.conf              |    7 +++-
 .../conf/distro/include/arago-prefs.inc            |   21 +----------
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    8 ++---
 ...agegroup-arago-tisdk-connectivity-sdk-target.bb |   17 +--------
 .../packagegroup-arago-tisdk-connectivity.bb       |   36 ++++---------------
 .../packagegroup-arago-tisdk-matrix.bb             |   14 +-------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    5 +--
 7 files changed, 23 insertions(+), 85 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index ef41d94..9b78258 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -94,12 +94,15 @@ SRCIPK_INSTALL_DIR_pn-bt-enable = "board-support/extra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-bt-firmware = "1"
 SRCIPK_INSTALL_DIR_pn-bt-firmware = "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-ti-compat-wireless-wl12xx = "1"
-SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl12xx = "board-support/extra-drivers/${PN}-${PV}"
+CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
+SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-ti-compat-bluetooth = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-bluetooth = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-wl18xx-firmware = "1"
+SRCIPK_INSTALL_DIR_pn-wl18xx-firmware = "board-support/extra-drivers/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-wl1271-wlan-cli = "1"
 SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli = "example-applications/wlan"
 
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 9c7bcbd..e1da2e9 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -93,22 +93,5 @@ PREFERRED_VERSION_bluez-hcidump = "2.2"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
 
-WILINK_VERSION = "WILINK-8"
-# For AM335x & AM43x Wilink 8 is now the default version to be used
-WILINK_VERSION_ti33x = "WILINK-8"
-WILINK_VERSION_ti43x = "WILINK-8"
-PREFERRED_PROVIDER_wl12xx-firmware = "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-firmware',d)}"
-PREFERRED_PROVIDER_ti-compat-wireless-wl12xx = "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-wl18xx','ti-compat-wireless-wl12xx',d)}"
-PREFERRED_PROVIDER_hostap-daemon = "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-wl18xx','hostap-daemon',d)}"
-PREFERRED_PROVIDER_wpa-supplicant = "${@base_contains('WILINK_VERSION','WILINK-8','wpa-supplicant-wl18xx','wpa-supplicant',d)}"
-PREFERRED_PROVIDER_ti-wifi-utils = "${@base_contains('WILINK_VERSION','WILINK-8','ti-wifi-utils-wl18xx','ti-wifi-utils',d)}"
-
-# Support Wilink 6 PG 2 modules
-# By default am180x-evm comes with an outdated wilink 6 module
-# All other platforms build the latest Wilink 6 PG 3 modules
-PREFERRED_VERSION_ti-compat-bluetooth_am180x-evm = "r5.00.18"
-PREFERRED_VERSION_ti-compat-wireless-wl12xx_am180x-evm = "r5.00.18"
-PREFERRED_VERSION_wl12xx-firmware_am180x-evm = "r5.00.18"
-PREFERRED_VERSION_wpa-supplicant_am180x-evm = "r5.00.18"
-PREFERRED_VERSION_hostap-daemon_am180x-evm = "r5.00.18"
-PREFERRED_VERSION_ti-wifi-utils_am180x-evm = "r5.00.18"
+PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
+PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 8d4d081..50ca1bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,25 +1,23 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # Further breaks to resolve
-#    ti-compat-wireless-wl12xx-src
 #    ti-compat-bluetooth-src
 
 FIRMWARE_AND_DRIVERS_SRC = "\
     bt-firmware-src \
     bt-enable-src \
+    wl18xx-firmware-src \
 "
 
 CONNECTIVITY_RDEPENDS = ""
 
-CONNECTIVITY_RDEPENDS_am37x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
-CONNECTIVITY_RDEPENDS_am180x-evm = "${FIRMWARE_AND_DRIVERS_SRC}"
-CONNECTIVITY_RDEPENDS_ti33x = "${@base_contains('ARAGO_BRAND','amsdk','${FIRMWARE_AND_DRIVERS_SRC}','',d)}"
+CONNECTIVITY_RDEPENDS_ti33x = "${FIRMWARE_AND_DRIVERS_SRC}"
 
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index da23384..b920770 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
@@ -14,24 +14,11 @@ BLUETOOTH_STACK = "\
 
 CONNECTIVITY_RDEPENDS = ""
 
-CONNECTIVITY_RDEPENDS_am37x-evm = "\
-    ${BLUETOOTH_STACK} \
-"
-
-#    wpa-supplicant-dev
-
-CONNECTIVITY_RDEPENDS_am180x-evm = "\
-    ${BLUETOOTH_STACK} \
-"
-
-#    wpa-supplicant-dev
-
 CONNECTIVITY_RDEPENDS_ti33x  = "\
     ${BLUETOOTH_STACK} \
+    wpa-supplicant-wl18xx-dev \
 "
 
-#    wpa-supplicant-dev
-
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index d7d2ef2..fd71494 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 inherit packagegroup
 
@@ -22,11 +22,11 @@ WLAN_COMMON = "\
     pulseaudio-module-bluetooth-discover \
     pulseaudio-module-bluetooth-device \
     eventdump \
-    ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
-    wpa-supplicant \
+    wlconf \
+    wpa-supplicant-wl18xx \
     crda \
-    hostap-daemon \
-    ti-wifi-utils \
+    hostap-daemon-wl18xx \
+    ti-wifi-utils-wl18xx \
 "
 # No bluetooth/bluetooth.h
 
@@ -34,12 +34,10 @@ WLAN_COMMON = "\
 #    netperf
 
 # Further breaks to resolve
-#    ti-compat-wireless-wl12xx
 #    ti-compat-bluetooth
 
 FIRMWARE_AND_DRIVERS = "\
-    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver bt-firmware bt-enable' , '',d)}"\
-    wl12xx-firmware \
+    wl18xx-firmware \
 "
 
 BLUETOOTH_STACK = "\
@@ -55,34 +53,16 @@ BLUETOOTH_STACK = "\
 
 DEMO_APPS = "\
     bluetooth-gui \
-    wl1271-demo \
+    wpa-gui-e \
 "
 
-#    wifi-direct-demo
-#    battleship
-#    wpa-gui-e
-
 CONNECTIVITY_RDEPENDS = ""
 
-CONNECTIVITY_RDEPENDS_am37x-evm = "\
-    ${WLAN_COMMON} \
-    ${BLUETOOTH_STACK} \
-    ${DEMO_APPS} \
-    ${FIRMWARE_AND_DRIVERS} \
-"
-
-CONNECTIVITY_RDEPENDS_am180x-evm  = "\
-    ${WLAN_COMMON} \
-    ${BLUETOOTH_STACK} \
-    ${DEMO_APPS} \
-    ${FIRMWARE_AND_DRIVERS} \
-"
-
 CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
-    ${@base_contains('ARAGO_BRAND','amsdk','${FIRMWARE_AND_DRIVERS}','',d)} \
+    ${FIRMWARE_AND_DRIVERS} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index c3143d3..311ad2e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 inherit packagegroup
 
@@ -68,9 +68,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-bluetooth-demos      \
 "
 
-#    matrix-gui-wifi-battleship-demo
-#    matrix-gui-wifi-direct-demo
-
 MATRIX_APPS_append_ti43x = "        \
     ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
                                     \
@@ -114,24 +111,15 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-display-control      \
     matrix-gui-clocks               \
                                     \
-    matrix-gui-wifi-demos           \
-    matrix-gui-bluetooth-demos      \
                                     \
     matrix-multimedia-demo-audiocapture \
 "
 
-#    matrix-gui-wifi-battleship-demo
-#    matrix-gui-wifi-direct-demo
-
 MATRIX_APPS_append_am180x-evm = "   \
-    matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
     matrix-gui-pru-demos            \
 "
 
-#    matrix-gui-wifi-battleship-demo
-#    matrix-gui-wifi-direct-demo
-
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_GUI}         \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index bcc8d81..913553a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r20"
+PR = "r21"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -56,7 +56,6 @@ MAKEFILES_append_omap3 = " u-boot-spl \
 "
 MAKEFILES_append_am37x-evm = " av-examples \
                                ti-ocf-crypto-module \
-                               wireless \
 "
 MAKEFILES_append_am3517-evm = " av-examples \
                                 ti-ocf-crypto-module \
@@ -65,6 +64,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
+                           wireless \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -78,7 +78,6 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
-                                wireless \
 "
 
 # Use ARCH format expected by the makefile
-- 
1.7.0.4


