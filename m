Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D365452985
	for <meta-arago@arago-project.org>;
	Thu, 18 Jul 2019 14:29:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6IESUo8071366
	for <meta-arago@arago-project.org>; Thu, 18 Jul 2019 09:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563460110;
	bh=KO2Euk/eQschXoc9SMx09AU4zhER5rnhSe5NpM4fLT4=;
	h=From:To:CC:Subject:Date;
	b=nNgFv8ZL8s8NMhoNsA8oJuQaZSjTghf/jP1YfysNKVKziBFbYVDa/71cCXCjVn71K
	vXVCCOYCDAwu9AF+KRFvw4PEVYJHt+3EZ2HmLfX1ZmEY1KDoKGVjd82u8gPcIzKDRx
	pQnucrNrU+hwbyI2aPjAGf2bhRLQ3y7YJgD6g6IU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6IESU7O028845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 18 Jul 2019 09:28:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 18 Jul 2019 09:28:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 18 Jul 2019 09:28:30 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6IESTAN086004;
	Thu, 18 Jul 2019 09:28:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 18 Jul 2019 10:11:49 -0400
Message-ID: <1563459109-25576-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-makefile: Makefiles: ensure find returns a directory
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
X-List-Received-Date: Thu, 18 Jul 2019 14:29:21 -0000
Content-Type: text/plain

* Make sure that the path that find returns is a directory for us to
  cd into, and while were at it, make sure that it is at the correct
  depth.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_am-sysinfo                  |  8 ++++----
 .../ti-tisdk-makefile/Makefile_arm-benchmarks              |  8 ++++----
 .../ti-tisdk-makefile/Makefile_av-examples                 |  8 ++++----
 .../ti-tisdk-makefile/Makefile_barcode-roi                 |  6 +++---
 .../ti-tisdk-makefile/Makefile_boot-monitor                |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod  |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev |  6 +++---
 .../ti-tisdk-makefile/Makefile_debugss-module-drv          |  6 +++---
 .../ti-tisdk-makefile/Makefile_dual-camera-demo            |  8 ++++----
 .../ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv   |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod |  6 +++---
 .../ti-tisdk-makefile/Makefile_image-gallery               |  8 ++++----
 .../ti-tisdk-makefile/Makefile_ipsecmgr-mod                |  6 +++---
 .../ti-tisdk-makefile/Makefile_linalg-examples             |  6 +++---
 .../ti-tisdk-makefile/Makefile_matrix-gui                  |  2 +-
 .../ti-tisdk-makefile/Makefile_matrix-gui-browser          |  8 ++++----
 .../ti-tisdk-makefile/Makefile_mmwavegesture-hmi           |  8 ++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf  |  6 +++---
 .../ti-tisdk-makefile/Makefile_opencl-examples             |  6 +++---
 .../ti-tisdk-makefile/Makefile_openmpacc-examples          |  6 +++---
 .../ti-tisdk-makefile/Makefile_oprofile-example            |  6 +++---
 .../ti-tisdk-makefile/Makefile_pdm-anomaly-detection       |  8 ++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru       |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss  | 14 +++++++-------
 .../Makefile_qt-opencv-opencl-opengl-multithreaded         |  8 ++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat  |  8 ++++----
 .../ti-tisdk-makefile/Makefile_quick-playground            |  8 ++++----
 .../ti-tisdk-makefile/Makefile_refresh-screen              |  8 ++++----
 .../ti-tisdk-makefile/Makefile_sysfw-image                 |  4 ++--
 .../ti-tisdk-makefile/Makefile_ti-crypto-examples          |  8 ++++----
 .../ti-tisdk-makefile/Makefile_ti-gc320-driver             |  6 +++---
 .../ti-tisdk-makefile/Makefile_ti-ocf-crypto-module        |  6 +++---
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km               |  6 +++---
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3            |  6 +++---
 .../ti-tisdk-makefile/Makefile_uio-module-drv              |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb             |  2 +-
 36 files changed, 120 insertions(+), 120 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
index e198350..20f7af3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
@@ -3,22 +3,22 @@ am-sysinfo:
 	@echo =============================
 	@echo    Building AM Sysinfo
 	@echo =============================
