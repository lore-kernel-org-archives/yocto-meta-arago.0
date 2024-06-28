Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29CEC41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 14:47:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.18784.1719586072556520261
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 07:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=US8Z+/RE;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45SElpvG110363;
	Fri, 28 Jun 2024 09:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719586071; i=@ti.com;
	bh=kUwfFbhhSNtsjN6GA+INlT+L8Ky+zA3099owFvUDg+c=;
	h=From:To:Subject:Date;
	b=US8Z+/REnwgxPWKmxOfQedimJtRVBIbPYbBbRofDysLKzNtBqke4knzvNXVNa3mN8
	 g46QxR9yMy312ROwuCmGuHCAiPTStsekL3g4KrtUkTQhWlvezT5anLgzuQ0Jxm/Orw
	 CXEbhlci99RM4UzPOGrEKqubvPm+WIdD+y+HOXQ4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45SElpxL057196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 09:47:51 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 09:47:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 09:47:51 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45SElpiI047534;
	Fri, 28 Jun 2024 09:47:51 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 2DA9E111DB26; Fri, 28 Jun 2024 09:47:51 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406280400
Date: Fri, 28 Jun 2024 09:47:51 -0500
Message-ID: <1719586071-89850-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jun 2024 14:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15416

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
index c8f0b13..c527718 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "fb8288168350ea241187915483bfd7c98c6790af"
+SRCREV = "f922118e24c8289128d255e4ab07d8fb13997c57"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


