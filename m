Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF19CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 13:03:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.18100.1760965430777616051
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 06:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jBt1Sqf+;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KD3nAf2894956;
	Mon, 20 Oct 2025 08:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760965429; i=@ti.com;
	bh=5jXU2G0f7V8ehnTx+rGeUgONJhUVhsYIpqiexw/dcfQ=;
	h=From:To:Subject:Date;
	b=jBt1Sqf+NOJIk6uMyqQhDzSU6q7UZewCJqq+2ECZlcAf8QgTo8b/chwjjdwkPXY8e
	 p7/SzwPzDFHtbhKpGFCprqPgiXVHG4wOotGC+UDG5aixtm4CoFroK9l+o5sb4BPNyi
	 eGqBR/KfIGdq6V+Qz0SXDKneK8fxD3dmVBBuxbMw=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KD3mU7447098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 08:03:48 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 08:03:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 08:03:48 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KD3moK1982646;
	Mon, 20 Oct 2025 08:03:48 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 95F832A6D; Mon, 20 Oct 2025 08:03:48 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
Date: Mon, 20 Oct 2025 08:03:48 -0500
Message-ID: <20251020130348.270528-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Oct 2025 13:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16694

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=f5b07568e39216feafa6a4c56b403ecede3892b2..61b318337fe7af7250b3da65fb3ab45a51674493

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index ccea1083..23ebefb7 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -9,7 +9,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "f5b07568e39216feafa6a4c56b403ecede3892b2"
+SRCREV = "61b318337fe7af7250b3da65fb3ab45a51674493"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


