Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98330CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:27:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3088.1758238071621288023
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 16:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nDAM8M+R;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58INRnC4581812;
	Thu, 18 Sep 2025 18:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758238069; i=@ti.com;
	bh=Z3LUDpcit43CEFoCdWxz1vdG61zkQ5qsWVd7JKY/g3c=;
	h=From:To:Subject:Date;
	b=nDAM8M+RYrzgPhfz8z1of6zgRmFVIUdFT8bI4GwN8LYrMcF+nKzfppZPf6KwTSbWw
	 PkULvwOPFKTtB1g4ex4z1t4NfzEPQXO83YzXSi7IfTsfZEVMJFpEJ88wsvzxZ0PViD
	 msDaXwHaourorcqE6LRZyGrlKplLDJBZjpAzFvkI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58INRnrF1894962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 18:27:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 18:27:48 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 18:27:48 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58INRmne4087291;
	Thu, 18 Sep 2025 18:27:48 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id A36AB136629; Thu, 18 Sep 2025 18:27:48 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509181257
Date: Thu, 18 Sep 2025 18:27:48 -0500
Message-ID: <20250918232748.1813453-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 23:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16596

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=b774254002ee83b85e5daee195e3330c824cbc4e..2718a40231e57089b6de8ea9740386fd9cdd2683

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 06866621..9e82a2b2 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "b774254002ee83b85e5daee195e3330c824cbc4e"
+SRCREV = "2718a40231e57089b6de8ea9740386fd9cdd2683"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


