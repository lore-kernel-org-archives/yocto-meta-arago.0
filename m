Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A34A252AA4
	for <meta-arago@arago-project.org>;
	Wed, 25 Jan 2017 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE6CE20B1D;
	Wed, 25 Jan 2017 21:53:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pMWdhiqVVuNc; Wed, 25 Jan 2017 21:53:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8E1A5208B1;
	Wed, 25 Jan 2017 21:53:39 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id ACB8816231F;
	Wed, 25 Jan 2017 16:53:38 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 25 Jan 2017 16:53:29 -0500
Message-Id: <1485381209-14755-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf, packagegroups: switch from bluez4 to bluez5
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
X-List-Received-Date: Wed, 25 Jan 2017 21:53:40 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                   |  1 -
 .../packagegroup-arago-tisdk-connectivity-sdk-target.bb    |  4 ++--
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb | 14 ++++++--------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1adb9c9..d0aa532 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -57,7 +57,6 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 # Remove some unwanted features
 DISTRO_FEATURES_remove = "x11"
-DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
 
 # Add additional distro features
 DISTRO_FEATURES_append = " pam wayland opengl systemd"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index 8b8a953..3380913 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Task to install wireless headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
 BLUETOOTH_STACK = "\
-    bluez4-dev \
+    bluez5-dev \
 "
 
 CONNECTIVITY_RDEPENDS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 1bf84b7..f64998c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r35"
+PR = "r36"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,8 +12,6 @@ WLAN_COMMON = "\
     wireless-tools \
     iw \
     softap-udhcpd-config \
-    obexd \
-    obex-client \
     pulseaudio \
     pulseaudio-server \
     pulseaudio-module-loopback \
@@ -31,6 +29,7 @@ WLAN_COMMON = "\
 
 FIRMWARE_AND_DRIVERS = "\
     wl18xx-firmware \
+    bt-firmware \
 "
 
 DEMO_APPS = "\
@@ -38,9 +37,10 @@ DEMO_APPS = "\
 "
 
 BLUETOOTH_STACK = "\
-    bluez4 \
-    bluez4-agent \
-    bluez-hcidump \
+    bluez5 \
+    bluez5-obex \
+    bluez5-noinst-tools \
+    bluez5-testtools \
     uim \
 "
 
@@ -56,7 +56,6 @@ CONNECTIVITY_RDEPENDS_append_ti33x = "\
     ${DEMO_APPS} \
     ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
-    bt-firmware \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti43x = "\
@@ -70,7 +69,6 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
     ${FIRMWARE_AND_DRIVERS} \
-    bt-firmware \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


