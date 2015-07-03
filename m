Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id E68EF52ABB
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:25 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00JPJ5RTO330@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ff9QsBkF c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=A4XlS-OwJD9JVlngPSoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4B072161AD2;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:35 -0400
Message-id: <1435892533-6046-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 16/54] packagegroup: now setting PACKAGE_ARCH must be before inherit packagegroup
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb     | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb           | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb        | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb            | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb            | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb           | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb        | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb    | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb | 6 +++---
 .../packagegroup-arago-tisdk-connectivity-sdk-target.bb             | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb          | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb       | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb     | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb   | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb     | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb   | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb       | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb   | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb            | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb          | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb      | 6 +++---
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb      | 6 +++---
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb        | 6 +++---
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb       | 6 +++---
 30 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 879b761..73e0928 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
-
-inherit packagegroup
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 ARAGO_LIBNL = "\
     libnl-route \
     libnl-nf \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 24e185c..5b4ced1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
-PR = "r7"
-
-inherit packagegroup
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 ARAGO_ALSA_BASE = "\
     alsa-lib \
     alsa-utils-aplay \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index d706938..c9d088d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
-PR = "r10"
-
-inherit packagegroup
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # alsa-utils-alsamixer depends on ncurses
 ARAGO_ALSA_EXTRA = "\
     alsa-conf \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 780363a..6484759 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r9"
-
-inherit packagegroup
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 GST_010_DEPS = " \
     gstreamer-dev \
     gst-plugins-base-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index b449dfe..4e33cc9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r12"
-
-inherit packagegroup
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 GST_010_DEPS = " \
     gstreamer \
     gst-plugins-base \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 149dfac..5ac3e74 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r9"
-
-inherit packagegroup
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 QT4_SGX_SUPPORT = "\
     qt4-embedded-plugin-gfxdriver-gfxpvregl \
     libqt-embeddedopengl4 \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 568dbae..82f86cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r29"
-
-inherit packagegroup
+PR = "r30"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 ARAGO_TEST = "\
     bonnie++ \
     hdparm \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c60bb7b..e1a5ed0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r10"
-
-inherit packagegroup
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 UTILS = " \
     am-sysinfo-src \
     arm-benchmarks-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9037ea1..f34c299 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r8"
-
-inherit packagegroup
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 UTILS = "libdrm-dev"
 
 UTILS_append_omap3 = " canutils-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5f0198a..7436503 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r26"
-
-inherit packagegroup
+PR = "r27"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 UTILS = " \
     am-sysinfo \
     dt \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 22bdf36..60e2234 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r21"
-
-inherit packagegroup
+PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # Choose the kernel and u-boot recipe sources to use
 
 U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index a239e64..42c6aef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
-PR = "r10"
-
-inherit packagegroup
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # Out of Box Experience (OOBE)
 OOBE = ""
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 5b6f223..b65657a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r11"
-
-inherit packagegroup
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 FIRMWARE_AND_DRIVERS_SRC = "\
     ti-compat-wireless-wl18xx-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index 540bc80..8b8a953 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install wireless headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r7"
-
-inherit packagegroup
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 BLUETOOTH_STACK = "\
     bluez4-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index f157676..ed90740 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r32"
-
-inherit packagegroup
+PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # WLAN support packages.
 # These are the packages that all platforms use for WLAN support
 WLAN_COMMON = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 492e174..b572e6a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r6"
-
-inherit packagegroup
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 CRYPTO_RDEPENDS = ""
 
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 0b4a6cd..1cd6d99 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r4"
-
-inherit packagegroup
+PR = "r5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 CRYPTO_API = ""
 CRYPTO_API_ti33x = "cryptodev-module-dev"
 CRYPTO_API_ti43x = "cryptodev-module-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 53a914b..60a4657 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r6"
-
-inherit packagegroup
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # Add openssl-misc to get the openssl.cnf file which is
 # needed for "openssl req" and to avoid warnings.
 # NOTE: This may change to openssl-conf in the future
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 1ea3cf6..1b0fc85 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r0"
-
-inherit packagegroup
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 GRAPHICS_RDEPENDS = ""
 
 GRAPHICS_RDEPENDS_append_ti33x = " omap3-sgx-modules-src"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 9b1ba93..d36da7e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r4"
-
-inherit packagegroup
+PR = "r5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 GRAPHICS_RDEPENDS = ""
 
 GRAPHICS_RDEPENDS_ti33x = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 327a11b..7e3bc82 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r8"
-
-inherit packagegroup
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 GRAPHICS_WESTON = "\
     weston \
     weston-init \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 1a4c41c..29872d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
 LICENSE = "MIT"
-PR = "r4"
-
-inherit packagegroup
+PR = "r5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 MATRIX_GUI = " \
     matrix-gui-browser-src \
     refresh-screen-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 8400ef5..d2c26b9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r39"
-
-inherit packagegroup
+PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 MATRIX_ESSENTIALS = "        \
     matrix-gui               \
     matrix-lighttpd-config   \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 8f7c4fe..8a728f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r7"
-
-inherit packagegroup
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 MULTIMEDIA = ""
 
 MULTIMEDIA_append_am37x-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 64d0d2c..9d5ddc3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r12"
-
-inherit packagegroup
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 MULTIMEDIA = ""
 
 MULTIMEDIA_append_omap3 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index b6ddb32..5d596f8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r6"
-
-inherit packagegroup
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 QT4_DEMOS = "\
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
     qt-tstat-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index ac84008..6fdccf1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r12"
-
-inherit packagegroup
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 QT4_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 43623b6..fc8506d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r6"
-
-inherit packagegroup
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 QT_TOOLCHAIN_TARGET = "\
     packagegroup-arago-qte-toolchain-target \
 "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index f2b542b..74d6dd0 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r8"
-
-inherit packagegroup
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 QT4_SGX_SUPPORT = "\
         libqt-embeddedopengl4-dev \
         libqt-embeddedpvrqwswsegl4-dev \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 5696dec..b72f25e 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r7"
+PR = "r9"
 LICENSE = "MIT"
 
-inherit packagegroup
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
-- 
2.2.0