-	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make CC="$(CC)"
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sysinfo*"`; make CC="$(CC)"
 
 am-sysinfo_clean:
 	@echo =============================
 	@echo    Cleaning AM Sysinfo
 	@echo =============================
-	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sysinfo*"`; make clean
 
 am-sysinfo_install:
 	@echo ===============================================
 	@echo     Installing AM Sysinfo - Release version
 	@echo ===============================================
-	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sysinfo*"`; make install
 
 am-sysinfo_install_debug:
 	@echo =============================================
 	@echo     Installing AM Sysinfo - Debug version
 	@echo =============================================
-	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sysinfo*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
index 9a1f8aa..fa8455c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
@@ -3,22 +3,22 @@ arm-benchmarks:
 	@echo =============================
 	@echo    Building ARM Benchmarks
 	@echo =============================
-	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make CC="$(CC)"
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-benchmarks*"`; make CC="$(CC)"
 
 arm-benchmarks_clean:
 	@echo =============================
 	@echo    Cleaning ARM Benchmarks
 	@echo =============================
-	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-benchmarks*"`; make clean
 
 arm-benchmarks_install:
 	@echo ==============================================
 	@echo   Installing ARM Benchmarks - Release version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-benchmarks*"`; make install
 
 arm-benchmarks_install_debug:
 	@echo ============================================
 	@echo   Installing ARM Benchmarks - Debug Version
 	@echo ============================================
-	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-benchmarks*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
index 870e8c7..1be5341 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
@@ -3,22 +3,22 @@ av-examples:
 	@echo =============================
 	@echo    Building AV Examples
 	@echo =============================
-	@cd example-applications; cd `find . -name "*av-examples*"`; make
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-examples*"`; make
 
 av-examples_clean:
 	@echo =============================
 	@echo    Cleaning AV Examples
 	@echo =============================
-	@cd example-applications; cd `find . -name "*av-examples*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-examples*"`; make clean
 
 av-examples_install:
 	@echo ==============================================
 	@echo    Installing AV Examples - Release version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*av-examples*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-examples*"`; make install
 
 av-examples_install_debug:
 	@echo ============================================
 	@echo    Installing AV Examples - Debug version
 	@echo ============================================
-	@cd example-applications; cd `find . -name "*av-examples*"`; make install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
index 7d7ae56..da97c40 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
@@ -4,16 +4,16 @@ barcode-roi:
 	@echo =============================
 	@echo    Building Barcode ROI
 	@echo =============================
-	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcode-roi*"`; make -f Makefile.build release
 
 barcode-roi_clean:
 	@echo =============================
 	@echo    Cleaning Barcode ROI
 	@echo =============================
-	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcode-roi*"`; make -f Makefile.build clean
 
 barcode-roi_install:
 	@echo ================================================
 	@echo   Installing Barcode ROI - Release version
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcode-roi*"`; make -f Makefile.build install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
index 03f3f92..fa1d851 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
@@ -3,7 +3,7 @@ boot-monitor:
 	@echo      Building boot-monitor
 	@echo ================================
 	@cd board-support; \
-	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
 	make image___BOOT_MONITOR_MAKE_TARGET__
 
 boot-monitor_clean:
@@ -11,7 +11,7 @@ boot-monitor_clean:
 	@echo      Cleaning boot-monitor
 	@echo ================================
 	@cd board-support; \
-	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
 	make clean
 
 boot-monitor_install:
@@ -24,7 +24,7 @@ boot-monitor_install:
 		exit 1; \
 	fi
 	@cd board-support; \
-	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
 	install -d $(DESTDIR)/boot; \
 	install -m 0644 ./skern-__BOOT_MONITOR_MAKE_TARGET__.bin $(DESTDIR)/boot
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
index 8cd34b1..cbb86aa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
@@ -4,7 +4,7 @@ cmem-mod: linux
 	@echo     Building CMEM Module
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
 
@@ -13,7 +13,7 @@ cmem-mod_clean:
 	@echo     Cleaning CMEM Module
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
 
