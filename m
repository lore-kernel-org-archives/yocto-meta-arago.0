Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 99F1452A62
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2015 15:46:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t22FkBPE013663
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 09:46:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t22FkAVB019498
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 09:46:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Mar 2015 09:46:10 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t22FkAFG009892;	Mon, 2 Mar 2015 09:46:10 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YSSXp-0000Bj-V1;
	Mon, 02 Mar 2015 10:46:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Mar 2015 10:46:07 -0500
Message-ID: <1425311167-690-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
References: <1425311167-690-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-tisdk-makefile: Add wl18xx driver targets.
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
X-List-Received-Date: Mon, 02 Mar 2015 15:46:12 -0000
Content-Type: text/plain

From: Jake Stiffler <j-stiffler@ti.com>

* Enables the wl18xx drivers to be built from the SDK Makefile.

Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_wireless            |   33 +++++++++++++++++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
index a3c7463..00a1931 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -1,7 +1,6 @@
-# Wireless build targets
-wireless: wifi-firmware
-wireless_install: wifi-firmware_install
-wireless_clean: wifi-firmware_clean
+wireless: wifi-firmware compat-modules
+wireless_install: wifi-firmware_install compat-modules_install
+wireless_clean: wifi-firmware_clean compat-modules_clean
 
 wifi-firmware:
 	@echo ================================
@@ -22,3 +21,29 @@ wifi-firmware_clean:
 	@echo      Cleaning wifi firmware
 	@echo ================================
 	@echo "Nothing to do" 
+
+compat-modules: linux
+	@echo ================================
+	@echo      Building compat-modules
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CC="cc" defconfig-wl18xx; \
+	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm
+
+compat-modules_install:
+	@echo ================================
+	@echo      Installing compat-modules
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm modules_install
+
+compat-modules_clean:
+	@echo ================================
+	@echo      Cleaning compat-modules
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 578dcf3..a39f7db 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r39"
+PR = "r40"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.9.5


