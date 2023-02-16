Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C904C636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 18:24:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17757.1676571859273802089
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 10:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31GIOI1e030259;
	Thu, 16 Feb 2023 12:24:18 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31GIOIH7025191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Feb 2023 12:24:18 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 16
 Feb 2023 12:24:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 16 Feb 2023 12:24:17 -0600
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31GIOHdN117539;
	Thu, 16 Feb 2023 12:24:17 -0600
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id CD28F110B33C; Thu, 16 Feb 2023 12:24:17 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] ltp-ddt: RC Auto-Merger: 08.06.00.006
Date: Thu, 16 Feb 2023 12:24:17 -0600
Message-ID: <1676571857-126095-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Feb 2023 18:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14221

Updated the value(s) for:
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 7015efc..2e65c27 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "805d7b3b9e4a43d52c3d3ef20174ddf7647b1775"
+SRCREV = "dc01adbddeae95858622840cd669cedf93821cf3"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
1.8.3.1


