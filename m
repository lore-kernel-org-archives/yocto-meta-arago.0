Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.8375.1645172737883237732
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oHiXY8+0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21I8PaVp011878
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Feb 2022 02:25:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645172736;
	bh=WSCgoRo8aeRDYQfBhJkDbrLR5+tJt+ZoiH9eRJcDFDU=;
	h=From:To:CC:Subject:Date;
	b=oHiXY8+0o35ukbFkULflPoy42AisZnATP+bwHhSa6XIf8fQ5lw1LwcoWiYux1Wg5/
	 ncuCnY0uw5aD6WtLH9ciJ3bKDWwbaVmxFSfO3EQXVeg1Honzix/Ihskz1LBBSHC0Y8
	 ha7FwTZ3JcT5l/TzsvwmlXNc4+MyDKwc0JqAbWAs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21I8PaYm054192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Feb 2022 02:25:36 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Feb 2022 02:25:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Feb 2022 02:25:36 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21I8PXBL128381;
	Fri, 18 Feb 2022 02:25:34 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, Aparna M <a-m1@ti.com>
Subject: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: Add support for sysfw build for am64xx devices
Date: Fri, 18 Feb 2022 13:55:30 +0530
Message-ID: <20220218082530.31503-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add support in Makefile for sysfw build for am64xx devices

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image                 | 7 +++++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb             | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 96efa538..aaf1f112 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,5 +1,6 @@
-# Define the following to support multple platforms
+# Define the following to support multiple platforms
 PLATFORM_TYPE_$(PLATFORM) = gp
+PLATFORM_TYPE_am64xx-hs-evm = hs
 PLATFORM_TYPE_am65xx-hs-evm = hs
 PLATFORM_TYPE_j7-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
@@ -9,6 +10,8 @@ SYSFW_CONFIG = evm
 SYSFW_SOC_$(PLATFORM) = NULL
 SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
+SYSFW_SOC_am64xx-evm = am64x
+SYSFW_SOC_am64xx-hs-evm = am64x
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
@@ -22,7 +25,7 @@ SYSFW_MAKEARGS_common = SYSFW_DL_URL="" SYSFW_HS_DL_URL="" SYSFW_HS_INNER_CERT_D
                         SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE).bin \
                         SOC=$(SYSFW_SOC) CONFIG=$(SYSFW_CONFIG)
 
-SYSFW_MAKEARGS_gp = 
+SYSFW_MAKEARGS_gp =
 SYSFW_MAKEARGS_hs = HS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
                     SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 25aa8c38..a510a814 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -66,6 +66,7 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 MAKEFILES_MATRIX_GUI_keystone = ""
 MAKEFILES_MATRIX_GUI_omapl138 = ""
 MAKEFILES_MATRIX_GUI_j7 = ""
+MAKEFILES_MATRIX_GUI_am64xx = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -356,6 +357,8 @@ do_install () {
 K3_UBOOT_MACHINE_R5 = ""
 K3_UBOOT_MACHINE_R5_am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
+K3_UBOOT_MACHINE_R5_am64xx-evm = "am64x_evm_r5_defconfig"
+K3_UBOOT_MACHINE_R5_am64xx-hs-evm = "am64x_hs_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
-- 
2.17.1

