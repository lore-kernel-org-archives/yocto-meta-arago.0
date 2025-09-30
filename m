Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B887CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 07:44:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.19894.1759218261775852837
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LItKCOJX;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58U7iK6L2403445;
	Tue, 30 Sep 2025 02:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759218260; i=@ti.com;
	bh=m30mPJyc0oCICFRWzWU6xuOskFjvtfZZIRBBwhegogU=;
	h=From:To:Subject:Date;
	b=LItKCOJXITj1PPcNDcRri8y7aZaVibv8uiq2+jJRotchf6DFt8JF1eEU3U6PYSP4/
	 +od9PrxEB5QTcmUdvse7WZnUqQC/gN/58srMEhDz1nEpy9qsTDbrFznq0CoNpm1lkg
	 9aJI69HZU34+Kii7/Jn7SfvN3k9GTRsC8H/G3ors=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58U7iKlW2941585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Sep 2025 02:44:20 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Sep
 2025 02:44:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 02:44:20 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58U7iKVV2562389;
	Tue, 30 Sep 2025 02:44:20 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2123F2A67; Tue, 30 Sep 2025 02:44:20 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509300100
Date: Tue, 30 Sep 2025 02:44:20 -0500
Message-ID: <20250930074420.281935-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Sep 2025 07:44:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16656

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=5fddfd1598f963e1e84be8448b988ce941650c6e..f5b07568e39216feafa6a4c56b403ecede3892b2

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 50e8a9a8..ccea1083 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "5fddfd1598f963e1e84be8448b988ce941650c6e"
+SRCREV = "f5b07568e39216feafa6a4c56b403ecede3892b2"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


