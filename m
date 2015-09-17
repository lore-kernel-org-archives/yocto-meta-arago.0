Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 535F752A58
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2015 14:37:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HEbW7j001972
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 09:37:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HEbWHL000494
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2015 09:37:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 09:37:32 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HEbW2c001232;
	Thu, 17 Sep 2015 09:37:32 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcaJX-0003dK-Mz; Thu, 17 Sep 2015 10:37:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Sep 2015 10:37:30 -0400
Message-ID: <1442500650-13932-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Remove wireless and sgx-modules
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
X-List-Received-Date: Thu, 17 Sep 2015 14:37:35 -0000
Content-Type: text/plain

* ti-compat-wireless was remove in commit 126262353a43aa0dab4f3747d29c013c7d4f4f82
* sgx-modules has been replaced with omapdrm-pvr.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sgx-modules         | 29 ----------------------
 .../ti-tisdk-makefile/Makefile_wireless            | 29 ----------------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 13 +---------
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules
deleted file mode 100644
index 13eb11a..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules
+++ /dev/null
@@ -1,29 +0,0 @@
-sgx-modules: linux
-	@echo =====================================
-	@echo      Building sgx-modules
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
-	make ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) BUILD=release TI_PLATFORM=__PLATFORM_SGX__ SUPPORT_XORG=0
-
-sgx-modules_clean:
-	@echo =====================================
-	@echo      Cleaning sgx-modules
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
-	make ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
-
-sgx-modules_install:
-	@echo =====================================
-	@echo      Installing sgx-modules
-	@echo =====================================
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try again."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
deleted file mode 100644
index b4ae858..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ /dev/null
@@ -1,29 +0,0 @@
-wireless: compat-modules
-wireless_install: compat-modules_install
-wireless_clean: compat-modules_clean
-
-compat-modules: linux
-	@echo ================================
-	@echo      Building compat-modules
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CC="cc" defconfig-wl18xx; \
-	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm
-
-compat-modules_install:
-	@echo ================================
-	@echo      Installing compat-modules
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm modules_install
-
-compat-modules_clean:
-	@echo ================================
-	@echo      Cleaning compat-modules
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm mrproper
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a770117..2ffafec 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -28,20 +28,18 @@ SRC_URI = "\
     file://Makefile_ti-ocf-crypto-module \
     file://Makefile_qt-tstat \
     file://Makefile_quick-playground \
-    file://Makefile_wireless \
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
     file://Makefile_dual-camera-demo \
     file://Makefile_image-gallery \
     file://Makefile_cryptodev \
-    file://Makefile_sgx-modules \
     file://Makefile_cmem-mod \
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_omapdrm-pvr \
 "
 
-PR = "r51"
+PR = "r52"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -72,18 +70,14 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
-                           wireless \
                            cryptodev \
-                           sgx-modules \
                            omapdrm-pvr \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
                            linux-dtbs \
-                           wireless \
                            cryptodev \
-                           sgx-modules \
                            dual-camera-demo \
                            image-gallery \
                            omapdrm-pvr \
@@ -109,10 +103,6 @@ MAKEFILES_append_am180x-evm = " pru \
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
-PLATFORM_SGX = ""
-PLATFORM_SGX_ti33x = "ti335x"
-PLATFORM_SGX_ti43x = "ti43xx"
-
 PLATFORM_OMAPDRM = ""
 PLATFORM_OMAPDRM_ti33x = "omap335x"
 PLATFORM_OMAPDRM_ti43x = "omap437x"
@@ -187,7 +177,6 @@ do_install () {
 
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
 
-    sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/" ${D}/Makefile
     sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
-- 
1.9.1


