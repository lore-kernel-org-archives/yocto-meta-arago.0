Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238D9CF58E1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:15:41 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16646.1763583335456075909
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fGOyGEz5;
 spf=pass (domain: list.ti.com, ip: 40.93.195.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL5+bZmCtgg7eNb7j3Dwrv3IpMKWUMAJhGzfaooxU7JI/rLDVVY8ETp9hY0GVSQNGj9gEe2ujzSEA3iWPm4aL6l42l/Ba/WdslPOMxHnh7QjCN+F3ilwsEH+RIUzZOqTmrrHe7ZDnwCI1QY2FYGdjc/j9bEbwu7mFxALCa38A6PaDo0jm3oQcNpoOBshtIDPkd11IfdEqsMo9CE7OwbiP5OJXprIys2JtlSWekNZzXvZ4z2du88bMgcdmSn6i2nw5zJHnivzPEdXAZcSqZoDH0qlPE43BhegQdZFWyS1AQZtKakYLYgbLuMAdV9zupx4fTd1Jnl+PSr9LzbhXHnA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7B+P1+R+zIYAcLLdFF4Zqibhz9CiA7tWlLXyK5DL8Q=;
 b=WLL2lG2Zpuw3eFuekUznmXpVt6ayP1z8R6vRoQeb2rOrX4JbJm2zGdZyKn5lUesmMMwsc05f1PLJpyxcAz9jD45+Kgr87KWXRJspHe+zUctSFGX6/V9yTieXnARy3W8Up/p6J4D5Owc2MwWFYX2hNkIvni74QFliTMjv4d+dVUs2+1Rm/SVVhyW8NUYP3tywcgHCeu9u6KOUbjLm01/iyb+VQVZRvU+zksJQhP1Bt06k+ipSdq1Op1StA+MMvEsv6m9VntUsPZvqHF5S0I1nPrF65RF/SV9C7/Y3RPgVwYsq/69fAahx33dOEZLhq5aTwbDTS30vN3hfJj6FQ44BHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7B+P1+R+zIYAcLLdFF4Zqibhz9CiA7tWlLXyK5DL8Q=;
 b=fGOyGEz5xHRICE0hvJLz6MCnDoxjf7m0XK40Ls02fBmtJ8z5az2wmSvjTcu/UOXoiMwKouQ5Rl3MiV2FTvIz6hkOli67y6RxRt7Y0WYrFr7BNLW9LzNAP8qrH10eNwhJJy4CL8/KFPN02M2Hf3fwrMygE2DBzx15umpRgCZgma5gY84pFLCxip9DatmJ40mGa9430sQHgA7lYbHOOgHFY7nyWnRHQVOCPcLMP4c6LFgAz5MQT8sZp9Ynqdpa3gMjuEMBdESbOWv3PmU2hjEv0fdZeIjrpi5SvnLHYhnkLN4u9S7xNzBHu3qUmWYijhN8MD4S+eP2t6jvAhSAPq+bWw==
Received: from DM5PR08CA0057.namprd08.prod.outlook.com (2603:10b6:4:60::46) by
 CYYPR10MB7675.namprd10.prod.outlook.com (2603:10b6:930:b8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 20:15:32 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::aa) by DM5PR08CA0057.outlook.office365.com
 (2603:10b6:4:60::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:15:31 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:15:26 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:15:26 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:15:26 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKFQNc1939350;
	Wed, 19 Nov 2025 14:15:26 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DC3F9ACF4; Wed, 19 Nov 2025 14:15:26 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v6] coremark: add Coremark CPU benchmark
Date: Wed, 19 Nov 2025 14:15:26 -0600
Message-ID: <20251119201526.2445948-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119195720.1274944-1-s-sadik@ti.com>
References: <20251119195720.1274944-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CYYPR10MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f5c900-fd53-4244-e3ed-08de27a86393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z5ThrSJ1j0RquGEepjp6r25cG3cXrtIa/Vmfiwk3dpajU3sbWma7Ta3joN02?=
 =?us-ascii?Q?aoIrodB7omeQ+HUcBCmLfgc/GLrMZUXMXdICAp/vAAIRQ3qEL+jXtC6Ea2OH?=
 =?us-ascii?Q?dKO/NB6fDEtG/BmnzZR9tgrs2aLROYpjWKXrRkH95MMP0U0bPVPo4pqG/k+4?=
 =?us-ascii?Q?i3Z1CowsohZCbUTr36ZCiCGOgXFznFnUpAzc9UjYcNf0M/WXoBnvBQrj5fwF?=
 =?us-ascii?Q?Z5UkbNcO1Nmwq2Rix/A/gdKBbBx48gljaSfOE4acOsALkwyJgOkpljbjGlOz?=
 =?us-ascii?Q?E6NR3xIg+iA1dVs14vYjj3AVwDYMlJBxkZPs2zhWtXWY11YmJqtxWpdI+Sgu?=
 =?us-ascii?Q?APysBL+2nkda3hsfggqFlOy7skmE3YGqq/sRncxxI4sqDbx6NzfTSSV6leLJ?=
 =?us-ascii?Q?K6JOyesdod3iH6yq1hE6AjywuEwFIaz7GGry5exRTkNxJ1xWsxjbSOP9oIqK?=
 =?us-ascii?Q?ZdaJGNx/mMzC5PTJ8qnLyNB2H3oRmcUXEycOsSCu8yhGPgiWhRLzQRGFgGQq?=
 =?us-ascii?Q?gZ+kZ6XN/39wyNB19RK6/HvQNTYT+RoSJbGBoJCIbVnDHSTurUdBzPYmL9mJ?=
 =?us-ascii?Q?+bJ0P953hvq0vJuhNsV+g+j/JQnHdTyFI/qbhfJ+nSzuhc6iNNVmJhwWXjZM?=
 =?us-ascii?Q?bZ3jVZ4L5nP4M0anXSAcdcCKPws9FgPwgqzncdFSlyhJT+r7Gw+oZBoo4Ep7?=
 =?us-ascii?Q?5gXwxUU4E8EckEPkgGUDGD0yuTVvgF68XP38Kwtha7Wcm1qPBGOiAXJbSm7Y?=
 =?us-ascii?Q?O/eW5ljVCD/tLxi3jPCZ8sWtyqb4gqx8K3OPnd4nmNKeQiftlP1lyifjHFiI?=
 =?us-ascii?Q?kLZOf9SjYhcTccsA8P++oEjcE5hTWS3XqsWlPmTD2ccMmw+XIslvY42KIjF/?=
 =?us-ascii?Q?C76wBWdOptDgETqXD/msRQlj8XL1mcaT5qx6QGy46vHd1yu/bL5AH22LUlen?=
 =?us-ascii?Q?yk8Z9xBM82P6zaVBphuna3jRBoR1e98QBVgGI3r+y/5iwHNMoMA0g3Zae5/1?=
 =?us-ascii?Q?AIOwSN8LMc/1FdyY7K28j4ncfegJFgSjURr0wu+eWlbuSSXLL/YBB2RA1vdM?=
 =?us-ascii?Q?ERS+hyeUEweH8vmzwfIZH7PKZFgPHxS5rfff/DC55eV0M9NNEE6A4DW4KNnO?=
 =?us-ascii?Q?M+whUvaA9KAR73SfZ24i/8/PPOCq48KL7zdULorW1XZ6N7DX+hf4yt/vZuu4?=
 =?us-ascii?Q?vEW1bIWbVYptuTcSx5o4N5okrp3vqb099kcMqXF/crQMCqtCOo+EjhdMFJ4B?=
 =?us-ascii?Q?9oN52MV9HH3MiT5EW/iPPb6F+wH5TeMVIyvzeRNQqZnYNkeBO1CFOb/dY+w/?=
 =?us-ascii?Q?rvi+kjpEyfMHbID6dbRp/LERofYYvNSYmBahN4GGY1BhBa1jhlSYMT4vtI7B?=
 =?us-ascii?Q?3ly+8krffXDmSTOCUoriuIXZMTaMExWty5Z7sfdnQW8ALQDDpgV+TyeD2UFC?=
 =?us-ascii?Q?h+IeDX1x2poK0Bq4CoHn99WXc14IG8qGHjhi3XB9lUSpSCjQ0pJk4pF7fjIC?=
 =?us-ascii?Q?ddxr7/cPv+cj6KQ00EfnWjJK9Qzh/fRBDoIgRkLwfjOwZBsngvMn8+r3Syqf?=
 =?us-ascii?Q?o1o5nS4k77LTkCuba5k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:15:31.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f5c900-fd53-4244-e3ed-08de27a86393
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7675
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:15:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16801

meta-arago / na / 20251119195720.1274944-1-s-sadik

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v6] coremark: add Coremark CP=
U benchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Thu, 20 Nov 2025 01:27:20 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 94856f9a07ad502a5d0cd5bde56837488=
722c73d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511190400
- Commit SHA: c273081b9e50cd3d742cbaae1e78a8439d6ff710

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




