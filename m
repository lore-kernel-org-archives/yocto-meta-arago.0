Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EEFC982E0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:36:16 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2741.1768584971137052065
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 09:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=evGGHKe6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuEoso45VxSQhK+MK0VvjGYZ0/cHCwM1kRUruiZzUrWjfWFeK39X58TqfgQVIbrzEOUXuHZBVGQ88gWL3RDblO0+V8+eytN/oX5pipkt3ju8tGXvjIk7UhN5BF6YGFvQ8DmL/AM0CcGVwWaICpXauwC6DWsISULt0pHLbvjJS7jIWr7A5DL9BseOIoIjPBtSmXXsPgTOSml9BXLMgu/wf3wosOSj+927Vrx6WI3ipoBql5UJAzOMeHOf92Yus01J+VgLPjUJI4gw8UbFn+byY49I9gFzo26Fn8TdkJYP6uCM1tTJB+tFFrryLgA6REW21e2rH8NHbzgKD9gD2LJfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHe2k2TXfXWYtNsT81ba1Eyqd0R/fwNSEEQIUJTEd1U=;
 b=PBXAWEK22jVwEEJnjABEHWTWS8kzVsSmdOnx+SUQ3f9iiqOy+tPfa4gKCn6CxQulk5my3KNrnVqiY/uBs1638inwyC6Dy3i/hwCmyxSW7djAS7rwvNRov7mysfYkbZuT+uHgfyqJtQ6w5EVWsLJu8WyeTYo6VPwdL3B+oLyvG6xLuhGOIxggmgiI90hocqcXv6Nov1dkXSBtKliwIFdJ1phqTMBU456ZnlhkB0IiXSLgGc2FOygunnu6ujq97/e6Q5Xne+oogS6L1wOoawoq6h96bwGHbKsSjDx8gRH6dlk5mf71h6zxXVu27Pg9AtaSsvMsIZ4OlZU2nBEGtUtC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHe2k2TXfXWYtNsT81ba1Eyqd0R/fwNSEEQIUJTEd1U=;
 b=evGGHKe6m0klyyeyXszPDYegWyr0z53WqN15oo3VPnKGyo99a7j1FivYd/453jeQoRzmLU1QRlarlPx6kGp+NPU26ROmsYGWILuy88AAPjH3MA8IN3bt6ZQ/U/6jyJ+UbzXilnzOKDNSzkO4Ipy0h4zYKMMpcQ7Wt6/248NgcY0=
