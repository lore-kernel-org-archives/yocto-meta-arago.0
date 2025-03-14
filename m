Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A35DC28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 08:22:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.8986.1741940541508843523
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VcKL8iMg;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E8MJRR1631696
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741940540; i=@ti.com;
	bh=lYjxW1GudMiyYYip/cznAG67buerCC9NH4EX++2UEMY=;
	h=From:To:Subject:Date;
	b=VcKL8iMgpOXyAE6BQxSotlPI+viZRt8eb9X0/U34AkDvSW+eA1XGucVjxD8apnJpn
	 PJILEwCe5zYHKTegeEyMLCBdnuRWmLVty22V2+ikMgPSVHBN4htUyCh64ax/QY08ks
	 c8kaP3JGyALCpaOKaBaGHd0X5+G28eB2bPHznqIg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E8MJN1029938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 03:22:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 03:22:19 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 03:22:19 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E8MJxU080367;
	Fri, 14 Mar 2025 03:22:19 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 944DE24E9; Fri, 14 Mar 2025 03:22:19 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202503140100
Date: Fri, 14 Mar 2025 03:22:19 -0500
Message-ID: <20250314082219.2139333-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Mar 2025 08:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16050

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=33b965c540e6e4860c8b79e41082bc7762699d4a..e6f5e9cb24d38b209e8ced9ddef08f176b28fdc8

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 11623ff2..3e9afc8b 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "33b965c540e6e4860c8b79e41082bc7762699d4a"
+SRCREV = "e6f5e9cb24d38b209e8ced9ddef08f176b28fdc8"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


