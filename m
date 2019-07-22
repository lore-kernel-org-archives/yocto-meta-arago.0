Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B7AD552976
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2019 18:42:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6MIg5oN038543
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2019 13:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563820925;
	bh=63b/6UymBc6H5DT5xU4mN6ExxQE6A1io9CpcogFjxPk=;
	h=From:To:CC:Subject:Date;
	b=MCHvRf9yKmoXAB7aUF3Cl8rWYhYwykJdW0wmCCkV19hl7dxGgVjNphBEG3C+Ie+VG
	HZKD40jliSFPMd4o0JjSQVqUHG+ARzb2fzKg2IbpVJ65oJuLrOZsYYKZa2uZaRWLaO
	vfxu2cUlD09xYUllylQJ+d04DUixiW/9b0e6m4vc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6MIg5ox080082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2019 13:42:05 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 22 Jul 2019 13:42:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 22 Jul 2019 13:42:05 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6MIg46u104019;
	Mon, 22 Jul 2019 13:42:05 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Jul 2019 14:25:26 -0400
Message-ID: <1563819926-6261-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-makefile: unify ti-sgx-ddk-km target
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
X-List-Received-Date: Mon, 22 Jul 2019 18:42:57 -0000
Content-Type: text/plain

* Now that ti-sgx-ddk-km has been unified, unify the ti-tisdk-makefile
  target.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km       |  6 +++---
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3    | 25 ----------------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 21 +++++++++++-------
 3 files changed, 16 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
index c4043c0..ecb1168 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
@@ -5,7 +5,7 @@ ti-sgx-ddk-km: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TI_SGX_TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws
 
 ti-sgx-ddk-km_clean:
 	@echo ================================
@@ -13,7 +13,7 @@ ti-sgx-ddk-km_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws clean
 
 ti-sgx-ddk-km_install:
 	@echo ================================
@@ -21,5 +21,5 @@ ti-sgx-ddk-km_install:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	cd ./eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild; \
+	cd ./eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target___TI_SGX_TARGET_ARCH__/kbuild; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3 b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
deleted file mode 100644
index db9f9fd..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
+++ /dev/null
@@ -1,25 +0,0 @@
-# ti-sgx-ddk-km module for k3
-ti-sgx-ddk-km-k3: linux
-	@echo ================================
-	@echo      Building ti-sgx-ddk-km
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws
-
-ti-sgx-ddk-km-k3_clean:
-	@echo ================================
-	@echo      Cleaning ti-sgx-ddk-km
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws clean
-
-ti-sgx-ddk-km-k3_install:
-	@echo ================================
-	@echo      Installing ti-sgx-ddk-km
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	cd ./eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild; \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e585abe..7802973 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -37,7 +37,6 @@ SRC_URI = "\
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_ti-sgx-ddk-km \
-    file://Makefile_ti-sgx-ddk-km-k3 \
     file://Makefile_opencl-examples \
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
@@ -54,7 +53,7 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r99"
+PR = "r100"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -186,7 +185,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
 
 MAKEFILES_append_am65xx = " \
                         pru-icss \
-                        ti-sgx-ddk-km-k3 \
+                        ti-sgx-ddk-km \
 "
 
 # Use this to export kernel arch to ARCH
@@ -200,10 +199,15 @@ PLATFORM_ARCH = "${ARMPKGARCH}"
 PLATFORM_ARCH_arm = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
-TARGET_PRODUCT = "jacinto6evm"
-TARGET_PRODUCT_ti33x = "ti335x"
-TARGET_PRODUCT_ti43x = "ti437x"
-TARGET_PRODUCT_k3 = "ti654x"
+# ti-sgx-ddk-km configurations
+# See meta-ti/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+TI_SGX_TARGET_PRODUCT = "jacinto6evm"
+TI_SGX_TARGET_PRODUCT_ti33x = "ti335x"
+TI_SGX_TARGET_PRODUCT_ti43x = "ti437x"
+TI_SGX_TARGET_PRODUCT_k3 = "ti654x"
+
+TI_SGX_TARGET_ARCH = "armhf"
+TI_SGX_TARGET_ARCH_k3 = "aarch64"
 
 PLATFORM_DEBUGSS = ""
 PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
@@ -279,7 +283,8 @@ do_install () {
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
     sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
 
-    sed -i -e "s/__TARGET_PRODUCT__/${TARGET_PRODUCT}/" ${D}/Makefile
+    sed -i -e "s/__TI_SGX_TARGET_PRODUCT__/${TI_SGX_TARGET_PRODUCT}/" ${D}/Makefile
+    sed -i -e "s/__TI_SGX_TARGET_ARCH__/${TI_SGX_TARGET_ARCH}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
     sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
     sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
-- 
2.7.4


