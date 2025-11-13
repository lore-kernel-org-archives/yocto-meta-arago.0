Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83047CD98FB
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5640.1763074229874382579
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cmmJb2lx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqKW5RkizLhsEBSPeUym9xEtMkZtYRf2fQAhlARdKA9wQsQtsVHGWEo/DmTvR16KICTHN7A1LwnkF4+OBa5GKUi4CnaUiXON0gqUpMOYP9KTofzyXVByXZpyR9x2o+apiLrjJUb5RYSeo8/TNY+DNM1cjd7o/RjxLVySs5ohv5H5LKsyZ3KcO1sxt/SiA6doH2CN66lSBYgm5KVAdgK3wMjb1ULzpN5QJxAetEJwUISPBCw9eQtHCfndxs9L3ZjhfNNgkb0E2Azejx/RTPV83DkoPxTgGI+wsSPEVzCnYY2vQkNqhXx4TPPPAZnqnbD8ws96vACNStA/dU3mMbfvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHQCm4ujzNF0/iZeUYO8rGvkjZ0VG23BipCnj63/p5k=;
 b=JFUj7YtWmIwfYcPme7oBwl2f+lUBaxwc96Es+pTMZkKx9G2HF4p81dhBbgadE50WI9ZU1qUCLqJnLup3XqNys/DqU+wkRazB8AHvjhC3M1b4HN6jHTdZPu4Nuawe8lRIMorlnIvpsWKC0m9UKEEY2beOG0zwXjlZrQ248uawsWYbt7D/BG4odhy2FJo5Bgju/5TYXRwaojDVnr/MWrd/thoX7ObXRzPe5lFhBXaWHNeO7fz6GCPYmS0O43SlBhxc+PSdcFqyhb2JT+mXfqlCHf4s4EAUsv+xO60tz1J2BVDd0GCdTZr9Mf2QixIYkJ5/8Cww4D4VMCuFZq7B8BR58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHQCm4ujzNF0/iZeUYO8rGvkjZ0VG23BipCnj63/p5k=;
 b=cmmJb2lx9d+Klef+B14q3MFOomWMzbC/SMjO/r95ZNvY0UKwzXhU0jyRPMu0rhDDKDdw4XbjEn7at6DdWC6rVlTzS++QRI1CSsIbUvwl9BVJ+Dx9QBkScOCgnUFwpPe0zI6JQsDUS1EqqJAYTqOt1oCgdjMc7Cetx6etXGjILjQ=
Received: from SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12)
 by DM3PPF1BD38130F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 22:50:25 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::5e) by SJ0PR03CA0217.outlook.office365.com
 (2603:10b6:a03:39f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:23 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoILO1018050;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8v-000602-WD; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 05/10] meta-arago-extras: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Thu, 13 Nov 2025 16:50:12 -0600
