Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F36EF529AE
	for <meta-arago@arago-project.org>;
	Mon, 30 Mar 2015 11:22:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2UBMAIB030855
	for <meta-arago@arago-project.org>; Mon, 30 Mar 2015 06:22:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2UBM9B0022757
	for <meta-arago@arago-project.org>; Mon, 30 Mar 2015 06:22:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Mar 2015 06:22:09 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2UBM9qA026379;
	Mon, 30 Mar 2015 06:22:09 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YcXlh-000147-83;
	Mon, 30 Mar 2015 07:22:09 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Mar 2015 07:22:05 -0400
Message-ID: <1427714525-4063-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] omap3-sgx-modules: Add source to SDK.
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
X-List-Received-Date: Mon, 30 Mar 2015 11:22:12 -0000
Content-Type: text/plain

* omap3-sgx-modules provides out-of-tree drivers which are required for
  graphics.
* These sources need to be provided so that whenever there is a kernel
  modification, the user can easily rebuild these moduels to reenable graphics.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: Remove "omap3" prefix from the sgx module sources within the SDK.

 .../conf/distro/arago-source-ipk.conf              |    3 ++
 .../ti-tisdk-makefile/Makefile_sgx-modules         |   29 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   11 +++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index b457504..c2a81b7 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -94,6 +94,9 @@ SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples = "example-applications/pru-${PV}"
 CREATE_SRCIPK_pn-ti-ocf-crypto-module = "1"
 SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-omap3-sgx-modules = "1"
+SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules = "board-support/extra-drivers/sgx-modules-${PV}"
+
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules
new file mode 100644
index 0000000..13eb11a
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sgx-modules
@@ -0,0 +1,29 @@
+sgx-modules: linux
+	@echo =====================================
+	@echo      Building sgx-modules
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
+	make ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) BUILD=release TI_PLATFORM=__PLATFORM_SGX__ SUPPORT_XORG=0
+
+sgx-modules_clean:
+	@echo =====================================
+	@echo      Cleaning sgx-modules
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
+	make ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+
+sgx-modules_install:
+	@echo =====================================
+	@echo      Installing sgx-modules
+	@echo =====================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "sgx-modules*"`; \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index ffedd4c..40e0911 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -34,9 +34,10 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
     file://Makefile_image-gallery \
     file://Makefile_cryptodev \
+    file://Makefile_sgx-modules \
 "
 
-PR = "r41"
+PR = "r42"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -69,6 +70,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            linux-dtbs \
                            wireless \
                            cryptodev \
+                           sgx-modules \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -76,6 +78,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            linux-dtbs \
                            wireless \
                            cryptodev \
+                           sgx-modules \
                            dual-camera-demo \
                            image-gallery \
 "
@@ -95,6 +98,10 @@ MAKEFILES_append_am180x-evm = " pru \
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
+PLATFORM_SGX = ""
+PLATFORM_SGX_ti33x = "ti335x"
+PLATFORM_SGX_ti43x = "ti43xx"
+
 KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -150,6 +157,8 @@ do_install () {
 
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
 
+    sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
+
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
 
     if [ "$?" == "0" ]
-- 
1.7.9.5


