Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB34C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 09:38:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.43759.1670319510926783176
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 01:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Up3uwNeT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B69cQno102079;
	Tue, 6 Dec 2022 03:38:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670319506;
	bh=K/lEiBeBJZFenPDZeq+h2sgroZrFUJXfALOVGPd6Wy8=;
	h=From:To:CC:Subject:Date;
	b=Up3uwNeTP3YdR3vUMh1/FqQFoZ/mV/vWSjDPhCpdoIyzetp0Z16Fu/OK0cHci4G+j
	 YSFz5XdhFxiQKSvmkBPmEVl3sEh4x3Slx779zqFHnWzCBEdFQfzD8pLreusPEfd6MV
	 jo+O/dbZxbSJQ3PnRk+kkfmB+xkijWG0RTCxmw/s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B69cQU6069521
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Dec 2022 03:38:26 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 03:38:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 03:38:23 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B69cNUR038591;
	Tue, 6 Dec 2022 03:38:23 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <g-gupta@ti.com>
CC: <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH] meta-arago-distro: add initial support for am62axx
Date: Tue, 6 Dec 2022 15:08:20 +0530
Message-ID: <20221206093820.10929-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Dec 2022 09:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14128

lets add support for the latest of TI SoC.

- ti-tisdk-makefile: adding uboot r5 config variable for am62axx
- packagegroup-arago-tisdk-addons: Add needed am62axx entries
- Makefile_sysfw-image: Add SYSFW_SOC for am62axx
- Makefile_u-boot-spl: Update Makefile to support am62axx

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 1 +
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image    | 2 ++
 .../ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl  | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 824c7fa0..073740a2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -65,6 +65,7 @@ UTILS_append_k3 = " mmc-utils \
 
 UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
+UTILS_append_am62axx = " ti-rtos-firmware"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index e7888848..b8971137 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -12,6 +12,7 @@ SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x_sr2
 SYSFW_SOC_am62xx-evm = am62x
+SYSFW_SOC_am62axx-evm = am62ax
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
@@ -19,6 +20,7 @@ SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 SYSFW_PREFIX_$(SYSFW_SOC) = ti-sci-firmware
 SYSFW_PREFIX_j7 = ti-fs-firmware
 SYSFW_PREFIX_am62x = ti-fs-firmware
+SYSFW_PREFIX_am62ax = ti-fs-firmware
 SYSFW_PREFIX = $(SYSFW_PREFIX_$(SYSFW_SOC))
 
 SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
index 4b210d1c..813ec60d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -21,7 +21,7 @@ u-boot-a53:
 	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 		 $(UBOOT_MACHINE) O=$(UBOOT_A53_BUILD_DIR)
-	if [ $(PLATFORM) = am62xx-evm ]; then \
+	if [ $(PLATFORM) = am62xx-evm ] || [ $(PLATFORM) = am62axx-evm ]; then \
 		$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 			CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
 			ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) DM=$(UBOOT_DMFW) \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 700b68c2..cea84a92 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -377,6 +377,7 @@ K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j784s4-evm = "j784s4_evm_r5_config"
 K3_UBOOT_MACHINE_R5_am62xx-evm = "am62x_evm_r5_config"
 K3_UBOOT_MACHINE_R5_am62xx-lp-evm = "am62x_lpsk_r5_config"
+K3_UBOOT_MACHINE_R5_am62axx-evm = "am62ax_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1


