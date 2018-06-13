Return-Path: <sam.nelson@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3E30852978
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 18:50:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DIoRqM008573
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 13:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528915827;
	bh=Zy9hRQdmCPYG2ydqEoyfdjpqpfCi8RGR+vkqGfU9ykk=;
	h=From:To:CC:Subject:Date;
	b=dzfXlGILBuxOSD5PDLxEd8cBjI9vmcqf5nie/f6eexxnU6Ong/tBA6Apy2axJrxQL
	tNF5sK4TvpK8xxaadGYwtjQOApp5d/1fUTxoDxZU8VVa8JPqKBtBXriKg+cHARX1U0
	lywaAxCOeUFBY+BoMIemXD1k/2eKYvLdWYACRjAA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DIoRU3029134
	for <meta-arago@arago-project.org>; Wed, 13 Jun 2018 13:50:27 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 13:50:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 13:50:27 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DIoRHn004723;
	Wed, 13 Jun 2018 13:50:27 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Jun 2018 14:50:18 -0400
Message-ID: <1528915818-61843-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3] ti-tisdk-makefile: Update to fix issue with ipc builds from linux
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
X-List-Received-Date: Wed, 13 Jun 2018 18:50:34 -0000
Content-Type: text/plain

setupenv.sh in PRSDK is getting deprecated and all the definitions moved
to Rules.make. With this change, Rules.make from RTOS package is
directly used.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
Move RTOS related defines into existing ifneq statement
Remove export of IPC related variables
Update other uses of IPC_INSTALL_PATH
---
---
 .../ti-tisdk-makefile/Makefile_big-data-ipc-demo   | 21 ++++-----
 .../ti-tisdk-makefile/Makefile_ti-ipc              | 50 ++++++++++------------
 .../ti-tisdk-makefile_1.0.bbappend                 |  6 +--
 3 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
index 32bb398..ea6ae34 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_big-data-ipc-demo
@@ -19,14 +19,12 @@ big-data-ipc-demo-linux:
 	@echo     Building the big data ipc demo: Linux host
 	@echo ==================================================
 	@cd example-applications; cd `find . -name "*big-data-ipc-demo-linux*"`; \
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
-	source $(ENV_SETUP); \
-	make -j $(MAKE_JOBS) host_linux \
-		PLATFORM="$${IPC_PLATFORM}" \
+	$(MAKE) -j $(MAKE_JOBS) host_linux \
+		PLATFORM="$(IPC_PLATFORM)" \
 		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
-		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
-		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
-		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
+		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
+		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
 		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
 		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
@@ -44,17 +42,14 @@ big-data-ipc-demo-linux_install:
 	fi
 	@cd example-applications; \
 	cd `find . -name "*big-data-ipc-demo-linux*"`; \
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
-	source $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) install_linux_bin DESTDIR=$(DESTDIR) \
-	PLATFORM="$${IPC_PLATFORM}"
+	PLATFORM="$(IPC_PLATFORM)"
 
 big-data-ipc-demo-linux_clean:
 	@echo ==================================================
 	@echo     Cleaning the big data ipc demo: Linux host
 	@echo ==================================================
 	@cd example-applications; cd `find . -name "*big-data-ipc-demo-linux*"`; \
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
-	source $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) clean_linux \
-	PLATFORM="$${IPC_PLATFORM}"
+	PLATFORM="$(IPC_PLATFORM)"
+
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
index f1721c7..f015b24 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
@@ -8,6 +8,13 @@ ifneq ($(TI_RTOS_PATH),)
 
   TI_RTOS_PATH_ABS := $(realpath $(TI_RTOS_PATH))
 
+  TI_PRSDK_PATH=$(TI_RTOS_PATH_ABS)/processor_sdk_rtos_$(PRSDK_PLATFORM)_$(PRSDK_VERSION)
+  SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS)
+  include $(TI_PRSDK_PATH)/Rules.make
+
+  IPC_TOOLS_PATHS= ti.targets.elf.C66="${C6X_GEN_INSTALL_PATH}" ti.targets.arm.elf.M4="${TOOLCHAIN_PATH_M4}" ti.targets.arm.elf.M4F="${TOOLCHAIN_PATH_M4}"
+
+
 else
   TI_IPC_TARGETS = ti-ipc-rtos-missing
 endif
@@ -15,10 +22,6 @@ endif
 TI_IPC_CLEAN = $(addsuffix _clean, $(TI_IPC_TARGETS))
 TI_IPC_INSTALL = $(addsuffix _install, $(TI_IPC_TARGETS))
 
