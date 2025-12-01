Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E84ED116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 19:06:32 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17.1764615981708997094
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 11:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vj8XaOMi;
 spf=pass (domain: list.ti.com, ip: 52.101.193.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpJbA8kAedt5s8FQhLi/gZycfkJiZbohc8hrAyW7NN2PuP4Yah9fMmt1fQ4slp4TpevLAa50teCirmaIcFxYYuzqWkbG+YaYmS5lUYMpEbp0gFSDwGLCq4shyxFywkFdqZ999qDE9n626Tm5k4ezDJdMREUWeQCLUgVnS1rHsqAFZ9fQX8HUmUl5H1jVBiEMG0pUgGXqx4i8x5pWu/UjUAALPsH0LMIWlwyQ56Msa+s0dQyxxFfXcbEiv8Bx9MIq+BvQzlcuZu5gkAt5p/RSfvKXLikdTK0R3BKwkRgb8z0ZNtlmxZeYp6Dqt48nfjOGq55fxdSTj6KoO/1FbF5buA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3Pb9omxvtDLne/Pn3+tf2dKlHs+pzXkI6Jy/qOmVgU=;
 b=iurh6QYDjXHuhsbIf3sd904Sqx3sua7iL+yA/3jmKbcREZApaqI/zGyGcF8c9lnT1HMEaX4XgZ4VCAho1wYHZzf1no0fDchAAo5Rlnu3uMdKaPhYoeLhpI8gmMAX3nM+FvWthNMmzYElH7UKXt7rfg9r4wSYkLWJHb73m8hvQoDpN0N4Rgu0Vk+GmgLXZilaCBuCldz/SAaQ9NtmJ3/HNtCPFQAYVCp0LJmzBVgr+Sm379YYfy3o9FYP4a+L0nMxBulMMdYUOeIpv/N5/PXmQFQ+9VRT6gYWltg+pheR4Nz4rR44mKBHD6l6dlNN3ha2Rcf2uwj0PdqcaHbMSM1sPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3Pb9omxvtDLne/Pn3+tf2dKlHs+pzXkI6Jy/qOmVgU=;
 b=vj8XaOMi5kdJoJCL43v+ZRF6Hy22n3G8yIxp8BcOQiDCRpT7jEyvrFMEvTiBOlCuvlVgzDZt+jUFFtVjFWpa0ZkYW2vfspBC/BFVMb/51tY5VUGLnou3qrEpp5mg2rhYk65hHflk9VJzNpdDpalvwJ1iM8fvr6/9ccEyIdjXLjkJK7CyMe6MhjKWyOtn9+kY8/aZILf2hZnN2Ue3OJkiFJZzdo5jhH1LvXLUdsHClw9GAhDA/U7JRmX5WtUzJCQ8MtpkOBN6lcDBxsT/izCWjnXXkKOLLm9Zw+lTTktm1Uy1ObNyjAuGcCdzX0CV3v6bpMi0AXFaidT6WkI3Gtnf1w==
Received: from PH0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:510:5::22)
 by MW5PR10MB5762.namprd10.prod.outlook.com (2603:10b6:303:19b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:06:18 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::24) by PH0PR07CA0017.outlook.office365.com
 (2603:10b6:510:5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 19:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 19:06:13 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:06:13 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:06:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 13:06:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1J6Cdw1171299;
	Mon, 1 Dec 2025 13:06:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6FA302A55; Mon,  1 Dec 2025 13:06:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] bpftool-native: Adapt bbappend to upstream change
