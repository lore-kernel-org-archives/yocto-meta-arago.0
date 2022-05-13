Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB824C433FE
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:49:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5695.1652428197761721043
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h2rwOjOd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nt5q047508;
	Fri, 13 May 2022 02:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428195;
	bh=C4ZA2ZNfD3UCdWnvJxApXS1UiGX7IGEZ9A6KMKhuJLM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h2rwOjOddNdHCrRUXJlLfFjnjmVYC5teTRI6f9p9FLbKttxqOnu2yYdV0+7U3Sanl
	 uhEwn9fTLYjoXyYUcReJgbURuEdkxxkKyjDnQuiyLLGbsPAWFzYNj9bMXyKQwECJpJ
	 C8l0X+wtN6gAjibtto7cPBNNKpR3nxxzj82JjC9o=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7ntoV035741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:54 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSq2019975;
	Fri, 13 May 2022 02:49:52 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 4/5] ti-tisdk-makefile:
 Makefile_sysfw-image: Add support for am62xx-evm
Date: Fri, 13 May 2022 13:19:22 +0530
Message-ID: <20220513074923.28761-5-a-m1@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13859

Add support for sysfw-image build for am62xx-evm.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image                  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 9a653769..08d80c35 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -12,13 +12,15 @@ SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x
 SYSFW_SOC_am64xx-hs-evm = am64x
-SYSFW_SOC_am62xx-evm = am62xx
+SYSFW_SOC_am62xx-evm = am62x
 SYSFW_SOC_j7-evm = j721e
 SYSFW_SOC_j7-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
-SYSFW_PREFIX = ti-sci-firmware
+SYSFW_PREFIX_$(SYSFW_SOC) = ti-sci-firmware
 SYSFW_PREFIX_j7 = ti-fs-firmware
+SYSFW_PREFIX_am62x = ti-fs-firmware
+SYSFW_PREFIX = $(SYSFW_PREFIX_$(SYSFW_SOC))
 
 SYSFW_BASE = $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
 
-- 
2.17.1


