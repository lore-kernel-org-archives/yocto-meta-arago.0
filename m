Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F14AC35FFA
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23281.1741892719910786082
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 12:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g6lyAjDu;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5IUn1432115
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 14:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741892718;
	bh=p1PJWj4lR7/TrHpsP/VJ2pnLuSfcygBs/Gkq0aGqRbg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g6lyAjDuJjM45fBbH3JnrgWAfWmjxBr4VLhlW13JFPEZ5Xro5wTklfFAkePowemxH
	 6sqysd11AZJkPh7ASgd6/fBmQ6bjqek+Ef/R8+qOXzSqNHEk1Ek2g2r6lqA2XLEqt4
	 DKeaii/mo5/bKuxKZy2rV9nN7Q4V0dGKXi1WbC9c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5ISk087167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 14:05:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 14:05:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 14:05:18 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5IFD026781;
	Thu, 13 Mar 2025 14:05:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsnrq-0005tO-3w; Thu, 13 Mar 2025 14:05:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 13/14] tsn-yang-models: move and clean up
Date: Thu, 13 Mar 2025 14:05:15 -0500
Message-ID: <20250313190516.22522-14-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313190516.22522-1-reatmon@ti.com>
References: <20250313190516.22522-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 19:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16046

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Don't empty DESCRIPTION

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/tsn-yang-models_git.bb                             | 2 --
 1 file changed, 2 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/tsn-yang-models => recipes-extended/sysrepo}/tsn-yang-models_git.bb (96%)

diff --git a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb b/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
similarity index 96%
rename from meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
index c8406062..8024a6ab 100644
--- a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/tsn-yang-models_git.bb
@@ -1,6 +1,4 @@
-# Recipe created by recipetool
 SUMMARY = "TSN based YANG models"
-DESCRIPTION = ""
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://README.md;md5=a89040f014c0c9c9360e29ddf88bf4a7"
 
-- 
2.17.1


