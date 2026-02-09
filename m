Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA79E81BDD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 15:47:10 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50363.1770652019764994670
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 07:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=m5Jfh8RY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.6, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh4bHh+4f2+MgyRIEgHW57SF43H+hK5y5rDwBVACsLG+GcMGsurvzV87wZN3W1DSrQ0Ylwc3kCcQ0D88yv7tj1aGfBX1d1db5eiLXUuswPnfXOCpRgBsOBJig77NQDHZ/ATzvYqO1+YMcvjeVtOe40uAVFpZpI1+V/Ao6akiy6jPy1jltV/w1W0EPPgPC5OCrVPRMjhctTECaG3aTpoXhA/fzrZJmCgIuTN+DItLPsMpeWDfMl1uTKyKWveMX4HITYNqxpUoNZD62IcDT6em+Ai4lEIOwXE22ScnZPg5NpcELCrE5WBlcIabx6xz+Xo2zyhxz2vxpMctbRU/doSIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLZZmQWGo97n34kMKrxLHpuYGHwVcJGn/DLP6rCj9ks=;
 b=aVxpt5H+rSjGcANn2MZftKtSOt+LKLH91v50r+hQ+Iu5yWqVjK9dmVl3d1UcG3/DK/IiWaFmOndmmYdpmJILTpj5AaGwlHyAfYXiBg+Uow7IxFIbr6/YBGaFnjd6uDTZgyGR/fBsZSTWhdawgzRxMHXzGUZDCRcQzOLx10D9SgxrtvWAltcMe6pF2QjBIr+GTm5sY/mzCH2uXIP07/7tBOHm1C2LsCT1TIi+86kkLGalwBYHU8S62ATsChtkjS5OjCSvTwwjQ0osxKHe6xv1Ft3gwTgXu9FxEZ6n/iBCduuJZgUGIfXZZ1m4QAPnKnJ5uNnrdMfUnvgLgXnphTj6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLZZmQWGo97n34kMKrxLHpuYGHwVcJGn/DLP6rCj9ks=;
 b=m5Jfh8RYZNrVxcZnLA90iZcMW51sBg+3NVorQehMRO+gmsyjt+8WNC6tsr85qsoZKQUjnApqIMyjRgCBeUX+5tUnWSQRGtOPX3tLci2heXhINa08zgmceF4OAyMB2qOa3V6dBjQAly5Xd5TIO7bFiKEArOxAsbs7V/cuj9vobIk=
