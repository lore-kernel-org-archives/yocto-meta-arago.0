Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775B6D2ED1F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:26:07 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8980.1768922759363157354
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=I540NqK/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.53, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMg4kMzW7dSWuNezOGcACr8s/f96ZqwgbBAyq49HOy7tQI8c3XqMsh/msVMctTDCJD4xP2U3hOW2fkA1d1gOjXz6iShuntFCud62z4o55+ngL7dRQ4tLtrPVt7ge8uTQRQ3OJnQDNCl9GOiHxdD6Gx0zZ4KW4YWdXcgphOH/4V1nvfJoUYNfxgp8mTKtujxuyGL2wrPrfl8LUvs+5sRWWGWyKe/r9j/SNi/9qV77kxHUnUvMuhcbASeXEXuhsULe6bwCpApkCDohXPCSRS1X7iGwHBXaHkumCE9CI2wziwJ/54vVVs4qaafEgsatwEbyyee01T4QMfbE7Kt4rUi+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Hr1w0jrZPcwLcaLQrjKz2smUnrEL6LDAFkPWftFs8Q=;
 b=QimUN7Fm0MS6x9vxolMCSL2UXG+n7sRx62FiDqGAAc3Embx1IHVwP89uB1osSutcofy/HPKIB2lBCNG+J4UZh0mbIlufdIDEZmG1RFr9V3MTAcLkYS1E8ZStjJ7WwwJBEWVZ2vQzfoWLM2XthKI0kLDyNslIlo/JzSboyyGI9Y+stHoibNVu4apiQKWcByIiM9UYVhIy75iP1Qqlq0qnoAwPBHcznyZA+KQZ5OVJjD4VKkyD4uS9X6/ggZByXz1UCZ/QOdMdkwjNEQ0Pf/biavzIfhQF/tg+E0DKr/tkvM+NAAXtJjaCut2+dednqE6+wJrfYjjPCOuJxpLsU8Tgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Hr1w0jrZPcwLcaLQrjKz2smUnrEL6LDAFkPWftFs8Q=;
 b=I540NqK/6TuIaYqUcaR5zH+fAgdLzRt4orufhMMUgLx/n0qiDmqVQMARcEv1pDTpT9SHF85UQEiaHOIdanDw335pCqmnFwj60XzTIqfHbWpZpvvr5pGezdFzyQoLuTvIr+AO6LdTRRAR+zFEVsMVDtfZVzYQLlO6eDdndXYbXpI=
Received: from BY3PR10CA0012.namprd10.prod.outlook.com (2603:10b6:a03:255::17)
 by SA2PR10MB4730.namprd10.prod.outlook.com (2603:10b6:806:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:25:54 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::d7) by BY3PR10CA0012.outlook.office365.com
 (2603:10b6:a03:255::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 15:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 15:25:54 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 09:25:19 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KFPJ2J1419269;
	Tue, 20 Jan 2026 09:25:19 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] open62541: Remove deprecated examples patch
