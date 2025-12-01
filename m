Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B586D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:45:46 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.211.1764614742448028691
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 10:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Q8FB8NWy;
 spf=pass (domain: list.ti.com, ip: 40.107.201.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuVJCSLVQmWftgTPZ36toWVX26NuUdki+ZvuU6rHr5BdpO7IXL9CfM/8DCJdtrK2eU2hKbfsspLUbn0N/oeUxSmX5PnEZZw+g2CjmckvkMAqR7JNbVh5jbG0ArGGzAEVUbyY+qOZHlm5Qdzt5Ae9ZOdmxUKkee5npYIsrSkZp58/1qbKb1zWRfaPNvWQk8UCw5MJBvbdPNFFCcgi6K0iXIAGMlwB/wWZpSKsy6mfG8WZe/VhDbETpokE0U0EtDcV8r1V5HPZoLpsVNShkft9i2PniJQ3A9KHj38D0HmScq2ldR3fbNfiutX1hrYgf20L3I/Y0wCa40NZkpVCH4KKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdo2KpgeWEUeUywDAefhl9o+UvFiHKSyeBp0SL0Q1e8=;
 b=G4llhHUQGJmDQgSreL0iKsHSbgDt/j3A/nav1KVY7xZ9sYLDLzH+PVe8fVypXvqsTUmFojAgXQOOXXAq4QN9AnTS2bGcbyuIvkFm+OpTs4eerRcdxSwYlJB9ebqunrCJ2eLf7hSVUH3BrMbDh8HnfQBL+ZTwJearldsiMFbnBzTye+pLnLK2I971GEusx+RkofsAd24zDfCm7czrUIlDQhc9f/aF+MIIQ0qdxQxkZw0i9XX6EAonqwnst4z3KtIsHsGNfAVJRU6/z2iPkW7mPRA4my4Osdyg89lBEpwazaOtMM8qRz7DPYt3no1CjhiEwBP60eCu1UgBQTcC09ay9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdo2KpgeWEUeUywDAefhl9o+UvFiHKSyeBp0SL0Q1e8=;
 b=Q8FB8NWywcqJtWF0KJl9wcVKEkeqRptLBo36847+K1iiJymk6PUKIM8fyGz8eRKzQ2FwCCeKq/18jlatQhX5Ij27w9xjNOckrghhaBlb0lV1diW1HISwAoWVPSTCRcZpC14YFiROhIV/j8Ms1i2+ykPG+DjScCxMpnfK7me6fqmUcKfyM7tdlASEJrNOKXzk+TLG1aPQRnRnzl3MrCcqWTxYPaN4R10zus41Bit91eJg0vbTkb9Km+2kmmpiFRE1+/r1VfJ0W55yAczJ3iFJ8gQSQuVJII1w9yvUH5vYeNeJHe43rgbZpC9lBTlB2Ohg00/27nOcaO/Xg+xu4zStdA==
Received: from SN6PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:805:106::12) by IA1PR10MB6097.namprd10.prod.outlook.com
 (2603:10b6:208:3ae::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:45:39 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::a5) by SN6PR2101CA0002.outlook.office365.com
 (2603:10b6:805:106::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 18:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 18:45:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:45:34 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 12:45:34 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 12:45:34 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1IjY2B1224830;
	Mon, 1 Dec 2025 12:45:34 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 7F386183E72; Mon,  1 Dec 2025 12:45:34 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] coremark: Clean up buildpaths QA error
