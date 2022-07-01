Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4F1C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:12:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.40320.1656691959902917493
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 09:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pB19Fx1J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261GCbXT053145;
	Fri, 1 Jul 2022 11:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656691957;
	bh=OQ9ObaajeeSg2n4KYyj7TcJ1a7FKc7yaHjNyflG4bZA=;
	h=From:To:Subject:Date;
	b=pB19Fx1JUwxkv5H02lAC3IRjWfe2A/tHgl3IMdsbNoTo7K9ml4J6beuV9aM0FspGu
	 n1bDBDRRuDL7SyzLmQa1WQ8Y5mcV+2YvqQFaiSUElX+2yuFR5nqKb6UuwUZbNeKrNt
	 bpVlxIDG1b6hEru3+lvMKcJEPmNu5DAwBvR5ovM4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261GCbdk019942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 11:12:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 11:12:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 11:12:37 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261GCb3I123538;
	Fri, 1 Jul 2022 11:12:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o7JG1-0002k2-2z; Fri, 01 Jul 2022 11:12:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new
 dtb for GESI
Date: Fri, 1 Jul 2022 11:12:37 -0500
Message-ID: <20220701161237.10497-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Jul 2022 16:12:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13935

The following commits in ti-linux-5.10.y kernel has introduced a new dtb.

commit: 9b05b2a89ff ("arm64: dts: ti: Add overlay for GESI to enable main CPSW2G in J721S2")

This patch on j721s2 conf is to include the new dtb.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index e5ed0b73..b224ce7b 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -13,6 +13,7 @@ OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-gesi-exp-board.dtb \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-- 
2.17.1


