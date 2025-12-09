Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A28D3B994
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:58:14 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16933.1765310284554041759
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 11:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vATwyCeM;
 spf=pass (domain: list.ti.com, ip: 40.93.198.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGxOvcaXlrLg4xxDTTQMvUoRj8y7CcrGhjiJS4KJArRV3jCxhNJy+qOTrJEfJF7lJ88DMkth3HgtpBxjL6J4C5g0eLHYpQoBuDd2u+iekx+x5J/AiJtChZXuVyMyfTWi5lKLkZ/9MfulugqRoEsZq16/EfvI2D71mo2vO/hPOxBogQKRa7uHaAsn5F7D3vJk10y8UqtdrAB0tPCvYvDGBpjlGLfZiRcwmRNysoYkJL0IpTPbs1UdmGv1dgDAD8TJQIM4IWXmTr8czQ2QnNy4bqq+UDaOtn/3rfU+V5lX7+nSANKMNsm8oKUuOexppE6O9WlkyxUbwLYwvPCM1y0oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUuZr42sgF7A+D+Lb3gTAgnNwlf+xyyf9f8KbxHOFsE=;
 b=TkCj7ecsIsjQd53QpokHQxrwjgXAw8Cz8L+JIANceE9SYabQPTK0PsnOuGTKVoIqhrnP/4Vrp+ytb2vI61ZemEVa+htNNzZV92ADXIjgLfnHzFV48qGE8wi1SUTtINa8SubgKDkrW+mW4TL4NzVE8OTlGZ+Ltamykii3PBBr9oipLKOJbKv4+qJHgNxvnhg379CTKnaMbizH31mGL6GRSjq6iGutFjJJZuFN6WbC8ja1bSX4JZ+8i1kjAqQcGmtpSsnjeuJcvRbk8D1O8kS2vKKFZ7YUlG19vGOswe76e6yDlDGGHk6k/ptqQrlZfTpUuYEBjvGNV9U1msyUQE/SXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUuZr42sgF7A+D+Lb3gTAgnNwlf+xyyf9f8KbxHOFsE=;
 b=vATwyCeMb9ZokN9gak/Hfi7ShykKMBF6is1h0h4BNFEoTomgpifKz3LKnqDTB8wmh/J3MbHDEWcTQVkFqo9wERpEJ8vhq+tH9oXdmrmNGdE9N8GmEUIXuc+W1D5qKY1dyA0RB5nXgPq3Xo2uXeBxxMTNmUWcgrPNbqsKzDkU3c2Ulj5B9e3NR1+7kME+A2EldyENsrAPYoy077ZmNhPA+J05dHg8FT8TRTlkUgRrl35G0tbwKfDktUeWQI+onJ+JpkHgja+1szTV306Mant4GE0bXWUImkaCgCu5w+yvSE610lzvhpxukgudxbSDavSrl6H6Gynu46WPY467vNCqKg==
Received: from CH2PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:52::29)
 by DS0PR10MB8127.namprd10.prod.outlook.com (2603:10b6:8:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 19:58:02 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::ab) by CH2PR04CA0019.outlook.office365.com
 (2603:10b6:610:52::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 19:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 19:58:02 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 13:57:57 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 13:57:57 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 13:57:57 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9Jvvc2781706;
	Tue, 9 Dec 2025 13:57:57 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 42E359ACF4; Tue,  9 Dec 2025 13:57:57 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] cryptodev-module: Add patch to fix 6.18 build issue
