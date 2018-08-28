Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 40549529EE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 19:10:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SJADlA086581
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535483413;
	bh=6DQ/7e6LDmSs0GvjqXjhCGX1vWOP06mla6lWnWy6yt8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z4fkQsA9FjVqy6b7tVJIj9T6SxOfFIcCSu182KbJo+92EmxmqWhiiBfc7oo87U9h3
	K+kd00CaG7GnmSKmyAACX2qHyoKAlnA60z5M/81RKiome+w8WDDFdB/qQ+TrSOw+7f
	zBRpDXoiqhbq1egEPJcECuXqtZdtHS4V4RR6bCjo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJAD9r025210
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:13 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 14:10:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 14:10:13 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJA4cu003290;
	Tue, 28 Aug 2018 14:10:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 14:57:48 -0400
Message-ID: <1535482668-18232-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535482668-18232-1-git-send-email-j-stiffler@ti.com>
References: <1535482668-18232-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 5/5] ti-tisdk-makefile: fix ti-sgx-ddk-km for k3
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
X-List-Received-Date: Tue, 28 Aug 2018 19:10:21 -0000
Content-Type: text/plain

* Make a copy of the fragment instead of overloading the processing
  within the recipe.
* Differences with base ti-sgx-ddk-km fragment are the following:
  - Uses WINDOW_SYSTEM=nulldrmws
  - A different "SUBDIR" when installing the module

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3    | 25 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  6 ++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3 b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
new file mode 100644
index 0000000..7c376b0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km-k3
@@ -0,0 +1,25 @@
+# ti-sgx-ddk-km module for k3
+ti-sgx-ddk-km-k3: linux
+	@echo ================================
+	@echo      Building ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws
+
+ti-sgx-ddk-km-k3_clean:
+	@echo ================================
+	@echo      Cleaning ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=__KERNEL_ARCH__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=nulldrmws clean
+
+ti-sgx-ddk-km-k3_install:
+	@echo ================================
+	@echo      Installing ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd ./eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild; \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 78baa9b..a84eb27 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -37,6 +37,7 @@ SRC_URI = "\
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_ti-sgx-ddk-km \
+    file://Makefile_ti-sgx-ddk-km-k3 \
     file://Makefile_opencl-examples \
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
@@ -50,7 +51,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r90"
+PR = "r91"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -168,7 +169,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         linux-dtbs \
                         barcode-roi \
                         cryptodev \
-                        ti-sgx-ddk-km \
+                        ti-sgx-ddk-km-k3 \
                         pru-icss \
 "
 
@@ -186,6 +187,7 @@ PLATFORM_ARCH_omapl138 = "armv5te"
 TARGET_PRODUCT = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
+TARGET_PRODUCT_k3 = "ti654x"
 
 PLATFORM_DEBUGSS = ""
 PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
-- 
2.7.4


