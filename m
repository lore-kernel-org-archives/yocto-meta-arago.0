Return-Path: <sam.nelson@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7963F52079
	for <meta-arago@arago-project.org>;
	Mon,  8 Oct 2018 17:50:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w98Hok6G104001
	for <meta-arago@arago-project.org>; Mon, 8 Oct 2018 12:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539021046;
	bh=Hz/SGmsEhWaqqz+ljqiMECCB6OEwue+du986I5+f0cI=;
	h=From:To:CC:Subject:Date;
	b=DMlYoDA4vf/K/7JHPVVlvJG8a1GxA3diS7sUL6Hcur7Q6H3VN+qiH7RqbJrDpcqbW
	4uGsIRr4CoOgnPw9sRJPui+bfoloZm+g2+CoSfojUfFSXTvO56kDrg0osuU3iOCjzQ
	LHRODQJMIvLzGezWKuq5rhc3K5vL5X4ryW7IuWkM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w98Hoknv002404
	for <meta-arago@arago-project.org>; Mon, 8 Oct 2018 12:50:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 8 Oct 2018 12:50:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 8 Oct 2018 12:50:46 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w98HokZ4011136;
	Mon, 8 Oct 2018 12:50:46 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Oct 2018 13:50:45 -0400
Message-ID: <1539021045-6899-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][master][PATCH v2] ti-tisdk-makefile: Add ipc targets for top level make for k3
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
X-List-Received-Date: Mon, 08 Oct 2018 17:50:55 -0000
Content-Type: text/plain

Also modify usage of source to "." to make it work with native shell
environment as well

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
- updated title
---
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc          | 9 +++++----
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend   | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
index e74660b..7f566cf 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ipc
@@ -63,14 +63,14 @@ ti-ipc-linux: ti-ipc-rtos-path-check linux ti-ipc-linux-config
 	@echo =================================
 	@echo     Building IPC
 	@echo =================================
-	source $(ENV_SETUP); \
+	. $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH)
 
 ti-ipc-linux_clean: ti-ipc-rtos-path-check ti-ipc-linux-config
 	@echo =================================
 	@echo     Cleaning IPC
 	@echo =================================
-	source $(ENV_SETUP); \
+	. $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) clean
 
 ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
@@ -82,7 +82,7 @@ ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
 		echo "Please run setup.sh in the SDK's root directory and then try again."; \
 		exit 1; \
 	fi
-	source $(ENV_SETUP); \
+	. $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) install DESTDIR=$(DESTDIR)
 
 ti-ipc-linux-examples: ti-ipc-rtos-path-check
@@ -94,6 +94,7 @@ ti-ipc-linux-examples: ti-ipc-rtos-path-check
 		PLATFORM="$(IPC_PLATFORM)" \
 		KERNEL_INSTALL_DIR="$(LINUXKERNEL_INSTALL_DIR)" \
 		XDC_INSTALL_DIR="$(XDC_INSTALL_PATH)" \
+		PDK_INSTALL_DIR="$(PDK_INSTALL_PATH)/.." \
 		BIOS_INSTALL_DIR="$(BIOS_INSTALL_PATH)" \
 		IPC_INSTALL_DIR="$(IPC_INSTALL_PATH)" \
 		TOOLCHAIN_LONGNAME=$${TOOLCHAIN_SYS} \
@@ -119,7 +120,7 @@ ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
 	@echo =================================
 	@echo     Cleaning the IPC Examples
 	@echo =================================
-	source $(ENV_SETUP); \
+	. $(ENV_SETUP); \
 	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples clean \
 		HOSTOS="linux" \
 		PLATFORM="$(IPC_PLATFORM)" \
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 29e0e76..70289a8 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -18,6 +18,7 @@ SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
 MAKEFILES_MATRIX_GUI_omapl138 = ""
 
 MAKEFILES_append_keystone = " ti-ipc"
+MAKEFILES_append_k3 = " ti-ipc"
 
 MAKEFILES_append_k2g = " opencl-examples \
                          openmpacc-examples \
@@ -88,12 +89,14 @@ KERNEL_DEVICETREE_append_am57xx-hs-evm = " ${AM57XX_KERNEL_DEVICETREE}"
 
 IPC_TOOLS_PATHS_C66 = "ti.targets.elf.C66="\$\(C6X_GEN_INSTALL_PATH\)""
 IPC_TOOLS_PATHS_M4  = "ti.targets.arm.elf.M4="\$\(TOOLCHAIN_PATH_M4\)" ti.targets.arm.elf.M4F="\$\(TOOLCHAIN_PATH_M4\)""
+IPC_TOOLS_PATHS_R5F  = "ti.targets.arm.elf.R5F="\$\(TOOLCHAIN_PATH_R5\)""
 IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""
 
 IPC_TOOLS_PATHS = ""
 IPC_TOOLS_PATHS_append_keystone = " ${IPC_TOOLS_PATHS_C66}"
 IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
 IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"
+IPC_TOOLS_PATHS_append_k3 = "${IPC_TOOLS_PATHS_R5F}"
 
 do_install_append() {
     sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
-- 
1.9.1


