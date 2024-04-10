Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BF3CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 18:09:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8615.1712772539715392131
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 11:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d+sRMsCl;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43AI8wU3104936;
	Wed, 10 Apr 2024 13:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712772538; i=@ti.com;
	bh=x3UYzlX2U4yGxijXkq2XzyDeWWnXs7UOVGEBil4grmo=;
	h=From:To:Subject:Date;
	b=d+sRMsClvEqVbJcuJuI8/RpOCH8FLYkPhHVKGbKJpI/DG637dnpjdZIHT1W4QJIrq
	 CFCz+MvggkR3CIV3pDQCP9Y4oUODyXQaXx+pstvuIU6dBNMOoqsS3rXaOW3r2k2Y0q
	 +fjcZz3e9MFkCMCWbNQyJMbutatd/NXxK7RPD7BY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43AI8wrk026138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Apr 2024 13:08:58 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 13:08:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 13:08:57 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43AI8vlp030648;
	Wed, 10 Apr 2024 13:08:57 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id DCE8A1040C85; Wed, 10 Apr 2024 13:08:57 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202404100939
Date: Wed, 10 Apr 2024 13:08:57 -0500
Message-ID: <1712772537-126026-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 10 Apr 2024 18:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15261

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index fc5803b..0b990b3 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git"
 
-SRCREV = "ced932c43a70895bce701891576d33f8a976d381"
+SRCREV = "07e0795c14d4bd8bd4857438cf3bb414b1f34eaa"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


