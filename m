Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B4C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:07:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3340.1714702064217214679
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 May 2024 19:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i8W80W35;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44327h0n129931;
	Thu, 2 May 2024 21:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714702063; i=@ti.com;
	bh=DxTmcXFGxoaXGrDAF7iE90YmkRQWfbANR4/9tQh2nbw=;
	h=From:To:Subject:Date;
	b=i8W80W35LHE5dNbLgpA4ZvB1cAae9w3yt5qaSryzoF6Ow2TTNc9AN9FCxmu57DcXZ
	 ZYyG5Gu7ilGeNyuxx+OLCPJaAcTXtGuyyrphm764y/+5Yf0RZbDwB4xqZ8Mom8r/UD
	 BLYF0ly8VC3PFdgu+MJk+olcuehmg/ImGyOJOPpQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44327hSd018406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 21:07:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 21:07:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 21:07:42 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44327gKB116276;
	Thu, 2 May 2024 21:07:42 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 969CB10C35C6; Thu,  2 May 2024 21:07:42 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202405021800
Date: Thu, 2 May 2024 21:07:42 -0500
Message-ID: <1714702062-108027-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 May 2024 02:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15325

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


