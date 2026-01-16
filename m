Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C9C982F2
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:46:56 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4603.1768589206807877429
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kzZG1pfu;
 spf=pass (domain: list.ti.com, ip: 52.101.52.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYfQxupaLHk/vJnJw2c3tcUUUDqb13uFtSxjfC+oOFurjSV9KgunJ2ioyKQypx3y/lLWrDiFA6emKwndpxF8LVBi1Z11DHV0lWBZx4pjBzMrBCYqcJAAJRdc3gcT6ilGUbQjRJGB+qYkPxA1FVNWeqaiIhZZTgibbrCMjwiMvLdEr+Jb1SZ3CpO7cBNjxQCVtKCjVlwZBr0aaqWDlFXEKebRRL0L3afhvqS/c37OTPVzUmmpvszkoe0uz+Fkx2t1DyQg5JVyCNOFkyrkrK4R8GRlLz5GmTgwu6yA+oRRdZvqIx0hEohlhbMJciu7TXENTxmQpesSQo42ACc51vLsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9WkfBW9g007i2A1JaRjFrarYqy4Pvafbb+tk2fiLkQ=;
 b=co/jNG3cJBtnuAXbjz35s2ajpiKNAIwUXORDjJwbjowUWu4atE2AuklMHSOe6N72WloMwHoTHlScU6xGGKvhJcisN+sQWNmeerYfmHIN5uwAhKzN6ayd05fmGwXPrBcLvTZ9k+eZMrCto0SarK0vBb0m4XqPnkPms5iV282XvU2v/MmXKgLx9gTVdHCvaMhA2HNbyflRWS2ToHNgCmOyFf/6Ho5ee7SYopWC9S5wypSy0i+NiEoUR6pX2meG1WF+JE00FBhC8RJLby2BP78DhmRhuG4cvHc+lH8Jr9OtggvEH1lwLKHajounNK8YCki+HgbZSJ+DVUIv1OpsUs6h9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9WkfBW9g007i2A1JaRjFrarYqy4Pvafbb+tk2fiLkQ=;
 b=kzZG1pfuFc0vCRTyI4CPcCwVHQCHx9Wgtw5vsA2JU5aPEu8eVS1GemAcgy0uw5njQ2mCUzYvpq04xvjCehnEp/xoEB+WP6PzNtEre8GaALcc8bijNMzHb3I0G3juiTIr6vi8KkEULRlBDvddWKsytjPM0C6YL5O2NKNQSPY+QzK2CHW2yieo2kQtTxy6kMpPJs4NUgPuf+uCgmvlwMI2+6XjQ+mWz+brInZL4tp/i0+/gd3CkseCzFCYvtJmkQ23uSK/a52BqzN4afs7ofb4DmrcmW9RigUYezGi5GKr6Zc775c+oVRtbvpdFzlZ665tBCaUC2rn6dEAT0BhyB89CA==
Received: from MN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:52f::34)
 by SA1PR10MB5735.namprd10.prod.outlook.com (2603:10b6:806:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:46:40 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::79) by MN0PR03CA0029.outlook.office365.com
 (2603:10b6:208:52f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 18:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:46:39 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:46:38 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:46:37 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:46:37 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GIkbAo1077880;
	Fri, 16 Jan 2026 12:46:37 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D631A9ACF4; Fri, 16 Jan 2026 12:46:37 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Version bump to 20250930
Date: Fri, 16 Jan 2026 12:46:37 -0600
Message-ID: <20260116184637.579236-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116182129.1938502-1-reatmon@ti.com>
References: <20260116182129.1938502-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SA1PR10MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d32756-35ec-44c8-5b58-08de552f95e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WYQq0o0CditSM3jJiEyP+Vf16m1d6jM/EC9eXe83y/rLDNvJC+SLILwJrZlA?=
 =?us-ascii?Q?7xuyIVdBYSrLPHd33V6tIU/sYYr+BcgOxr1BTKMsejho9nGCOve8uK8hesRF?=
 =?us-ascii?Q?6jmWQQMatHWJKXCjVyThFxvd09A7dNyZFsEHNQRu9cBCsxI9ARVo1NX4n1PN?=
 =?us-ascii?Q?I3OKCa64WGgbnFBZtLWe0v3ELAC8pzgGcU/4l3LRO2P9vGpN4cB6ZRvbnNQa?=
 =?us-ascii?Q?vKO4xr2RHjSwopv3D+MfVncdDLS98cv0MjBBFi6XN+LYT/YEgVtMxCUbetth?=
 =?us-ascii?Q?7qifS4S5NSWQGZ6fKYUSctlnO6s7YPO3M3qm1kyGJrowV5UeJpepxmxMdDnx?=
 =?us-ascii?Q?PoIkhbd3v4VGaJyPOJk0SszuJd2Xgj5oqq24fjeK37pfx9/4+ZJO27ihLmHI?=
 =?us-ascii?Q?wlLWMp7XLLUiP9J38+fPoUPG4VoqE3D4emWWXgdzo6Gzt3COSdlbhrB3hNTs?=
 =?us-ascii?Q?g2IXSTi5tC15179FaiDlhSFzINiZUQihcbBffduyDapQo1KCSGhVkfPNYvC1?=
 =?us-ascii?Q?BCUuHyCRyToRKgnay2U7BeqQFYnfc3qmFSKO+kgNpq9iBts7fbVj8IMP+eD/?=
 =?us-ascii?Q?GDyw6Bg2N87rf1kSaNP1MJYahXDWaTnVRfF2W09H2UEcSGK/yD7Rz/XrIl0w?=
 =?us-ascii?Q?8QMzLEquu9SqH5A6YK2H1FLsokfkoix0iz2iieag/LjN3GpxI/ZI87F62qEa?=
 =?us-ascii?Q?SLarKLReGwr3KKGApwVXQK/UQ9ZOCrwsj1VTuvpByKukdXGlSuUYNBYvpCl2?=
 =?us-ascii?Q?G+AhNb6hNYkH3p5jZtmWSSlXRr23k440g6w9h5yIkHyU7tzJjHDT7ryUFX3x?=
 =?us-ascii?Q?JZQhBQGE59l9CY9dNNf2QW/yrsqMxaskSYqFwb0KBVBA0JdLuAWxEMHAx+60?=
 =?us-ascii?Q?VlpEdMHXULETU/PX75gbTSKhQEWbmdxE6ICLhToSNESspJll3a8hdnLhG0/P?=
 =?us-ascii?Q?rGXtn+E2+xDrdEZ73FaNtVbUEVgi97THiCnSm+7CQKG+ebk0Cp70UjNPTigX?=
 =?us-ascii?Q?+z6AXXOa/Kj7nDQaoJNCmob8xBlKMsQSsMMA/Ku0KELrQZIYmaW84+us8pJd?=
 =?us-ascii?Q?nJKyYqGkfL9/bXA7YJqBZcubhU3Il56gU6Orv7YCmf9UHwDVDL5XMKGRgY/a?=
 =?us-ascii?Q?/SUwKNBMtt9rloS4F2/Ut8r9mKZxg4fWBaztrv0PSpG7940jn3s8xaLky+Rx?=
 =?us-ascii?Q?iHk4arkyJHVaUXuQhZm8ZL7zxUg6ZjpDVYZbDHzPyFo4pAspo2E8mggjAjlg?=
 =?us-ascii?Q?sl7ho+9p0ehTD7gU8Ke18hfPxY97aMuHDanpY0Cfb7ylx5gRpfiNdiaoPO50?=
 =?us-ascii?Q?pxII0yMiFv0rp2E+XDdXEfGFeDTsZHbp302iPoaBWw9Aisp5LNYmWJMnYJs1?=
 =?us-ascii?Q?oyjfdKbsO67/I3uuDJ+NLHgbThuYIyHj85ABPPiC2WwUoY/+Xr97uTw2KdYV?=
 =?us-ascii?Q?QrDynOD+H6Urf+Tgvppt63L9BvUXxtsj2XirbzC3E8aSD9o3/+nOjEvFyeWR?=
 =?us-ascii?Q?gDiT+ZYvylAZzALNsBtqp5bG8eEf2K622Fc/I45AROOEBhjmCh3OM3XXY21+?=
 =?us-ascii?Q?R2PlNSpz98I7W9F06/KnL4dRem7cg3kNQUG7x/zRrsqUNbbvO2XzPmsfjQxC?=
 =?us-ascii?Q?WkK5Yyiqcz3N1vckFEPu1WmBbAxgQCHlxlPIj+xG3bj1?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:46:39.8823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d32756-35ec-44c8-5b58-08de552f95e8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5735
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:46:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16978

meta-arago / na / 20260116182129.1938502-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Version bump to 202509=
30
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
-From: Ryan Eatmon <reatmon@ti.com>
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+From: Wei Gao <wegao@suse.com>
- Date: Date: Fri, 16 Jan 2026 12:21:29 -0600
+Date: Mon, 10 Jun 2024 22:52:56 -0700
 Date: Wed, 29 Jul 2020 08:47:09 -0400
-Date: Mon, 29 Dec 2025 12:42:29 -0600
+Date: Fri, 23 May 2025 15:17:49 +0800
+Date: Sun, 14 Dec 2025 02:15:20 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4a23be37973ea69f77e7887fb0f7e2070=
f64c992

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