Date: Mon, 1 Dec 2025 12:45:34 -0600
Message-ID: <20251201184534.754943-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251201184100.1372032-1-reatmon@ti.com>
References: <20251201184100.1372032-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c95b9c-e90a-42ad-00ea-08de3109d21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?61hetIKN05jXpnofn0aTIWcEP23ioXqFcP5G7fM7X3gM+YxbAgmSK3WiJc10?=
 =?us-ascii?Q?fsTAFWuKJjsb6LjQeDAs1bA+gaeymNa5Eb6vFnlYXp2TFQ/UnnOinFXUbVoU?=
 =?us-ascii?Q?kpaBsGF1CrxBulcXLUNmEskZwr2Mrgklk0DBsI9Esn8AJThhqBcTozO0ZSGo?=
 =?us-ascii?Q?nbJGV7xyVOnZpCtIvxqsVK5TG+TOT3DsY+oUk/OMdIlrJ58rTnocPYdyX3xT?=
 =?us-ascii?Q?50Lhrjb9csAFuwpSF+z7v+3o1fRjOrX+tzpE+MbsHvWAIbkkWNsG940hJXQg?=
 =?us-ascii?Q?1mOVuf6nh3RqX3kP2bZj7CQTyLi2VFNab2EwmKMSh01xEc+NXrSWtza+zfqO?=
 =?us-ascii?Q?PGdc1annPYRRTEWmpadRpf48YdXl4a+98AWqevuBBeCsNysjS0tIWVIv2eiD?=
 =?us-ascii?Q?ulvSu0IY6YXDgw7QvnddNIDV5oTxBckfjeNwOCPigtdWTzAy+IZHMa/9NCYd?=
 =?us-ascii?Q?3oZnJnaFHWSPqDyqB4GRdMdSzGYLnTUFpSRzzfFsfakT3wgtVHU1hPp6SHsv?=
 =?us-ascii?Q?Ht2jGwpqcTaedGwvq3wZpOoeJLBs8XNkeH0RyXyaqSZR39EHBhi5NrOExM5r?=
 =?us-ascii?Q?nAIv627e95ucl+kUi91qC0BCOJmgfciOd9v3iuxp56H3Lg7KSSe5JpzAjaIJ?=
 =?us-ascii?Q?WnHI1Q4CPN97nhw/mPYuvDJCuuqLK9oxoZ2qjUpzPS4kq1wUfNXvEKKoZnKd?=
 =?us-ascii?Q?HDxTlD5Z4/XWaPLTivRujJDU51tfQThFimwbPtAeWNNJJkcgxt+0b+yxL9ZQ?=
 =?us-ascii?Q?TlNf6V8lC6zHnWqN+dhP8c3Rcnnvg/GRiR5oACRFCZ06dmDgckqRji2ckaUL?=
 =?us-ascii?Q?owKNvZALgq2x+yS2zv2mxv6S4up5eKVX2K66MwlvQlW0wX3mRxT3Qm6NvyUu?=
 =?us-ascii?Q?XE1p4ocpBiVIUSDgdarKW2bFzipfIcJBJbJH2Da+jJ5bBsOWWY75V88F/ENh?=
 =?us-ascii?Q?uZqh5unwd7EEbssHqtoi+T0mLjh0eWm6tYXrS3xW1V6iQtBSsjd+Z9MLHPTq?=
 =?us-ascii?Q?6igskeCQ2HWWWi5LneXWgrWuDySNSfXecopGU8H+rgRk8t+KIgROkZr479WS?=
 =?us-ascii?Q?W1MCAA3asvMcJfKk2Hx5m1+k/23o1FScP/4odIKhJD2wWQKCHaKzLi4o36TM?=
 =?us-ascii?Q?8tQPXh7iS+9DAs6mgvRg59kq275aGFl8awMqFGjB3UsWoYgkBgoLivahDgov?=
 =?us-ascii?Q?jOHIej6Y9UHZBUxsphsdTe1zcTu9f3DAIfscn9L0jBA3OXkCq/0lWt9J+yQ5?=
 =?us-ascii?Q?9v+yfYrKhYnkqgLj8dlDiF9BymPbebF73KCZyDj8l91MPwL690JscbzJCn0n?=
 =?us-ascii?Q?xIuS+ec3EDw2rsR0TvqTBInXKSpVAWWGyXAvDhx26spvCNqQhzWyhyMezeXZ?=
 =?us-ascii?Q?0J0l7+zaRLauZf2wL10IqndkC16teGuTfjvIR3weaMrH1gtFTAsepy/ErIaf?=
 =?us-ascii?Q?JkboVfhSl2NnlvFoNXmkrxaASt9X9HsAy6zFZzRMpdg7UQ3SI1qy1kPKuDGP?=
 =?us-ascii?Q?dTRzWmky7aL1sbU6+yp9e1cgB2vK7dDzNDg6CcNBd0RnHw0uK/hlWj8nCoSC?=
 =?us-ascii?Q?WHc+e5LnFsRJq1VDd2Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:45:38.2218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c95b9c-e90a-42ad-00ea-08de3109d21c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Dec 2025 18:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16844

meta-arago / na / 20251201184100.1372032-1-reatmon

PRC Results: FAIL

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] coremark: Clean up buildpaths Q=
A error
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 1 Dec 2025 12:41:00 -0600
+Date: Mon, 1 Dec 2025 12:21:23 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 170e989365362f8ba8a6ac2bd3f0ac92d=
01f8759

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511180100
- Commit SHA: 82a437373896b01cd89d456dcc9cb28521b64ac7

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] coremark: Clean up buildpaths QA error
    .git/rebase-apply/patch:51: trailing whitespace.
    --=20
    .git/rebase-apply/patch:53: new blank line at EOF.
    +
    error: meta-arago-test/recipes-benchmark/coremark/coremark_git.bb: does=
 not exist in index
    Applying: coremark: Clean up buildpaths QA error
    Patch failed at 0001 coremark: Clean up buildpaths QA error




