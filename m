Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B1CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:41:45 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10718.1762551700216353335
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Jvk+21zo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.36, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+/oyEuFcIt/T3lvOWwlvDItIHwDd3P+vturpcy8JpRHMzaNyQ0P3aO0EYov4WhROWKfkzImIvrTYSAs8U8vBdBSvWxjWfQI0I6KWjUvF/rXHXYx+gynvMvpM0lyfaGCYaJLup8QGLRbUkU7th+FR5WU7RoRLVMljF+AgZdXy0i8Vy/zdb22ofq2YRWswiaFDOhXlPz97a+ShEavu+sNOlXuUUJHTi4cPB4OVGB7iAPu24qSysmwASvQbhxwOkzYbguJexvn4DkWNeUZpj58ChpWClXdoBMezL2uAxb9aZ1LsRLOwd5TVHuRWoXY52iNH400+sOh/elXHsY0xKnHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PDHxE3mRNxJfQzfecn6zGnQbNC0nsH59Dme8v+/cr4=;
 b=t1wJA03Esg5paZ2w7YFiN1xnFI8NGZgf93Znl9iTDjoK9BC1XZ4JkUN1ysarvGehOjOpExEx5dW2GKL7bqINiX/hY5+zLob6m+uYVQTC9TjurNORFarnwSmJaAmdFQU1XnRF0V2CnycYfUYbuwsjF6DDPge9kQ0q2aTyuyOtv3+5rr+SuKOfNR23Pr2rK6tp7C1pk7FMqnys2MVhqmBZYLh/9fxPTS+/wVkEv1FukXt0HjEYy4iIkDq+iZhcEZIvrMdsQjMaDO838AIZwKooKi0qKWp/cHPujzniVtYpAI9KpHYfa6JC5vhxUg4DP3aiYfSmqN6IhXRPCzPLFiE+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PDHxE3mRNxJfQzfecn6zGnQbNC0nsH59Dme8v+/cr4=;
 b=Jvk+21zo6WRT097b+rDJwS1uoL20gTU9WP0Bi+bAkUJIDlcvwBzUxtUMfYb8M4ldsbBRuv3VxSeNRIpWg0YdIp4CYIeX5pyVfSN40en8IEpIXRakfPPBdU2i0M/Vo7olZ2aIXxTVGMNxZkKiMvwUYMn7l+lOfn8FVKGFSpNytQM=
Received: from BL1PR13CA0240.namprd13.prod.outlook.com (2603:10b6:208:2bf::35)
 by IA0PR10MB6746.namprd10.prod.outlook.com (2603:10b6:208:43e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 21:41:37 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::ff) by BL1PR13CA0240.outlook.office365.com
 (2603:10b6:208:2bf::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Fri, 7
 Nov 2025 21:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 21:41:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:41:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LfUT33713651;
	Fri, 7 Nov 2025 15:41:31 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/5] packagegroup-arago-tisdk-addons: Remove leftover commented out packages
