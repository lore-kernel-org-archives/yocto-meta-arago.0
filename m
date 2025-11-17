Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AA9CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 15:25:44 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11895.1763393141047327475
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 07:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CcNNqKRE;
 spf=pass (domain: list.ti.com, ip: 40.93.194.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV6Lr8NKJ7mCCFStX1J7kLWoI+24pBS9ezz63bn48MTQ0mYmw5CGGAN1VKzGlwhkcmFKF4YiJoHe9nEAnh9Hzk8fOGwScXeyaqX7sjyAUwQUVD9hAEu64deyX8AnS7ri3AuiujVjBijzLRX2wPb/j00iWMuL54TdsQgHYJfB0xeb97IUaF51eGO38+TgI1trFLlU0//Fz7B00mZIj0+EGr/mxQ9Lmn3D4tgSYhFrw1z9pFcwnWxaVpZaQvhJaglw6twlsY6pbiVaXSedVRefsYyUCRocwPnIqZXtpR+1KY3k1H+4h9ZIdVb9+j1hvEwjIRHhJ1qu8MUbABJ/8wUWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2H159PKyBmQ6gJ97gqc/AtXr60fSCAKpOySncseP1g=;
 b=jq+bN21O25YxyGRUeCN1UXdYkxHrZI+ghcBPFvURlmzhkHyGksuxFrPuG5pHBseBOos8ZTN1uixm/KVI+exQq634OcE1OOR04OGm4K4p6Fi9jGN3tLt5ZZWMP6ZKe5bkpdOgEp5cCXJSODfwoAhf0df0YW81scm1bIjiDPNRaWLflLCfkvgWgqYLrjWXfVAFGzeClhFTDMuq3wv615vHQMiiVvPTxZE8oGqv0StedmoU9G0V4cmanv11jhRZegviF+29DgI92iQw855OsduCbFVCZcNa8RV0aeY9+vJTfViM/QOFyjT3g/HzjCnydVIsRft+UIhphadea67zQJMueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2H159PKyBmQ6gJ97gqc/AtXr60fSCAKpOySncseP1g=;
 b=CcNNqKREIwgxWmufGJ8s5WjEosuYHW0M/KJfO8JTV/qWvDqlr30NUUEkB+iOXIkxZpl3Uyuq2tgyxGP+b17NAVUK8atZfwPaV97tp9b8XX+amf/y/gI8TpcuJ9Zlkfa+n7k1D5aRZM4pCZVi3m8usEcHfc6U8MmmtiPs/LtFbW+uaC+rAid9OhiV2mwd7QfhFZVZa8gr38CLNI1zPJm1zXirQoV0XMAnHxKA/Nun3VJyex+M2HQAYyvAmWM32OPES4f7z97DzG0qhnYKn+IvgNTdt+4RinAm9q4lYwObxZBSAj9Bx8v49W6Ki8KPl2f1rj6TKJlq4Mk6RLCwVIv9Hw==
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 15:25:35 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ab) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 15:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 15:25:34 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 09:25:17 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 09:25:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 09:25:17 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHFPHx12668979;
	Mon, 17 Nov 2025 09:25:17 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 8AAED142E21; Mon, 17 Nov 2025 09:25:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v3] meta-arago-test: Add CoreMark CPU benchmark