@@ -27,7 +27,7 @@ cmem-mod_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
index db89c5e..d42652e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
@@ -3,7 +3,7 @@ cryptodev: linux
 	@echo      Building cryptodev-linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)
 
 cryptodev_clean:
@@ -11,7 +11,7 @@ cryptodev_clean:
 	@echo      Cleaning cryptodev-linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 cryptodev_install:
@@ -24,5 +24,5 @@ cryptodev_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
 	make ARCH=__KERNEL_ARCH__  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
index 078d579..6af8231 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
@@ -3,7 +3,7 @@ debugss-module-drv: linux
 	@echo      Building debugss-module-drv
 	@echo =======================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "debugss*"`; \
+	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__
 
 debugss-module-drv_clean:
@@ -11,7 +11,7 @@ debugss-module-drv_clean:
 	@echo      Cleaning debugss-module-drv
 	@echo =======================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "debugss*"`; \
+	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__ clean
 
 debugss-module-drv_install:
@@ -24,6 +24,6 @@ debugss-module-drv_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "debugss*"`; \
+	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
 	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
index bd99075..219fcdd 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
@@ -3,22 +3,22 @@ dual-camera-demo:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-camera-demo*"`; make -f Makefile.build
 
 dual-camera-demo_clean:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-camera-demo*"`; make -f Makefile.build clean
 
 dual-camera-demo_install:
 	@echo ===================================================
 	@echo   Installing Dual Camera Demo - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-camera-demo*"`; make -f Makefile.build install
 
 dual-camera-demo_install_debug:
 	@echo =================================================
 	@echo   Installing Dual Camera Demo - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-camera-demo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
index 3333910..5ac4aee 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
@@ -3,7 +3,7 @@ gdbserverproxy-module-drv: linux
 	@echo      Building gdbserverproxy-module-drv
 	@echo ==============================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__
 
 gdbserverproxy-module-drv_clean:
@@ -11,7 +11,7 @@ gdbserverproxy-module-drv_clean:
 	@echo      Cleaning gdbserverproxy-module-drv
 	@echo ==============================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__ clean
 
 gdbserverproxy-module-drv_install:
@@ -24,6 +24,6 @@ gdbserverproxy-module-drv_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
 	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
index bd273f8..2b26fdf 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
@@ -3,7 +3,7 @@ hplib-mod: linux
 	@echo      Building hplib-mod
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
 	make -C module ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 hplib-mod_clean:
@@ -11,7 +11,7 @@ hplib-mod_clean:
 	@echo      Cleaning hplib-mod
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
 	make -C module ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 hplib-mod_install:
@@ -24,5 +24,5 @@ hplib-mod_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
 	make -C module ARCH=__KERNEL_ARCH__  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
index df843fb..abd1690 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
@@ -3,22 +3,22 @@ image-gallery:
 	@echo ================================
 	@echo    Building Image Gallery
 	@echo ================================
-	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-gallery*"`; make -f Makefile.build
 
 image-gallery_clean:
 	@echo ================================
 	@echo    Building Image Gallery
 	@echo ================================
-	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-gallery*"`; make -f Makefile.build clean
 
 image-gallery_install:
 	@echo ===================================================
 	@echo   Installing Image Gallery - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-gallery*"`; make -f Makefile.build install
 
 image-gallery_install_debug:
 	@echo =================================================
 	@echo   Installing Dual Camera Demo - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*image-galleryo*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-galleryo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
index 7ce0dcf..557a439 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
@@ -3,7 +3,7 @@ ipsecmgr-mod: linux
 	@echo      Building ipsecmgr-mod
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
 	make ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 ipsecmgr-mod_clean:
@@ -11,7 +11,7 @@ ipsecmgr-mod_clean:
 	@echo      Cleaning ipsecmgr-mod
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
 	make ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 ipsecmgr-mod_install:
@@ -24,5 +24,5 @@ ipsecmgr-mod_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
 	make ARCH=__KERNEL_ARCH__  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
index 19c182f..f755db9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
@@ -3,7 +3,7 @@ linalg-examples:
 	@echo     Building the Linalg Examples
 	@echo =====================================
 	@cd example-applications; \
