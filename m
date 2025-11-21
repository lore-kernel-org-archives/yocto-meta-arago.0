Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8216FCFC28D
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 16:00:47 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14618.1763740845853714250
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 08:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H5m50RDB;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.56.13, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG+R/U5ObxkYD7FueOSCXB2HT4ivDwvvjfdD4RuTcp+/nNxPqeBOeNGhN7z6fqAzpwaADcs6EmmMMoJRATHMNM0Y0kjWmQ0UhkcAT94+rfDRRzhioAH/dnkGkzBlWCQ3qRULeMjIUJsIxFjvFXGkgx9CHAylPORB0z0oRA27kgVXgRKPtp1dK8b3A+tmfRyh36hZHuXao6ZdMwsfqn5CnNGLx/UNWPoIDlfScJYrQkuO4sqNCHaznDz6qKYtMElMCZx7pkJmGNnaYTAowkX3ljp40h0iL7HKnUmvlUwK9ryGd5ExQH+M6+UD7YP4XKDq5+ubLupXVruQHqfgVDYHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX6CdVmOj4sfNjv5cB4coQw29XLukSWzTmDNovYO/oU=;
 b=hlRhUF1Kq5e+gn7d9xaW1nTof+CSi6jxZxzADKvXOcgHQjD8Vppv/8/thai675yinWo7hyJdvnKvp2tNMkod91ioqBIra9gC+78xSIi14CZLQM945Ubna9WfO9vdvf3I6+Bxknl0XX+jrlvMx02sk7qPljks67I2z42CLRj+NOHiqv86vVNVyGxHMMBEHN36mtI7x0CeUL9ABZQz8ArbVJYMDZR4coxtR/llq+eKjXsZyGawG34D32ZyIer6LUf3VBNNQz5q62hT2EhTXhbMGpblrWC0OsCIxqUgbHOVI+bseA5WywN1XVGZnQnzKIvePVZnIp3peHjaNrK2/NKwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX6CdVmOj4sfNjv5cB4coQw29XLukSWzTmDNovYO/oU=;
 b=H5m50RDBYQeaA9jlVHmPRlZ9dkOc+SaXJ7ZgYUbThP8jP+M1NSMFd2FKIxKLdyDcm9jAVbJ1Bucicpg208urj1X80qSEnA1hMISgdwORmTUVWBjYIRvhBfyW90t33pVqhoz7eD7ndgFwZlEXOKeWlsa3hi7qmUbxxsB7ujmPLpA=
