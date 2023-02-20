Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C44C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 12:59:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12045.1676897931442645446
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 04:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wt62ISeR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31KCwlHq004965;
	Mon, 20 Feb 2023 06:58:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676897927;
	bh=SljkhemCYlOympq5waXXXcNz4TB9gkVmDKg1DO52EZg=;
	h=From:To:CC:Subject:Date;
	b=wt62ISeRVFFXjrIO6UurAzOy3qJt0PBZ3+nxGdpie3Tqb/fN7mdXlFlLuh18lvyNn
	 Upv19U5gJ+vJDmYYN5AExDsVfiGljVf9n6q1fRggW79SxAsz9SZWMI31sUyZ4tkITg
	 uFzWdkY+T4iph/7iucypTrKRbhmS+4XdAHvkCjGE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31KCwlJM014676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Feb 2023 06:58:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 20
 Feb 2023 06:58:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 20 Feb 2023 06:58:47 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31KCwjcP018669;
	Mon, 20 Feb 2023 06:58:46 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][dunfell][PATCH] recipes-tisdk: ti-tisdk-makefile: Makefile_sysfw-image: Pass DEVICE_TYPE_SEC as SOC_TYPE while building sysfw-image
Date: Mon, 20 Feb 2023 18:28:42 +0530
Message-ID: <20230220125842.545371-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Feb 2023 12:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14222

- Currently $ make sysfw-image DEVICE_TYPE=hs-fs generates a tiboot3 for HS-FS with the name tiboot3-<SOC>-gp-evm.bin as k3-image-gen doesn't have hs-fs override. To solve this issue, let's pass DEVICE_TYPE_SEC as SOC_TYPE while building sysfw-image.

- This changes will be reflected only while building sysfw-image for am62xx-evm, am62xx-lp-evm, am64xx-evm and am62axx-evm.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 1f497261..80f8f701 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -52,7 +52,7 @@ sysfw-image: linux-dtbs
 	@echo    Building SYSFW Image
 	@echo =============================
 	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; \
-		make SBL=$(SBL_PATH) $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
+		make SBL=$(SBL_PATH) $(SYSFW_MAKEARGS) CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc SOC_TYPE=$(DEVICE_TYPE_SEC)
 
 sysfw-image_clean:
 	@echo =============================
-- 
2.34.1


