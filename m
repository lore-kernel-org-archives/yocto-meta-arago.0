Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BCEC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:50:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.5663.1652428201497825151
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sxHDdpAF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nx2i047555;
	Fri, 13 May 2022 02:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428199;
	bh=nGBP9kMRK3IVZn2YK4qyXQB5PTDZ6xPc/gKfQm9k6Lg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sxHDdpAFQENFUcdScK7J2aCHLnne3F6nbioZlV4hhkjMzf/bH3NZPQjxbQk8Y9EMS
	 5rtIDeKtNfon+9+wipbFS8plps0ZF4joT6qEEeZqAvqugNUOWx4PSTj0Hbrok1Gukh
	 AeDpg1tRud26yrTYNyOed7kesB6xaRNT1egm/Ccc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7nxsg025529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:58 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSq3019975;
	Fri, 13 May 2022 02:49:56 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 5/5] ti-tisdk-makefile: Rename
 UBOOT_MACHINE for R5 for am62xx-evm
Date: Fri, 13 May 2022 13:19:23 +0530
Message-ID: <20220513074923.28761-6-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513074923.28761-1-a-m1@ti.com>
References: <20220513074923.28761-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13860

Rename UBOOT_MACHINE for R5 for am62xx-evm to am62x_evm_r5_config

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1cdd5345..471e2776 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -374,7 +374,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
-K3_UBOOT_MACHINE_R5_am62xx-evm = "am62xx_evm_r5_config"
+K3_UBOOT_MACHINE_R5_am62xx-evm = "am62x_evm_r5_config"
 
 do_install_append_k3() {
     cat >> ${D}/Rules.make << __EOF__
-- 
2.17.1