-export TI_PRSDK_PATH=$(TI_RTOS_PATH_ABS)/processor_sdk_rtos_$(PRSDK_PLATFORM)_$(PRSDK_VERSION)
-
-export IPC_TOOLS_PATHS=__IPC_TOOLS_PATHS__
-
 ti-ipc-rtos-missing ti-ipc-rtos-missing_clean ti-ipc-rtos-missing_install:
 	@echo
 	@echo ===========================================================
@@ -48,13 +51,12 @@ ti-ipc-linux-config: ti-ipc-rtos-path-check
 	@echo =================================
 	@echo     Configuring IPC
 	@echo =================================
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
 	. $(ENV_SETUP); \
-	cd $${IPC_INSTALL_PATH}; \
-        ./configure $${CONFIGURE_FLAGS} \
+	cd $(IPC_INSTALL_PATH); \
+	./configure $${CONFIGURE_FLAGS} \
 		CC=$${CC} \
 		--prefix=/usr \
-		PLATFORM=$${IPC_PLATFORM} \
+		PLATFORM=$(IPC_PLATFORM) \
 		KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR)
 
 
@@ -62,17 +64,15 @@ ti-ipc-linux: ti-ipc-rtos-path-check linux ti-ipc-linux-config
 	@echo =================================
 	@echo     Building IPC
 	@echo =================================
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
 	source $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH)
 
 ti-ipc-linux_clean: ti-ipc-rtos-path-check ti-ipc-linux-config
 	@echo =================================
 	@echo     Cleaning IPC
 	@echo =================================
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
 	source $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH} clean
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) clean
 
 ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
 	@echo =================================
@@ -83,23 +83,20 @@ ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
 		echo "Please run setup.sh in the SDK's root directory and then try again."; \
 		exit 1; \
 	fi
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
 	source $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH} install DESTDIR=$(DESTDIR)
+	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) install DESTDIR=$(DESTDIR)
 
 ti-ipc-linux-examples: ti-ipc-rtos-path-check
 	@echo =================================
 	@echo     Building the IPC Examples
 	@echo =================================
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
-	source $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples \
 		HOSTOS="linux" \
-		PLATFORM="$${IPC_PLATFORM}" \
+		PLATFORM="$(IPC_PLATFORM)" \
 		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
-		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
-		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
-		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
+		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
+		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
 		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
 		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
@@ -114,26 +111,23 @@ ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examples
 		echo "Please run setup.sh in the SDK's root directory and then try again."; \
 		exit 1; \
 	fi
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
-	source $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples install \
 		HOSTOS="linux" \
-		PLATFORM="$${IPC_PLATFORM}" \
+		PLATFORM="$(IPC_PLATFORM)" \
 		EXEC_DIR="$(EXEC_DIR)"
 
 ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
 	@echo =================================
 	@echo     Cleaning the IPC Examples
 	@echo =================================
-	SDK_INSTALL_PATH=$(TI_RTOS_PATH_ABS) source $(TI_PRSDK_PATH)/setupenv.sh > /dev/null; \
 	source $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples clean \
 		HOSTOS="linux" \
-		PLATFORM="$${IPC_PLATFORM}" \
+		PLATFORM="$(IPC_PLATFORM)" \
 		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
-		XDC_INSTALL_DIR="$${XDC_INSTALL_PATH}" \
-		BIOS_INSTALL_DIR="$${BIOS_INSTALL_PATH}" \
-		IPC_INSTALL_DIR="$${IPC_INSTALL_PATH}" \
+		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
+		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
 		TOOLCHAIN_INSTALL_DIR=$${SDK_PATH_NATIVE}/usr \
 		TOOLCHAIN_PREFIX=$(CROSS_COMPILE) \
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 27a8b2b..b7399c7 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -71,9 +71,9 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
 "
 
 
-IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\${C6X_GEN_INSTALL_PATH}""
-IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\${TOOLCHAIN_PATH_M4}" ti.targets.arm.elf.M4F="\$\${TOOLCHAIN_PATH_M4}""
-IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\${C6X_GEN_INSTALL_PATH}""
+IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\(C6X_GEN_INSTALL_PATH\)""
+IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\(TOOLCHAIN_PATH_M4\)" ti.targets.arm.elf.M4F="\$\(TOOLCHAIN_PATH_M4\)""
+IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""
 
 IPC_TOOLS_PATHS = ""
 IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
-- 
1.9.1