Date: Tue, 9 Dec 2025 13:57:57 -0600
Message-ID: <20251209195757.1342741-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251209193648.3581363-1-reatmon@ti.com>
References: <20251209193648.3581363-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS0PR10MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d8f754-b1a3-44ed-e853-08de375d4299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T6GSH/FGZfSnffKEoCUq3LxZW/glgHneJfoNJLtoA4/dB288RtLDAfD81Zpu?=
 =?us-ascii?Q?e6h+3JKipV1xkCuVhv6ZFMCAfqkbIxcktPUUKVs/gsiQdsG8Als1E9Gulzcu?=
 =?us-ascii?Q?FKxrKBv5QobkAElELFZW/CCUej3EYn90kkVEwW/umpzGDmb4+ysXSZgaJ1Vy?=
 =?us-ascii?Q?CqiM/MxBcAzdOdbLZNNNArotm0GcacR5pioQUClGngfA1hE0B9v9LL233TdB?=
 =?us-ascii?Q?o4QWSmDyTCLm49ipcprav73XM0n+be50d2R9DFg6Lh1dcLHB4BRcoHO2qMgF?=
 =?us-ascii?Q?1ApvGx54+S6flz1tTgRB4tb3S7F13sB1LEtKZjciukEeyUwXzBzoKIdwAGM3?=
 =?us-ascii?Q?IrumXtqtSsVTj9II1xlOu9Am7F3g4UedmqkT7YCIXPztbst/j+jXIM5HLOjA?=
 =?us-ascii?Q?5oanAxJuKbdKb1Kx6ZxRCRRzrp2W7wF3qPVW7Df/ph2QojecpssBx7eY70tx?=
 =?us-ascii?Q?LeOl0MoYeVqGDtXErW8vF+qOgmRZ4BAxMbfhfIc3YRgJ/RNJQEMMX4DrQBUO?=
 =?us-ascii?Q?8avOlx90fPptAHV/V4XtEnnuV1Fxr89ToExvzcpWBP92MRl/CNcD50nO3V2I?=
 =?us-ascii?Q?x+p2RHVLrFfvb6Pg5vunYBRDGXVI+eaZydyljrSfIjVmHKUgSwwzZkSIUd1/?=
 =?us-ascii?Q?8tQROeFC7dSra7UhFa36fkMLd7+RtieZ74mcfoKgYB1zS+DHQJufdoeoWuZI?=
 =?us-ascii?Q?uEUy8gIYekv+04qydEuUoIaipTWzzmAS4+qdMULkJFvRttiu4x5vk8Mw1WFk?=
 =?us-ascii?Q?r13XSKwWc+FXKwAF8c2LBfItHrrh4ZQtDp83F1gYYiHxdseZoN06D1RIo1X3?=
 =?us-ascii?Q?2/UMaDCjQZfrDSHNtW+sFDSlu4lehi3tC7UEEhhJPOpgHckoY83OD8m/nj1q?=
 =?us-ascii?Q?qDsFimxo4BYSdng0jYQggGTnGHBaRCJCUnl4RkU/dXSscpZHNW6oVtTIN6o0?=
 =?us-ascii?Q?yw0MJZjZSqKg3sNwEajbB+cs7+YiZ+WfZfhUM2cmEgrLyteCQuUSI0oSLJtQ?=
 =?us-ascii?Q?6KfraqfcDACQD8xCENKc4ZzzBSEAH7Gww2IcjQTJdWZXO2PJydxBRcfOGbIC?=
 =?us-ascii?Q?A75jYu1UhUvenL09ZS5xuUbQsWTWNZL3keZF4juZqVU1UnUCYhRFtHi7qg8/?=
 =?us-ascii?Q?Y2z5XCvM2V03OxFQsf1INoL0KnCVo7abexa/QidppZVBhy5KsEI2cK8nDS/c?=
 =?us-ascii?Q?yw+R6Crg5IfgEA9Al+ZEOeoREsiW+YOCIsjMQ83j/+ZRvwUTpu/cQYG/Vrfm?=
 =?us-ascii?Q?9esg/T//4FyCvpgSv0Go4NVB7yuty/tlwg4FuKca9MrgwmMS93de7s0cRqWw?=
 =?us-ascii?Q?uqXURgdvElywsrGZpqrssW8OxWxS6QXQy7S4K8mLvRep4Tn3AIzMhju8/4g4?=
 =?us-ascii?Q?QHpJ/KXNVWaEMEikiT0vzK0eNEOMNrIyJzPpuv6VvgvlhigpBNsT/jWle23e?=
 =?us-ascii?Q?f+3+wrBHwjwFBv9OP/cHSAmEDEzn1OgfI3lwzIbWCCw/P38KEJm8AU424qLy?=
 =?us-ascii?Q?Iiw9XW2ozvtRLxkauox/qMsc5ynA2Svl8V9jcPQGL6K49Wxpocro9WVqurMe?=
 =?us-ascii?Q?IoXPqNwS90t2ew612jQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:58:02.1546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d8f754-b1a3-44ed-e853-08de375d4299
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8127
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 19:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16884

meta-arago / na / 20251209193648.3581363-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] cryptodev-module: Add patch to =
fix 6.18 build issue
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: =3D3D?UTF-8?q?Joan=3D3D20Bruguera=3D3D20Mic=3D3DC3=3D3DB3?=3D3D <joa=
nbrugueram@g=3D
- Date: Date: Tue, 9 Dec 2025 13:36:43 -0600
+Date: Sat, 6 Sep 2025 20:36:38 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9b9f8e633f8ad8bf94ebb121e692fae7f=
2f216be

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512090100
- Commit SHA: 984999baf5085a912dff08708e2417baab5d15ad

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




