Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCD6EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 06:30:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2619.1689575401863249724
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 16 Jul 2023 23:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36H6U05F038775;
	Mon, 17 Jul 2023 01:30:00 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36H6U04H018896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jul 2023 01:30:00 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jul 2023 01:30:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jul 2023 01:30:00 -0500
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36H6U07u086615;
	Mon, 17 Jul 2023 01:30:00 -0500
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 0350910F5C83; Mon, 17 Jul 2023 01:30:00 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] ltp-ddt: CI/CD Auto-Merger: cicd.kirkstone.202307161900
Date: Mon, 17 Jul 2023 01:29:59 -0500
Message-ID: <1689575399-97951-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Jul 2023 06:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14803

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index 192b89c..aaba41e 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "e71a22ce40d777fb3a71aadb9d083155ab476f17"
+SRCREV = "15ce79d02abeb2d5b3cd6a741d4fbdf59566fb56"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


