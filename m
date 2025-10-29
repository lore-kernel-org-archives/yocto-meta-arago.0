Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB1FCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:45:41 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.23])
 by mx.groups.io with SMTP id smtpd.web01.14171.1761770739893214217
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 13:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=tcDi6eFg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.23, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg2ivWFknCdP51ROQcC2G/LdZOX6YP0RtfVvjKY6wzg2xhCc7UUkDi4EaA6g9TmJgPH5um63Xeiw4Pxn5gu0dOeFWMtdH1mG/rDRYJPo6W37bKYj36mz/mOlJlRAbEpskXcXZ/EhE/aNARfAnAK4AvDbuqGXHroU8yq5t0t1QiNPQaIKwNzSQ5OhyjqJrkOyDo2bw6+IXcs55UdscCMQBVB0bKwpDVE9+ukpv4k0DGAaUba1O+IsklrLqtEHGkNP0c0w0vK0QCWXtMfnKugUypyMyJ6AQUSv0QnfIbEa5v2RvD+aZTRuDnPlM9wnfCwg4xh8ffvociKg5DEv9Us04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/LA+1v7oqY0hJ5NwFEvuGj9PgH9vb8uGXfMngLOJfg=;
 b=jgI87HuZ2G1rDNK4veF9XQlGU1QwdL1X4Af/mny4ZnFyWvaUNDblxLnrVwwrtq1qgteAiGZmobP4fmwtSPcn+hBRuWw9aNvYNbDLs3jzCP3r7KAtp0KPtZYT6XEcZNCe0r7XaGmJkmxfekxjp3LFbW6GMbvG3BS9bvPOJNQPrVEi4+EnjAKX6LQ7FNtKLWGYClCdQPe3Zdyb5GEMv9sgI2wqhtKFamcsTzEABKJSsqGmszUsnZbyRjAFJ1AC3P9iDx7iC2Q2jHf58Cs55lwnbwUUP8XOKdj/pvvJ32p/DMyJ9AbsDAOhsDTAJpR9QgXqv2ijGCPY+kmyd1sDZ1RaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/LA+1v7oqY0hJ5NwFEvuGj9PgH9vb8uGXfMngLOJfg=;
 b=tcDi6eFgFuVkDSqVwSv2189yCUSRMXpQvl6qn0mnBCtKw13tC/z9qle3C0lXpWBCtl/yquamJd9Du99oG9LlTtmORUeJIPJAOtbsAxJK6d6+FygNzFkUwLF2BXb8SjMGpBExjFGZx1rPr4bSH071KMlmLINwhcXbIDMgQXupBaw=
