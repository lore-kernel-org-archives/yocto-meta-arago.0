Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F83CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:33:11 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11046.1761312789276095685
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OE82e/cF;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ODX84M1911431;
	Fri, 24 Oct 2025 08:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761312788; i=@ti.com;
	bh=uyHDn+RpKTsN/gNVu8ggFnaNBp0r6eNxw9uIhhEDl54=;
	h=From:To:Subject:Date;
	b=OE82e/cFSTxyVOJ1fbdnKU2u1lGM+lgJt2A9XNpYRebEg+qD4+dfjSCbWa9Acg40r
	 NzgVyQcVmNEhyMymwCFChHiLbCd4RgtoJBBdQS4b6qPIL6TZrQQWGwqAG2Nz5gXp8l
	 daAi8mwZhO/6oxLyuxl8yuPCKaaEpq+p3AFfMz1Q=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ODX8bd3197404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 08:33:08 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 08:33:07 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 08:33:07 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ODX72k1252897;
	Fri, 24 Oct 2025 08:33:07 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id AECD92A6C; Fri, 24 Oct 2025 08:33:07 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
Date: Fri, 24 Oct 2025 08:33:07 -0500
Message-ID: <20251024133307.804954-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16703

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=61b318337fe7af7250b3da65fb3ab45a51674493..84666597750b5c68d903eb23cdd9b412c28e889b

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 23ebefb7..d70e5c09 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "61b318337fe7af7250b3da65fb3ab45a51674493"
+SRCREV = "84666597750b5c68d903eb23cdd9b412c28e889b"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


