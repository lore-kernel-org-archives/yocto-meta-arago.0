Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96D5C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 06:27:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37107.1710743218138593353
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 17 Mar 2024 23:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UvBX7qOn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42I6Qv3Q067283
	for <meta-arago@lists.yoctoproject.org>; Mon, 18 Mar 2024 01:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710743217;
	bh=FTSfIUQ37q1U0Nr06XVDQJBeXwwtLlWUI1PEbI0F08Y=;
	h=From:To:CC:Subject:Date;
	b=UvBX7qOnBDPynWPD1IngHkGdYnTTsStJw1N9wQtrJJt9nwubmirtQcnhJp8m6pMxl
	 Gq+Zqg7bf6G1cw/sTCF6h1gq54cfZeZ/mst36xpcrHMxqWit2wLWTn9mOptiiT3Q/Y
	 YQPMe4Hqws1l/qpTbqqdxhBEZ4e2B0SirZYAVgQc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42I6QvIn022776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 18 Mar 2024 01:26:57 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 01:26:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 01:26:57 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42I6Qtvi060982;
	Mon, 18 Mar 2024 01:26:56 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-test: packagegroups: ti-test: j784s4: Add ufs-utils package
Date: Mon, 18 Mar 2024 11:56:53 +0530
Message-ID: <20240318062653.2055243-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:27:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15238

j721e and j784s4 support UFS but the package ufs-utils was missing for j784s4.
Adding the same.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index cf720c03..4dbd9fca 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -127,6 +127,10 @@ TI_TEST_TI_TOOLS:append:j721e = " \
     videnc-test-app \
 "
 
+TI_TEST_TI_TOOLS:append:j784s4 = " \
+    ufs-utils \
+"
+
 TI_TEST_TI_TOOLS:append:omapl138 = " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', d)} \
 "
-- 
2.34.1