Received: from CH2PR14CA0060.namprd14.prod.outlook.com (2603:10b6:610:56::40)
 by CH0PR10MB7500.namprd10.prod.outlook.com (2603:10b6:610:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 15:46:57 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::e) by CH2PR14CA0060.outlook.office365.com
 (2603:10b6:610:56::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 15:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 15:46:56 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 09:46:56 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 09:46:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 09:46:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619FktYZ1825020;
	Mon, 9 Feb 2026 09:46:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vpTTT-00000005IcY-2rTq;
	Mon, 09 Feb 2026 09:46:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: Remove backported patch
Date: Mon, 9 Feb 2026 09:46:55 -0600
Message-ID: <20260209154655.1263211-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CH0PR10MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: f2925d3b-bf33-427d-d874-08de67f27456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TjpchGyMi8vHhDC/WMhN5Jrob8GRYWAEvF1uHKivRqmkdZrHvrag7igKJp3g?=
 =?us-ascii?Q?g/gi6PlSlmmFGTDs0ZOF4asOUkh0XosSIsROJxQh5fvZBL37N2pVZUd00qLT?=
 =?us-ascii?Q?oaqtUWkykfMyvJKZSn7PabP1HpjyrXtbn5JFDchPDJikRdvt4b4O9ENrXRjQ?=
 =?us-ascii?Q?KnHpb5z0D7jzTVORNIKpuy4H0/aeNNQ8UafgycJEcdUqTyog7O1K84ZntR5m?=
 =?us-ascii?Q?8TPfml6FJCZadRPGFcbH4ZHmubH67NtAG5ppuGTWhiO0Th1/NAzid3NERM7Q?=
 =?us-ascii?Q?WkM1owQsMuMu+vtxeSUXss0F+fzkNdV8heWhrqfbl8Dv5uH1ZLz3Y/V5rDOX?=
 =?us-ascii?Q?WDNmm/DIEQqqh5+PllMdbvlBkd3SVxgI9bXjc4UpW7w1hh76x6ne4X1owTjh?=
 =?us-ascii?Q?r5utwfUMrvmRSNNUNpenOeBaBWXQ7Db9g0Cvd70ZenNGRXFSHxIR0nNeMJTZ?=
 =?us-ascii?Q?ITwW3Y9zMjMv+d/8g8MUxsVWv6q/ErAq8pmRgT5H5kOzBIJL1rvwmZvJEE6t?=
 =?us-ascii?Q?iSKsqKWRMP8zcqCx4jYUqQQUZokB1HgNqXw3jkV0aYtGT+Xc7udqt8JQP4rp?=
 =?us-ascii?Q?X7XnCW49nkH8k2JYSJFjEwXF2MeN9cpprCTVzz2032I1FKzMWZ6sCZc8j8PE?=
 =?us-ascii?Q?fxP50FvPpmMV/ekkODs2LWj1Pi/vbS419ljIyuYe+GrSmEy3x0cX7cMqn2Gg?=
 =?us-ascii?Q?bFtvcDbm72jqdujVZp0Rjp8ReZTH+AEM2mzrmKDnp3faqFYvDjBBqdTXopAo?=
 =?us-ascii?Q?SXXMZ+4eAYZhLzQzNu+GkPfCjEhhm2UAQ+JcCsTlIo+QbZWyEBE29noVCi2h?=
 =?us-ascii?Q?LN8yoPw7LqUSW9l71XBfq39VGCRAkgMdAJ7OAbPevf82TIkrXIrsOmJzZnxF?=
 =?us-ascii?Q?Ku9ZM0u99r51FBljWuv1ikXCt36RfVMy53RN4vwa3RnAnkU2bLoCtQQPxlMu?=
 =?us-ascii?Q?Oy0KJPyzKhLIaxoC3/17P2ODLfxfPuNQ5sGggfTSY6DLkzdYPI5ciHRcQzhe?=
 =?us-ascii?Q?h38cHxsflUP2udIebM+++gyBwECe62aywfGzLpwZ6QBZf67xdC55Vp4SVs5r?=
 =?us-ascii?Q?U+73YLTZZTa3zwLOf9CEcUKKHf16h1Hq1QdYetXpJjQ+9frTvd4xoKJ6rLDH?=
 =?us-ascii?Q?+2UCwIguhdCesmYrPvJDt0owESvWjSp3pPG2F0WqidWGyZ+zAZxDFdrgmwjD?=
 =?us-ascii?Q?0yIdV7exh1sKqs34arYotLwQhoepC7zP4dWySGIX/4lKeKDpWj2QEHMxdKUq?=
 =?us-ascii?Q?yM8KGdjtFhlz3LJfUA3zOLjP86I21pxEr72pHjXDCr9UzW+byb6/banZ2ffP?=
 =?us-ascii?Q?wYtQT9PPsOkwQigUOVqjYQLxvSOJmjDVPmXsrCtCq3F4fars5SwXr9zyl7Ch?=
 =?us-ascii?Q?Oq9uF3faMMZJTAUjiC61PYWf8BKtnmuvr1yowph+GP6sSJ03Egf5QuNnuimW?=
 =?us-ascii?Q?jQEbHW1w6cNcjqmM5jGdMItwmgxrorcxXDZ6P0DqNW2Wa7mV8dUYsPYYsApO?=
 =?us-ascii?Q?68Clc1c1VZzug3z+2WLO+ZFt+1qfcJkBfIs2aArZBZ9e4Z2quXQu1MYTtBs6?=
 =?us-ascii?Q?KrxhGhwVc1FAuEwLOQW7LzWIsxCayfItLcu3JUkMsJ3y369NhbUVCi4hywCa?=
 =?us-ascii?Q?5NYt7k9INS+b6TpUaWkhm9Ifyj8Pc+gx2ztoqwQgTF2Qw5SFBlTQdSyO5Hw2?=
 =?us-ascii?Q?Gorg0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TKswJ7GCtk5cNLD9El+W5wUikMM1k5Jw7qjlrVgx7PtpuObuW3lkPxUdrrwgLqEetAI2umSmAdEd+u8Y0ilIcv3H8rzdMBq+HQG3XBmzxS09dSBTmtXMUNwgtaT1X4sSQTLtPdW689d7EnMLGMmLsQDtjzX5XieS2vvyrwt5RYMHd23LsFATGRjEpq62+FwbMXqGd/2jp+6xXx6oOShtLeGC9xeishVb7SgFI1pXZGVajIc+UT1XhIy2juswJGoWKX/wY9YUTPFqGy4rpJSwVuWgjfkWtmkmT7LRQwrs4zV4/csv6PXtS1XDEFi1/5VUrWP5woWlCdr2hj7sw5NfsAOwyOl1j1WRxeiwUXCWq9WI/MbjL8aStQNTHKVsbp5yGu/PwCGkvtHJ0pJGeZUI4nunSeiIJgYCdDVyyh9f24UYbE61pNx7JIk0F+sRn1Dx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:46:56.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2925d3b-bf33-427d-d874-08de67f27456
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7500
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Feb 2026 15:47:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17093

A recent version bump [1] in meta-openembedded has moved to a version
that already contains this backported patch.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3D97ef9cc3b88=
34567ab6c1a2f0812d96f2d56154d

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../open62541/open62541-arago.inc             |  1 -
 ...blisher_rt_level-Add-missing-pthread.patch | 38 -------------------
 2 files changed, 39 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.i=
nc
index f92e1e90..cd8ceb00 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/open62541:"
=20
 SRC_URI:append =3D " \
     file://0001-examples-client-allow-configurable-server.patch \
-    file://0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch=
 \
 "
=20
 EXTRA_OECMAKE =3D "-DUA_BUILD_EXAMPLES=3D1"
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-server_pubsub_publisher_rt_level-Add-missing-pthread.patch b/meta-arago-e=
xtras/recipes-connectivity/open62541/open62541/0001-server_pubsub_publisher=
_rt_level-Add-missing-pthread.patch
deleted file mode 100644
index 9d56cb12..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-serve=
r_pubsub_publisher_rt_level-Add-missing-pthread.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7af0f9a29ec011530a2b8c4b60e719e76ce0cdf0 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 16 Jan 2026 16:40:07 -0600
-Subject: [PATCH] server_pubsub_publisher_rt_level: Add missing pthread.h
-
-Fix for errors:
-
-open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:78:5: error: implicit declaration of function 'pthread_create' [-Wimplic=
it-function-declaration]
-   78 |     pthread_create(&pubSubELThread, NULL, runPubSubEL, NULL);
-      |     ^~~~~~~~~~~~~~
-open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:78:5: warning: nested extern declaration of 'pthread_create' [-Wnested-e=
xterns]
-open62541-1.4.14/examples/pubsub_realtime/server_pubsub_publisher_rt_level=
.c:173:5: error: implicit declaration of function 'pthread_join'; did you m=
ean 'pthread_kill'? [-Wimplicit-function-declaration]
-  173 |     pthread_join(pubSubELThread, NULL);
-      |     ^~~~~~~~~~~~
-      |     pthread_kill
-
-Upstream-Status: Backport [3a02b5c59d267a8286c4fb72d4308adc8e0f3e4c]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- examples/pubsub_realtime/server_pubsub_publisher_rt_level.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c b=
/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
-index 0ec133d1f..caa440596 100644
---- a/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
-+++ b/examples/pubsub_realtime/server_pubsub_publisher_rt_level.c
-@@ -8,6 +8,7 @@
- #include <open62541/types.h>
-=20
- #include <signal.h>
-+#include <pthread.h>
-=20
- #define PUBSUB_CONFIG_PUBLISH_CYCLE_MS 100
- #define PUBSUB_CONFIG_FIELD_COUNT 10
---=20
-2.43.0
-
--=20
2.43.0