-	cd `find . -name "*linalg-examples*"`; \
+	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
 	. $(ENV_SETUP); \
 	make TARGET_ROOTDIR=$(SDK_PATH_TARGET) \
 		TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x \
@@ -19,7 +19,7 @@ linalg-examples_install:
 		exit 1; \
 	fi
 	@cd example-applications; \
-	cd `find . -name "*linalg-examples*"`; \
+	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
 	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
 		install -d $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example}` ; \
 		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example}` ; \
@@ -33,7 +33,7 @@ linalg-examples_clean:
 	@echo     Cleaning the Linalg Examples
 	@echo =======================================
 	@cd example-applications; \
-	cd `find . -name "*linalg-examples*"`; \
+	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
 	. $(ENV_SETUP); \
 	make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
index 7b5f30f..1c88de2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
@@ -15,4 +15,4 @@ matrix-gui_install:
 	@echo =============================
 	@echo     Installing Matrix GUI
 	@echo =============================
-	@cd example-applications; cd `find . -name "*matrix-gui-2.0*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix-gui-2.0*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
index 2fc3b21..c568692 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
@@ -3,22 +3,22 @@ matrix-gui-browser:
 	@echo =================================
 	@echo    Building Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix-gui-browser*"`; make -f Makefile.build release
 
 matrix-gui-browser_clean:
 	@echo =================================
 	@echo    Cleaning Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix-gui-browser*"`; make -f Makefile.build clean
 
 matrix-gui-browser_install:
 	@echo ===================================================
 	@echo   Installing Matrix GUI Browser - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix-gui-browser*"`; make -f Makefile.build install
 
 matrix-gui-browser_install_debug:
 	@echo =================================================
 	@echo   Installing Matrix GUI Browser - Debug Version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix-gui-browser*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
index f575625..5156211 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
@@ -3,22 +3,22 @@ mmwavegesture-hmi:
 	@echo ================================
 	@echo    Building mmWave Gesture HMI Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwavegesture-hmi*"`; make -f Makefile.build
 
 mmwavegesture-hmi_clean:
 	@echo ================================
 	@echo    Building mmWave Gesture HMI Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwavegesture-hmi*"`; make -f Makefile.build clean
 
 mmwavegesture-hmi_install:
 	@echo ===================================================
 	@echo   Installing mmWave Gesture HMI Demo - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwavegesture-hmi*"`; make -f Makefile.build install
 
 mmwavegesture-hmi_install_debug:
 	@echo =================================================
 	@echo   Installing mmWave Gesture HMI Demo - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwavegesture-hmi*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
index 9a8e69a..d18e515 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
@@ -3,17 +3,17 @@ omapconf:
 	@echo =======================
 	@echo    Building OmapConf
 	@echo =======================
-	@cd example-applications; cd `find . -name "*omapconf*"`; make CROSS_COMPILE=${CROSS_COMPILE} omapconf
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapconf*"`; make CROSS_COMPILE=${CROSS_COMPILE} omapconf
 
 omapconf_clean:
 	@echo =======================
 	@echo    Cleaning OmapConf
 	@echo =======================
-	@cd example-applications; cd `find . -name "*omapconf*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapconf*"`; make clean
 
 omapconf_install:
 	@echo ==========================================
 	@echo   Installing OmapConf - Release version
 	@echo ==========================================
-	@cd example-applications; cd `find . -name "*omapconf*"`; make DESTDIR=${DESTDIR}/usr/bin install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapconf*"`; make DESTDIR=${DESTDIR}/usr/bin install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
index 0b8aa96..5e98446 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
@@ -3,7 +3,7 @@ opencl-examples:
 	@echo =====================================
 	@echo     Building the OpenCL Examples
 	@echo =====================================
-	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x EXAMPLE_SET=EXCLUDE_PERSISTENT
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x EXAMPLE_SET=EXCLUDE_PERSISTENT
 
 opencl-examples_install:
 	@echo =======================================
@@ -15,7 +15,7 @@ opencl-examples_install:
 		exit 1; \
 	fi
 	@cd example-applications; \
-	cd `find . -name "*opencl-examples*"`; \
+	cd `find . -maxdepth 1 -type d -name "*opencl-examples*"`; \
 	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
 		install -d $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example}` ; \
 		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example}` ; \
