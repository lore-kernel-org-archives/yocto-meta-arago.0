Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA9AC54EDA
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:01:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1642.1748026856256611067
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 May 2025 12:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vEFFxLQ7;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NJ0tFd1036176;
	Fri, 23 May 2025 14:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748026855; i=@ti.com;
	bh=1+yMXgSvZ1mWFPOlpVerpQS1rO9eWwNi3F74gUuS6oA=;
	h=From:To:Subject:Date;
	b=vEFFxLQ7xNlovKSgG/ETdSdghf6vJlWD82SJgT1PSO5RmCKKTs5WzHDMM4U/MP8dN
	 zDGhi6250F8MsLmLinszKDcNTD19XLk6AKbGpNI5hctLgvRl7nfyS6Oo5Q7dNoUCNh
	 S5ddTEw+k1mOwEFou5QhiHJ79Dhkpgudh1YVbnEI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NJ0tuf285506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 14:00:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 14:00:54 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 14:00:55 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NJ0swO096088;
	Fri, 23 May 2025 14:00:54 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id CA71518D467; Fri, 23 May 2025 14:00:54 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202505230901
Date: Fri, 23 May 2025 14:00:54 -0500
Message-ID: <20250523190054.691783-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 May 2025 19:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16238

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=d1a8b82eb11222e80fb500e766784847103e06f8..74da4eaddd2a3f80ed565667d9cc8faf97fe014f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 98f368e2..9501d2de 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "d1a8b82eb11222e80fb500e766784847103e06f8"
+SRCREV = "74da4eaddd2a3f80ed565667d9cc8faf97fe014f"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


