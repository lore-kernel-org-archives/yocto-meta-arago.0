Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A845B5298D
	for <meta-arago@arago-project.org>;
	Wed, 24 Jul 2019 14:12:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OEBA4d045683
	for <meta-arago@arago-project.org>; Wed, 24 Jul 2019 09:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563977470;
	bh=y7p6S/rngejUhlSZyO1sOBw6U4kUDQmxMCH8QQLVL9w=;
	h=From:To:CC:Subject:Date;
	b=gaQPJEkzHBfyF5RDe4tsRryelcYqIALljPgeevC8nxO6fEmW494IbzHYC7EvMufFl
	nBzCVdUIHanE8FUne2u4giSYrzjApA0VuIcjr8sLceNSrA5UXI0B9YPhUGqbIn+Beq
	z/1uuXD8vfquujskNcFKNxY780JaaYYf1ig1BXzw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OEBAtN107273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 24 Jul 2019 09:11:10 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 09:11:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 09:11:10 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OEBAEa051898;
	Wed, 24 Jul 2019 09:11:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Jul 2019 09:54:28 -0400
Message-ID: <1563976468-25558-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-makefile: add ti-ipc target
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
X-List-Received-Date: Wed, 24 Jul 2019 14:12:03 -0000
Content-Type: text/plain

* The ti-ipc target will build the IPC libraries and examples for the
  Linux OS.
* The TI RTOS SDK provides the sources and it is required to set
  TI_PRSDK_PATH to the RTOS SDK installation path in the Rules.make in
  order to enable building the ti-ipc target.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-ipc              | 135 +++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  22 ++++
 2 files changed, 157 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
new file mode 100644
index 0000000..53f9c88
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
@@ -0,0 +1,135 @@
+TISDK_VERSION=__TISDK_VERSION__
+
+PRSDK_VERSION=$(shell echo $(TISDK_VERSION) | sed -e 's|^0||' -e 's|\.|_|g')
+PRSDK_PLATFORM=$(shell echo $(PLATFORM) | sed -e 's|-evm$$||' | sed -e 's|-lcdk$$||')
+
+ifneq ($(TI_RTOS_PATH),)
+  TI_IPC_TARGETS = ti-ipc-linux
+
+  TI_RTOS_PATH_ABS := $(realpath $(TI_RTOS_PATH))
+
+  TI_PRSDK_PATH=$(TI_RTOS_PATH_ABS)/processor_sdk_rtos_$(PRSDK_PLATFORM)_$(PRSDK_VERSION)
+  SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS)
+  include $(TI_PRSDK_PATH)/Rules.make
+
+  IPC_TOOLS_PATHS=__IPC_TOOLS_PATHS__
+
+else
+  TI_IPC_TARGETS = ti-ipc-rtos-missing
+endif
+
+TI_IPC_CLEAN = $(addsuffix _clean, $(TI_IPC_TARGETS))
+TI_IPC_INSTALL = $(addsuffix _install, $(TI_IPC_TARGETS))
+
+ti-ipc-rtos-missing ti-ipc-rtos-missing_clean ti-ipc-rtos-missing_install:
+	@echo
+	@echo ===========================================================
+	@echo     If you wish to build IPC, please install
+	@echo     Processor SDK RTOS $(TISDK_VERSION) for $(PLATFORM)
+	@echo     and set TI_RTOS_PATH in Rules.make
+	@echo ===========================================================
+
+ti-ipc-rtos-path-check:
+	@if [ ! -d "$(TI_PRSDK_PATH)" ]; \
+	then \
+		echo; \
+		echo "Error: TI_RTOS_PATH ($(TI_RTOS_PATH_ABS)) does not contain"; \
+		echo "       the corresponding Processor SDK RTOS release!"; \
+		echo; \
+		echo "Please install Processor SDK RTOS $(TISDK_VERSION) for $(PLATFORM)."; \
+		exit 1; \
+	fi
+
+ti-ipc: $(TI_IPC_TARGETS)
+
+ti-ipc_clean: $(TI_IPC_CLEAN)
+
+ti-ipc_install: $(TI_IPC_INSTALL)
+
+ti-ipc-linux-config: ti-ipc-rtos-path-check
+	@echo =================================
+	@echo     Configuring IPC
+	@echo =================================
+	. $(ENV_SETUP); \
+	cd $(IPC_INSTALL_PATH); \
+	./configure $${CONFIGURE_FLAGS} \
+		CC=$${TOOLCHAIN_PREFIX}gcc \
+		--prefix=/usr \
+		PLATFORM=$(IPC_PLATFORM) \
+		KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR)
+
+
+ti-ipc-linux: ti-ipc-rtos-path-check linux ti-ipc-linux-config
+	@echo =================================
+	@echo     Building IPC
+	@echo =================================
+	. $(ENV_SETUP); \
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH)
+
+ti-ipc-linux_clean: ti-ipc-rtos-path-check ti-ipc-linux-config
+	@echo =================================
+	@echo     Cleaning IPC
+	@echo =================================
+	. $(ENV_SETUP); \
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) clean
+
+ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
+	@echo =================================
+	@echo     Installing IPC
+	@echo =================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	. $(ENV_SETUP); \
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) install DESTDIR=$(DESTDIR)
+
+ti-ipc-linux-examples: ti-ipc-rtos-path-check
+	@echo =================================
+	@echo     Building the IPC Examples
+	@echo =================================
+	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples \
+		HOSTOS="linux" \
+		PLATFORM="$(IPC_PLATFORM)" \
+		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
+		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		PDK_INSTALL_DIR="$(PDK_INSTALL_PATH)/.." \
+		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
+		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
+		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
+		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
+		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
+		$(IPC_TOOLS_PATHS)
+
+ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examples
+	@echo =================================
+	@echo     Installing the IPC Examples
+	@echo =================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples install \
+		HOSTOS="linux" \
+		PLATFORM="$(IPC_PLATFORM)" \
+		EXEC_DIR="$(EXEC_DIR)"
+
+ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
+	@echo =================================
+	@echo     Cleaning the IPC Examples
+	@echo =================================
+	. $(ENV_SETUP); \
+	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples clean \
+		HOSTOS="linux" \
+		PLATFORM="$(IPC_PLATFORM)" \
+		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
+		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
+		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
+		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
+		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
+		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
+		$(IPC_TOOLS_PATHS)
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 7802973..271218f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "\
     file://Makefile_sysfw-image \
     file://Makefile_mmwavegesture-hmi \
     file://Makefile_pdm-anomaly-detection \
+    file://Makefile_ti-ipc \
 "
 
 PR = "r100"