@@ -28,5 +28,5 @@ opencl-examples_clean:
 	@echo =======================================
 	@echo     Cleaning the OpenCL Examples
 	@echo =======================================
-	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
index e1842ba..44ba30c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
@@ -3,7 +3,7 @@ openmpacc-examples:
 	@echo ================================================
 	@echo     Building the OpenMP Accelerator Examples
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
 
 openmpacc-examples_install:
 	@echo ==================================================
@@ -15,7 +15,7 @@ openmpacc-examples_install:
 		exit 1; \
 	fi
 	@cd example-applications; \
-	cd `find . -name "*openmpacc-examples*"`; \
+	cd `find . -maxdepth 1 -type d -name "*openmpacc-examples*"`; \
 	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
 		install -d $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${example}` ; \
 		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${example}` ; \
@@ -28,5 +28,5 @@ openmpacc-examples_clean:
 	@echo ==================================================
 	@echo     Cleaning the OpenMP Accelerator Examples
 	@echo ==================================================
-	@cd example-applications; cd `find . -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
index 1e4793b..886ea62 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
@@ -3,16 +3,16 @@ oprofile-example:
 	@echo =============================
 	@echo    Building OProfile Example
 	@echo =============================
-	@cd example-applications; cd `find . -name "*oprofile-example*"`; make CC="$(CC)"
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofile-example*"`; make CC="$(CC)"
 
 oprofile-example_clean:
 	@echo =============================
 	@echo    Cleaning OProfile Example
 	@echo =============================
-	@cd example-applications; cd `find . -name "*oprofile-example*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofile-example*"`; make clean
 
 oprofile-example_install:
 	@echo =============================================
 	@echo     Installing OProfile Example - Debug version
 	@echo =============================================
-	@cd example-applications; cd `find . -name "*oprofile-example*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofile-example*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
index a972c9d..ad4a3c8 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
@@ -3,22 +3,22 @@ pdm-anomaly-detection:
 	@echo ======================================
 	@echo    Building PdM Anomaly Detection Demo
 	@echo ======================================
-	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-anomaly-detection*"`; make -f Makefile.build
 
 pdm-anomaly-detection_clean:
 	@echo ======================================
 	@echo    Building PdM Anomaly Detection Demo
 	@echo ======================================
-	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-anomaly-detection*"`; make -f Makefile.build clean
 
 pdm-anomaly-detection_install:
 	@echo =========================================================
 	@echo   Installing PdM Anomaly Detection Demo - Release version
 	@echo =========================================================
-	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-anomaly-detection*"`; make -f Makefile.build install
 
 pdm-anomaly-detection_install_debug:
 	@echo =======================================================
 	@echo   Installing PdM Anomaly Detection Demo - Debug version
 	@echo =======================================================
-	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-anomaly-detection*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
index cfbc4ae..9ca9fe2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
@@ -3,16 +3,16 @@ pru: linux
 	@echo ===========================
 	@echo    Building PRU Examples
 	@echo ===========================
-	@cd example-applications; cd `find . -name "*pru*"`; make
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`; make
 
 pru_clean:
 	@echo ===========================
 	@echo    Cleaning PRU Examples
 	@echo ===========================
-	@cd example-applications; cd `find . -name "*pru*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`; make clean
 
 pru_install:
 	@echo ==============================
 	@echo     Installing PRU Examples
 	@echo ==============================
