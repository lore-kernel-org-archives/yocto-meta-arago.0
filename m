Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8AECFC50E
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 22:27:09 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23113.1763764022896756807
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 14:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pOBXRCXe;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.93.196.8, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vK8eTQC5DkN7jc+Yyz/CqscQLIWIPOx6HjzZSXWMbWx++IDlc0rk6jq9bcQJMRpvEnVNU325Ol3mBn8QFa4LaymK52uZHcljG6+KzC5OuS/AO5iYt/LSkCdwpcNukZx3vj9b33erVjStWwO1St6+nM/iZLbAvnhDR5xiH2suHpN067B8dWYEcLm2Q80xdoTpjaDB1NWtYBInZlOY32hnrgpCRmoZG46f5TKe1gQtvzyIx65mMaScwizIiRXkM7XJXEUgEXcPuyIv6M0dehpXu6IFSoRD9TM7FUoNUVzs8uYw5Nvy8D97H1canmqCvtEu9MvBj7GQcyQn2kDm5lCdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAbanN34wvTv3ENl5bHs8tKwMBXqTjPL3tumMshwq10=;
 b=TDJ8rBLTLermwuym9apPQEVBZhsuBUGiJxYIH42Mz5+FFmGK+XuOUYo6dNP/cjV89XoncSEhYQA6LrK3oysO76tad8Zu1kEpEpm69oXn2aCJURgzhOP690Ec9WniL9iSYKQU8VkDKpePpQrYVb11aoyjf6fZJkt2vZELnZzihpIZzDFt3CaDb/oNltEAx0AH0YOOH7pDv6eLtCtcpCRaar4DrzjPcv8mtoLYZhkgEvF35enFiVsomP2pNry+kmW+jCS3wSNhrjc24UmV0AsBEDJZDwRfCa2Hapx6d1Gv3E4QPT5sW4t6/YzbYAis1W04m7viZbV6NXt50hNBS5/rCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAbanN34wvTv3ENl5bHs8tKwMBXqTjPL3tumMshwq10=;
 b=pOBXRCXeLmbPsstJAIca29Ro7Hz7FeBEyg47fP7PBDMIdQ7tooX7djFqcO5zZawvVT9AKws9hk6LHVrRKhnD+bymjBeKs4Z5Dbl5OG+DKTCeiH0eUz5oX9viQ6NpEnW8BvPttlExv3VFnq3GgppkzjGs9Cn9J2frXUxfl9jX6Ow=
Received: from DM6PR11CA0012.namprd11.prod.outlook.com (2603:10b6:5:190::25)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 22:26:59 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::cc) by DM6PR11CA0012.outlook.office365.com
 (2603:10b6:5:190::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 22:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 22:26:58 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 16:26:53 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 16:26:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 16:26:52 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALMQqDP2196764;
	Fri, 21 Nov 2025 16:26:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2] nnstreamer: Update to 2.4.4
