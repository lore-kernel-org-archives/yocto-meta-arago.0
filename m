Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F6DC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 08:27:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.135624.1719217626422940807
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 01:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yGpeXpI4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45O8R5to095795;
	Mon, 24 Jun 2024 03:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719217625; i=@ti.com;
	bh=4A/Ka/2zMNRKq3+aIODIrT0B0aToEKRgx/ggXW68qq8=;
	h=From:To:Subject:Date;
	b=yGpeXpI4vrDn1nBXs2/7xzKXRhRQgcDgdYA+9+vdvnK4lhl+3Gc2ZHJgSWfPyLRym
	 VXCy67tVjRSrTaf4eYjDVeE6d+7FiyF1/0rH4JnZRDObqOo/LYQQGLgHjFyDk2ongP
	 WQoF5Tmym1roGWVb708ce9euAhgDESyAenr7pSI4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45O8R4uW057936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 03:27:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 03:27:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 03:27:03 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45O8R3W1018779;
	Mon, 24 Jun 2024 03:27:03 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 4072110AC0C7; Mon, 24 Jun 2024 03:27:03 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202406240100
Date: Mon, 24 Jun 2024 03:27:03 -0500
Message-ID: <1719217623-99295-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Jun 2024 08:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15411

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
index 89607d5..76ee939 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "d1a50556eadefaa19922b8c07c2e21b5c42846ba"
+SRCREV = "47c592f19b393238aee076f92973fcc082e7fb22"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


