Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DED9752982
	for <meta-arago@arago-project.org>;
	Fri, 24 Aug 2018 19:37:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OJbaY2028908
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535139456;
	bh=AGPlabteI8iRWo+P7UTQV1ur3sAZQXMeJNbb7Um+AGI=;
	h=From:To:CC:Subject:Date;
	b=tpr6KnMtFR9vNgb4wOQIbExbqTsizxT+/+dd/Xgmz9iQIHFrWynB8qMWkXedtLtYz
	K28dlXcyTOq8gtM8wY+ETdykVJJQrhbUjGUJzN3HS9RiFFIXZPy64ad32uYAX7fECO
	dEewz/NRdZiMEz2by+ei3jVuOMDGMwyr9pau39Lc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbaL1027184
	for <meta-arago@arago-project.org>; Fri, 24 Aug 2018 14:37:36 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 14:37:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 14:37:35 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OJbZ0p004368;
	Fri, 24 Aug 2018 14:37:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Aug 2018 15:25:15 -0400
Message-ID: <1535138718-6772-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/4] ti-tisdk-makefile: add k3 U-Boot for R5
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
X-List-Received-Date: Fri, 24 Aug 2018 19:37:44 -0000
Content-Type: text/plain

* Add a custom U-Boot target for k3 as there are multiple differences
  from previous machines:
  - Two U-Boot images. One for A53, one for R5.
  - Each U-Boot image is combined into a fitImage with other images
   (e.g. ATF, OPTEE, SYSFW).
* Also make additions to the Rules.make as the R5 uses the armv7
  toolchain while the A53 uses the armv8 toolchain.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/k3/Makefile_u-boot-spl       | 61 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  9 ++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
new file mode 100644
index 0000000..7a0ec22
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -0,0 +1,61 @@
+
+# u-boot build targets
+u-boot-spl: u-boot
+u-boot-spl_clean: u-boot_clean
+u-boot-spl_install: u-boot_install
+
+UBOOT_A53_BUILD_DIR=$(TI_SDK_PATH)/board-support/u-boot_build/a53
+UBOOT_R5_BUILD_DIR=$(TI_SDK_PATH)/board-support/u-boot_build/r5
+
+UBOOT_ATF=$(TI_SDK_PATH)/board-support/prebuilt-images/bl31.bin
+UBOOT_TEE=$(TI_SDK_PATH)/board-support/prebuilt-images/bl32.bin
+UBOOT_SYSFW=$(TI_SDK_PATH)/board-support/prebuilt-images/sysfw.bin
+
+u-boot: u-boot-a53 u-boot-r5
+u-boot_clean: u-boot-a53_clean u-boot-r5_clean
+
+u-boot-a53:
+	@echo ===================================
+	@echo    Building U-boot for A53
+	@echo ===================================
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
+		 $(UBOOT_MACHINE) O=$(UBOOT_A53_BUILD_DIR)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
+		CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
+		ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) \
+		O=$(UBOOT_A53_BUILD_DIR)
+
+u-boot-a53_clean:
+	@echo ===================================
+	@echo    Cleaining U-boot for A53
+	@echo ===================================
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
+		O=$(UBOOT_A53_BUILD_DIR) distclean
+	@rm -rf $(UBOOT_A53_BUILD_DIR)
+
+
+u-boot-r5:
+	@echo ===================================
+	@echo    Building U-boot for R5
+	@echo ===================================
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) \
+		 $(UBOOT_MACHINE_R5) O=$(UBOOT_R5_BUILD_DIR)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) \
+		CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_R5_BUILD_DIR)/scripts/dtc/dtc \
+		SYSFW=$(UBOOT_SYSFW) \
+		O=$(UBOOT_R5_BUILD_DIR)
+
+u-boot-r5_clean:
+	@echo ===================================
+	@echo    Cleaining U-boot for R5
+	@echo ===================================
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) \
+		O=$(UBOOT_R5_BUILD_DIR) distclean
+	@rm -rf $(UBOOT_R5_BUILD_DIR)
+
+u-boot_install:
+	@echo ===================================
+	@echo    Installing U-boot
+	@echo ===================================
+	@echo "Nothing to do"
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f296ffa..75a9392 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -282,6 +282,15 @@ do_install () {
 
 }
 
+do_install_append_k3() {
+    cat >> ${D}/Rules.make << __EOF__
+
+# Add CROSS_COMPILE and UBOOT_MACHINE for the R5
+export CROSS_COMPILE_ARMV7=\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE}-arago-linux/usr/bin/arm-linux-gnueabihf-
+UBOOT_MACHINE_R5=am65x_evm_r5_defconfig
+__EOF__
+}
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} = "/*"
-- 
2.7.4


