Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016FEC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 08:13:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3578.1740471200713160405
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 00:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wc5Tl108;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51P8DJtM1747456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 02:13:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740471199;
	bh=ZgJWpRD1YzogVS2PFISDLR5cTClXc1xySpZ+37w9wVc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wc5Tl108vNMabLCE8VI7h5M+C3Qt7GS9WctTe+l7Mb0xBTKxR2K/876OXAo/ou0/D
	 kpcRst0lejjnDEEn0dUaH2ool8O8YDBibBkwamdFCnM0YshVel77U+bOVsMfAXglq6
	 B835Di44w4fbUOBktGmAdh8vEMJe3MWM+i5/5iUE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51P8DJ4t125244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 02:13:19 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 02:13:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 02:13:18 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51P8DD2P048235;
	Tue, 25 Feb 2025 02:13:17 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <denys@konsulko.com>, <c-shilwant@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 2/2] conf: machine: j721s2/j784s4: Pick overlays for V3Link cameras
Date: Tue, 25 Feb 2025 13:43:11 +0530
Message-ID: <20250225081311.86701-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225081311.86701-1-y-abhilashchandra@ti.com>
References: <20250225081311.86701-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 08:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15909

DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
TI EVMs. So pick the DS90UB954-Q1EVM overlay.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 5cb28309..f0600f33 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -20,6 +20,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
     ti/k3-j721s2-evm-gesi-exp-board.dtbo \
     ti/k3-j721s2-evm-pcie1-ep.dtbo \
+    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index e1443ef5..3940a95f 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -23,6 +23,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm-quad-port-eth-exp1.dtbo \
     ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtbo \
     ti/k3-j784s4-evm.dtb \
+    ti/k3-j721s2-evm-ub954.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.34.1


