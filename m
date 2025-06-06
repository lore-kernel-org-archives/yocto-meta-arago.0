Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A04C5B552
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 02:40:26 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.25180.1749177617012514349
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 19:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r/jb+8Cu;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5562eF0E1266471;
	Thu, 5 Jun 2025 21:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749177615; i=@ti.com;
	bh=c9fwNxRmrPbZ1vftKcJv8nYstuZaB3sE7gCf2DDZIQ8=;
	h=From:To:Subject:Date;
	b=r/jb+8CuLVZ1yhXpdeB7kLnF4BUcgL53eTIEIg1G9VNb51+BXEX6BzHV2eSNDFHhZ
	 q900wXL81JQIyyWQA/Fme/46G0vcHlBCwwvduWtB3AN10kTCQ/M9rbHPWoBut3seqM
	 Blxy5sNZFC479vBxcnD7D5zXCFrtr1NhWUP1qJzQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5562eFUn1251900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 21:40:15 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 21:40:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 21:40:15 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5562eFHH289403;
	Thu, 5 Jun 2025 21:40:15 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 6D4162356; Thu,  5 Jun 2025 21:40:15 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202506051136
Date: Thu, 5 Jun 2025 21:40:15 -0500
Message-ID: <20250606024015.272536-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Jun 2025 02:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16256

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=81256f628c763f63f77818cf0d1605a9703ef92a..c5be4c2b403371c49cb98f3c2c50f59b08b18c05

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index d04ca0fe..5a8fd2d8 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "81256f628c763f63f77818cf0d1605a9703ef92a"
+SRCREV = "c5be4c2b403371c49cb98f3c2c50f59b08b18c05"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


