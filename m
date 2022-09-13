Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C86C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 19:09:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1772.1663096176999118724
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 12:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UJ0K5gyr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28DJ9W7s071196;
	Tue, 13 Sep 2022 14:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663096172;
	bh=GJqYReTDssTygk5w7XSHDDA7kaYA1O07OFz8rv7DxgE=;
	h=From:To:CC:Subject:Date;
	b=UJ0K5gyrz5+mRgsOViMe6GLG3D50HHpJF7xUBgtTYLEmNgKmQvlunBLy1uM4aNSHo
	 CdGgdcru4K44gj4x5Kr24J2h6jYvCk+dizbeNd0Ciy8PjDWPjGX7XxRqbmCgd6m4S9
	 up53FgdOPxdKcxTUBNmikfMSe/bUjYb4afdhGEOw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28DJ9WxE004690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Sep 2022 14:09:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 13
 Sep 2022 14:09:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 13 Sep 2022 14:09:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28DJ9V7F025230;
	Tue, 13 Sep 2022 14:09:31 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <p-bhagat@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: Fix top-level
 Makefile for am62xx-lp-evm
Date: Wed, 14 Sep 2022 00:39:29 +0530
Message-ID: <20220913190929.27123-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 19:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14037

- SYSFW_SOC for am62xx-lp-evm should be the same as am62xx-evm.
- DM R5 should be packaged as part of the tispl for am62xx-lp-evm as
well.
- Defconfig for u-boot machine R5 should be am62x_lpsk_r5_config.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image    | 1 +
 .../ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl  | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 08d80c35..bcc5eb38 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -13,6 +13,7 @@ SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x
 SYSFW_SOC_am64xx-hs-evm = am64x
 SYSFW_SOC_am62xx-evm = am62x
+SYSFW_SOC_am62xx-lp-evm = am62x
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
index 4b210d1c..d03373e2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -21,7 +21,7 @@ u-boot-a53:
 	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 		 $(UBOOT_MACHINE) O=$(UBOOT_A53_BUILD_DIR)
-	if [ $(PLATFORM) = am62xx-evm ]; then \
+	if [ $(PLATFORM) = am62xx-evm ] || [ $(PLATFORM) = am62xx-lp-evm ]; then \
 		$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) \
 			CONFIG_MKIMAGE_DTC_PATH=$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
 			ATF=$(UBOOT_ATF) TEE=$(UBOOT_TEE) DM=$(UBOOT_DMFW) \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 471e2776..97e61e17 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -375,6 +375,7 @@ K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
 K3_UBOOT_MACHINE_R5_am62xx-evm = "am62x_evm_r5_config"
+K3_UBOOT_MACHINE_R5_am62xx-lp-evm = "am62x_lpsk_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1


