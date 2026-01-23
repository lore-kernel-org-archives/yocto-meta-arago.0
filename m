Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E30D778B6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 21:37:40 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6648.1769204259174312285
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 13:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=htnK4bGA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.23, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hf/SPAEwDVXie2jRzvPwHuiTmrAv4t/czNq0a7HNv/t1laWquSKY6UXhtMzkMKP69ImjJx74XBB/KGmO6obH19rQYc+WN+hip4ZAq9QVJho8zENiJFMiqOrpLOMI0DAuEpkOdMcf2RbbuWHG1lC2738Wix0wrWxhWVUEG6b/6maGPfaETHhVqJ9OVzLGPxBEHdkowSG2wT9EOWGlWkGPcUQhSxr0vCjsNIuzWM1TjsU8t/BPZ8wztxKq8Xoi5nBBS4MHxPr0UD7csJ5HXYLHTPEdvdhxV4w7IKAsmwooJrS4TGYQYgqFgcI7xfcdO5HcJMXUS0sFOEt6DR2+0haPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSPcMnNDvEkUFkqTr/QE3aRvJrRw4t4i7YX1U+fwCCQ=;
 b=xBnWxo6yVmuw0DnbMSf2F/hYIvxMr+sBvjWAluXZRTWjsxwewm7cf3qqUIlmLgCtD8GDZbL2LkFNjoCFC2opdLSoHncsNnuLrGBjtwcPIUyb9jXTPjhYo0yCa1jW/FvR/Xyo0sClmqhIPjCwhnTOHAxLGqcNPUiP6zyW/xkWBCUT1COi4YOMNW+DFKDLMrnVfBdhXJA4ZX4TvcJH56fvHB3CSA7IJcjsbHxbPdFxd1LscK0jHTdMTSfhJxfKP/Npl/f58zTiWjg4Z9C4iQGykU9TMqSGucmTnJp2BQ+Xm3IUaOP6XTGfRjuBqDMs7/9HCSeLc2yTmiaN40KUfEvxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSPcMnNDvEkUFkqTr/QE3aRvJrRw4t4i7YX1U+fwCCQ=;
 b=htnK4bGAGzzS6dUn35XLQZR7kuAt1R7bTnSroR0qzcNpeW77ZD9DNmJxe5DXcU7yIw0Na5oTTdpYJOQ+PN3qYtZiV2ZehobWUCd8qrb7HjTbx3vtofZ2PGHcHjCxwC4updLCjfup+HsvGJUwl9vOoBSpXBL1H3kpOaKi9UUOju4=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by DM3PPF00080FB4B.namprd10.prod.outlook.com (2603:10b6:f:fc00::c04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 21:37:36 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f6) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 21:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 21:37:35 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 15:37:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 15:37:34 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NLbX6W2974534;
	Fri, 23 Jan 2026 15:37:34 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/3] alsa-state: Remove unneeded empty asound.conf
