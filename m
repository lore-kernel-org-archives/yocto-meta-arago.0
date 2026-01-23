Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91782D778B2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 21:38:00 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6641.1769204270842283963
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 13:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IuuP7Mfb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.36, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTzACldQTYEWofrAfSzktjb5pQuaBzlJXmSyCwgLCtK2F27XBEQ0ImwXpzE1dLTcjqW0brj9ATRm3i9786s5/J26hNsyMkzTXzszHqP0/pdpcU8eyN7HKEtFtgxX3/KzXP6Xi/8sgYpE2AY5lB7iDsUNLhxaLPSNDkpis2w8CYnS2V+3AHYMKxj5CKXWEFYE89z6OUhp6NDa9n1tRC2E4Dw/+0GwftsP4xGtn6/EzlHNZSPyQd/C1haAoCJwY6arCGazHsp6bvAFlDN5vRGvin4FAvinmapIucaS4eYAUFlyEHeiATkqI91wm7e1JAyqcF+rRc/nM0nalP5TBi7ixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlsNZgWIMYy7aAaqXNKlt2rHiLkOBdBCCNqDaIv6CV0=;
 b=OAxQLEOgxi97Yr7uy2qudkZ0oy1VBrP0tT5vUkSrHb8Oc9Cg0Mk7ZTa6swCR/k9FLxjekPwMAH9qDAaPCtgL92KOxFp1pwCWnZrZy/HlATtpJhCI4yF5ERG+MIfDSsOf8Tf73ehoa+kK1fJA9zwqLKLrtcwyKKfSlQCw8Cxbhb8QYiY0kUYfR9K35Azn4FNZqMLbgcFP5e2hvtlj85TVDb0M15Rn+VsBUcH3V48k32KvqEXSzG9T9nHgMRM482W831oLIH96c1f5PXat26RINuF4bQ9wtTNkuKti8gmzLjhFnCrFXKQR4GoPyCmgA4mgRYe587Amha1brtTPYWBaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlsNZgWIMYy7aAaqXNKlt2rHiLkOBdBCCNqDaIv6CV0=;
 b=IuuP7Mfbf5IHFsr8Fk8zR2Cw5Wv3e3tfuAx0LUJ8TgnTVl5DaJLyuLzvTzJk0WyAE9nh0Ayp7kX+Oa9c+7VG14Bd5WN2NnnwMQBTjLEIfpeXgNPPWPtKGF9RCC3+efOSd9ztmLQbKGvv7D2Fym2K8yZKLNZQWt9j0EWY8mh0l60=
Received: from BL1PR13CA0221.namprd13.prod.outlook.com (2603:10b6:208:2bf::16)
 by MN2PR10MB4287.namprd10.prod.outlook.com (2603:10b6:208:1da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 21:37:40 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::e1) by BL1PR13CA0221.outlook.office365.com
 (2603:10b6:208:2bf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 21:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 21:37:38 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 15:37:34 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NLbX6X2974534;
	Fri, 23 Jan 2026 15:37:34 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 3/3] netperf: Remove fix for GCC-10
