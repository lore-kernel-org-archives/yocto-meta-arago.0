Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 87F84529A9
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2014 23:57:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0GNvnYm019244
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvn8h003993
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2014 17:57:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 Jan 2014 17:57:49 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0GNvfd5003746;
	Thu, 16 Jan 2014 17:57:47 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2014 19:19:08 -0600
Message-ID: <1389921550-8122-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389921550-8122-1-git-send-email-fcooper@ti.com>
References: <1389921550-8122-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/5] Remove all Wilink bluetooth references from packagegroups and other recipes.
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
X-List-Received-Date: Thu, 16 Jan 2014 23:57:50 -0000
Content-Type: text/plain

* Wilink going forward will not support bluetooth via bluez.
* Remove all references to these recipes from other packagegroups and other sdk
  recipes.
---
 .../conf/distro/arago-source-ipk.conf              |    9 ---
 .../conf/distro/include/arago-prefs.inc            |    2 -
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    7 +--
 ...agegroup-arago-tisdk-connectivity-sdk-target.bb |   11 +---
 .../packagegroup-arago-tisdk-connectivity.bb       |   24 +--------
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +-
 .../ti-tisdk-makefile/Makefile_wireless            |   54 +------------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 8 files changed, 10 insertions(+), 103 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 9b78258..bdee5d1 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -88,18 +88,9 @@ SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples = "example-applications/pru-${PV}"
 CREATE_SRCIPK_pn-ti-ocf-crypto-module = "1"
 SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-bt-enable = "1"
-SRCIPK_INSTALL_DIR_pn-bt-enable = "board-support/extra-drivers/${PN}-${PV}"
-
-CREATE_SRCIPK_pn-bt-firmware = "1"
-SRCIPK_INSTALL_DIR_pn-bt-firmware = "board-support/extra-drivers/${PN}-${PV}"
-
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-ti-compat-bluetooth = "1"
-SRCIPK_INSTALL_DIR_pn-ti-compat-bluetooth = "board-support/extra-drivers/${PN}-${PV}"
-
 CREATE_SRCIPK_pn-wl18xx-firmware = "1"
 SRCIPK_INSTALL_DIR_pn-wl18xx-firmware = "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e1da2e9..8a2d7de 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -88,8 +88,6 @@ PREFERRED_VERSION_readline-nativesdk = "5.2"
 PREFERRED_VERSION_libnl = "3.2.21"
 PREFERRED_VERSION_crda = "1.1.3"
 PREFERRED_VERSION_obex = "0.34"
-PREFERRED_VERSION_bluez4 = "4.101"
-PREFERRED_VERSION_bluez-hcidump = "2.2"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 50ca1bc..4ebfe15 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,17 +1,12 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Further breaks to resolve
-#    ti-compat-bluetooth-src
-
 FIRMWARE_AND_DRIVERS_SRC = "\
-    bt-firmware-src \
-    bt-enable-src \
     wl18xx-firmware-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index b920770..28304c6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,21 +1,14 @@
-DESCRIPTION = "Task to install wlan and bluetooth headers and libraries into the SDK"
+DESCRIPTION = "Task to install wlan headers and libraries into the SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Bluetooth development packages
-BLUETOOTH_STACK = "\
-    bluez4-dev \
-    openobex-dev \
-"
-
 CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x  = "\
-    ${BLUETOOTH_STACK} \
     wpa-supplicant-wl18xx-dev \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index fd71494..0cdc480 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
-DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
+DESCRIPTION = "Task to install wlan packages into the target FS"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 inherit packagegroup
 
@@ -13,14 +13,11 @@ WLAN_COMMON = "\
     htop \
     iw \
     softap-udhcpd-config \
-    bluez-tools \
     obexd \
     obex-client \
     pulseaudio \
     pulseaudio-server \
     pulseaudio-module-loopback \
-    pulseaudio-module-bluetooth-discover \
-    pulseaudio-module-bluetooth-device \
     eventdump \
     wlconf \
     wpa-supplicant-wl18xx \
@@ -28,31 +25,15 @@ WLAN_COMMON = "\
     hostap-daemon-wl18xx \
     ti-wifi-utils-wl18xx \
 "
