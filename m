Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391C2C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 09:28:37 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3382.1749634111300219947
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 02:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eFmO41Vq;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B9SUxj2547561;
	Wed, 11 Jun 2025 04:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749634110; i=@ti.com;
	bh=c9fwNxRmrPbZ1vftKcJv8nYstuZaB3sE7gCf2DDZIQ8=;
	h=From:To:Subject:Date;
	b=eFmO41VqJCIQw0O21wRSP04t/gp0p4RQXbhFo9JZwiLsq4RDXaOrb2j/ktGJmyI0c
	 RtReJIZG3xMknDbt+F8ILnlt6YCEYEcatRmJJtBA7fdNz05KZcdLAB3Ooyh49nznOp
	 NZ9cQJUN0l8szJUOWTR2ay05UyhUQa1WvYL7tvJk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B9SUW61624466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 04:28:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 04:28:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 04:28:29 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B9ST5o121415;
	Wed, 11 Jun 2025 04:28:29 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 9E3192354; Wed, 11 Jun 2025 04:28:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202506110100
Date: Wed, 11 Jun 2025 04:28:29 -0500
Message-ID: <20250611092829.3283962-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Jun 2025 09:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16263

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