Date: Tue, 20 Jan 2026 09:25:18 -0600
Message-ID: <20260120152519.12538-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120152519.12538-1-a-christidis@ti.com>
References: <20260120152519.12538-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SA2PR10MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: e28e8db6-dc07-4758-a268-08de583833ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RoOab+GMeE026WEtpaqKgsQo5BvT+AoOQd6BkLSXBLeyqPCM4V2+d9mz312u?=
 =?us-ascii?Q?uNEqoQAeylxyJNheYv1ysEF7N/DoPxm250u6wf7OVOhd3+jQBI+vMaBq/wKn?=
 =?us-ascii?Q?FpurWl/SjjQBisTRBu8IdchmKtJuoz5KxDIhXEHJHsMsINT94eC9e7e/ogA6?=
 =?us-ascii?Q?RQSfSMntdTmxdA+cfrwgNaalXcM0iwA/Cmd1GfqeVhDetj3BF6nH14yXIlOF?=
 =?us-ascii?Q?s1ANjPOFDLB0i9KKZ4nfXdss5qrioblo/zXx04pYbKMBtNL5/gvSLRwzedj8?=
 =?us-ascii?Q?wk9JcVAms6EeINMxAL3dfkrxQ3NKCuVWhkMufox1nNtmA4paqYV3s33t2stU?=
 =?us-ascii?Q?qrPm8jqg6rP3qVecQ0IZRHlTNNOmiHAy7/hMDPXD524lEu4Jf2gs0NuUG/o1?=
 =?us-ascii?Q?6Pn4ynPFi/PRUZJE9zFmuZQ2kVavY0ZWimjVuc+hRyCqYcqkBGoLmnS/lS76?=
 =?us-ascii?Q?kEWM7CVh4waMciLAjX1FNCK3MmqqkDNI7h1Zd2Id5/m3FtUrs1EU9WmWmT3F?=
 =?us-ascii?Q?aNoXI24SjQADufgBzn+07slNUKGRf2pbKfKDBaPvqMmAF0iEFwnf3Kb1+2kS?=
 =?us-ascii?Q?G8M3GVoqrE5FtbKqXxBJ4HU5NYOtFi2mlqITbJfVJvmou3kSUB+46p2P/X/S?=
 =?us-ascii?Q?UitXy5blc0IgPUBp5kbGLPtrXW7T8F2EcGo5hdv0/MEx1H7MtcIeK4n3F4hC?=
 =?us-ascii?Q?1zzNNzUvc2gUjDHcc+EKX8FYj8v7dzfOKLzdC1ECfL8Y4EvrMQ5MT4XGpYsC?=
 =?us-ascii?Q?HIntz6v6Gz4fM4yOF1L1XYUI0Aqg4BIgUR4vPlHLlTKFse3QUsAIQcczhF++?=
 =?us-ascii?Q?qU+6SCOqyQ+RPj+wFHNP6wGReCeno8ycKZQ1XNTzXby4IwE9YjQrWBa3b02H?=
 =?us-ascii?Q?RHJdFEwm2pZ4BchP1yfjKPnouSdTj3ru7iDFvHtxP8qap4lekZsZ3svx5Uwt?=
 =?us-ascii?Q?O7EFlstBp7uGVDCC94Y4vyV8Xp2b90JHXTOPjxMIK4pxM5bXC+2TqEGXiX0n?=
 =?us-ascii?Q?2vn1TqSITJzj26nmWd5z0v4YFjxCmEmx2AbZjF/9UdkdHkk5c7v8e+J8g4di?=
 =?us-ascii?Q?/Dd5Nrsr0SENa2HyjI0xG6RKCe40rH42KLbK/rr3ShTorlq7kZHiw1SYjGEd?=
 =?us-ascii?Q?k1yOEIDXbyskD2D+3VkL2SSjvxTrHtQxh8G8TSH7iRq5xD6BrOlfQ0gBSw00?=
 =?us-ascii?Q?EDOGv6xY1sqvbFgHefqDBzVj6LBYJcLMVTbG/7Igece7caJvjrrCcGjl2VEa?=
 =?us-ascii?Q?AeiMCNMbKHo5Whp2yd/iZA1/B+DEIshT7Nbhh3v0bfqfbWU553PS6dmz2QdQ?=
 =?us-ascii?Q?DhsjFh6U2ze9B0nuuUyZBV3t3t/sYZgtjmTrmEJcZnYwVRzcVE/wf4qwnHuU?=
 =?us-ascii?Q?zyBy3OUyWK3Il4fbDxlN+R28F/5Txa4rhAnt8vb8K1Sh8SUFABQLKvVnOwYE?=
 =?us-ascii?Q?ZQsDa2d6FQErD76xAzZu1IfhLe84WTR1kRRVKTp+Ngp/Ph34jxfe96NT/XYu?=
 =?us-ascii?Q?Y4tUl77h6NFDVFJKJhVcsXLSxuyipZ5aJV4P/EmarhnBNujXLodzy0S7dLce?=
 =?us-ascii?Q?pk68qjVkXOjKPd2M+SM/9t9pZ5GZw+xq+vufAKCtpRda7+Gi/mG2pLCIfzO/?=
 =?us-ascii?Q?EBPdsTe2l/jhgNJM66pgW8HUPX/BLO5xkpnYMRJUt28rbyUmj0HrRdIQak7l?=
 =?us-ascii?Q?Dt7SkQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:25:54.0228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e28e8db6-dc07-4758-a268-08de583833ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4730
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16986

From: Antonios Christidis <a-christidis@ti.com>

Remove this patch, as it is for a set of deprecated examples.

Commit deprecating examples: 8cee854beaf97e71bb54604a893a3e597af851d6

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../open62541/open62541-arago.inc             |  1 -
 .../0001-examples-Remove-sys-io.h.patch       | 68 -------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-examples-Remove-sys-io.h.patch

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.i=
nc
index 745c88a1..cd8ceb00 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/open62541:"
=20
 SRC_URI:append =3D " \
     file://0001-examples-client-allow-configurable-server.patch \
-    file://0001-examples-Remove-sys-io.h.patch \
 "
=20
 EXTRA_OECMAKE =3D "-DUA_BUILD_EXAMPLES=3D1"
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-examples-Remove-sys-io.h.patch b/meta-arago-extras/recipes-connectivity/o=
pen62541/open62541/0001-examples-Remove-sys-io.h.patch
deleted file mode 100644
index 3119fb3d..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-Remove-sys-io.h.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 123f7274cf6cb65866c910dec16ec1595495d1dc Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Thu, 29 Jun 2023 11:14:50 -0500
-Subject: [PATCH] examples: Remove sys/io.h
-
-This header is missing on some architectures, aarch64 being one of them.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- examples/pubsub_realtime/pubsub_TSN_loopback.c                  | 1 -
- examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c    | 1 -
- examples/pubsub_realtime/pubsub_TSN_publisher.c                 | 1 -
- examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c | 1 -
- 4 files changed, 4 deletions(-)
-
-diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback.c b/examples/pub=
sub_realtime/pubsub_TSN_loopback.c
-index 803a3c107..e90015aa3 100644
---- a/examples/pubsub_realtime/pubsub_TSN_loopback.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_loopback.c
-@@ -77,7 +77,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c =
b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-index 7db37e9d5..ba5f7aff6 100644
---- a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
-@@ -54,7 +54,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher.c b/examples/pu=
bsub_realtime/pubsub_TSN_publisher.c
-index 945ec3d4f..5ff866908 100644
---- a/examples/pubsub_realtime/pubsub_TSN_publisher.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_publisher.c
-@@ -78,7 +78,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
-diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread=
.c b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-index 72dcd3997..73967577f 100644
---- a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-+++ b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
-@@ -57,7 +57,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <linux/types.h>
--#include <sys/io.h>
- #include <getopt.h>
-=20
- /* For thread operations */
---=20
-2.17.1
-
--=20
2.34.1


