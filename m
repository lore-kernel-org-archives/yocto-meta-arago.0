Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E90DC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 19:39:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.5389.1716320358721818870
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 May 2024 12:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ucgrF05Z;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44LJdHJS110820;
	Tue, 21 May 2024 14:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716320357; i=@ti.com;
	bh=DxTmcXFGxoaXGrDAF7iE90YmkRQWfbANR4/9tQh2nbw=;
	h=From:To:Subject:Date;
	b=ucgrF05ZLMNLS29r4eHNkYH02vT5dqPe8E/yInCVoEC7DbORYJMiHZl5sBlA+V6FU
	 H8rH1L1LoDvb8PV9DRf2Uyq8cDTmkLv7BZ6lnJZbfwwVPNYiLQ3cd6m39YqlFUKzvJ
	 /txXly8lS7PuFHHvdobvC70IXeccF0tFJgEC/LoM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44LJdHCu099764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 May 2024 14:39:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 May 2024 14:39:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 May 2024 14:39:17 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44LJdHbc117777;
	Tue, 21 May 2024 14:39:17 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 2A1C310C90D2; Tue, 21 May 2024 14:39:17 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202405210100
Date: Tue, 21 May 2024 14:39:17 -0500
Message-ID: <1716320357-88119-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 May 2024 19:39:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15337

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
index ead0262..283a036 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "0c8b175b49a463969639eb1539b664f38bba66ff"
+SRCREV = "9dddd72c1108f244921a81c1787062d22da7ad20"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