Date: Fri, 23 Jan 2026 15:37:31 -0600
Message-ID: <20260123213731.827613-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260123213731.827613-1-afd@ti.com>
References: <20260123213731.827613-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|MN2PR10MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fdc899-2ca3-44c3-1d9d-08de5ac7a1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z452CmcDsbEEGgdqIlMXphKl4yL40Hdw6Dr4fM6SFYcDM2WTvdGfEIIrHYtX?=
 =?us-ascii?Q?JaStyznKZBWlaXMvwvz6MJY4K7vFZAd2C9E9yaOL51EITzdL1UJGzs43yFUL?=
 =?us-ascii?Q?UpENBKDFGGJWX10utA0Xq9bs6tErGUeDPXfpD+wYVB+Y6HewfXkVF+aOiF41?=
 =?us-ascii?Q?8/v9r0bYYNrraMsuTwel8ENO/O44T//2qmPhE3vNbQudTb/dpj8SR8svq7u9?=
 =?us-ascii?Q?sNBTHeJ4OUSTYCayIuPaB3NkqE3o/FSMqf0ZhMc99tfHz2hfekv8J7EozQqV?=
 =?us-ascii?Q?eCyXP8+Sj7zTf8PvrpkYt6U/lAJ94TqEgZ7mH8QW5iWi9dwTQEhXwDx22ruU?=
 =?us-ascii?Q?UauO9BnI5c9tpXtOVT+uR/nIORa5cQiNA6ZHAAK1qHcRdMTxDnIl66VQ8Efj?=
 =?us-ascii?Q?cM83T+utA3Yz+F1RQK0WMP7ctYrgf36O//94TrXT84LjhEZbMqw8jPfir7uZ?=
 =?us-ascii?Q?9bHtEhfujlMYWnAVYlvdgn9j33tsZTAcH7npIm2FCuYyvfO9r4i25001j8oC?=
 =?us-ascii?Q?TQuWWvGO3x8pfj1jPkvaRaWxkxOqcbqXf7PheDlxrc/9bMYFUfgyMtrOBdDQ?=
 =?us-ascii?Q?cF85wetMwxtsc0jeG2VGTlAXti0hrQJiLLwDapjTZjogresUmVsousz8X5fM?=
 =?us-ascii?Q?DY6+tbDMaXULAczK3ZQjEFPR1BPrSdZ5KnUgn0Bg2X3n3UgguftOzHUPuh9c?=
 =?us-ascii?Q?z9hz/kcNOETPIl/FNbvS/Xxe7HsigiY2e1BcSUG1H4GPPwS0JQ1HseaDtmvv?=
 =?us-ascii?Q?DNn3975gHXagMQD3+I8xrz8F1Ljy9UcACmxZypN/22DAj1Fr7fXUY/qOGjFM?=
 =?us-ascii?Q?PhALkXAG29k0la67Rfo8NMhC1EsmzXWHl4HZQsdnQyc8H0kNGBz35cWxZjf8?=
 =?us-ascii?Q?PgxI1hy6W3VKPIHzH2ol4RTlzRqPKCp654YbxuKFvWC+t9n83Y9+WhmTKUvZ?=
 =?us-ascii?Q?T+xdVJtNmkU3xKnXEuP+rFrctFcpnfig52iEMN7+IljKRR93r3sOSVS/lOgQ?=
 =?us-ascii?Q?8xhOEyR49pYYo9IUIoFg4GKeOpP9PEJRHs0qJBwiK8YrC4CC3bTH5puPo2tN?=
 =?us-ascii?Q?0FOHMxayihye45WJETLWVum3/nXXZtrVTYvZkApZ/8eC5YwBWJcXYJyhb11a?=
 =?us-ascii?Q?FpSlAW2oWMXBE8VJhtyeyIGY6XgZ/VEKhzsIzz/My5x+2KkkrOxyf4jJFuyI?=
 =?us-ascii?Q?F6SSN4U0L/cfRMlHPUF0JawYv3y56dWNrOlw3flDZgpepwus8byk+ERXhL9v?=
 =?us-ascii?Q?iNR7wf+8/AuU+EEo2iNHWKClpopsigDtCUXdWz6DtDIIeQ/JCkSJ+sAqkVw9?=
 =?us-ascii?Q?nUmlEVg343RLPwARiYzd+If2xyGosXQt5W79Ux+M4X29ImWeGXh4vncLdygj?=
 =?us-ascii?Q?ldQ7FSGl/Md1CB4+PJiDxUnRpSCtl5a8yjMgzOxU4W4YGWUDDo4NtyrKO8YZ?=
 =?us-ascii?Q?MShJJMoHmuqZlNUoLR7LKuCMDia5ePYDmW9KeoP4xxRJCle1WjHD+HI1IeXu?=
 =?us-ascii?Q?+Whezkg7+pVijoT5+ultI3y3+ni9JVIuPJTwZLktpNZPMdXrNWy+x3x6LSgd?=
 =?us-ascii?Q?SWLDGjlauCoL8uJuDCKxo6oLv4TdWiBA2uXpUrCfyFZKbYtRqWZBilv6wqkd?=
 =?us-ascii?Q?AFf6QAnn61YWJhyexizbnexsUShsivHYBLo5h62X2H6txGjGEC+9Ye6AT++e?=
 =?us-ascii?Q?m0qiPQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:37:38.8696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fdc899-2ca3-44c3-1d9d-08de5ac7a1a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4287
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 21:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17037

This fix was only needed for GCC 10 which is no longer used.
Remove old workaround.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-support/netperf/netperf-arago.inc   | 1 -
 .../recipes-support/netperf/netperf_git.bbappend              | 4 ----
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/netperf/netperf-arago=
.inc
 delete mode 100644 meta-arago-distro/recipes-support/netperf/netperf_git.b=
bappend

diff --git a/meta-arago-distro/recipes-support/netperf/netperf-arago.inc b/=
meta-arago-distro/recipes-support/netperf/netperf-arago.inc
deleted file mode 100644
index f63b608f..00000000
--- a/meta-arago-distro/recipes-support/netperf/netperf-arago.inc
+++ /dev/null
@@ -1 +0,0 @@
-CFLAGS +=3D "-fcommon"
diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend=
 b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
deleted file mode 100644
index e31e7081..00000000
--- a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-NETPERF_ARAGO =3D ""
-NETPERF_ARAGO:arago =3D "netperf-arago.inc"
-
-require ${NETPERF_ARAGO}
--=20
2.39.2


