Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4EBCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:32:37 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10142.1760106752685797685
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 07:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q9WLKBdX;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AEWVp8334825;
	Fri, 10 Oct 2025 09:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760106751;
	bh=RRW7whuLp4/kdDIGKvPIRAY7RpNyF1KoL/PLtgzBvUc=;
	h=From:To:Subject:Date;
	b=q9WLKBdXZcuiCwliaWpXrO3rUtWUKhfwKVImS0/nNyWPXAG5G7iJE1W+SiCoPyfo8
	 z2EdCCNs5ntZkYRV52uFoVHX/Ip0nUywLwBWhrwgsDBZLyIoPdwriB38tQWb4MNh+j
	 Io5DjcUMVanAFD3awD9qPVDtdWT3T11fvhjTs5R4=
Received: from DFLE213.ent.ti.com (dfle213.ent.ti.com [10.64.6.71])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AEWVgY1741860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 09:32:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 09:32:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 09:32:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AEWV4B2017797;
	Fri, 10 Oct 2025 09:32:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v7EAZ-0000Nl-3B; Fri, 10 Oct 2025 09:32:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] pm-qa: Add PATCHTOOL = "git"
Date: Fri, 10 Oct 2025 09:32:31 -0500
Message-ID: <20251010143231.370-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:32:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16680

A recent commit in meta-openembedded removed the PATCHTOOL setting,
choosing to fallback to quilt.  But the setting seems to be required for
the patches to actually be applied correctly.

While we wait on meta-openembedded to either revert their commit, or
figure out why this is required, we can carry the setting here.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
index 079772ad..1119162f 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
@@ -8,4 +8,6 @@ SRC_URI += " \
 	file://0002-cpuidle-Avoid-relative-paths.patch \
 "
 
+PATCHTOOL = "git"
+
 PR:append = ".arago0"
-- 
2.17.1