Date: Fri, 21 Nov 2025 16:26:50 -0600
Message-ID: <20251121222650.540856-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b87e5b-f720-47dc-9b35-08de294d1581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NfpFTgJ4d+j0zixFIPGO8o2EWiPJLiVYtQXfc/TWzs2aQYiADp/IBc2HqtJZ?=
 =?us-ascii?Q?CaRCg9Wt3YAuGLCJdS0B6cT5jsmxcJd1C26zerNeWEQBAthUMo324RkipXeh?=
 =?us-ascii?Q?FZOcaVhOJzAEGAuaB//5ygkDVaKzujShbBtRqELfUSTt8mGZswg4NVdcLPFu?=
 =?us-ascii?Q?DLPDyLd8esO6XHZhxL1o8lwimewkoRaq1YYsY3H9jck8gGXipdOwnkVq5nj9?=
 =?us-ascii?Q?/ncetzlctfhOqmrHMHowFczWMzFfIYd54xDiQGKbWbYG9c3odNjAgb/y/nhq?=
 =?us-ascii?Q?My5j/VOCOPWq+5ro3P7p/rk/jL1akATTDy837JNNCmFZpdVHh/chIQGdwFh6?=
 =?us-ascii?Q?A/jbyyaTZkAzanlSiyckNSwxaTVXuo9YelcpMczX5cEnWyDYG4e4mmBvUwSj?=
 =?us-ascii?Q?ALiKIdMJImH4qOsec7YK5ENjtlVYdOrTW+F4MXEryEyaFh1XAno72GqywyDe?=
 =?us-ascii?Q?KtLlkLpGoL23WIVVMaib8Ivq3S4qqwtEoh56xZCm6csBtC3ZaA43u+0dAmUd?=
 =?us-ascii?Q?hKwddCQEDOh8pSP1vNR7xUlwuQZxIpVDctcpriMSiIl7x4Hn68503AFd8jD4?=
 =?us-ascii?Q?MEMJAcab5Wi9J8g625Hls3cezM3DSWVR84EaFHADIKpFQottMTipmX9roigm?=
 =?us-ascii?Q?IiMu0Ln9CJUShC5QxS9ePbqqoURvj438ee5/gX6iUP8Vn6RvjO9mYPCGiIgm?=
 =?us-ascii?Q?xAHUO0YuPuG+CQyVoKTnYZTLOdzet50lvsMpjsJSxMpOKP2xNKvXAYwz4JNT?=
 =?us-ascii?Q?fwBUPSHGrqTIMJS7yE1GEUqnOaQa3XP4sdzVxQq+Y6DzgV9iU0bEQqNc+olp?=
 =?us-ascii?Q?fO7CYIBSgYvCSXqR8hfVkomJVYa2lYlLp/7foXSHtgpjg6qp2dCmRcev8yIO?=
 =?us-ascii?Q?2Auf6ccCwrt8+owhhaVdMfJyoCjx4dtMlkXim+4WETaJP5VqpWg7gFv7/MPp?=
 =?us-ascii?Q?tWuSydK59n7ZYzUNYUM7UW9mXYB1vESNr0pDUqAM2xGmMRSee58rz4hUBeX9?=
 =?us-ascii?Q?f/QENhp60EsevYkNV2qhGFdpFWZWrRLc/4kNCJDKgKQdpmzwAQdoqIUfGcif?=
 =?us-ascii?Q?XMxrepBMj/7KbrPAX1/IBCgQ61PbEnB7uI8pZcETA8WvMHCHGGEQ76x/QIst?=
 =?us-ascii?Q?8t+HsRugSDvvzhGKtR65oVfjKiCNpV23Oh3GHdGdx7TMD1PXmL8p3oBC0oRj?=
 =?us-ascii?Q?OsyYgR0kzecEilJamgJ1NBMnU3ZD87O4ndFdyM43qXocLhOnVhW9ZjKpmcYu?=
 =?us-ascii?Q?sq0cvvaZR6nkoQJOAMm9FAKGohlayp9NG8eqjO8Ye6+TOolfTj+I4FlmbwFm?=
 =?us-ascii?Q?wP6rmIJ1bes5qL49mM2cEk4UxUWLpT3mA+YJbL4V83AU2tsZqxrMylQTRyyB?=
 =?us-ascii?Q?7Cw5uzXxkO6sgSFsH/iq00ouEQxj7cOh73glqVJiYPoXQW2UWHLJTbYxR4AF?=
 =?us-ascii?Q?OTsgrmkHhlCrn3q28kjl2e27/BrH2Z0rRIYtz8RlXq2HtOaOkQyy3+QN06dA?=
 =?us-ascii?Q?wXY/bZugyiGQestYLnShSkySXDNDfRBAWONZxcf/vNzLrNnlyA4sxp0eR02h?=
 =?us-ascii?Q?ihUrTnFxyvgKhYqWZO0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:26:58.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b87e5b-f720-47dc-9b35-08de294d1581
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 22:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16826

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Remove extra path from commit subject
 - Remove PV as it redundant and set in the filename

 .../nnstreamer/{nnstreamer_2.4.0.bb =3D> nnstreamer_2.4.4.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.0.b=
b =3D> nnstreamer_2.4.4.bb} (97%)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
similarity index 97%
rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.=
0.bb
rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.=
bb
index 63995d83..3419e5a3 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
@@ -4,8 +4,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
 SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
-PV =3D "2.4.0+git"
-SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
+SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
--=20
2.39.2


