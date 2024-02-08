Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3515C4828D
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 01:07:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7567.1707354422583774507
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 17:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uf1hc/5S;
 spf=pass (domain: list.ti.com, ip: 198.47.23.248, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418171mY047602;
	Wed, 7 Feb 2024 19:07:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707354421; i=@ti.com;
	bh=mSbiH0bB8+FdjJblj2zIZPmMATAwX8+cikJExk9Sgww=;
	h=From:To:Subject:Date;
	b=Uf1hc/5SE6J4rI7V3WYTg7k+A6d+rMAKe1Cw6LdWbrayXluQd+xM8KgiEmdXEpRnq
	 +LuvDY5Qo0ZQsrurNO7wxrd39UCL6B1ax7LiLI4RSUjybiC1JXqyp2DqmTWeQ9y36m
	 wmrVX27xWHX6DOUPGS+ntmzW8VATa6sgKZxaqGD8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418171Ag069476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Feb 2024 19:07:01 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 19:07:01 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 19:07:01 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418171e7012304;
	Wed, 7 Feb 2024 19:07:01 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 080561134DC0; Wed,  7 Feb 2024 19:07:01 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402071239
Date: Wed, 7 Feb 2024 19:07:01 -0600
Message-ID: <1707354421-80981-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 01:07:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15131

Updated the value(s) for:
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index ba8b0ed..c49c2a1 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV:append = "+git${SRCPV}"
 
-SRCREV = "945344005060044046fe047aabf736c56b1709b3"
+SRCREV = "e4fcc2b20dfd9a4c068f3244590ac6d74f5ba1c8"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
1.8.3.1