Date: Fri, 23 Jan 2026 15:37:30 -0600
Message-ID: <20260123213731.827613-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260123213731.827613-1-afd@ti.com>
References: <20260123213731.827613-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|DM3PPF00080FB4B:EE_
X-MS-Office365-Filtering-Correlation-Id: ec55056d-ec6b-4234-c824-08de5ac79f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fH2DsmxTVYvE58CzuAUvIWG7inOroYuV7upmp/kj73lJKwfv70+oLEdCdrSx?=
 =?us-ascii?Q?4DqKrUQODxdFVDXuFhOpAd4/UQieChYgwWIk6g9dcIYe7KipxzjyicQ0iJq+?=
 =?us-ascii?Q?AfMkJfVA4uXBcTFBbK96E9sFgQWdYcKreVqLU0TdO7RMgK1gH+8yU1zD1+v7?=
 =?us-ascii?Q?FVBS1fC+4zkPU2Z4TmiD/PuU86tMMgfwNJHoMa7WQBfYsqlnPJ7pDO8f+J5d?=
 =?us-ascii?Q?p79ZxFpCkOBt6Ds8Gle8VuirqdDYAcALSvqLNCQQBDTfXasJJjQH1e91CRT2?=
 =?us-ascii?Q?52/YLwkKby+Ui0TFsfU2QA3VLJW0n61bbsglkXiyanxr17MwZXh0AXTif+Kf?=
 =?us-ascii?Q?EVGxbZwpujwUlAY9BOCO7WyFSAlM7KxySHDOxlh3phspIU10ULzpgcr6ZJpY?=
 =?us-ascii?Q?nNk9eauzaFU3cVPvxPU6Dtf+BEDx1bgI64ubMGgQIqsC8VrQoBPTL9iD2Br2?=
 =?us-ascii?Q?M3N/7PC41u6gymRnpt5xNgjgqNZyLck4qeaFUQmERKn7w451/2RjCkvIssVB?=
 =?us-ascii?Q?LaFYiYzNeT/Gxz+EcvcuQML5Pyw2Pvf6aN8DTCM9CmDljenF1KxQAM54gG5z?=
 =?us-ascii?Q?bMk1D1WKl75VgnLDuW7GcxxgxNsM55aGKL4E4yZvF+V/0MdUVobOliCtWmMh?=
 =?us-ascii?Q?t/hPlK2FifxkTGNd8czgzHgJdvteyPu1nEfM8B00kL/CKHaAfvjR8994DlN/?=
 =?us-ascii?Q?87/m6o1CVT6+zPYi5KuS6n1CQ1rAvpoQebH+xgWQvLruxG3b1P5/QpcC57jt?=
 =?us-ascii?Q?21+k1w0LlCQOHusYM+ZAitKFmwRJaTJKdBcjF8cX00/e2VF/0oYsTP5wPxO5?=
 =?us-ascii?Q?LujEDolIbg2keU/VVuia8YC9gAGCRN8m79KQTjcUrn6eF4iuB/wRln0l/J6T?=
 =?us-ascii?Q?brfyQMOLNuDocxb2fcei2aKhnZ60vIU7P2E420UkZ0wVV19Z8wsAzWMrAWzQ?=
 =?us-ascii?Q?ACfBB/SqfjyD5c1KirbfPiGenKE1BQEyF5NrEROcW2TqleJAqRU5hsIdit+8?=
 =?us-ascii?Q?9UFc7OLrC1HE01IUNOc7sw6KKKmPV09OIm3WW553JSznKiadFVwtOxePnTxe?=
 =?us-ascii?Q?rINzciAa4o036Qkj9QnqwWg85kV8P36G310qPDeDTKQ7t1Gregy+ivSPCG5C?=
 =?us-ascii?Q?8ZE1XGVuY+9Ntre/cdPGLuW9tqaySQaTOqtpz3cwc0/ZPjmTD9Xn9OPiDUPV?=
 =?us-ascii?Q?nrL51BjmYDZFKw0xAUuLoK7DlH+MdN+acrRFxiSD/bcxPu+K9YFHOPTnZNBX?=
 =?us-ascii?Q?wJ+6NOIJ7KsTQQVEM61XZu4arb1Fjig7Yj2YkhVjCplv/FsnagwfbDHlvv3M?=
 =?us-ascii?Q?LMViEIw5p4hDTcwseP7wNvQGrC86eqQgvb0IZ3ucYb2J+hfN173euCLbY1hy?=
 =?us-ascii?Q?tmYN2dKvsWRkUhyW368kXEm2bosRuiykeMwwJ23IXa9Zu39tox2KypXe09ka?=
 =?us-ascii?Q?0mEkdbVPGrXPcQHrRq6MZsbijWzCJr46wSRT2lBymV3yi5ZFiJFH8pycZTl5?=
 =?us-ascii?Q?UHBFpAJP/73zVDL5uF31Axc/JtmRHEtU6OW/BFitgNbMqWwbs+mFaSc4wO4C?=
 =?us-ascii?Q?m4V1VcNNZR7ZuhHGLH0v1qHcJTXL61W0lyp3EDWJXpAljRUwDmMeEDvEI88D?=
 =?us-ascii?Q?r1xe8cW61qR4GuWX31bEef6dA/Ex1kAvicf/8IVJgEaIgpr1dDcjEojm6cPr?=
 =?us-ascii?Q?5AbZwA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:37:35.0194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec55056d-ec6b-4234-c824-08de5ac79f56
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF00080FB4B
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 21:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17035

The default asound.conf in oe-core is now also empty, remove this
now unneeded bbappend.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc | 4 ----
 meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend  | 4 ----
 .../recipes-bsp/alsa-state/alsa-state/asound.conf             | 1 -
 3 files changed, 9 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state-ara=
go.inc
 delete mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bba=
ppend
 delete mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state/aso=
und.conf

diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc =
b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc
deleted file mode 100644
index 80dfa776..00000000
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state-arago.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-PR:append =3D ".arago0"
-
-# look for files in this layer first
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/alsa-state:"
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b=
/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
deleted file mode 100644
index 1a4fc80b..00000000
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-ALSA_STATE_ARAGO =3D ""
-ALSA_STATE_ARAGO:arago =3D "alsa-state-arago.inc"
-
-require ${ALSA_STATE_ARAGO}
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.con=
f b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
deleted file mode 100644
index 34a5cb89..00000000
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
+++ /dev/null
@@ -1 +0,0 @@
-# default Arago configuration
--=20
2.39.2