-	@cd example-applications; cd `find . -name "*pru*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
index d0f5130..40e8bd2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -4,7 +4,7 @@ pru-icss:
 	@echo =================================
 	@echo    Building PRU-ICSS
 	@echo =================================
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	for dir in examples pru_cape/pru_fw lib/src labs; \
 	do \
 		make -C $$dir PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
@@ -14,7 +14,7 @@ pru-icss_clean:
 	@echo =================================
 	@echo    Cleaning PRU-ICSS
 	@echo =================================
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	for dir in examples pru_cape/pru_fw lib/src labs; \
 	do \
 		make -C $$dir clean PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
@@ -39,7 +39,7 @@ pru-icss_install_none:
 	@echo ===================================================
 
 pru-icss_install_am335x: pru-icss_install_common
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	install -m 0644 ./examples/am335x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
 	for i in 0 1; \
@@ -49,7 +49,7 @@ pru-icss_install_am335x: pru-icss_install_common
 	done
 
 pru-icss_install_am437x: pru-icss_install_common
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	install -m 0644 ./examples/am437x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
 	for i in 0 1; \
@@ -59,7 +59,7 @@ pru-icss_install_am437x: pru-icss_install_common
 	done
 
 pru-icss_install_am572x: pru-icss_install_common
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	install -m 0644 ./examples/am572x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
 	for i in 1 2; \
@@ -72,7 +72,7 @@ pru-icss_install_am572x: pru-icss_install_common
 	done
 
 pru-icss_install_k2g: pru-icss_install_common
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	install -m 0644 ./examples/k2g/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
 	for i in 0 1; \
@@ -85,7 +85,7 @@ pru-icss_install_k2g: pru-icss_install_common
 	done
 
 pru-icss_install_am65x: pru-icss_install_common
-	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	for i in 0 1; \
 	do \
 		install -m 0644 ./examples/am65x/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.out \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
index 12246db..d1d9e7f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
@@ -3,22 +3,22 @@ qt-opencv-opencl-opengl-multithreaded:
 	@echo =============================
 	@echo    Building QT OpenCV Multithreaded
 	@echo =============================
-	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build release
 
 qt-opencv-opencl-opengl-multithreaded_clean:
 	@echo =============================
 	@echo    Cleaning QT OpenCV Multithreaded
 	@echo =============================
-	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build clean
 
 qt-opencv-opencl-opengl-multithreaded_install:
 	@echo ================================================
 	@echo   Installing QT OpenCV Multithreaded - Release version
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install
 
 qt-opencv-opencl-opengl-multithreaded_install_debug:
 	@echo ==============================================
 	@echo   Installing QT OpenCV Multithreaded - Debug Version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
index 857e058..b39ef4b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
@@ -3,22 +3,22 @@ qt-tstat:
 	@echo ================================
 	@echo    Building QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tstat*"`; make -f Makefile.build release
 
 qt-tstat_clean:
 	@echo ================================
 	@echo    Cleaning QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tstat*"`; make -f Makefile.build clean
 
 qt-tstat_install:
 	@echo ===================================================
 	@echo   Installing QT Thermostat App - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tstat*"`; make -f Makefile.build install
 
 qt-tstat_install_debug:
 	@echo =================================================
 	@echo   Installing QT Thermostat App - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tstat*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
index b8b7c51..f1e8de0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
@@ -3,22 +3,22 @@ quick-playground:
 	@echo =================================
 	@echo    Building Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-playground*"`; make -f Makefile.build
 
 quick-playground_clean:
 	@echo =================================
 	@echo    Cleaning Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-playground*"`; make -f Makefile.build clean
 
 quick-playground_install:
 	@echo ====================================================
 	@echo   Installing Quick Playground App - Release version
 	@echo ====================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-playground*"`; make -f Makefile.build install
 
 quick-playground_install_debug:
 	@echo ==================================================
 	@echo   Installing Quick Playground App - Debug version
 	@echo ==================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
index bcc17fa..5f33c20 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
@@ -3,22 +3,22 @@ refresh-screen:
 	@echo =============================
 	@echo    Building Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refresh-screen*"`; make -f Makefile.build release
 
 refresh-screen_clean:
 	@echo =============================
 	@echo    Cleaning Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refresh-screen*"`; make -f Makefile.build clean
 
 refresh-screen_install:
 	@echo ================================================
 	@echo   Installing Refresh Screen - Release version
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refresh-screen*"`; make -f Makefile.build install
 
 refresh-screen_install_debug:
 	@echo ==============================================
 	@echo   Installing Refresh Screen - Debug Version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refresh-screen*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 46c9129..f7b8787 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -4,14 +4,14 @@ sysfw-image: linux-dtbs
 	@echo =============================
 	@echo    Building SYSFW Image
 	@echo =============================
