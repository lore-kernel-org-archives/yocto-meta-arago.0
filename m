Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0CC9F52978
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 19:10:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5QJAoTq045450
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530040250;
	bh=cFXxKZ09L6sZmd+Anyzy25s6NQfmEoCbzpw5CXqiyWY=;
	h=From:To:CC:Subject:Date;
	b=t43u90IG8mbRNEfOcakIDpW0wFSA9isNyhu7GQYOitTvwKrZcQJbQC+Z9BMTZjIVf
	TY+eixNqUeeBa2kHgIj6ktaIHg3R6rDuWcYVCGplzQe3Kocbhb+q7MB4pxAQD7YnK/
	ylv3AVtogA3u7ryM800fHO94RkpHMMLzOK7pHPes=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJAodr019777
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:10:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 26 Jun 2018 14:10:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 26 Jun 2018 14:10:50 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJAos4024654;
	Tue, 26 Jun 2018 14:10:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Jun 2018 14:59:27 -0400
Message-ID: <1530039568-1313-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH 1/2] ti-tisdk-makefile: abstract kernel ARCH
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
X-List-Received-Date: Tue, 26 Jun 2018 19:10:57 -0000
Content-Type: text/plain

* With the addition of a aarch64 device, ARCH=arm is not a safe
  assumption.
* Use the kernel-arch.bbclass to set the appropritate ARCH and
  replace that in each makefile fragment.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod      |  4 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev     |  6 +++---
 .../ti-tisdk-makefile/Makefile_debugss-module-drv              |  6 +++---
 .../ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv       |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod     |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod  |  6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux         | 10 +++++-----
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs    |  4 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km |  4 ++--
 .../ti-tisdk-makefile/Makefile_uio-module-drv                  |  6 +++---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb   |  9 ++++++++-
 11 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
index d1ae4e1..8cd34b1 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
@@ -6,7 +6,7 @@ cmem-mod: linux
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
+	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
 
 cmem-mod_clean:
 	@echo ================================
@@ -15,7 +15,7 @@ cmem-mod_clean:
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
+	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
 
 cmem-mod_install:
 	@echo ================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
index ee54327..db89c5e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
@@ -4,7 +4,7 @@ cryptodev: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cryptodev*"`; \
-	make ARCH=arm KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)
+	make ARCH=__KERNEL_ARCH__ KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)
 
 cryptodev_clean:
 	@echo ================================
@@ -12,7 +12,7 @@ cryptodev_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cryptodev*"`; \
-	make ARCH=arm KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make ARCH=__KERNEL_ARCH__ KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 cryptodev_install:
 	@echo ================================
@@ -25,4 +25,4 @@ cryptodev_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cryptodev*"`; \
-	make ARCH=arm  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
+	make ARCH=__KERNEL_ARCH__  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
index 913653c..078d579 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
@@ -4,7 +4,7 @@ debugss-module-drv: linux
 	@echo =======================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "debugss*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__
 
 debugss-module-drv_clean:
 	@echo =======================================
@@ -12,7 +12,7 @@ debugss-module-drv_clean:
 	@echo =======================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "debugss*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__ clean
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_DEBUGSS__ clean
 
 debugss-module-drv_install:
 	@echo =======================================
@@ -25,5 +25,5 @@ debugss-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "debugss*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
+	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
index b81833b..3333910 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
@@ -4,7 +4,7 @@ gdbserverproxy-module-drv: linux
 	@echo ==============================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__
 
 gdbserverproxy-module-drv_clean:
 	@echo ==============================================
@@ -12,7 +12,7 @@ gdbserverproxy-module-drv_clean:
 	@echo ==============================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__ clean
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__ clean
 
 gdbserverproxy-module-drv_install:
 	@echo ==============================================
@@ -25,5 +25,5 @@ gdbserverproxy-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
+	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
index dcee4e2..bd273f8 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
@@ -4,7 +4,7 @@ hplib-mod: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
-	make -C module ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR)
+	make -C module ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 hplib-mod_clean:
 	@echo ================================
@@ -12,7 +12,7 @@ hplib-mod_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
-	make -C module ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make -C module ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 hplib-mod_install:
 	@echo ================================
@@ -25,4 +25,4 @@ hplib-mod_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
-	make -C module ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
+	make -C module ARCH=__KERNEL_ARCH__  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
index 35456b2..7ce0dcf 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
@@ -4,7 +4,7 @@ ipsecmgr-mod: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
-	make ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR)
+	make ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 ipsecmgr-mod_clean:
 	@echo ================================
@@ -12,7 +12,7 @@ ipsecmgr-mod_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
-	make ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make ARCH=__KERNEL_ARCH__ KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 ipsecmgr-mod_install:
 	@echo ================================
@@ -25,4 +25,4 @@ ipsecmgr-mod_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
-	make ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
+	make ARCH=__KERNEL_ARCH__  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 2e878d5..100a225 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -3,9 +3,9 @@ linux: __DTB_DEPEND__
 	@echo =================================
 	@echo     Building the Linux Kernel
 	@echo =================================
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) modules
 
 linux_install: __DTB_DEPEND_INSTALL__
 	@echo ===================================
@@ -20,10 +20,10 @@ linux_install: __DTB_DEPEND_INSTALL__
 	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/__KERNEL_BUILD_CMDS__ $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/System.map $(DESTDIR)/boot
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
 linux_clean:
 	@echo =================================
 	@echo     Cleaning the Linux Kernel
 	@echo =================================
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) mrproper
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) mrproper
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index d1d7e02..1ecaf5e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -3,9 +3,9 @@ linux-dtbs:
 	@echo =====================================
 	@echo     Building the Linux Kernel DTBs
 	@echo =====================================
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
 	@for DTB in __KERNEL_DEVICETREE__; do \
-		$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $$DTB; \
+		$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=__KERNEL_ARCH__ CROSS_COMPILE=$(CROSS_COMPILE) $$DTB; \
 	done
 
 linux-dtbs_install:
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
index 8d9b583..3c12972 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
@@ -5,7 +5,7 @@ ti-sgx-ddk-km: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 ti-sgx-ddk-km_clean:
 	@echo ================================
@@ -13,7 +13,7 @@ ti-sgx-ddk-km_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 ti-sgx-ddk-km_install:
 	@echo ================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
index ceecb28..be037a3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
@@ -4,7 +4,7 @@ uio-module-drv: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)
 
 uio-module-drv_clean:
 	@echo ================================
@@ -12,7 +12,7 @@ uio-module-drv_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
-	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) clean
+	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) clean
 
 uio-module-drv_install:
 	@echo ================================
@@ -25,4 +25,4 @@ uio-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
+	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 4fdd99f..4669827 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r86"
+PR = "r87"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -162,6 +162,12 @@ MAKEFILES_append_k2e = " opencl-examples \
                              openmpacc-examples \
 "
 
+# Use this to export kernel arch to ARCH
+#
+# We need to be very careful here. This class will also overwrite UBOOT_ARCH
+# even though it may be set in the machine configuration.
+inherit kernel-arch
+
 # Use ARCH format expected by the makefile
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
@@ -234,6 +240,7 @@ do_install () {
         sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefile
     fi
 
+    sed -i -e "s/__KERNEL_ARCH__/${ARCH}/" ${D}/Makefile
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
     sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
 
-- 
2.7.4


