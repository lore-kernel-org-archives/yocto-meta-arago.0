Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9A0CB520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 17:51:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86HoEeG130842
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 12:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567792214;
	bh=+StQB/gwi/96kcPWV8e5OpM5m85VE81jzUPoUvbwGe0=;
	h=From:To:CC:Subject:Date;
	b=YIBiZhObRNPVdVUvyVyDHENMJeZi5W1qrrvxBhuf0xfEGvXfNM6qwChyScwv40SqN
	l1w24eANQeb6NLKw73Z3vpYlCxUTQBJ+yaWADJrYa4Z7DMsqyPZtL1Sdma9MhbvL64
	L8lp7GqkS5YnNtXJl90VMy+AYD4OQaDsi5tVgj+o=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86HoE4P005447
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 12:50:14 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 12:50:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 12:50:14 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86HoDWH003584;
	Fri, 6 Sep 2019 12:50:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Sep 2019 13:32:11 -0400
Message-ID: <1567791131-25912-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-makefile: sysfw-image: extend support
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
X-List-Received-Date: Fri, 06 Sep 2019 17:51:19 -0000
Content-Type: text/plain

* extend support to am65xx-hs-evm and j7-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image         | 28 +++++++++++++++++++++-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  2 +-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index f7b8787..94ee40d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,3 +1,29 @@
+# Define the following to support multple platforms
+PLATFORM_TYPE_$(PLATFORM) = gp
+PLATFORM_TYPE_am65xx-hs-evm = hs
+PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
+
+SYSFW_CONFIG = evm
+
+SYSFW_SOC_$(PLATFORM) = NULL
+SYSFW_SOC_am65xx-evm = am65x
+SYSFW_SOC_am65xx-hs-evm = am65x
+SYSFW_SOC_j7-evm = j721e
+SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
+
+SYSFW_PREFIX = ti-sci-firmware
+
+SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
+
+SYSFW_MAKEARGS_common = SYSFW_DL_URL="" SYSFW_HS_DL_URL="" SYSFW_HS_INNER_CERT_DL_URL="" \
+                        SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE).bin \
+                        SOC=$(SYSFW_SOC) CONFIG=$(SYSFW_CONFIG)
+
+SYSFW_MAKEARGS_gp = 
+SYSFW_MAKEARGS_hs = HS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
+                    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin
+
+SYSFW_MAKEARGS = $(SYSFW_MAKEARGS_common) $(SYSFW_MAKEARGS_$(PLATFORM_TYPE))
 
 # Depend on linux-dtbs for the dtc utility
 sysfw-image: linux-dtbs
@@ -5,7 +31,7 @@ sysfw-image: linux-dtbs
 	@echo    Building SYSFW Image
 	@echo =============================
 	@cd board-support; cd `find . -maxdepth 1 -type d -name "*system-firmware-image*"`; \
-		make SYSFW_DL_URL="" SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/ti-sci-firmware-am65x-gp.bin CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
+		make $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
 
 sysfw-image_clean:
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 99f6523..417b28b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -55,7 +55,7 @@ SRC_URI = "\
     file://Makefile_jailhouse \
 "
 
-PR = "r100"
+PR = "r101"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


