Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74226C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 11:21:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19430.1684840869789300267
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 04:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34NBL7FT005509;
	Tue, 23 May 2023 06:21:07 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34NBL7Id058890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 06:21:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 06:21:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 06:21:07 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34NBL7us026492;
	Tue, 23 May 2023 06:21:07 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 4AFD110FDEE4; Tue, 23 May 2023 06:21:07 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] ltp-ddt: CI/CD Auto-Merger: cicd.kirkstone.202305230400
Date: Tue, 23 May 2023 06:21:07 -0500
Message-ID: <1684840867-100663-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 11:21:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14447

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index c14ddba..af8efa3 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "41e97da730b9064d9fc5337afb515a8b6f752099"
+SRCREV = "045a9d7651217cd801c6d1ceed521a1d6f2e9319"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