Message-ID: <20251113225017.22994-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|DM3PPF1BD38130F:EE_
X-MS-Office365-Filtering-Correlation-Id: 9669626b-4540-443d-95d1-08de230707d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hpDPnuYggl0Sr65rUDhse6Xxd9D/K8T344RkNOAS8oPTHIBJeqPbWTs95VM1?=
 =?us-ascii?Q?ivK6E00KkWbk2IR5mh3L8/67qEURcflmy2PYnNyyZxhryHyinOl3HnktYs3M?=
 =?us-ascii?Q?5lx+Q7XDfyrx2kRvYbhn+EfVXM42cg9f+1MuCMsTxi17Y4Q/a14h+r7RNrxl?=
 =?us-ascii?Q?MwMUtOuQtNcRUFDdwH0NXXbf1Ho9ew4iGzcIfXc7kH8HbnjlV1Hr7wHE4IDf?=
 =?us-ascii?Q?r/HgaBY5xqAum7qCLam1AMZ2z3Ko+xEUu6g0Qad1JZhsHQxxCIovOURnzNgt?=
 =?us-ascii?Q?Y5Lq5z1Ac3lwRIxjVG7kEQ2SWz1rBJ/3+6LU4yvRrceKYpGQmcqFlnxE2HeJ?=
 =?us-ascii?Q?TztrXvzWceXfXD/zD2VaIi8olqJQJ7AAAWacs7Mo0VaHr5p4JlMvKSg3T9BG?=
 =?us-ascii?Q?1+c8UVVNIMv2R4MDGMqn+Zfs0+BGt3rt45rK4G50CglMcaiiJAeZHqe0Sufv?=
 =?us-ascii?Q?B7LHlJONp79wUrOzkLjOD93aJUs4wMLFwOVlaemcOukiCdTPRQOo3itoGgRh?=
 =?us-ascii?Q?ReSwB7RwGEgMhqUVSHoHlRa2JUR23ppsUz2E2fEMnfRbsuR3LS9VjaRN8euA?=
 =?us-ascii?Q?J0LJFPoy/AWNXBVOrF9g7Xc0kYKAW1+LIGr8iJvx6Qd64gLzmWYp9LJFyUQt?=
 =?us-ascii?Q?naITCfVcQUCaOtjy/IF3UYdE3sufjCf4OHGTJGiK0GJinmoKL6B5D9cWTvis?=
 =?us-ascii?Q?lfNormWhdN5aSdYpZJS/HXStST00JhnJUdJGtj4hUE82BEvPetFYEc6Ex1/e?=
 =?us-ascii?Q?CIs5hfmMjeP6E6MiU/6krNnmG3nSSp4TSJSSTPXu9aK3mO+pTPF0SP05CZqD?=
 =?us-ascii?Q?uukZkX2Ga8TCsHpZnHvU+RybJtJgGymu7N7H46XHfWU153f6Ye1wBGR4BhaL?=
 =?us-ascii?Q?VkWu1lSC86UuVX2qcRACTe2zqG5sYz7N7ztCvO3yyk466EIis7+3T8HOd9iu?=
 =?us-ascii?Q?4/lRJh05OYZsIrI87vSBJmdiUvSl6uzMko7r4fD3GXnD4rjkD279KYM16t1Z?=
 =?us-ascii?Q?M0NsQ0LQgQBwuhKSwkxxzR6maFGCdVEQNJdYHvSCcGegIZHCTmnbIKpg2HIz?=
 =?us-ascii?Q?vKFGXZQtjY3cJmFLcDpvQ6W1F2R8PCw7tFq2dmqzw3kTxJKv6P976pkqlJXt?=
 =?us-ascii?Q?jjt7ezgMn9gpJtkbW19pMFcgIee4H6Gk81nSU5Gknm9ZzwUM5A091jyMyMaH?=
 =?us-ascii?Q?rtrZwiXq4b8C9tzFqRJUSo5vHCapNcpsRaDSdH1o0DsxjaEMzvGA89zwX/1r?=
 =?us-ascii?Q?Fc9HrsJwkwvsgwfXSPUwZrFJ/GHUn/mkX9aZXAs369EeOq32wGL62AdRYmD7?=
 =?us-ascii?Q?Qi+uWt4+BobYrEUZA/8EFHf0Z8QkwYxbkXBylSHCOczBn58g6l8ZfkDvugZA?=
 =?us-ascii?Q?Jmye7mLUfuONghkTNH9sVMzRJfh5lUO2D0E0mS9fOHdXCKGmbIrDyn4uONNm?=
 =?us-ascii?Q?L6ByHeWBUw7C6UVXL44Hqm07xwkWv3B1HrdBTjJr9bUoeAfTgUM4KaJtgHpm?=
 =?us-ascii?Q?xXKoSDHFpdrg4qxw6D8RcSFL2bIr1Y6tdoVNSlhJ4O+xYL5PYUve2swc1Y6B?=
 =?us-ascii?Q?kX2ESDujqetZwVBzWVs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:23.5149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9669626b-4540-443d-95d1-08de230707d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1BD38130F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16761

Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/conf/layer.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 7053ed77..048272d4 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -22,7 +22,3 @@ LAYERDEPENDS_meta-arago-extras = " \
     networking-layer \
     openembedded-layer \
 "
-
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    gstreamer1.0-plugins-bad \
-"
-- 
2.17.1