-# No bluetooth/bluetooth.h
 
 # netperf has non-standard license, needs verifying
 #    netperf
 
-# Further breaks to resolve
-#    ti-compat-bluetooth
-
 FIRMWARE_AND_DRIVERS = "\
     wl18xx-firmware \
 "
 
-BLUETOOTH_STACK = "\
-    bluez4 \
-    bluez4-agent \
-    libasound-module-bluez \
-    bluez-hcidump \
-    openobex \
-    openobex-apps \
-    obexftp \
-    ussp-push \
-"
-
 DEMO_APPS = "\
-    bluetooth-gui \
     wpa-gui-e \
 "
 
@@ -60,7 +41,6 @@ CONNECTIVITY_RDEPENDS = ""
 
 CONNECTIVITY_RDEPENDS_ti33x = "\
     ${WLAN_COMMON} \
-    ${BLUETOOTH_STACK} \
     ${DEMO_APPS} \
     ${FIRMWARE_AND_DRIVERS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 311ad2e..b8b3217 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 inherit packagegroup
 
@@ -65,7 +65,6 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-clocks               \
                                     \
     matrix-gui-wifi-demos           \
-    matrix-gui-bluetooth-demos      \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -116,7 +115,6 @@ MATRIX_APPS_append_am37x-evm = "    \
 "
 
 MATRIX_APPS_append_am180x-evm = "   \
-    matrix-gui-bluetooth-demos      \
     matrix-gui-pru-demos            \
 "
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
index 708c0ad..de99463 100755
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -1,55 +1,13 @@
 # Wireless build targets
-wireless: compat-modules bt-firmware bt-enable
-wireless_install: compat-modules_install bt-firmware_install bt-enable_install
-wireless_clean: compat-modules_clean bt-firmware_clean bt-enable_clean
-
-bt-firmware:
-	@echo ============================
-	@echo      Building bt-firmware
-	@echo ============================
-	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
-
-bt-firmware_install:
-	@echo ==============================
-	@echo      Installing bt-firmware
-	@echo ==============================
-	@cd board-support/extra-drivers; cd `find . -name "*bt-firmware*"`; make DEST_DIR=${DESTDIR} BASE_LIB_DIR="/lib" PLATFORM=${PLATFORM} install
-
-bt-firmware_clean:
-	@echo ============================
-	@echo      Cleaning bt-firmware
-	@echo ============================
-	@echo    NOTHING TO DO.
-
-bt-enable: linux
-	@echo ===========================
-	@echo      Building bt-enable
-	@echo ===========================
-	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
-	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM}
-
-bt-enable_install:
-	@echo ============================
-	@echo      Installing bt-enable
-	@echo ============================
-	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
-	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM} install
-
-bt-enable_clean:
-	@echo ===========================
-	@echo      Cleaning bt-enable
-	@echo ===========================
-	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
-	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM} clean
+wireless: compat-modules
+wireless_install: compat-modules_install
+wireless_clean: compat-modules_clean
 
 compat-modules: linux
 	@echo ================================
 	@echo      Building compat-modules
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
-	./scripts/driver-select bt; make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm; \
-	cd ..; \
 	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
 	./scripts/driver-select wl12xx; make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm
 
@@ -58,9 +16,6 @@ compat-modules_install:
 	@echo      Installing compat-modules
 	@echo ==================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
-	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm install-modules; \
-	cd ..; \
 	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
 	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm install-modules
 
@@ -69,8 +24,5 @@ compat-modules_clean:
 	@echo      Cleaning compat-wireless
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
-	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean; \
-	cd ..; \
 	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
 	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 913553a..ed23f98 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r21"
+PR = "r22"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


