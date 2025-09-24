Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF4DCAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:26:30 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.20250.1758734786215332094
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 10:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PUvtk1qd;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OHQPZA1277305
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758734785;
	bh=gLP/IMD2grfuZhBr42lEuZHgrYisGjlhKTlE+m0mlCI=;
	h=From:To:CC:Subject:Date;
	b=PUvtk1qdJAMqBm6Hw+7h8eC9zigUATmbbGDFiyi/H1u+y1JB6yns2kaD8eYy+zRHc
	 Cj5GqjX3HBkKUVK/a0BpDj47HebkG2qzvd/CMsenoRfFbtFEAJixdUkEARU+vtoLEe
	 gL7NWeyBJzayIW7Bi1BGqm/fZc2b0OUTRiCTwrK8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OHQPLI2024663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:26:25 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 12:26:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 12:26:24 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OHQNl32374277;
	Wed, 24 Sep 2025 12:26:24 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>
Subject: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV to latest
Date: Wed, 24 Sep 2025 22:56:10 +0530
Message-ID: <20250924172610.8166-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 17:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16622

Pulls in AM62D SoC support.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
index 39171041..6dec53e7 100644
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
 "
 
-SRCREV = "a8297c7a2ca9e127929095045228dd4761121d56"
+SRCREV = "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


