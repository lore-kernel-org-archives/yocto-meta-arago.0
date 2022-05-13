Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9808C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:49:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.5665.1652428193829780544
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P4YubEIt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7npfb051332;
	Fri, 13 May 2022 02:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428191;
	bh=LDeOrf+rWxkzGx5KVbM2/QZhdVogC2bE5JuIMyMyFvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=P4YubEItzRHDdt0x5MzgmclH6g2O+nXHzi+XYMYbAk8VNNwQFkRAo3YTOADLiOGAH
	 qSAo2Aun0LRBNVzxlzkeLolpVlwnEfJm1BnFn9ojWWppPIeaKNweS1yIe6VuEbR1Bu
	 CiiyI/TjwZGt8vgE21sXijVgxGF0hfNyhH/+v2o8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7npT0108701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:51 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:51 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSq1019975;
	Fri, 13 May 2022 02:49:48 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 3/5] ti-tisdk-makefile:
 Makefile_sysfw-image: Add support for combined tiboot3.bin build in k3
 devices
Date: Fri, 13 May 2022 13:19:21 +0530
Message-ID: <20220513074923.28761-4-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513074923.28761-1-a-m1@ti.com>
References: <20220513074923.28761-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13858

Add support to combine sysfw.itb with tiboot3.bin to generate a combined
tiboot3.bin for k3 devices. Additionally, add support for both GP and HS
machines.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image        | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 65c79653..9a653769 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -23,28 +23,31 @@ SYSFW_PREFIX_j7 = ti-fs-firmware
 SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
 
 SYSFW_MAKEARGS_common = SYSFW_DL_URL="" SYSFW_HS_DL_URL="" SYSFW_HS_INNER_CERT_DL_URL="" \
-                        SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE).bin \
-                        SOC=$(SYSFW_SOC) CONFIG=$(SYSFW_CONFIG)
+			SOC=$(SYSFW_SOC) CONFIG=$(SYSFW_CONFIG)
+
+SYSFW_MAKEARGS_gp = SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE).bin
 
-SYSFW_MAKEARGS_gp =
 SYSFW_MAKEARGS_hs = HS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
-                    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin
+		    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin \
+		    SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin
 
 SYSFW_MAKEARGS = $(SYSFW_MAKEARGS_common) $(SYSFW_MAKEARGS_$(PLATFORM_TYPE))
 
+SBL_PATH = $(TI_SDK_PATH)/board-support/u-boot_build/r5/spl/u-boot-spl.bin
+
 # Depend on linux-dtbs for the dtc utility
 sysfw-image: linux-dtbs
 	@echo =============================
 	@echo    Building SYSFW Image
 	@echo =============================
 	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; \
-		make $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
+		make SBL=$(SBL_PATH) $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
 
 sysfw-image_clean:
 	@echo =============================
 	@echo    Cleaning SYSFW Image
 	@echo =============================
-	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; make clean
+	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; make $(SYSFW_MAKEARGS) clean
 
 sysfw-image_install:
 	@echo =============================
-- 
2.17.1


