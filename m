Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBB4C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 19:35:15 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3117.1738265709252042694
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 11:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TXxbjOuL;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50UJZ8dk1535395
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 13:35:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738265708; i=@ti.com;
	bh=9CcXncx2uie36TdoqaZFMJQNX43SaH6g/XjTMeD1J4M=;
	h=From:To:Subject:Date;
	b=TXxbjOuL0n9QNO9h8YfdsKBP43xb50OlyiiqcJNQ7Pi9yoHKijZ0j88FhfCmGt3kd
	 gnsEwfYdPqLMf40Q+BiBvrgudvTU5YYSI+CYH10V2omytS3826snjwbuUItz4CNkuV
	 Xx4Egc0ATW1PFe8FXpzNOpttzsxAhbMQauZ8q4aw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50UJZ8sx048203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jan 2025 13:35:08 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 13:34:38 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 13:34:37 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UJYbkX038480;
	Thu, 30 Jan 2025 13:34:37 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id CC5CCE80D1; Thu, 30 Jan 2025 13:34:37 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202501300931
Date: Thu, 30 Jan 2025 13:34:37 -0600
Message-ID: <20250130193437.1462701-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jan 2025 19:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15786

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=9743760dbb27c3bebe7ca82123bdf70c33d8367a..34602e4308a8c276bddfc0b4984b387037574f5c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
index d9dd243b..f6861e0c 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "9743760dbb27c3bebe7ca82123bdf70c33d8367a"
+SRCREV = "34602e4308a8c276bddfc0b4984b387037574f5c"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


