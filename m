Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B92BCAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 03:23:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.5846.1759461792055808097
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 20:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OxqTo60x;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5933NAdD3411517;
	Thu, 2 Oct 2025 22:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759461790; i=@ti.com;
	bh=DIvDRCZ6w2gOOkVsrpM2LsuVL2i9IYP+/5wDwu/r5nM=;
	h=From:To:Subject:Date;
	b=OxqTo60xwa+OFNeQuZrmu+9Lw6ev59QDPYQ6UvzQMpSJ/nRYNO+jvJUpHnTV0dDGg
	 7ScH9SmkUyUuAXDuvSALJhBgQV9f5ofrjgVzIhDDuwqYwq9whpIg9gw1wZ5Ri9htWX
	 eorFJLicduKlt2mIHeB4FsNSMz8fUj2K85St3Vzk=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5933NAk6470725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 22:23:10 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 22:23:10 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 22:23:10 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5933NA1H560813;
	Thu, 2 Oct 2025 22:23:10 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 085542A67; Thu,  2 Oct 2025 22:23:10 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
Date: Thu, 2 Oct 2025 22:23:10 -0500
Message-ID: <20251003032310.860790-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Oct 2025 03:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16670

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=f5b07568e39216feafa6a4c56b403ecede3892b2..4d6e319a8063f34f6b6fd7803ca1c7419afad472

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 50d1419b..c5f02da4 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "f5b07568e39216feafa6a4c56b403ecede3892b2"
+SRCREV = "4d6e319a8063f34f6b6fd7803ca1c7419afad472"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


