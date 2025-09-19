Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4640CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:18:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4801.1758309530593253089
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A07q78cs;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJInOP306873
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758309529;
	bh=hAfXxnD5KjSpr90oTXSjjMSPcIaQV/3MXR76fGM8Yg8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=A07q78csmqmU2xJ9xUlUvAJAWOBw5cuRdyPt4PlqeM8LN9RxIAEohlm79lIIPbgjq
	 E4zhlNHIBFRRuxvpiZEpsYMWHbNXVEXx/Exk+oF8ZGMRjQh93HMEbZC/8d1M4MvOtD
	 w5Ga6u2zDs/rSuuUqES/Yp93dwA54DGIGL7gqB34=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJInG44176250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:18:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:18:49 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJInax3063676;
	Fri, 19 Sep 2025 14:18:49 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2 2/2] ti-test: Add libsdl2-tests to packagegroup
Date: Fri, 19 Sep 2025 14:18:49 -0500
Message-ID: <20250919191849.2622310-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919191849.2622310-1-a-christidis@ti.com>
References: <20250919191849.2622310-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16603

From: Antonios Christidis <a-christidis@ti.com>

Add libsdl2-tests to the ti-test packagegroup.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index a44dd8d7..c1166bc2 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -67,6 +67,7 @@ TI_TEST_BASE:append:ti-soc = " \
 "
 
 TI_TEST_EXTRAS = " \
+    libsdl2-tests \
     python3-pillow \
     pytesseract \
     piglit \
-- 
2.34.1


