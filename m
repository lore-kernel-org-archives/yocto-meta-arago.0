Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A55C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:49:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5603.1652428186666692063
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kn7a91cD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nh9c101978;
	Fri, 13 May 2022 02:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428183;
	bh=Y8l6BFH/JPhEylh8BbQ8eyIbRVPUQduJ49VGkGki8ZA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kn7a91cDgSBG4b595yV7KBLE3O3LggI7BHztOpng4isE6vxFQJG5iJjGUXxQ7dgn/
	 lVlzbQTLSgV83tPSWgHUwFXBPlKca5OztlhvlAUEOhQp7PST4dowPNxNoWPGiHjo6S
	 u4SmyLUMtFuD986Skyfdyb9MVf0RL/1QnETKUSos=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7nh3h108652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:42 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSpx019975;
	Fri, 13 May 2022 02:49:40 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 1/5] ti-tisdk-makefile:
 Makefile_u-boot-spl: Add support for u-boot-a53 build for am62xx-evm
Date: Fri, 13 May 2022 13:19:19 +0530
Message-ID: <20220513074923.28761-2-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513074923.28761-1-a-m1@ti.com>
References: <20220513074923.28761-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13856

The DM firmware binary ipc_echo_testb_mcu1_0_release_strip.xer5f is
packaged with tispl.bin in am62xx-evm. Add support for u-boot-a53 build
for the device in toplevel Makefile of SDK.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../ti-tisdk-makefile/k3/Makefile_u-boot-spl     | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
index d1a5ed08..4b210d1c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -10,6 +10,7 @@ UBOOT_R5_BUILD_DIR=$(TI_SDK_PATH)/board-support/u-boot_build/r5
 UBOOT_ATF=$(TI_SDK_PATH)/board-support/prebuilt-images/bl31.bin
 UBOOT_TEE=$(TI_SDK_PATH)/board-support/prebuilt-images/bl32.bin
 UBOOT_SYSFW=$(TI_SDK_PATH)/board-support/prebuilt-images/sysfw.bin
+UBOOT_DMFW=$(TI_SDK_PATH)/board-support/prebuilt-images/ipc_echo_testb_mcu1_0_release_strip.xer5f
 
 u-boot: u-boot-a53 u-boot-r5
 u-boot_clean: u-boot-a53_clean u-boot-r5_clean
@@ -20,10 +21,17 @@ u-boot-a53:
 	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 		 $(UBOOT_MACHINE) O=$(UBOOT_A53_BUILD_DIR)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
-		CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
-		ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) \
-		O=$(UBOOT_A53_BUILD_DIR)
+	if [ $(PLATFORM) = am62xx-evm ]; then \
+		$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
+			CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
+			ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) DM=$(UBOOT_DMFW) \
+			O=$(UBOOT_A53_BUILD_DIR); \
+	else \
+		$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
+			CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
+			ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) \
+			O=$(UBOOT_A53_BUILD_DIR); \
+	fi
 
 u-boot-a53_clean:
 	@echo ===================================
-- 
2.17.1


