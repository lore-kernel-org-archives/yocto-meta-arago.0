Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BDEC021B0
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 04:17:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.42381.1740025058453367656
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 20:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SXfWZxHS;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51K4HaU8486078
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Feb 2025 22:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740025056; i=@ti.com;
	bh=/G0eeSxSh7gIJHoU3jLSg6wc8niBLLJJp7ZZht5pX5U=;
	h=From:To:Subject:Date;
	b=SXfWZxHStMjYT/BHoINf2YRdCCv5Wx83zmhLUcJetjFXE0iF6KPXyaAkfJ+9DrA4n
	 E1hs4FDHpzZcrfwiOChiViybjcCVbBjP5Zb4xgkQBt6jDNqzqZkdnV/ZKuJbftZG2I
	 VUo5tx5jpuLF93/lZwY9bqcXfrRR9J1AGNVwvoXU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51K4HagO008592;
	Wed, 19 Feb 2025 22:17:36 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 22:17:35 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 22:17:35 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51K4HZng099264;
	Wed, 19 Feb 2025 22:17:35 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id DB4BA13821A; Wed, 19 Feb 2025 22:17:35 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202502191800
Date: Wed, 19 Feb 2025 22:17:35 -0600
Message-ID: <20250220041735.3378220-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 04:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15868

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=551467bce4c38af24c9c98843770fdfe45e1e253..0b8efc9d4b198420c47be321c236a1c537a433e3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 6ddbfbe4..1f8774a5 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "551467bce4c38af24c9c98843770fdfe45e1e253"
+SRCREV = "0b8efc9d4b198420c47be321c236a1c537a433e3"
 BRANCH ?= "cicd"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


