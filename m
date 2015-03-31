Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5C2C352A44
	for <meta-arago@arago-project.org>;
	Tue, 31 Mar 2015 16:05:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2VG5rKp013409
	for <meta-arago@arago-project.org>; Tue, 31 Mar 2015 11:05:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2VG5qu6008681
	for <meta-arago@arago-project.org>; Tue, 31 Mar 2015 11:05:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 31 Mar 2015 11:05:52 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2VG5qS4002010;
	Tue, 31 Mar 2015 11:05:52 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Ycyfo-0002XV-1C;
	Tue, 31 Mar 2015 12:05:52 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Mar 2015 12:05:48 -0400
Message-ID: <1427817948-9729-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] wl18xx-firmware-src: Remove from SDK.
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
X-List-Received-Date: Tue, 31 Mar 2015 16:05:54 -0000
Content-Type: text/plain

* Firmware source is not provided by this package so there is no
  reason to include it.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: PR bumps.

 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 +--
 .../ti-tisdk-makefile/Makefile_wireless            |   26 +++-----------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
index 3862816..5b6f223 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "Task to install wlan and bluetooth sources into the SDK"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FIRMWARE_AND_DRIVERS_SRC = "\
-    wl18xx-firmware-src \
     ti-compat-wireless-wl18xx-src \
 "
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
index 5d7267e..b4ae858 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -1,26 +1,6 @@
-wireless: wifi-firmware compat-modules
-wireless_install: wifi-firmware_install compat-modules_install
-wireless_clean: wifi-firmware_clean compat-modules_clean
-
-wifi-firmware:
-	@echo ================================
-	@echo      Building wifi firmware
-	@echo ================================
-	@echo "Nothing to do"
-
-wifi-firmware_install:
-	@echo ==================================
-	@echo      Installing wifi firmware
-	@echo ==================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "wl18xx-firmware*"`; \
-	make DEST_DIR=${DESTDIR} install
-
-wifi-firmware_clean:
-	@echo ================================
-	@echo      Cleaning wifi firmware
-	@echo ================================
-	@echo "Nothing to do" 
+wireless: compat-modules
+wireless_install: compat-modules_install
+wireless_clean: compat-modules_clean
 
 compat-modules: linux
 	@echo ================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index ffedd4c..9bc1853 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r41"
+PR = "r42"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.9.5