Received: from MN2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:208:a8::21)
 by MN6PR10MB8096.namprd10.prod.outlook.com (2603:10b6:208:4f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 29 Oct
 2025 20:45:37 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::9d) by MN2PR12CA0008.outlook.office365.com
 (2603:10b6:208:a8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 20:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 20:45:37 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 15:45:36 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 15:45:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 15:45:36 -0500
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TKjagI471762;
	Wed, 29 Oct 2025 15:45:36 -0500
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vED31-0000NC-So; Wed, 29 Oct 2025 15:45:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add missing dependencies
Date: Wed, 29 Oct 2025 15:45:35 -0500
Message-ID: <20251029204535.1395-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|MN6PR10MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 190456d3-38fe-4f15-b23c-08de172c1d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VeIcHUqtmeFRcmDMXaoR8J+dIhWE8ZQpodV5gSi0Hf9Spx8GZDYgjAnbAWP0?=
 =?us-ascii?Q?iXem2kv3Ey5MRGZ1NtK+4MBvv1JK+9aDi5uAuFLJmbYTckjKsxRSasVZYFc/?=
 =?us-ascii?Q?DPyxYJc7gsBzkaNY04YJVZK99QeI7Tf+t0FfKDBtDcvugYYA/d6vO6G7qS66?=
 =?us-ascii?Q?tXb5q932PXVbwMXfEmLFLeRrNTXzWGbBUTHV7ImLBeOj3CSiCdOGA14xYfb3?=
 =?us-ascii?Q?L/pfqd1npq5tav3sY/LnrmpqId/cNmCi3kfYedNWvqsMhUbl67PTO1kXpbVS?=
 =?us-ascii?Q?c7icJNVDECOAtu40xgeShzs9Rcg6Me2Zc+u0pi+uLPC6fgVp0KLpE+Y2OqfM?=
 =?us-ascii?Q?sP4+W0VoN3A1SzN2IQkeff2375hcy6l9AUEW/vRRFm7rDpd5FNMtc7hx4YlV?=
 =?us-ascii?Q?4bBlgYwss3GAeByaQSlOV+mxqmekD/igWH8FQI+It+kcEwQqrr9FgZPUw7HX?=
 =?us-ascii?Q?qlX0D6S4Bg3WuVip73OUnzaL3H9yUuNRHoVHBecQCgGAInlMadfOyHIDDANH?=
 =?us-ascii?Q?4Es0aojcAwWa6eL3eNrk46I7VXzZ69Yi6+Cqw6Byy/JHMtqDG4gCHdODq2q0?=
 =?us-ascii?Q?Q1hS6zH0N5cmVm5Iwc7EUwnBM91F9S3DkSg5xrXNBHCalC/XnpX1GIIhipG6?=
 =?us-ascii?Q?Lwd1JahNy5FUPA7bgKBJr49oRikK/FJOb8vfvSrhekU7QO37UYsBAPbvmiRF?=
 =?us-ascii?Q?3xEBi4IDRXFMvvFyJJGHB01vD5xXtpGr7zPFU754Pnyr3XBq8t2PvXLsqTpw?=
 =?us-ascii?Q?A3rgMlv0y1O/dAf8YfX0xhK3TYitQEci0z/Xj1/nbOdQsATnExsKObgnmoq0?=
 =?us-ascii?Q?Xe3XAZAgkgjYEKnlXzcXmpawp10THQG/HdA5D4obD0cbUmBIcQdC4elATcdM?=
 =?us-ascii?Q?IjpDY6lcZCY/mvdfK1AwRP2j86G6bBDTm6poiFiYfZSpn4/ymrWDHHhTQ/Bo?=
 =?us-ascii?Q?PYeBNPJAUGbSNUrYvT/RzMaBMqpGZ03Rxr+aHsDYWGivpc58jnpWLQRyh8FI?=
 =?us-ascii?Q?Wb+tAWRbgtpqMmy0I+c9gD/ze4ne9owHw4LP8U+dIZjQd4AqrJl9r/iQbHxT?=
 =?us-ascii?Q?/wfPrz6L6ZuCMoINuSv6pOkkzAnB+IBdGA3BvJ3HVg46I7IcrvRaH++5W/bT?=
 =?us-ascii?Q?Zzihsih028SJNxtrNThuOy0TIKuWW4cbhVONqcwFefWWOW1MycqBmQPwZAFu?=
 =?us-ascii?Q?kaNqDAjgX9ghUY5NZjVl5a4OzVOOF4RhWAF+hxq6w2JpK+/yQtJlqmtbxBuG?=
 =?us-ascii?Q?x4WM8umBlV4l7yZC95XNoMkrP/aRqBJgLHFksIOP39YsZy3+eZabC0gVwgwi?=
 =?us-ascii?Q?d/ZuMsadBjTJKgU0m/9vyryU+ghBCFIuCLknk5jBzTPkzkrQX+bC0vgoIjvV?=
 =?us-ascii?Q?msDS+iuI/GrKPHsVszIU/TOGtbOKcGMtPIsLfD+dMdZ3BA/28WLGccGOry9s?=
 =?us-ascii?Q?Y/pxooTCRXA5Pxl6iB409xESirVU+kZYuQS/SRTkzgI994Y2z/sPVVTV7sMu?=
 =?us-ascii?Q?jBwz5O5ZPye8Rb0VpGNyBAVcLMCFmYO88/8IBPoTngEg5E+I+/JkXsEHBw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:45:37.1327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190456d3-38fe-4f15-b23c-08de172c1d61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8096
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Oct 2025 20:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16712

In running yocto-check-layer on meta-arago, it was found that there were
some missing layer dependencies.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index c1c11db9..7053ed77 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -19,6 +19,7 @@ LAYERDEPENDS_meta-arago-extras = " \
     core \
     meta-ti-bsp \
     meta-ti-extras \
+    networking-layer \
     openembedded-layer \
 "
 
-- 
2.17.1


