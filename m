Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A73C48292
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 03:45:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15554.1706845531847182107
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 19:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P0DzHPeB;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4123jUYM018869;
	Thu, 1 Feb 2024 21:45:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706845530; i=@ti.com;
	bh=pmqa3lhpG1B2tF0859K5thRz9jg0/wI0RxHI0UNyH08=;
	h=From:To:Subject:Date;
	b=P0DzHPeBlyprF5TKz+ynVlu45AuClRHx9jI6OzLXFdt4uomOXuXXMd6aW2yUaCpsy
	 clstha6GtwAYxFsDkLvJHeIWMm9C4gDijC9pPVgx5ilROCRGM7Ghc7NI1y5I1bggmQ
	 +kfA6YxBmLhRISJZ9GTN/6j2/v3hPUt0gkHUIAQg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4123jUO3002121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 21:45:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 21:45:30 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 21:45:30 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4123jUx6118785;
	Thu, 1 Feb 2024 21:45:30 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 40A371134DBD; Thu,  1 Feb 2024 21:45:30 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402011419
Date: Thu, 1 Feb 2024 21:45:30 -0600
Message-ID: <1706845530-88042-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Feb 2024 03:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15103

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index be61de0..ba8b0ed 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "bb97b3ad4f8187cea24499119f28eed0d92255ae"
+SRCREV = "945344005060044046fe047aabf736c56b1709b3"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


