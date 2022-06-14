Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D16C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 09:25:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.4020.1655198750543673435
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 02:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cZo69eqM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25E9PnlS100905
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 04:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655198749;
	bh=z03X8amYXC7mitnp33vNwd2JNUIqorXRuIWRPwEhD2o=;
	h=From:To:CC:Subject:Date;
	b=cZo69eqMMcN+SV4P1/vl0eEqx4RD5w7XkbTcr9KSCUcvqpqhVcSzM8Hg/t0MpGyCf
	 uWnE5QfTHxAGc9WRgiwQ5OuxF9RM0qcMVp/AqkZNZqN8cyav7Oje0qjFFc4r5FX86k
	 pcfqamWNfeR9JeFbvXiY7Jr7WtnIgPWVkrVhxFcM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25E9PnkB116396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 04:25:49 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 04:25:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 04:25:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25E9Pm2C022858;
	Tue, 14 Jun 2022 04:25:48 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <praneeth@ti.com>
Subject: [dunfell/master][PATCH] conf: arago: Add j721s2 hs platform support
Date: Tue, 14 Jun 2022 14:55:47 +0530
Message-ID: <20220614092547.1988217-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 09:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13897

Add kernel type for j721s2 hs platform

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index eb380c63..0e2f7ef1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -55,6 +55,7 @@ KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_am64xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j7200-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES_j721s2-hs-evm = "Image fitImage"
 
 KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"
-- 
2.17.1


