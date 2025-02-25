Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15681C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 08:13:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3645.1740471197157807690
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 00:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OaaiAr4y;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51P8DGfn1712580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 02:13:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740471196;
	bh=p1UCcdsnvr8fphwa2937nZQwGbaErZG1zn70TO+bXAI=;
	h=From:To:CC:Subject:Date;
	b=OaaiAr4y6lFcEjQvaxfh3Xgmni/LPeAPBB2yAqeWcyvcvMxHJdu6+cyH60v0Bijhz
	 ObcoQurbIJI2AfmekZyflstwerBgxrx7gyEaTCR5g49XHBMWh8nVdN94hfV/KRLkE8
	 QC5shOkmwGUAGs9DD24hutFwNLetj26rnNO4x9fY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51P8DF7W060185
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 02:13:15 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 02:13:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 02:13:15 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51P8DD2O048235;
	Tue, 25 Feb 2025 02:13:14 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <denys@konsulko.com>, <c-shilwant@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 1/2] conf: machine: j721e-evm: Add camera overlays for J721E EVM
Date: Tue, 25 Feb 2025 13:43:10 +0530
Message-ID: <20250225081311.86701-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 08:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15908

DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
TI EVMs. So pick the DS90UB954-Q1EVM overlay.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 meta-ti-bsp/conf/machine/j721e-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index b0b2a5b6..d216bbe2 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -19,6 +19,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
     ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
     ti/k3-j721e-sk.dtb \
+    ti/k3-j721e-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.34.1


