Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E290ECAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:15:52 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15352.1758629744689041737
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 05:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VHq6Q9ox;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: y-hegde@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NCFgHZ986943;
	Tue, 23 Sep 2025 07:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758629742;
	bh=mR0aV8BN60DUN4Jf/KLLfz3h8mmiMCme3+znjDxPrCo=;
	h=Date:From:To:CC:Subject;
	b=VHq6Q9oxBXb2nECwuvWRHr2F3f0nNWTdl5ZPPgI96/ASkBN9Ic7u+7kXj2NE73WHD
	 WYliXXdehWgfJ19Za/uny/uk8Y9PA+Nj+HYMn+xyQBonPfbI1o/7dyu2WfgaxPAmbS
	 g/Yl0muGoYrLzSP2WkaWHB/c6NIDB+nKXmGf/nXQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NCFgYi1063464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 07:15:42 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 07:15:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 07:15:41 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.158])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NCFeRU279715;
	Tue, 23 Sep 2025 07:15:41 -0500
Date: Tue, 23 Sep 2025 17:45:39 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti packages
 to legacy platforms only
Message-ID: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Sep 2025 12:15:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16613

The bt-enable and bt-fw packages are only applicable for AM33X, AM43X and AM57XX
legacy platforms, but was being included for all machines. While the
bt-enable script performs noop for unsupported machines, it still adds
unnecessary overhead to boot time and generates log noise.

Restrict the bt-enable and bt-fw packages to only be included for the
specific machine overrides (ti33x, ti43x, am57xx) that actually require
Bluetooth support.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 5a91357b..5eeeaa01 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -49,7 +49,19 @@ BT_COMMON = "\
     linux-firmware-ibt-18 \
 "
 
-BT_TI = "\
+BT_TI = ""
+
+BT_TI:append:ti33x = "\
+    bt-enable \
+    bt-fw \
+"
+
+BT_TI:append:ti43x = "\
+    bt-enable \
+    bt-fw \
+"
+
+BT_TI:append:am57xx = "\
     bt-enable \
     bt-fw \
 "
-- 
2.34.1


