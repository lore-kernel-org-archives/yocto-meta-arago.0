Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2EAC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 08:37:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.154441.1672130265247875172
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Dec 2022 00:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nEZH3sS5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BR8bdcP117196;
	Tue, 27 Dec 2022 02:37:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672130259;
	bh=UWmChrucNlyX+XcPXkwWSA0fzRKvI+cubI5IslZsMxQ=;
	h=From:To:CC:Subject:Date;
	b=nEZH3sS5+TcqdEnLUu2MNLlVJl1yCOSOYd/g+eIwgMw8Be3tCS/msvyO8XlgaPero
	 WRYDH6Od+zUlcYJeRRcTyPFKKObJbYMaq6QsHpx3izZY83RP5uNgg855ml0NlC6lTK
	 POz4QLAThGSPSiXNfsBTwSJJco6H5PuZv4Gc7eXI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BR8bdZJ071960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Dec 2022 02:37:39 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 27
 Dec 2022 02:37:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 27 Dec 2022 02:37:38 -0600
Received: from chirag (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BR8bbAC026235;
	Tue, 27 Dec 2022 02:37:38 -0600
Received: from sadivi by chirag with local (Exim 4.90_1)
	(envelope-from <c-shilwant@ti.com>)
	id 1pA5Sq-00020W-5v; Tue, 27 Dec 2022 14:07:36 +0530
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][dunfell][PATCH] meta-arago-distro: add initial support for AM62Q HS-SE
Date: Tue, 27 Dec 2022 14:07:30 +0530
Message-ID: <20221227083730.7001-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Dec 2022 08:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14139

- Makefile_sysfw-image: Add SYSFW_SOC for am62xx-lp-evm
- Makefile_u-boot-spl: Update Makefile to support am62xx-lp-evm

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image   | 3 +++
 .../ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index b8971137..fe51de5f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -2,6 +2,7 @@
 PLATFORM_TYPE_$(PLATFORM) = gp
 PLATFORM_TYPE_am64xx-evm = hs-fs
 PLATFORM_TYPE_am65xx-hs-evm = hs
+PLATFORM_TYPE_am62xx-lp-evm = hs
 PLATFORM_TYPE_j7-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 
@@ -12,6 +13,7 @@ SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x_sr2
 SYSFW_SOC_am62xx-evm = am62x
+SYSFW_SOC_am62xx-lp-evm = am62x
 SYSFW_SOC_am62axx-evm = am62ax
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
@@ -20,6 +22,7 @@ SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 SYSFW_PREFIX_$(SYSFW_SOC) = ti-sci-firmware
 SYSFW_PREFIX_j7 = ti-fs-firmware
 SYSFW_PREFIX_am62x = ti-fs-firmware
+SYSFW_PREFIX_am62x-lp-evm = ti-fs-firmware
 SYSFW_PREFIX_am62ax = ti-fs-firmware
 SYSFW_PREFIX = $(SYSFW_PREFIX_$(SYSFW_SOC))
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
index 813ec60d..f0bd16df 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -21,7 +21,7 @@ u-boot-a53:
 	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 		 $(UBOOT_MACHINE) O=$(UBOOT_A53_BUILD_DIR)
-	if [ $(PLATFORM) = am62xx-evm ] || [ $(PLATFORM) = am62axx-evm ]; then \
+	if [ $(PLATFORM) = am62xx-evm ] || [ $(PLATFORM) = am62axx-evm ] || [ $(PLATFORM) = am62xx-lp-evm ]; then \
 		$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 			CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
 			ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) DM=$(UBOOT_DMFW) \
-- 
2.17.1