@@ -136,9 +137,11 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               uio-module-drv \
 			      mmwavegesture-hmi \
                               pdm-anomaly-detection \
+                              ti-ipc \
 "
 MAKEFILES_append_omapl138 = " linux-dtbs \
                               u-boot-spl \
+                              ti-ipc \
 "
 
 MAKEFILES_append_keystone = " u-boot-spl \
@@ -151,6 +154,7 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               uio-module-drv \
                               ipsecmgr-mod \
                               barcode-roi \
+                              ti-ipc \
 "
 
 #                              gdbserverproxy-module-drv 
@@ -181,6 +185,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         sysfw-image \
 			mmwavegesture-hmi \
                         pdm-anomaly-detection \
+                        ti-ipc \
 "
 
 MAKEFILES_append_am65xx = " \
@@ -224,6 +229,21 @@ PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 
+# Path to toolchains for the various cores in TI SOCs
+#
+# These are provided by the TI RTOS SDK and used to build firmwares used by the
+# IPC Linux examples.
+IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\(C6X_GEN_INSTALL_PATH\)""
+IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\(TOOLCHAIN_PATH_M4\)" ti.targets.arm.elf.M4F="\$\(TOOLCHAIN_PATH_M4\)""
+IPC_TOOLS_PATHS_R5F  = "ti.targets.arm.elf.R5F="\$\(TOOLCHAIN_PATH_R5\)""
+IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""
+
+IPC_TOOLS_PATHS = ""
+IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
+IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
+IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"
+IPC_TOOLS_PATHS_append_k3 = "${IPC_TOOLS_PATHS_R5F}"
+
 
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
@@ -289,6 +309,8 @@ do_install () {
     sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
     sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
     sed -i -e "s/__PRU_ICSS_INSTALL_TARGET__/${PRU_ICSS_INSTALL_TARGET}/g" ${D}/Makefile
+    sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
+    sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
 
-- 
2.7.4


