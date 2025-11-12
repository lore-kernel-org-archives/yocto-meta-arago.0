Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CA0CD4F23
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:05:53 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11333.1762988750599631330
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=a4n8i+qZ;
 spf=pass (domain: list.ti.com, ip: 52.101.61.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWImdSEfMbwNDF2vI7srIiRcpK4wHWp2ioCx8bAZh1d3G7riqdhrrAqaIbQm/Ej6sG1fuNvyE707Vf1ThxGC9ctMeAzST1dQlfFHYFzP/u0NCz+HOAxYXS2IfHd55bJSoOgIqgkRhNoBcSWzZayCNLmkVYHnF2yknicuKXBSsW6Sbq0e9R/3ywsZufaq8ZRa0Oa9gXeF9ZY0bRwBBqJFCtot3psrgdkS//ok6OaQ5/asbbfvc1CnDMG07tKXDHQAuVUcN0uLpLN917ce0EI7RUu46+GXHuQCTrp2WX6yo8SyXtnKCGsbJg2cCfZ5RzpKwacnFpfpNDinlNgwJxQu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmcWf2h9WVUQi6CAZvlLX950TxpCX74H4ziTbLfgU4o=;
 b=AqWGzCgX9lb3knKwuJLfEqqswaT0j7nkcYrr+FL1YQ/BGLM0i6o4ELpkGoby9NRfCmAEXsTq/fZ98Ipmf38MkWgLYHf4mlP7kmPMyE8T/NYjcKSz/dHXPdvIyVbZp9Ck289L8+MuPoAX3Ecs3fJnr//n6zUg2iAUZw/PTzdWVcgFbq8lXC3oR4nocynpJJLX5T4Xp6EngaeKQshiKwnycL0m6l3NIfM5ELu7dKkHCtVDUJkSstKbCwQ7j1ooxqQty0ueS8LKWqCQqrTsbKgB1Ce+V9dUvjwjYJPXyb+Nb7GQsvLijFuWkIIQBIWkk0EaRg1CHBNWBhGrgFCmJ8Ak8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmcWf2h9WVUQi6CAZvlLX950TxpCX74H4ziTbLfgU4o=;
 b=a4n8i+qZE7c4qdrnFDDlzpdO2EJQ9SfTQlwgmAcmY6rgemmse9KPg5IMtQeNEzXGgHTvYMf6aqJWKyy8np2dUe5GTu0RUfxx3XqFuDlxu3uJbySZzbCaT/RLZijH5NlxfwPh1w6bOMPgLxAi4SEvZtrRav4vAHXAj5AffSuibXOD/Q1jt76guD1IAcO9UMiWbOc9QaspJFAQ8xoCdvY3ceGzuA9m6xl5H5ox5n15NPeqAydn4AVMY/SJKWF+WF7uKJGXDtplXbr3/1ZpBEa9eIfRCyawgiq/G7ZwTK2m4Jd91ncnvLRiCaeqjGfO9WjUZJYjS01/I8kASxtxQaF0Rg==
Received: from SA9PR03CA0014.namprd03.prod.outlook.com (2603:10b6:806:20::19)
 by CY8PR10MB6658.namprd10.prod.outlook.com (2603:10b6:930:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 23:05:47 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::a9) by SA9PR03CA0014.outlook.office365.com
 (2603:10b6:806:20::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 23:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:05:46 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:05:43 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:05:42 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:05:42 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACN5gbj3294710;
	Wed, 12 Nov 2025 17:05:42 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CFEBC9ACF4; Wed, 12 Nov 2025 17:05:42 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <j-choudhary@ti.com>,
	<tomi.valkeinen@ideasonboard.com>, <h-shenoy@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] libdrm: remove any rogue specific overrides
Date: Wed, 12 Nov 2025 17:05:42 -0600
Message-ID: <20251112230542.1384856-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112230243.190593-2-rs@ti.com>
References: <20251112230243.190593-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|CY8PR10MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b32aca-6ea4-426b-3474-08de224003bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?66pf5OuLib6+dI8rJ5PwFnmpI8/vXit2YCFwHY/Pfg81X7K7j0Jr5ih1Ikxk?=
 =?us-ascii?Q?8wkH53Hd1PvJD3AaINr3YgVKwbvhGzuJzb6gJL/qjy6D0FbcpfcI5Zn/xj6W?=
 =?us-ascii?Q?oRzk+TQt4Plrm1R4iuUVyMIy3s1anBiqixgGiUMyuke3T2GlbVBLv922390r?=
 =?us-ascii?Q?tQE5W3UAD7rE1JRtaQz5mw/itBflGmzSfMH5nuikTJme3HdgJ1I+JDUdKJXP?=
 =?us-ascii?Q?ogpR35pNCM3d0J9o2GvFhgwFzYi8JA3IBEApcSAqUkUjN85WlQ5T0e+ilBur?=
 =?us-ascii?Q?GI7cPHfPvhNtkorMpp4uVpNpjFYfB1OLk3ALisMd5L5lvQNwUch4DggzouyK?=
 =?us-ascii?Q?d7vxzgQLokXFytctywLJJAVEQPLHqdP1uszjs/AMgfu/KoidnN95o+TWVZK5?=
 =?us-ascii?Q?9oaaHq/OZ0HGrI3rtTnhUsxSOXuu9aXSgXP4BYxmGEvSDLmmNMC+NnRrshGw?=
 =?us-ascii?Q?POAPRidG2LyDeTxfESC0K/VLhXYR0HuigjfERY2pgqTEvYjHpiN6hEmaFL3s?=
 =?us-ascii?Q?u2/XtSkpe/OUaGnMFe/YESLtGvXznldPiZXwZLo81pm7gBrC10Sz77QKeSdI?=
 =?us-ascii?Q?SCl3I0mUniL6kzfrGilPzT+f7fMDsDApkZitcvhApiSGsbRAkvdWx47DQS0v?=
 =?us-ascii?Q?zZzZYU8LlE00iY3NH4euEB3gSyQlx3CE8VcKL6luNQjpe8CTQAUpfYP2cHFA?=
 =?us-ascii?Q?TN0GuUoYNjM4pYn1cizwWnvsg+wxCEpdpfIjFkhvw5yUVGfq0TVWFQtiuNsN?=
 =?us-ascii?Q?mQz2339GALM9nOmey86amkQFgwPWENqi1P3GuWcQIoQakkoUdMgbgxqzLxCk?=
 =?us-ascii?Q?fvpWF7q8pd9gpdOAFfw3PEPPsrLX4mvlG6rp7JnSqHU9KPEkJv0Qh3pF9f0e?=
 =?us-ascii?Q?lLj/UhtAkhD7V6PS89gnlYF/reNM34VUIiokMaONb8D04k4BzN+QVVLt8X/T?=
 =?us-ascii?Q?UF3lfXKpLIewFPj1LWSq1M7BXKY+mYfp8dX7Iz2vArc9CNB0hXY5PaMUnneA?=
 =?us-ascii?Q?hwwLkj7n50nYyRdLKZjsSrNBxnLfmf+3tc5+Vqsg2uf/vhQrKBjFwon2q4Q1?=
 =?us-ascii?Q?Bln2ef3IclGUvNd0U0y2tOk3XImjplt8TIOWpBLVgLs8LNXKmzXI0mKnzp1I?=
 =?us-ascii?Q?SCBWo3yQGWgCELhiQiutbcPz0wkZ/RDSGtLLCkuMumgx2W+VTDbanEpb2w3s?=
 =?us-ascii?Q?VYu2IDskj+31tCCPDMKNHiZgXbheSExaTbQgdkUusW3IsNcOScmsb6j8hK2L?=
 =?us-ascii?Q?roK5jjEwcDNXCNAmNOYohzp1RztFbYoAbQpoPgoS49IUkRRVh9pgt67Xinhd?=
 =?us-ascii?Q?AfMLy/AszV16iVjzvkKonAz2gW1t5ubGfJ4gYfsC/xo0bWswK/+gIT5AA/KE?=
 =?us-ascii?Q?+krMA8H0wGQq/zEo4EsWU/XUMqSH1qe+bNtnJMee97yjpQn/nVwOGH2OHodw?=
 =?us-ascii?Q?4mgJmOOLpVYPd/7DFmAjnDMx2xZsSisdZEIEVIkHGoUcr1Iv0Md/2tCT1je6?=
 =?us-ascii?Q?AMEqSGz8Za3shMrPdk2skIw4b1QyCav6G2Vsg20kDoYBikyvJSQhGft70dOv?=
 =?us-ascii?Q?n2Wl5kr0pqrtCLcrpMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:05:46.8965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b32aca-6ea4-426b-3474-08de224003bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6658
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16750

meta-arago / na / 20251112230243.190593-2-rs

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
- Patch Series: [meta-arago][scarthgap][PATCH] libdrm: remove any rogue spe=
cific overrides
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
-From: Brendan King <Brendan.King@imgtec.com>
-From: Brendan King <Brendan.King@imgtec.com>
- Date: Date: Wed, 12 Nov 2025 17:02:44 -0600
-Date: Tue, 13 Jun 2017 15:52:44 +0100
-Date: Thu, 24 Aug 2017 13:28:38 +0100
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6917a8bfbc5d94a684c15f1fd9768c2e6=
dc31a7a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: udev-aragoconf: aggregate generic udev rules
- Commit SHA: 39a7faf1cc1f969a1e22215e901f956df40cc8a3

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




