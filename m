Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B529C982FC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:37:47 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5534.1768592263915789059
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 11:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=L7Qe1bLL;
 spf=pass (domain: list.ti.com, ip: 52.101.53.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbpFp+ZnqoiwCG4oJpLEXSC0L8H4kXXfOCv+F7b1OQ0qzvo6LKCLtnhX8ZStoGvbsHwqWVjBMgA8bXIMrIBusKTawowckcCozZ5yknfsAe+mjnoYae9kYWWgV8y/ppyPRHEqt7f+VtTQXln9+QKBJ9C4T3bHViwI9ynHf9NUM35x5CXXMXQb3UJOazPEH5HKqR1ZbyX3r9KFT8jVbuIlRD+WAwf72hOW+odSa8IlaT5UcGXth5IktVvomE98EP9lME+CK/RUUSmsVa63aT/Sb3Qao3tBe4yt8/mD9ZTaV4+NCR5uyuKLv5EGa/l8U//Oi9BPPfTh5wu19pUwvL09CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BljuXi1RGt7LAJD9/8R7bKkq0bEYAQMulph62H/kmdA=;
 b=bliCkld77TgGq1C4QYlVryj4paPG6iG68FSRzITZNZHIdmlFJXyaeR2gdtIrV7UzdQ9GtO085DUMKZvxGoA3FDONa1i+P92LRUv44QZasrYYaCUXwlPR+08IiQxZUct9UFvtMJ2bOt1eHPgqAEyei6ShqWz+zuEAvMXI7hxX39FmsJZKLgRo0yddLbV9UYUMet4VxrVS97Bm7D5XW4K/PN8hIrmUmDrXzlK0CWuzZ6rWP/dok4hpBUsxvxFkJ2sbbrYe/h9XSBQ1NQhULAwtWsw1pfrHEbGWMPBZIfDqGkjXqS/RyWyzlQEJfedt6bWdFPQ0wSlcbpyvjDjjcWaVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BljuXi1RGt7LAJD9/8R7bKkq0bEYAQMulph62H/kmdA=;
 b=L7Qe1bLLdk//KUQtpcg3Xf4R0qtv/IHJnW39qszCmMTaEw7oZvfdYoVJ7sWEOWEbFBKRMqIsoHc90/y+1tRsJoNvw/HfUALTQB35dd9JPQ63k0+uTl8dLFofLaGo0FI5YF+xToQvO8yyg/pJwjQx0cwXo564u50mzY75BYxIc/zyuvW2h+cWthAdeVnYEXWQjwXWgNsubL8kPjfc3v6iJFi25nGeMEM+kNk8K6l06WGIMEH+UV+HA8Q5cY49rc96shWX5TJka62ed+ZDU9qC/o5+8z5iQroKJbP6RvMxsjjHh94GZqSMTFWu9kVMN24IzMLk1kAHLkzR2rZILXfPpw==
Received: from DS7PR07CA0005.namprd07.prod.outlook.com (2603:10b6:5:3af::15)
 by IA1PR10MB7335.namprd10.prod.outlook.com (2603:10b6:208:3d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 19:37:41 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:3af:cafe::6f) by DS7PR07CA0005.outlook.office365.com
 (2603:10b6:5:3af::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 19:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Fri, 16 Jan 2026 19:37:39 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:37:38 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:37:38 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 13:37:38 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GJbckQ1208259;
	Fri, 16 Jan 2026 13:37:38 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4BED29ACF4; Fri, 16 Jan 2026 13:37:38 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v5] packagegroup-arago-console: Remove unneeded alsa-utils-* packages
Date: Fri, 16 Jan 2026 13:37:38 -0600
Message-ID: <20260116193738.700673-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116190317.3044790-1-reatmon@ti.com>
References: <20260116190317.3044790-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA1PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 809caeac-9f3a-4604-7d32-08de5536b560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uc9YhP9ZutQyxd8dGtAoPgv6vQ66BvXP77Dje+/HhoYCPJzEL+GwvuPpWUKX?=
 =?us-ascii?Q?YYcyePyklrEFvxOmtWJmO83gYuLYMyeXwiuXms3YMzwazkUc1Obpo6syoyiJ?=
 =?us-ascii?Q?r3fduAIUSj75DQ1fUASgmG4wSNaOmqNwYe4LL4WGWjT8eUYz408S6eHZVC46?=
 =?us-ascii?Q?XR2oU4fx5/BoeokztU+GkBF4DlVnFkqUZzheorhXT3NRkKCs1LWv2sFDzGXB?=
 =?us-ascii?Q?2qhFP3qItgYOf++SNRK5YtIYWNRyH1DNKmTagxEXyqYHE3DpSCG2O2jGe+cq?=
 =?us-ascii?Q?1fpSCvSVS8znr87vjmr9G3y5qmV0UQKNbVBa8TRNyS0rbc6nhRHFJ2oemjxP?=
 =?us-ascii?Q?FN46v6pAuHQcTz72054yGj1k3thsRGmLqrYlz9+vKIIXeO6JotY4g8vblA4H?=
 =?us-ascii?Q?FiIRHaJeMou66HgYz3adiHYIDASaVA3bleXB3UuYc52K58F8g9RQ57BYmDo/?=
 =?us-ascii?Q?W6g9+5y8GdqLlvD1b/3GmpAAUU/QFxnzRuCi1MHToiukwhwTxZhNaXStfdWB?=
 =?us-ascii?Q?0+q5Q3XjuyYsIZ67bxLrcHsy9YbVc5BFHnBpVEIV9ITMZGbSwGX5rMkByyoR?=
 =?us-ascii?Q?etGKcfAe9DyuatPyu/e7ZK7/isZ/0vOvKh5OY1M3l/pIzG9IhS+cGVeTKzW6?=
 =?us-ascii?Q?0hQgWkvFfpOk2DXjM7R5E46LSDOyKSZ+6GtezPVGc+Up/GC8cx6X2uMkOFEV?=
 =?us-ascii?Q?KvAWmxcpImV9Ork7qoDTRfiY0K9zveCI0XRnCbsL2ITT7BxvcgfLMJt8US8y?=
 =?us-ascii?Q?NnqFCFLKnVeNga61TURayRuLRX5kem5zZg+vT8DEP7X+NgEa6qycdlTTwmoD?=
 =?us-ascii?Q?lsK/x+uu/W1UlfAfXCTaSjucv46uuo9y9V3yCs+JaGCo04X8fn8NVcpwu0fS?=
 =?us-ascii?Q?axZhCHGebUw1Ke87G6QTz1iTWWKspMm8GWzsebF8YTgPrOvEGVqzPSONmL6q?=
 =?us-ascii?Q?jWdjp/cFRTspLpm9rVMSe9ivncP44Nuj227nkfCj8o5VhSzbTFP4gXFJ5OH4?=
 =?us-ascii?Q?tsZrsF4orXMOOtCU81Oo+EukNrcQM/eWaxpoqznCI12GnS+/NPLafnE8vUj1?=
 =?us-ascii?Q?kbfku5Qr08iDwjwoTiq9viciXJflJ/YmByd0a0dOnihyRu7A8Spd0uZxt5bP?=
 =?us-ascii?Q?fEK9zd92YXrUrgnf1yhSgC7CninlUjZGgW6cF94v8IZ45K6O95Yl80KZgUkr?=
 =?us-ascii?Q?W1nt9ozaE2FkES3S7bhJRMIfwF28f8urEhFBVSSvuVfG01jT3GE+XdwFNJ1b?=
 =?us-ascii?Q?08vFgbHoao9zPLhr+/k0w1+xxyo2R0VvGfNrOcvJmrBdspenxWM5K1sDVyUq?=
 =?us-ascii?Q?j8K6hFUXXvFYi1RgwSXa9HqDjPYg5NSP6GBkLVtI2F3Zjpq4eFua4Psm4mmP?=
 =?us-ascii?Q?mOMmO3vHO5tQFOSGII1VbXVkv7qa3VMfOJ6FeLL7/QNdNZGh9xevnb30P0RO?=
 =?us-ascii?Q?rdaMbfaRHlY/twzPoKG84WP2LynWPpTAMPCDpp6P5Qi7RjaXE8mDnS8DxwCd?=
 =?us-ascii?Q?wknbJFQWTBlfsC0pA9DV2SW6eSJcBkoBPJ90ACGQA8kGWW3LIvCrv/40j65o?=
 =?us-ascii?Q?LDLF9P8WBAMUPp0Izw9Uiy1oSuEd3k0p76BqDjjDirGwUU/FRiJFk+Wl7NaO?=
 =?us-ascii?Q?nRgzQC84nuAH7OLPa6Fi6uwGe6ssQfhfaG9bKk6Otv3H?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:37:39.1708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 809caeac-9f3a-4604-7d32-08de5536b560
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7335
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 19:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16980

meta-arago / na / 20260116190317.3044790-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v5] packagegroup-arago-console: =
Remove unneeded alsa-utils-* packages
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 16 Jan 2026 13:03:17 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 265650e67e4223d1d8a9b650ef0d1a151=
7cffa80

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




