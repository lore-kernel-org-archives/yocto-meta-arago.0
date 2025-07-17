Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C9CC83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 22:57:07 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8389.1752793023246031017
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 15:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DeLVHnNs;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HMv1VS110126;
	Thu, 17 Jul 2025 17:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752793022; i=@ti.com;
	bh=cq883kuPRZzrMcWGHTdg3IzNufjIqr+Gv+iNadYCeo8=;
	h=From:To:Subject:Date;
	b=DeLVHnNsr3XsJh3H17KuwFBpoLp+58NbfJKNsLWfsuh63c/2uVECOUAgcJB++UHPM
	 IdmLZC98aTAhS3fOSNpiMABgZSR0LRJ+bpqBBOEG8Q/obrCG2sQW8mSVQs7czFYbBt
	 ecyL9FYsAUWQ2ZPJ0ZSpEDcwJhbJX42hrR32JV84=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HMv1XO3085615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 17:57:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 17:57:01 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 17:57:01 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HMv1cx3575032;
	Thu, 17 Jul 2025 17:57:01 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 9330C138222; Thu, 17 Jul 2025 17:57:01 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202507171300
Date: Thu, 17 Jul 2025 17:57:01 -0500
Message-ID: <20250717225701.589148-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 22:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16313

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=6a635db1816af206c582611edc6682c967e9a46a..b7bd9f25903d5f0952304e51319c3723545422e8

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 48f0868a..a5468d4c 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "6a635db1816af206c582611edc6682c967e9a46a"
+SRCREV = "b7bd9f25903d5f0952304e51319c3723545422e8"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