-	@cd board-support; cd `find . -name "*system-firmware-image*"`; \
+	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; \
 		make SYSFW_DL_URL="" SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/ti-sci-firmware-am65x-gp.bin CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
 
 sysfw-image_clean:
 	@echo =============================
 	@echo    Cleaning SYSFW Image
 	@echo =============================
-	@cd board-support; cd `find . -name "*system-firmware-image*"`; make clean
+	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; make clean
 
 sysfw-image_install:
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
index 9ab9616..6ad07e9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
@@ -3,22 +3,22 @@ ti-crypto-examples:
 	@echo =================================
 	@echo    Building TI Crypto Examples
 	@echo =================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make release
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make release
 
 ti-crypto-examples_clean:
 	@echo =================================
 	@echo    Cleaning TI Crypto Examples
 	@echo =================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make clean
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make clean
 
 ti-crypto-examples_install:
 	@echo ===================================================
 	@echo   Installing TI Crypto Examples - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make install
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install
 
 ti-crypto-examples_install_debug:
 	@echo =================================================
 	@echo   Installing TI Crypto Examples - Debug Version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make install_debug
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
index d72d1c0..fbf3888 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
@@ -4,7 +4,7 @@ ti-gc320-driver: linux
 	@echo      Building ti-gc320-driver
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
 	make -f Kbuild AQROOT=`pwd` KERNEL_DIR=${LINUXKERNEL_INSTALL_DIR} ARCH_TYPE=arm
 
 ti-gc320-driver_clean:
@@ -12,7 +12,7 @@ ti-gc320-driver_clean:
 	@echo      Cleaning ti-gc320-driver
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
 	make -f Kbuild AQROOT=`pwd` KERNEL_DIR=${LINUXKERNEL_INSTALL_DIR} ARCH_TYPE=arm clean
 
 ti-gc320-driver_install:
@@ -20,6 +20,6 @@ ti-gc320-driver_install:
 	@echo      Installing ti-gc320-driver
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
index 19eb61f..04e3787 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
@@ -3,16 +3,16 @@ ti-ocf-crypto-module: linux
 	@echo ===================================
 	@echo    Building TI OCF Crypto Module
 	@echo ===================================
-	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make
+	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make
 
 ti-ocf-crypto-module_clean:
 	@echo ===================================
 	@echo    Cleaning TI OCF Crypto Module
 	@echo ===================================
-	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make clean
+	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make clean
 
 ti-ocf-crypto-module_install:
 	@echo =====================================
 	@echo    Installing TI OCF Crypto Module
 	@echo =====================================
-	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make install
+	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
index 3c12972..c4043c0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
@@ -4,7 +4,7 @@ ti-sgx-ddk-km: linux
 	@echo      Building ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 ti-sgx-ddk-km_clean:
@@ -12,7 +12,7 @@ ti-sgx-ddk-km_clean:
 	@echo      Cleaning ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 ti-sgx-ddk-km_install:
@@ -20,6 +20,6 @@ ti-sgx-ddk-km_install:
 	@echo      Installing ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	cd ./eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3 b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
index 7c376b0..db9f9fd 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
@@ -4,7 +4,7 @@ ti-sgx-ddk-km-k3: linux
 	@echo      Building ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws
 
 ti-sgx-ddk-km-k3_clean:
@@ -12,7 +12,7 @@ ti-sgx-ddk-km-k3_clean:
 	@echo      Cleaning ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws clean
 
 ti-sgx-ddk-km-k3_install:
@@ -20,6 +20,6 @@ ti-sgx-ddk-km-k3_install:
 	@echo      Installing ti-sgx-ddk-km
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
 	cd ./eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
index be037a3..544e0eb 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
@@ -3,7 +3,7 @@ uio-module-drv: linux
 	@echo      Building uio-module-drv
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)
 
 uio-module-drv_clean:
@@ -11,7 +11,7 @@ uio-module-drv_clean:
 	@echo      Cleaning uio-module-drv
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
 	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) clean
 
 uio-module-drv_install:
@@ -24,5 +24,5 @@ uio-module-drv_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
 	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 8ed00f0..e585abe 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,7 +54,7 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r98"
+PR = "r99"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


