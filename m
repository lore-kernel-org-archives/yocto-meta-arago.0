Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D9C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 07:47:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14838.1669189648119632520
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 23:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PfqHUk3q;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN7lR8i014064
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 01:47:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669189647;
	bh=kl8zXzAGV91/JhMEslk2JegGj9keQ7h70zLmC4mlUz8=;
	h=From:To:CC:Subject:Date;
	b=PfqHUk3q5G0Sy892kNd4AwIA3ZARQaAP1T3/+c9YSvJwSJXgrbmna8rb4mF0hKZGU
	 tLLV0Wkd2X5WcDprvltmkigrs0zR9p3EzXUgAVUFXTJxx5LNFw7Xs4TFIFqNuqemX/
	 RHxl+hsmbrIfTNIhAFMVZpkedCkIV+xxWJETLElA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN7lRuG020835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 01:47:27 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 23
 Nov 2022 01:47:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 23 Nov 2022 01:47:26 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN7lPlc093964;
	Wed, 23 Nov 2022 01:47:26 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [dunfell][PATCH] ti-tisdk-makefile: Add support for AM64x HS-FS in Makefile_sysfw-image
Date: Wed, 23 Nov 2022 13:16:41 +0530
Message-ID: <20221123074641.3860-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 07:47:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14116

-Add support for sysfw-image build for am64xx HS-FS.
-Make HS-FS as default platform for am64xx-evm.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 08d80c35..e7888848 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,6 +1,6 @@
 # Define the following to support multiple platforms
 PLATFORM_TYPE_$(PLATFORM) = gp
-PLATFORM_TYPE_am64xx-hs-evm = hs
+PLATFORM_TYPE_am64xx-evm = hs-fs
 PLATFORM_TYPE_am65xx-hs-evm = hs
 PLATFORM_TYPE_j7-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
@@ -10,8 +10,7 @@ SYSFW_CONFIG = evm
 SYSFW_SOC_$(PLATFORM) = NULL
 SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
-SYSFW_SOC_am64xx-evm = am64x
-SYSFW_SOC_am64xx-hs-evm = am64x
+SYSFW_SOC_am64xx-evm = am64x_sr2
 SYSFW_SOC_am62xx-evm = am62x
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
@@ -32,6 +31,9 @@ SYSFW_MAKEARGS_gp = SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SY
 SYSFW_MAKEARGS_hs = HS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
 		    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin \
 		    SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin
+SYSFW_MAKEARGS_hs-fs = HS-FS=1 SYSFW_HS_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin \
+                    SYSFW_HS_INNER_CERT_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-cert.bin \
+                    SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/$(SYSFW_BASE)-enc.bin
 
 SYSFW_MAKEARGS = $(SYSFW_MAKEARGS_common) $(SYSFW_MAKEARGS_$(PLATFORM_TYPE))
 
-- 
2.17.1


