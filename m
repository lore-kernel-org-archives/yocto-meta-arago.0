Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B63C54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 21:26:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4603.1710451569899764669
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 14:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NaCZKGj4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42ELQ8Bc020215;
	Thu, 14 Mar 2024 16:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710451568; i=@ti.com;
	bh=Ml1ZNElQ9sKlyAesuG5nVq7Syrpo+KloaYulTz/QbUA=;
	h=From:To:Subject:Date;
	b=NaCZKGj4Z4+14Ixpi6bhqOtEBMWsLBo8ctdrpXIMbBtzT0TUGPa8aOjp6dfS9fibC
	 blmJpn0qN1pGUFQTyPrM5rSJ65IU8kEY51zoFN0E75LcwiAMUD0Q1dV+tnLlfVC0xW
	 vu5v244lnQPnu/w397EStsZsrr922CaBcXAFJcxs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42ELQ83x119369
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Mar 2024 16:26:08 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 16:26:08 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 16:26:08 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42ELQ8Zx126951;
	Thu, 14 Mar 2024 16:26:08 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 792B610AC0F3; Thu, 14 Mar 2024 16:26:08 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202403141157
Date: Thu, 14 Mar 2024 16:26:08 -0500
Message-ID: <1710451568-120858-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Mar 2024 21:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15237

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index 143e624..bd58c1a 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "1c5181113b70283ac8e81b9600a91acb8faea8c0"
+SRCREV = "ced932c43a70895bce701891576d33f8a976d381"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