Received: from BY5PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:180::41)
 by DS7PR10MB5213.namprd10.prod.outlook.com (2603:10b6:5:3aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 17:36:08 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::90) by BY5PR13CA0028.outlook.office365.com
 (2603:10b6:a03:180::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Fri,
 16 Jan 2026 17:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 17:36:06 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:36:06 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:36:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 11:36:05 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GHa5nR3640581;
	Fri, 16 Jan 2026 11:36:05 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgnjx-00000006ZLy-2rJ8;
	Fri, 16 Jan 2026 11:36:05 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix package names for alsa-utils-*
Date: Fri, 16 Jan 2026 11:36:05 -0600
Message-ID: <20260116173605.1565859-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|DS7PR10MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: ab78f3f1-7848-4cd9-a6bb-08de5525baa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+t0LwW+Im5KFbCId2pCd+o0wRh0ig9R4BtKwApnXpWpQxeNyqawgZVI9+aFj?=
 =?us-ascii?Q?qP8V+9LUhzy7swwUEm+IiV7/bErws29ipFh0tDmzKVjoKFvZN1hoDRfzp07g?=
 =?us-ascii?Q?EyNDIwfgkgN11cS4bW0TjxTJxm3kq6RGrUS/mmMHSjJjw5CYNMMsahR5fNJm?=
 =?us-ascii?Q?WJ1AybS/u8J6WRumw5J/RZDF7OB/HDZrbv5OqgnTGwhS2h7lmu/riFwWJ0M0?=
 =?us-ascii?Q?QT6kHFzo6HzDzusRQzxaP8l5f+Yo9V6XjBMgaG3IwperKQdMi4K6Q2Nt4hwj?=
 =?us-ascii?Q?JOclGCjkuzBnFUeZCysZ59tnnHK+XvA1nPY+Fa0cO49RRhG03UEzaDf7uW89?=
 =?us-ascii?Q?sUU27ZpBk1UTjsH6Nk+mRCRYk28/idwey58ykj8c3xrkijprHUKDZ/35DEZe?=
 =?us-ascii?Q?e8hKY32ydoKsx/VoaQiLGmWoEtycLqfgZdx3wxmtViNvH6Pc3kXep+Ziqnks?=
 =?us-ascii?Q?OLT5BfRUulNAqCkkYaaNDr6bxPtSIw8ZCqvVh7033EdTPT88EsbiFukTMeWd?=
 =?us-ascii?Q?SHjbuYB4F7pkXc/BOM/aZroU7Tn2UPmcY9qkZCcZUe04tqRJgzijItxjhmCS?=
 =?us-ascii?Q?PGmP6/1uEXfoWJVp9DCZx7hsn3WJlbeh5qpToTNsKAo7ByR7DDMfKHVnjDmb?=
 =?us-ascii?Q?eJjGNTLFM+tV9aKCz4pmGMNRDMMhXKduuaLOAuupQ1qR8t7Md57tp9tSYMc0?=
 =?us-ascii?Q?8x3R8m6LfgeV4C40RenvYH/fgMNAVdA80kByQPAp4uoGxSvTlT2zcygvjF26?=
 =?us-ascii?Q?/4IPSoJeYXORTDf2YPhlDgs6CeTRv7jHhBIifaIqEhOwtBQC6nmWQndGfVXB?=
 =?us-ascii?Q?QcdNhqdhgyF6BR6/Xtlia3qs70bVxGESPEgl6nu9vHWPdb0FeQYrlQJrz18H?=
 =?us-ascii?Q?ks2fEU91IgA3xCYX4h+y5zZdYcQcIjX0J1YyVbjh9S11yk6RdGqJN2TZP0hX?=
 =?us-ascii?Q?DRNbWiotICjUhEYXEOHd5iD9qMYOJ06pvCYxhIlTwh9Havt8PNH34KYwDzGq?=
 =?us-ascii?Q?oFMeUloVczXaVhtDRz5PEjMt4PzLwv7P+FpanyEC32a1635rExkwm5F8UcJb?=
 =?us-ascii?Q?QTJfeg097jcRPNO+1nPqqsPaJvlFEDU4XnG8jceLmuOyYf7Ylqkg9gd95Njp?=
 =?us-ascii?Q?XOCQDttYaU8RZpUY9jzEGyzOZTYHnrwDj1I0Dpv1y7O6wx1Irjv0yHq1mHO2?=
 =?us-ascii?Q?GxUbHkuYxX22KF8yFcoQhJOJHj2VKKsXffbY3B//+D/NQrTJ67acvE+cvXMj?=
 =?us-ascii?Q?/gaIh+xQuCt9aWl0Nwr6mem184XB31mXj2ydmmML+9UyTpNV0qf2MoKx6KtM?=
 =?us-ascii?Q?7H1O5Y7nptBuIM5mAfHsfNePtqnb6RAUGyYQVHirBYx+kCfLstCuoOsqYBlH?=
 =?us-ascii?Q?TSvdlErnWO19LinPZsphTZ+g3Bln6EruRuPjy39M3HLjPdg6BkKlNkWX/mDt?=
 =?us-ascii?Q?8C0IhOLmQYM9NubCRDH0XVERqRsMxd+J2P0EyUfwDtwNfW5GApvuBCAw1ln9?=
 =?us-ascii?Q?zO3X3mjUB63F8b2E9qzIMd+b3qHteuZHSFYYfcIcL4fqmfvjffUocJwobQPD?=
 =?us-ascii?Q?MVRMo33On0NTuW8MRuDyyGq/p4c66wbC4n6eT857vOYr1MFLSleOPrr4IwDw?=
 =?us-ascii?Q?pYoK+iOn4b6T0ZVEmo6y0vIY/XvQuvCQxcZlIjkf8Z6amZX5UdnqnxOr1Aal?=
 =?us-ascii?Q?dS41dA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:36:06.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab78f3f1-7848-4cd9-a6bb-08de5525baa7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5213
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 17:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16972

A recent change in oe-core [1] reworked how the recipe chose to name the
subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi,
and alsa-util-scripts was removed in favor of separate packages for the
three scripts.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D26a28ee7935=
091250a8c52f223a7a954d9e29d34

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v4: More pacakge name changes after more testing.
v3: Fix commit subject.
v2: Added three more packages in place of alsa-utils-scripts.

 .../packagegroups/packagegroup-arago-console.bb            | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index f6ec0a05..e13cb3c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -13,13 +13,14 @@ ARAGO_ALSA_EXTRA =3D "\
     alsa-server \
     alsa-utils \
     alsa-utils-aconnect \
-    alsa-utils-scripts \
+    alsa-utils-alsaconf \
+    alsa-utils-alsa-info \
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
     alsa-utils-amixer \
     alsa-utils-iecset \
-    alsa-utils-midi \
-    alsa-utils-speakertest \
+    alsa-utils-amidi \
+    alsa-utils-speaker-test \
     alsa-state \
     "
=20
--=20
2.43.0


