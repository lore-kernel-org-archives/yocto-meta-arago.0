Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2E84C52092
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2018 22:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A752208AE;
	Wed,  7 Nov 2018 22:54:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ECIFZpKbrAph; Wed,  7 Nov 2018 22:54:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 60F5C2014F;
	Wed,  7 Nov 2018 22:54:40 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DFFEE164D06;
	Wed,  7 Nov 2018 17:54:39 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Nov 2018 17:54:39 -0500
Message-Id: <1541631279-42508-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] packagegroup-*-connectivity: restructure WLAN & BT lists and add WLAN to K3
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
X-List-Received-Date: Wed, 07 Nov 2018 22:54:52 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       | 58 ++++++++++++----------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index b64f252..25d2e2a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,13 +1,11 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r40"
+PR = "r41"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# Disabled in master:
-#    crda
 # WLAN support packages.
 # These are the packages that all platforms use for WLAN support
 WLAN_COMMON = "\
@@ -16,34 +14,24 @@ WLAN_COMMON = "\
     softap-udhcpd-config \
     eventdump \
     wlconf \
-    wpa-supplicant-wl18xx \
-    hostap-daemon-wl18xx \
-    wl18xx-calibrator \
-    wl18xx-target-scripts \
-"
-
-# netperf has non-standard license, needs verifying
-#    netperf
-
-FIRMWARE_AND_DRIVERS = "\
-    wl18xx-fw \
-    bt-fw \
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
 "
 
-DEMO_APPS = "\
-    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
+WLAN_TI = "\
+    wpa-supplicant-wl18xx \
+    hostap-daemon-wl18xx \
+    wl18xx-calibrator \
+    wl18xx-target-scripts \
+    wl18xx-fw \
 "
 
-BLUETOOTH_STACK = "\
+BT_COMMON = "\
     bluez5 \
     bluez5-obex \
     bluez5-noinst-tools \
     bluez5-testtools \
-    uim \
-    bt-enable \
     pulseaudio \
     pulseaudio-server \
     pulseaudio-module-loopback \
@@ -55,6 +43,16 @@ BLUETOOTH_STACK = "\
     sbc \
 "
 
+BT_TI = "\
+    uim \
+    bt-enable \
+    bt-fw \
+"
+
+DEMO_APPS = "\
+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
+"
+
 CONNECTIVITY_RDEPENDS = " \
     htop \
     iptables \
@@ -65,22 +63,30 @@ CONNECTIVITY_RDEPENDS = " \
 
 CONNECTIVITY_RDEPENDS_append_ti33x = "\
     ${WLAN_COMMON} \
+    ${WLAN_TI} \
+    ${BT_COMMON} \
+    ${BT_TI} \
     ${DEMO_APPS} \
-    ${BLUETOOTH_STACK} \
-    ${FIRMWARE_AND_DRIVERS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti43x = "\
     ${WLAN_COMMON} \
+    ${WLAN_TI} \
+    ${BT_COMMON} \
+    ${BT_TI} \
     ${DEMO_APPS} \
-    ${BLUETOOTH_STACK} \
-    ${FIRMWARE_AND_DRIVERS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_dra7xx = "\
     ${WLAN_COMMON} \
-    ${BLUETOOTH_STACK} \
-    ${FIRMWARE_AND_DRIVERS} \
+    ${WLAN_TI} \
+    ${BT_COMMON} \
+    ${BT_TI} \
+"
+
+CONNECTIVITY_RDEPENDS_append_k3 = "\
+    ${WLAN_COMMON} \
+    ${BT_COMMON} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


