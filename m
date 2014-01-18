Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 41EAD529A5
	for <meta-arago@arago-project.org>;
	Sat, 18 Jan 2014 00:01:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0I01lII027947
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 18:01:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0I01l4c004068
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2014 18:01:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 18:01:46 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0I01f7p024292;
	Fri, 17 Jan 2014 18:01:45 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Jan 2014 19:23:33 -0600
Message-ID: <1390008213-5559-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390008213-5559-1-git-send-email-fcooper@ti.com>
References: <1390008213-5559-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] ti-tisdk-makefile: Add Wilink 8 wireless firmware
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
X-List-Received-Date: Sat, 18 Jan 2014 00:01:48 -0000
Content-Type: text/plain

* Current 3.12 kernel no longer requires compat-wireless but does require a
  firmware to be installed.
* Remove compat-wireless from the top level makefile and replace it with the
  wireless firmware.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_wireless            |   30 ++++++++-----------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 14 insertions(+), 18 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
old mode 100755
new mode 100644
index de99463..a3c7463
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -1,28 +1,24 @@
 # Wireless build targets
-wireless: compat-modules
-wireless_install: compat-modules_install
-wireless_clean: compat-modules_clean
+wireless: wifi-firmware
+wireless_install: wifi-firmware_install
+wireless_clean: wifi-firmware_clean
 
-compat-modules: linux
+wifi-firmware:
 	@echo ================================
-	@echo      Building compat-modules
+	@echo      Building wifi firmware
 	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	./scripts/driver-select wl12xx; make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm
+	@echo "Nothing to do"
 
-compat-modules_install:
+wifi-firmware_install:
 	@echo ==================================
-	@echo      Installing compat-modules
+	@echo      Installing wifi firmware
 	@echo ==================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm install-modules
+	cd `find . -maxdepth 1 -name "wl18xx-firmware*"`; \
+	make DEST_DIR=${DESTDIR} install
 
-compat-modules_clean:
+wifi-firmware_clean:
 	@echo ================================
-	@echo      Cleaning compat-wireless
+	@echo      Cleaning wifi firmware
 	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean
+	@echo "Nothing to do" 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 34a53b6..ada51b5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r23"
+PR = "r24"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


