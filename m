Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1543CD13CF
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:00:40 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25255.1762887633927503294
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 11:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=V/WAe20Q;
 spf=pass (domain: list.ti.com, ip: 52.101.62.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW9ht+FmIvuilaPtIUe2KJGp8MbfQQCGeuUvMM13U/LIm0ph9FEH3JoeGodcx3D0toDQwkHsdG42xtGs4M7r94FqKRPTojiUhlJGrVn9BqCYsq131en1iq0qhldlC2tcg692JOJewAbooN6hFVqmWObuMLMJj603i962Te6/gqiLhlSUgtSUmFOqG7ZgAOw/K58PGCOXjDcOYa1Lc2eUzxj89w1gv1ViD0D4zBOo29CopvIpnzmB5DkGwAT1+3cLBD1m8hoASnnU0l0Aug56/3b9w/xKBrVIftWwb2FiyQId8zWSEzj62z93bhDbDMfzXx6gywK0bQCf0DzhGWGn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMIyxYEcoX/7xlYe0U2FOYPMJH+o8rTevTs/3cq0M64=;
 b=V4JgBukzOrwsspE870T69U748IRAUFvmTJx+nr2hGw+WriwIldAZH3LY7trVgnmbZAsgnhrlZzkDJZjMs5tZLQjY8ey0QC6Ezh2pSjUUafeU77uUwcX70FrVWdonUrHFlAVmBoxQMzz/AAOTEqnXHknu0ZQoSbBQNGadgWghQJ5xIiRHbgUUm9rNjhrJjXU+QKOkTF2Qvskfi1yPLOZpGzyHVbthMmrjLQOePnljEJrHxAoEvQ1P0DZmgv16mOv9sShqRur01QfvUjEiFMKc0daia0d+ICEP+K47KUueYjkhiDvBs24kqgW9qMzrSUkgvGLvAisom5kFvTER1JLSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMIyxYEcoX/7xlYe0U2FOYPMJH+o8rTevTs/3cq0M64=;
 b=V/WAe20QvWXEXOhXtNuWJevXNehTHmmLe0jbHw4q9cSVwxdJZtTPe65yjtHvi7956WOtnxP/ibzy0+aiMnAQZlh1PDG6ckUKaqKgC6BYSeShAZG8IzVBRjAY4ERjR1h955Y1BkMYYqAasnasLQsBmigraIVMqfr1LtK5qmRhKGKBVUtN3cOKo3tKoz3aXaSbVINmvhKOpJK+w4nFplaqAs8K1MO9zAYsae4ixvUiSpoPaPwiUBEzAZNIr3YnSaV/DRJ85SA2VDlzP8OpL7wsoPJMVyXxo1iiA1t7zbsh4tvHtnfw7mFGte8nh5veGxnLfZFc5G2Mm9ggLFQt0R2X7A==
Received: from DM6PR02CA0113.namprd02.prod.outlook.com (2603:10b6:5:1b4::15)
 by BL3PR10MB6020.namprd10.prod.outlook.com (2603:10b6:208:3b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 19:00:26 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::9a) by DM6PR02CA0113.outlook.office365.com
 (2603:10b6:5:1b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 19:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 19:00:25 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 13:00:21 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 13:00:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 13:00:21 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABJ0LPe1388517;
	Tue, 11 Nov 2025 13:00:21 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3FF3FD6F28; Tue, 11 Nov 2025 13:00:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] syslog-ng: Remove this recipe
Date: Tue, 11 Nov 2025 13:00:21 -0600
Message-ID: <20251111190021.2117450-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251111185832.2351798-1-afd@ti.com>
References: <20251111185832.2351798-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BL3PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c85708-85f2-4583-ed64-08de215492d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OWPYqTjWSpwndqDg+m6NHLVsxM9D+juoUl7nDTcXFqTSof0/eqPjCV9JKAf5?=
 =?us-ascii?Q?VN7ywNray17YDFwpJyG7gFVxpWP72CNYahDcxrBrT696RBD3fA1FnFsmYB3j?=
 =?us-ascii?Q?mAGQoInVx91f48tFjjhsrbHfu6SLklTvxUL7MgHcsDxByYjtksJsfFAmt/Cl?=
 =?us-ascii?Q?zO+Y7DD0FAakVLQDyq22TDSE1CbRptrldA7kfO/ZTWTwmeGozEj3dnRl4fEa?=
 =?us-ascii?Q?4SNO6nZOBHry27qQ3nEua8UH+uemJJhgQC+ht1vasw5Yx0/6JXmxtZAeYIlU?=
 =?us-ascii?Q?V9dIr7mrPK7SAO7Jloy2e/EhkMOChjmQ+7Bj30xC4JYmM9fp+wTbqv0F4Ml2?=
 =?us-ascii?Q?UvwgxvAYmMyEJ/qjexhl4MLkrQCa63pzUA7nbxDuhCqMom9ziCyUDkocuwfG?=
 =?us-ascii?Q?j5U8ajm27oWcP8DvTzvA7aUNvtExVwxJAA6I6tRUOvDfxfvzo3SR9uUsOfRZ?=
 =?us-ascii?Q?n5yzFwuXgZqvHa5t6aSZ08A3juj8Bekfwalm6RESOeIfUTuHBnbaHCPrszoq?=
 =?us-ascii?Q?Le/dE1+vVIOqHV7/4BK0ayt6VkREUuVmvLFgjd1rgTM46KYIL5+mGz5JKGfk?=
 =?us-ascii?Q?xMAO6U/QvCAy4u97PQEvt8R/cFF9OrzvLLtbe60QgQCYuHBSNMdI63hetA8s?=
 =?us-ascii?Q?LS/uBA+6cf3QE3Wit3w3/P7bXhZECRExKQuH1hxtA7GsWjfXVdATekYhVImp?=
 =?us-ascii?Q?UkHe90xm/RxEV90ehgqhfusqpsX96WY6KWt5vFBR2+2HysYb9H5v4lu6qTvo?=
 =?us-ascii?Q?UahvVUhZeWeR0Y4SxzDKkGJ4+N79OUUs6YXhOAFJ481V6BvSVdf3JN4cCov7?=
 =?us-ascii?Q?Fwt3wo91h0hKON2SB7cpoQDiHKB2AxKncISuLQATStVH7auIvXvxVgP3RWpp?=
 =?us-ascii?Q?cY0LSbBB2c6hm5N9fwdua2Bv2FXcPwjHFfE4iEK4K8FsKZnuYY7sBTkJQ+JO?=
 =?us-ascii?Q?vScHTyv2PbaRWY45L0xcCI1WnKimysbvn4oxTu7kWfHvopAvX+rm6C/gCLPu?=
 =?us-ascii?Q?xInJBLKHLfk8IOEYVlehIJYNqMJgJUj8l2pPPBVpiCI61vZAViu510rwLIDd?=
 =?us-ascii?Q?A6d92M8KOpiyR4Any9Ib3f85FgCUXSboBPBlcdkex7rwP45e6KDvJPWrOFT3?=
 =?us-ascii?Q?pyUfxpf6ev0M3hyUnUsZZOV+r1oa1K9eXTBSPoAOuHLP+fV11ku2UY0lWpI7?=
 =?us-ascii?Q?qSZcvT+EUlOyKguMEPyiVlFUjb5UuOZBVJL7jCKk6AkiFrOjnFEUdCZW5T9l?=
 =?us-ascii?Q?v+YgN72MzJj5qId1UmCEf7v/emc/89Vh0cuURSbD7akWz3ERPxS/tfFXRFlB?=
 =?us-ascii?Q?5l39w2F83rE/KObPqb+/CHcivTCFBntPsdpCRnxS7BH80sX/29M3lW3RO3RE?=
 =?us-ascii?Q?CRIJ4RDlXxEM4G+ry5PEhuVWKJaIjSK7oAgZTYCEQo1/SSuRN3bJm4SyHsKn?=
 =?us-ascii?Q?/+Nk40oQIxeH4mbRhAkzhGWdsrctSJ2v4E5Mv0mu5/K7O7f++TIP0NkhV5rf?=
 =?us-ascii?Q?YKtgdVik7PoG1yRGXjjPqBXmUmh8rgxl2P4O9BGY7TxpO7OYeypUHKOJ+v4A?=
 =?us-ascii?Q?KUeZ7qf10f0NtqOA7nw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 19:00:25.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c85708-85f2-4583-ed64-08de215492d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6020
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 19:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16746

meta-arago / na / 20251111185832.2351798-1-afd

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
- Patch Series: [meta-arago][master][PATCH] syslog-ng: Remove this recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 11 Nov 2025 12:58:32 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a84178883269da69d0f65a7cc6b4cfac3=
22fd034

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511110100
- Commit SHA: 260cfe5d29feca96d784fc914a546677242fe2dd

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