Date: Mon, 1 Dec 2025 13:06:12 -0600
Message-ID: <20251201190612.3283145-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251201184050.1371702-1-reatmon@ti.com>
References: <20251201184050.1371702-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|MW5PR10MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ac0056-92d3-4303-a205-08de310cb2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LY2m1YG8Rl+Aqy6LGk8yLaBEHV8LfpM9oXVITJ0yGdksvFvMznBASUDDTg9l?=
 =?us-ascii?Q?2DvNdwwjj92AGsWpQeGVi9WlQFy6mOBF9ubpLchMOr9uq3yG9miPl6AapCpP?=
 =?us-ascii?Q?E0fUWKVcwTSLH6DuLJ04zLuNSZbkZx5+nK18ctuWhYM8zwOpI2zN7nQ07EIQ?=
 =?us-ascii?Q?VKr7DtmZkfbtUirhVOqRQ+2uXPv7H2HbRM460OpyJWk0AlHucfK4WGlOD15H?=
 =?us-ascii?Q?8YdVqFE116xVWu/nYdURhGf9d2cWDRsa17H3n99uyMjSTqbRCSaEkW6TR0x0?=
 =?us-ascii?Q?68I6ykFlrjxlt/mZ/0bmLI4pozeQBIU1W/rg/I2Cbmw7+xasEJqomX1yez3F?=
 =?us-ascii?Q?qCcaOVCS0/1wfy9PaNoQ98i4yENNeRvOjv/sYMKcFmqS7CFtFO3+qb4Wt3ri?=
 =?us-ascii?Q?aydIam+AINu8gJhKbhJoWamxuTq01+meJKsJTDfXaP3GcyTrfpq+RzxcBs4G?=
 =?us-ascii?Q?jXTsLKjw0tdxx9LQhjaw4/NQhZj1qLq44FQdrlTtbZT/z5nGJptr7DtVJoFg?=
 =?us-ascii?Q?IfyOZybcz2asFakT2pii6Vxb4R/Q6xPRvbpanelbO74SPzGAt7JR/iLs6ASP?=
 =?us-ascii?Q?+lkvpMN1fMn7NoAqUYhJT7l0wdDVgrk33FscymXu5b0o5PGw/5Za4vyR74b+?=
 =?us-ascii?Q?qeAgFA55LucJf/hdFpBPuAf3ikJ/j4O63kLTRRkXtiaT3UbhR3mCcRcDGEKH?=
 =?us-ascii?Q?/cRVWty7JkTVNZHeYeQbgq9hUj0oyRsCdVlT7mofW7GbnLh61k7BafuEONxM?=
 =?us-ascii?Q?CI+RHjdjw7q5ki5rsC/gRrfUv+w3VaSg01MapRIlHA0jt5UvaKT4dglukWHI?=
 =?us-ascii?Q?/grgY7Gtp5/KNO3BVMWU/pESajqO7pUv+vbr+KPM7avw5DmCk+kCIqnocucL?=
 =?us-ascii?Q?nLGH+QVENwwuWM77iZaJqv355455ByQH4it4M7+37YkTu6DWypcUNRvqb46P?=
 =?us-ascii?Q?r6ZMHhwluVWjb7LRZN2qk9kZGDQF6+s43ks1AjkvdYGYxlYigJQDaOk/8mhZ?=
 =?us-ascii?Q?e2S49NynMVNS3SpsQbdEv+oQxh+dMTADha+4bfizqfObql50Ps6sYi+bKIQa?=
 =?us-ascii?Q?1gsaJltlt6RNe1LgX7Yngxa6xflzk3Zih9I2qIIK87/UFCA00fdKRdsTwjt9?=
 =?us-ascii?Q?QiY30fPQsEtkqcfKNU0nDuLvt7ritKSw1ewsFNF2olsHYXT/G5BT2wnzLejI?=
 =?us-ascii?Q?q0rNIBYHe1kdIgA4EwxP6XDxdIRR/2Gn/3/bJBtGC2kSOU8ewmTmlFlX76Jr?=
 =?us-ascii?Q?5IY+RM4JPQtD9xgthnCT3QBBTlH+92ouTi2xd9eznfAxY7zAqlmKQPuiVjkZ?=
 =?us-ascii?Q?ufWdeK/RTaZ8vqId3NKGqg3haEWI93unmE1tD1eyxjppnWeGkcqytnyV2g0q?=
 =?us-ascii?Q?NEIBR+SNhnYHkremVDIbPh0Nd0Su/lbY9yUSyd1oth26T1y0TxEZ/r+qLRWx?=
 =?us-ascii?Q?T3XUGymWkHerTIjTYS5aos09GJscSxjBtDfQR2py1a5K6BDUJzxRMgYKAiqS?=
 =?us-ascii?Q?2nwpv3nzzDxQmPuloubLUL/W8/5fzykF7dve8MIQyXtmS21pHBByuD0rpXUQ?=
 =?us-ascii?Q?UCfgM1kUSqDhMHBmsZY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:06:13.8819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ac0056-92d3-4303-a205-08de310cb2a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5762
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 19:06:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16845

meta-arago / na / 20251201184050.1371702-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] bpftool-native: Adapt bbappend =
to upstream change
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 1 Dec 2025 12:40:49 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 96b94704a25f6577360ac11ce327e3a4c=
fdb2189

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512010100
- Commit SHA: 057c703828c6d677be5d6e820c49d6682e4c2a76

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