Date: Fri, 7 Nov 2025 15:41:25 -0600
Message-ID: <20251107214128.1491466-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251107214128.1491466-1-afd@ti.com>
References: <20251107214128.1491466-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|IA0PR10MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bec1ee-72dc-49bd-0854-08de1e466d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hCd1+ZgIqn+wGjnk39Ht/dOodTxlu5O8AukMwoXNMyPFYh/vicM2oDGmDrwX?=
 =?us-ascii?Q?KbAUubfABjRkDGo0CgvoICJaDn9BJZnsqol/s6YojZNt/Er3Oq7UAZpNd5Qz?=
 =?us-ascii?Q?6CxJN6cAsHx+HjvYwBvaX3CNxRLFzP/uXv/+SeCTZaCkUq7L66KbMyOlAubB?=
 =?us-ascii?Q?wEXcRWaFHCzpPurfv+3W8nqOxOHKqSBvhlicSwdDUImYRdOixwEd/fAWGtq2?=
 =?us-ascii?Q?ZnvuGyAhAOO9p7EC1hSCMdYxcENSYmml6E8EkUucA092VO6Qm1+tOUtgnqYm?=
 =?us-ascii?Q?E7ElRukLGC6QiydwJltFapIZmpKLpYH/DT2FKqOZP0ykwDIOeChb4Ot+CaNt?=
 =?us-ascii?Q?mzAuTfaxeDMk73CZ+Q/jBu9eLX0aabd90ug2iQarxUHt3700kBv+2o5LpZaV?=
 =?us-ascii?Q?nVyThkV1i10y/W+vBR06bP3t7mxkCehtredxOfu3AWANCuUFfvNxHRsIGM5i?=
 =?us-ascii?Q?TxL1QZXn0Q6JKsVP8txv6eJ7FVVUdtcPV2+Vmxm2YYTEqM+m8zV9daU+Jute?=
 =?us-ascii?Q?/qPHovx487tKLI3i70iA7luVXdcnnP1n7VNLhbBnEs4ZgodC6RrWmE4uauEX?=
 =?us-ascii?Q?LHwtX5gYMhcWhx+yCnkwB4AQX5x6tsYZHkm+v+/N/XoLUvQYU6rQv+gBovl0?=
 =?us-ascii?Q?XPZSwy0hs2QE9WwgN2p6bb4ewbmJADZeTOJU8x44k3AM0dpFC4Gcvj2CeA4o?=
 =?us-ascii?Q?uVGE6tu8h71R/WAmyDSRCgjP9xzdDZv+QSttOymUR2aLN6f8LV22bhQ1rx86?=
 =?us-ascii?Q?oM5aPfkf5ubkfifwK7zaf/1TfobD8z7YuaAcvtDdee+YiKiY1cA0vhIMHw7K?=
 =?us-ascii?Q?Kny3u36BOsRoc0+Wtb1OR9GItgRoFsxZ4IGL41W6AD2JnLpqSONcJQb8IIN5?=
 =?us-ascii?Q?1lWGQNEUxhX0GE9TmoaiQpih0hr+mbm+rQDSL9vwaF3F7YkCMLDcTCnbpCgE?=
 =?us-ascii?Q?EeUiICfWSAGXvTIP9CvkgLj7spdlXrsIpXDSHbw6A0qm6HTgHPD6OyEbUqQv?=
 =?us-ascii?Q?dePA9tcPsVAiIU7pw4Y50uR4NxYXs4OU1Xgp3hl8zBCDeAWS63uTf7F6KZuD?=
 =?us-ascii?Q?t6X9Gpn2PM4ArrUkh9HdtNPx7plOePQcktT4NssKeY1/dwT9On2X4pwoczPf?=
 =?us-ascii?Q?6vgx6fcMikrdTAKHVhE1NFrViVXf5o5ibFKfoIIWN4+ly0qKAXBAHStEeuoh?=
 =?us-ascii?Q?B3PEUYJ4KmxKEnLqxIfFKSor8Lw9MPAypANQ9Y2E9YOoh0YN6JuapfGBN59h?=
 =?us-ascii?Q?/ILbrqpGJqFeiOLpMg2HqC+9iYCklTQ38clK5j6p4dmFr3Bl1nvZkpHg/NNr?=
 =?us-ascii?Q?mbFz1puJ0Gk5jlB9LT5OgOsUrGyuTF0ZOYZa43wZFOOt91HUyiisI6kXzZ98?=
 =?us-ascii?Q?H+l21iSLzL9MxxbAxk+20P/f6MWojsoJZuVKPzaDDqru+mJrNtRnV+D1JL42?=
 =?us-ascii?Q?SGbTi1bZCiNyENg/8qKc5wEEzJXWK21r5eyTYvMaqypsq7y3ciyCBZXXWeyO?=
 =?us-ascii?Q?tY4aAD4giPApkrGoqLUUvdlF+R+5TEzCHB6CuG5cXmui4aPQ4OoX13uw+yBj?=
 =?us-ascii?Q?EWxgiRbeyR7/vbJ4Ryg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:41:36.3808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bec1ee-72dc-49bd-0854-08de1e466d76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6746
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16735

The package pruss-lld-apps is not coming back, and adding these based on
the board and not the SoC is not a good example of how things should be
done, remove these lines.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons.bb
index 9632cf18..58fffd26 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
@@ -87,9 +87,6 @@ EXTRA_PACKAGES:omapl138 =3D " \
 "
=20
 EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-linux"
-#EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
-#EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
-#EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
=20
 RDEPENDS:${PN} =3D "\
     ${UTILS} \
--=20
2.39.2


