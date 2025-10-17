Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701E5CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 21:03:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3688.1760735020044167592
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 14:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yNHKkyHX;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HL3cRS2359881;
	Fri, 17 Oct 2025 16:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760735018; i=@ti.com;
	bh=WA/OfeVPcDcGdpRl2TKoGmbAdF+qPRWhR9xbOA9Meyo=;
	h=From:To:Subject:Date;
	b=yNHKkyHXFkpCwfJxOrvIq+YcWe3fKAVsL9F9EKr2Xv6D9g0ndZCGVO7JgPWnhiDFm
	 l6jaAnnviggmbSOJnA/h2jQ9Rz3bDbyuAkJrjjefVmPP4v+xICVcFvEKq+d48kmaYL
	 FulpwPeeBw+6aozFQguXXW+b3bpeNrub+r77Ud1M=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HL3cIl3071304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 16:03:38 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 16:03:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 16:03:38 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HL3b511895481;
	Fri, 17 Oct 2025 16:03:37 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E28642A59; Fri, 17 Oct 2025 16:03:37 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
Date: Fri, 17 Oct 2025 16:03:37 -0500
Message-ID: <20251017210337.1556670-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Oct 2025 21:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16692

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=4d6e319a8063f34f6b6fd7803ca1c7419afad472..61b318337fe7af7250b3da65fb3ab45a51674493

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index c5f02da4..58f5fffe 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -12,7 +12,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "4d6e319a8063f34f6b6fd7803ca1c7419afad472"
+SRCREV = "61b318337fe7af7250b3da65fb3ab45a51674493"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


