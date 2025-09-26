Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5C9CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:03:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3087.1758913402671435011
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 12:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HxvAzIIv;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QJ3LZl2175158;
	Fri, 26 Sep 2025 14:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758913401; i=@ti.com;
	bh=3XfOxRuF4ilgGEuTdZesCRR5N8pQdWKIebkL3zkN3/Y=;
	h=From:To:Subject:Date;
	b=HxvAzIIvGlW9IlFqLWN+8q9N0mA9V6itptW4uG+6+Pk5I2GJRVhFtINpKX+yFaCmK
	 JmF6EJucxCm4UNwOF+sGD64JDOv5DyaOzq/961rKhtKiCrTBHyjBin/37S5DHLmY8/
	 sXp4E/mDNhHFC0EQcCWmKABumj9AkxFxZKqagDb4=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QJ3L7g364683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 14:03:21 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 14:02:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 14:02:51 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QJ2pJX1521418;
	Fri, 26 Sep 2025 14:02:51 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 00D1D2A6A; Fri, 26 Sep 2025 14:02:50 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
Date: Fri, 26 Sep 2025 14:02:50 -0500
Message-ID: <20250926190250.1349022-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 19:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16648

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=5fddfd1598f963e1e84be8448b988ce941650c6e..f5b07568e39216feafa6a4c56b403ecede3892b2

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 5e6da6bf..50d1419b 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "5fddfd1598f963e1e84be8448b988ce941650c6e"
+SRCREV = "f5b07568e39216feafa6a4c56b403ecede3892b2"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