Received: from BN9PR03CA0959.namprd03.prod.outlook.com (2603:10b6:408:108::34)
 by CH3PR10MB6740.namprd10.prod.outlook.com (2603:10b6:610:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 16:00:38 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::22) by BN9PR03CA0959.outlook.office365.com
 (2603:10b6:408:108::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Fri,
 21 Nov 2025 16:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 16:00:38 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:00:32 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 10:00:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 10:00:32 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALG0WfM1530190;
	Fri, 21 Nov 2025 10:00:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update to 2.4.4
Date: Fri, 21 Nov 2025 10:00:30 -0600
Message-ID: <20251121160030.459921-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CH3PR10MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1defcad4-54b2-4c6b-a27c-08de29171d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q2hJEHzKWQxwTtot/yJ9YPxDMjlol9lK1FYAwkwGZQ3oYLKTyGFklnaEDdic?=
 =?us-ascii?Q?tlsq42NhkvBabtDJc/CqQG1FXLkmBlYzThfrvhIHWmMSLkQAi6EhLEVECp0I?=
 =?us-ascii?Q?6zMFc92kWlZ7NUWe/dOsXGL3V0q/0fFQPZLw3Q1tu2jmW1CEA+vfPUrecZGT?=
 =?us-ascii?Q?2FtUUbHjuTv7u/Gj41PmZBGZeCvCHAap18D+uFbNqUX+IiFQzSr85EQZlvFI?=
 =?us-ascii?Q?xKXKx6za6GIh4l+W1HKdgJh1pJFGReWEz4veGaX5fo86xhklbfGmx4l21wco?=
 =?us-ascii?Q?YezzLHUlAIW0cZ4vg/u6EFjY0PEwz959xX7hhP8KOBHClFM/2dy4Dy6+me2j?=
 =?us-ascii?Q?cGsEkzxWolHiJ0CM1852R6NgmdmMV42U0AMvZGusBRYLdyzt53fv3ebp9xvA?=
 =?us-ascii?Q?ibFVjaVkSEecQq0U2J75SUM387q+0NOTjV4U91n/1OLxZNrm2GM74vyxjZ9e?=
 =?us-ascii?Q?KqtmOnXoVWI9YWlkz297h6rcF8rhznFEnX80F7HWukOrOlXhLRMGrej6CPl6?=
 =?us-ascii?Q?y3pU3gFxTVflDeeiKZDcVKSHAryj8JmNIFrLZYpaqgYPe+mp/v6xnpc3C5Cp?=
 =?us-ascii?Q?hdknjxX8YSGwfVotcwru+AS8r2pA7xEejBt5HkhVrZf2xP3aGd26CUsPaLFp?=
 =?us-ascii?Q?K9NksqMY3+9BHi2sYK1d375yOvf6qME5+lnn2NvWlxkQKpuQlU2WScHrI3Hf?=
 =?us-ascii?Q?AvA/x1lLJwDql7sgLTU2VQ6Kf5V9rPKgT60Hjdx6FfvrG7JWIobrf/6A0n4Q?=
 =?us-ascii?Q?+eK/VyOuU/7lABe0s+Wajo59lzE57GFzYT0pDkjr8tqkYRfDvBwhGdiZMIf0?=
 =?us-ascii?Q?a46kpQVuZ+byYZPvgLSaneGuh5JZldN/aUpYumTKrk8PujN1ykF6JED5Ljmu?=
 =?us-ascii?Q?b8FxDVLLNvWJulZ7jpxgsYLmlXpvkPmMNM2+6TFARbR5GG2yh/CxngeP2pOb?=
 =?us-ascii?Q?/PrPw+jNd/oYGzaEr0VKARaKTALLToorc2lLE5rLqBG5ePkS/Yb+rRCrbEnK?=
 =?us-ascii?Q?dYwmYB/mi9UpBJQAKgGHlr35lTh4Jkno07IyT93JlyqPyUc2WSvs38zQpGk7?=
 =?us-ascii?Q?N5TWUermFtArT7zUpiUkSgu63X92FuZjtAC6ApWtBrYuu+R9zylchUF3FuND?=
 =?us-ascii?Q?vxnpLFKFIimd4si3GROHDAFfWnRQWol861Z4L5yiXCgZcKb6YRd7MieaLGr5?=
 =?us-ascii?Q?6FNqaGKimazGahedRD7UXWam3A7nFZuGeb+jRo9dVPFf+8dLwCp1iyzwIWte?=
 =?us-ascii?Q?NxcANILOSfYfrDjye/Use05PGz+EEsHFFTRY7S+MmME+JtJBXG5ssJPGTbL7?=
 =?us-ascii?Q?pygLV42/NZknpuphFCODyGYPMEu9raPm0A17tMsSxfWYLqmwwGSjecALuAr7?=
 =?us-ascii?Q?yJEwwyk98HuaJlk1GS250KxqsYb60pg4cNWA4Jbni45kqAVRlm/JQk7drM5L?=
 =?us-ascii?Q?hINA4MU6xBh2+DKGht8dwc+gv/NnhBcIqpymgdvJgdFv9/oBt9XoERfXGttd?=
 =?us-ascii?Q?pbN8z07dzzit/ghVZKDXUKFkmSk07S9ytSChnFhn5yhCxfZco+FR9VUqooTI?=
 =?us-ascii?Q?XfBr9iVJ4ErssNegKzE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:00:38.1031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1defcad4-54b2-4c6b-a27c-08de29171d16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6740
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16820

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../nnstreamer/{nnstreamer_2.4.0.bb =3D> nnstreamer_2.4.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.0.b=
b =3D> nnstreamer_2.4.4.bb} (97%)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
similarity index 97%
rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.=
0.bb
rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.=
bb
index 63995d83..0da572a7 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
@@ -4,8 +4,8 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
 SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
-PV =3D "2.4.0+git"
-SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
+PV =3D "2.4.4"
+SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
--=20
2.39.2


