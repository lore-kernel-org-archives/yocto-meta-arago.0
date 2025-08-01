Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFB9C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 08:16:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.82849.1754036181498393520
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 01:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eUeYg405;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5718GK4A3200250;
	Fri, 1 Aug 2025 03:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754036180; i=@ti.com;
	bh=1/PwzahfqswVr0gFm9Fruxrex5k7VYJOamNpj1bYp8Q=;
	h=From:To:Subject:Date;
	b=eUeYg405JfTrQQ7U/V8EPYm6u6Bu9b7+gcltXcXwneE4svVRp24DaxqfmPA3hZASe
	 TuKuv0/ZY04WVOMWWFBvKLrnKLkp7v9dS7PGYQahTYRCEfV7sFXGnhI1rb8xzfqTEE
	 XCrwaaNuY9mDpzcXMO4874Zxhtqy9l666LkycZrI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5718GKTs3952452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 03:16:20 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 03:16:19 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 03:16:19 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5718GJv4093673;
	Fri, 1 Aug 2025 03:16:19 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id AF74C138222; Fri,  1 Aug 2025 03:16:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202508010100
Date: Fri, 1 Aug 2025 03:16:19 -0500
Message-ID: <20250801081619.3460470-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Aug 2025 08:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16349

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=b7bd9f25903d5f0952304e51319c3723545422e8..d38f4c605e816a56e9c50149754ad8efedcc3f3a

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 53d2332b..1037c15d 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "b7bd9f25903d5f0952304e51319c3723545422e8"
+SRCREV = "d38f4c605e816a56e9c50149754ad8efedcc3f3a"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