Date: Mon, 17 Nov 2025 09:25:17 -0600
Message-ID: <20251117152517.3901687-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117151917.383760-1-s-sadik@ti.com>
References: <20251117151917.383760-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f030ece-4401-4a3b-5a3b-08de25ed8dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cWFYbBOg4Bb6t/RXCdA003VIpvcaOK3Ka5yNi36miD6FC970+0+yTy0Bn1/l?=
 =?us-ascii?Q?JeMQfoC73qr6aEYeRgXhvq9mkH5ZVCSEcV7rT4dJ6Hf8xrutBLXGtxdpaYCc?=
 =?us-ascii?Q?9KOI56sksIRu2NsCxxfsbodJeZjJOilasxL3MozMrL5zYrNZo4XEAO6FsKpj?=
 =?us-ascii?Q?Ux/QVCSCe/J3ffFDUDDY0eRhFzgnpUhjtgfEhaK3SSm3B0ntMeyPDMMPRdsz?=
 =?us-ascii?Q?v/OU2SBf46EkHPB9Zxg6KBOWSI+hx51/cXJEpxcZzkJzLbRSyCMKKNvST6Zj?=
 =?us-ascii?Q?B/7N7hNZqOqc90jwogCkKJfDY4o37aJ7siT3eo03JvdK2iA8ynYiAsjN4Mvf?=
 =?us-ascii?Q?DiGExH3SyYrYjANgolof2bA80SeAE1VeaR7c6ySn7YK9NYSWqKfb/bcIsj7q?=
 =?us-ascii?Q?rqlVvh2r9C0Sb3PsVJ9IFAbN7ZqpdMAh3e0cYyuU0MoX6b2hVA5/m/k0Uyy4?=
 =?us-ascii?Q?Vq+C6VSs87tJc6AsID9dG+5X6tXLW4UGWYmAON6vo19OFaGPbIgElE6IsIqY?=
 =?us-ascii?Q?Q/76CqPNtdGz7eBauRCnsGU0XHDk7vGDDHkj0mdtXG5VQn2401jIoqD50F3D?=
 =?us-ascii?Q?X6BQeWnA7372T9lOihysRqvzRVdb9TAe06n+jKDHldk3BAld/vTVtQeJSbIZ?=
 =?us-ascii?Q?2xC9K/7lUcaQnvQ2I6IHZbuMcEhDMgD3V0awIqG7QQR5hE2XbndpTW1Gha4Z?=
 =?us-ascii?Q?9tCZzhWn5xw39HEjmJgoIA5azsUgobpewOBj6dMzrCvdGBXDFkAXpcZCA4ll?=
 =?us-ascii?Q?BS9qJ9sjjaMTSsk1aTZSYSuaZ9W1X/264iRQxHen0XCE2E+HBvYYvqqBb0iL?=
 =?us-ascii?Q?4os4hhSYtoyzHTHSy7Q1sybRNVoXK3UCOfU0XN+V2MIVU8tjZSB0rHFmi+BB?=
 =?us-ascii?Q?1YtQ/5wnJh6SCVoHjss3XWgnyOpba54OxvRWMJttbHIhdAWk1LsySxwfm8Qh?=
 =?us-ascii?Q?I6eCkxx7l39vlV0LUGJrPtc6BtB+jDzYfPzOugU765Hji4gPgB0fXis14gqg?=
 =?us-ascii?Q?Bng91HvNgp27+Dt1mM8eUXK3Bqc+fdu4Jlvx/gpQVSxM+Bj66gKIGNAD75rJ?=
 =?us-ascii?Q?UGp126cPt00MS/AYxcvjsVIUUGLaSi1mQzmOAMMARDaylCx4qhDwfUnVuLMX?=
 =?us-ascii?Q?6HogT3A3P0iosL6pKAxZN561GbymqxP4wESnSF5o1IEFVrU5gC2uLtVA8jA0?=
 =?us-ascii?Q?gHSQrEvGYkHLDuxJSUpSfx5KgkOTfxfSourxjdPmN3890OA4ZzFQ4J9oxuWa?=
 =?us-ascii?Q?/e08YSo1+xt1SyGVAjXOCJeLwX4jKH/qeCw8vtk+UaermkUtmFZn9O5K1PnA?=
 =?us-ascii?Q?K3hnE6Ewn9NCCUiyku5O2OYGYi9nZ4uMTmijswTWDMJ1O9UhA6974tlYSUJA?=
 =?us-ascii?Q?mEGM5vVrb37KC99gsfp1410klWO8BnsPUwM9frXreKd9dLcl7Mw7Ho8nwBbu?=
 =?us-ascii?Q?uI+09TsvDJ8WxpLVhfEtEG5XP3JmttArgQy5QUbvWkdBk4n5BoTeuTB+uoVl?=
 =?us-ascii?Q?Ct81boWLKvK4mX3RMgEO1zeZaIqoolNJJYlMt59uryYmJ9Sfp6o5jLjM4zIl?=
 =?us-ascii?Q?lU0jwYMaIJLoxHq/g0k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:25:34.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f030ece-4401-4a3b-5a3b-08de25ed8dd1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 15:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16777

meta-arago / na / 20251117151917.383760-1-s-sadik

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
WARN - [meta-arago][scarthgap][PATCH v3] meta-arago-test: Add CoreMark CPU =
benchmark
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add CoreMark CPU benchmark.
              meta-arago-test: (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v3] meta-arago-test: Add Core=
Mark CPU benchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Mon, 17 Nov 2025 20:49:17 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2e5849b0d44ce5a5d26b7119c2792d1e4=
4679839

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




