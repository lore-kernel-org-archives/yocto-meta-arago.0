Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA6DC44525
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:50:11 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11041.1768999797890630163
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 04:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gUvxRI4r;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.38, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myg65ES5r/5rFaz+OKToVOkeepZ6ruIgKHF+/XjINTMLuqIjq+6Cyv2iY5UqTcz/H74q8zN6L/Pv1AVCuOq8NLKH4C0DJaTB2nRUKzv4MbjFUfs4/IlR0vdCTsORWptAuYCHmPi1kDCq0ydWEm4+gZX9fdNOHSyH8r/ewj29+tF4zRrIGar/EMylufD3eu7Zhq7y6Zcn6GnFVbHJVMB0FgJeqe05Hz4vhjbYr/wkGeVJMFoev8vimFMSQUqip3F3uE04/y23yUCUZUMjQuu6Kw8+uqRb9B3kgZP/L1clP3DFLMKOZujy68itpJdcpwN7UsSKsap7RYlZZKhkCMdfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBOjKl8/fo7kSKe2CqSn0fCJUqupjc/IbVkrbpjRoUs=;
 b=JZV1okX5lLqmPimBPGjAjIcT/DAw907dhnF+pHtFSKj3Knw2IX7KCax0VjERiZTkmV2pIjcjqpwUGHgzKIq3XWCvNNE/OarP1wYy1Bm5NRWju19zOHmfIKh5NOKWvDlvZwuEzd9S8RIpYdgeTl31EcZ1W4eVLTShAKv1AKekwyiNo0k9RdMIGkkNbn6Cw1HkoOKY9yMZinZA4X+A0obTQ//QAq2bk1w+U4LuO4P159drcgPK0LV+4BFfNL7tidvJ2evscsa+LQIRjCthfVEE1fm7G+T3lVbqelaFWWjs6M3U+iV07ZAZsZahIxw0LYIEhzVL2RrzMU0Wd/1SCsECwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBOjKl8/fo7kSKe2CqSn0fCJUqupjc/IbVkrbpjRoUs=;
 b=gUvxRI4rZoovWoOjme3fn36f/Cjn/YoFPD+3HiVGQAu8cs5yDlpsyRRidG2SYv53QHACwVNJ4w7rIkrubhl19x7yMJeNiFpVBkkp7Kj71tHQYXqywwTU/M0idF0kCrs791ENsSBlxQYhLXul2ae8TYCP8SyzyQLm6ECljBx2gd8=
Received: from SJ0PR03CA0353.namprd03.prod.outlook.com (2603:10b6:a03:39c::28)
 by SJ5PPF2BC420A1B.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::797) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:49:55 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::9c) by SJ0PR03CA0353.outlook.office365.com
 (2603:10b6:a03:39c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:49:54 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:49:52 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:49:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:49:52 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LCnqvf3021402;
	Wed, 21 Jan 2026 06:49:52 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: Update upstream-status of pthread patch
Date: Wed, 21 Jan 2026 06:49:51 -0600
Message-ID: <20260121124951.49144-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SJ5PPF2BC420A1B:EE_
X-MS-Office365-Filtering-Correlation-Id: bee16b77-3581-4be1-9835-08de58eb9323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H+5Z/pn0HZpsxonr0ALev9Y7wJVFniwlqBp3THIqnLU7N+UTYRnn6aEqg0Mo?=
 =?us-ascii?Q?E2CWwX7dRDDEJMTHt1J+DjJ1ZjqPagw8/sKJAJUWW5HumYdK/eDiMuVZio6B?=
 =?us-ascii?Q?BUCEKPd8EVcgfq9FbAnoBrhwaPkFQNfpFiaxDynr3Cx2kOB29U6SkYthLm+b?=
 =?us-ascii?Q?USe0yiD9iOZl3UynXzcUgzu6QufUzc0MXFa6W5HJoQnwHcQavE3gompfXIRq?=
 =?us-ascii?Q?Qrc0vMF5COh9K45Xl2Z8GGfNuXSCNTBo151hujRLrWrQN79CC8hJQ3sjfe7n?=
 =?us-ascii?Q?0K288aul5nAL+N5m5CpPEk2snHuqZfFtRHlKTdOb3fezhICBg+k2TADEfqqo?=
 =?us-ascii?Q?l/3b98rVW023NUqEPCrjDrJ+hYUu+ZYjwZXJWM/xd8GT2hX9Fus2+/K4EaYo?=
 =?us-ascii?Q?zQgxkhO9hbYTZANMyhLOCHGw1k2AOC2rEkn0GoIgmJT7GIUBI0lJab0r99u0?=
 =?us-ascii?Q?lUx9QJkcFecx2zH2SYbmrzqmGmQQ9wHOX//nwS6BojEFbUDLW1hNte1F465W?=
 =?us-ascii?Q?F2czyhQ2J6JayPE1mB/gyLFJzgQpUgih6/6XnkDjqNnJGxgHntSfZ+KPzDZk?=
 =?us-ascii?Q?ylJmMAYte/VTW/IhaCo34EByCZAumJVt3M0H7nZNe3BuhME787ETz26Tsd1C?=
 =?us-ascii?Q?YUgzl5bwVACdxhIJek08oskDmTrnlDJn1K9YknoZu+xADUvsA5wxcDpzyuoC?=
 =?us-ascii?Q?UNuv0uhMwObc4r7b+sXptISoJwLTrq/+gSwEOacuFH0ff4wx3uavHDw/rgl9?=
 =?us-ascii?Q?uG2d3X4UVmfug96r+T7w8STGCaoQReBevdMVAzpPUo2+zZlBKFxquTvK/GXH?=
 =?us-ascii?Q?bSrYbzy0ga+9HSQiKgvNB2VUdr5SLYlcjtNCvvSsG1iOANGUhwCk+P+631cy?=
 =?us-ascii?Q?ScH8c0WKQOmtym1oUqKBd2UMdYz4gX7J8Ovq9abM6+BpTHTsFPWJkmuO+v3k?=
 =?us-ascii?Q?UQu3rJ52IJRv7Vfo0TVOXvJWW3XTGJ0i+TNDeaVi9HUkdkgl+ydeBvub2zhC?=
 =?us-ascii?Q?olVr8RS//tvG8/DM7tgBeHxpnukZFzunE9x+CXzhmPsaISPA1kkAZ7i3eto5?=
 =?us-ascii?Q?WzywOQ4OzcitZ+BJxNWAUi4ClS/td8zHj/mBzPzQ5BzzahiK8b4W+/SiBlQA?=
 =?us-ascii?Q?CBVS3vBv4d2pMsgLyQPQyhbvCOKc4UQKILL44gaAEx9A70O9F+oZvUOFK6vW?=
 =?us-ascii?Q?5FAbWZ7ZELav6jgNmhnCaFg4+9RDBk30Byg5OxnB8zs2W1kA6lWZe5x8PWu1?=
 =?us-ascii?Q?VctZ0bPCfTUkiTj8X3L9izXgvbOp5rjvt0C275FtH2dBVZDTl2CXmbzY5IDl?=
 =?us-ascii?Q?TCuDYbiKsG166ioCS1ObaqvQGnyQV4hLGkTcCWuLmPMB7grzlddoLsY2t3dh?=
 =?us-ascii?Q?qH5+myvqBJnOK21u9/hNsoxFE2mXyBGGFJK5taUO6bG3S/CvO7fE8EmxXK40?=
 =?us-ascii?Q?rtiGkw+WEvVD5uLm8Sqr15kOTQslvNzEmvI5Ugno82W65UtJuqIBpi7L6lJG?=
 =?us-ascii?Q?qFQubOa0Xqa0chH/LOBreRj034LVNy+esS3nBtCj3/L5rKE24bNec6ImkoaJ?=
 =?us-ascii?Q?4aT0pXUovMEOHKobkdwbZuGj1RzdCawrA9EUL/+cVkb0ds6y/S8rogFXWimU?=
 =?us-ascii?Q?ktouoCmN6E43HdXSkRhGLhP5iwia+M17r2KmLsFbFqGPZEZRaUr8h9GnnrDq?=
 =?us-ascii?Q?BtAW+Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:49:54.0961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee16b77-3581-4be1-9835-08de58eb9323
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BC420A1B
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 12:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16994

From: Antonios Christidis <a-christidis@ti.com>

Update the upstream-status from pending to backport, since patch got
merged upstream.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 ...1-server_pubsub_publisher_rt_level-Add-missing-pthread.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-server_pubsub_publisher_rt_level-Add-missing-pthread.patch b/meta-arago-e=
xtras/recipes-connectivity/open62541/open62541/0001-server_pubsub_publisher=
_rt_level-Add-missing-pthread.patch
index 8519fd5c..9d56cb12 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-serve=
r_pubsub_publisher_rt_level-Add-missing-pthread.patch
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-serve=
r_pubsub_publisher_rt_level-Add-missing-pthread.patch
@@ -14,7 +14,7 @@ open62541-1.4.14/examples/pubsub_realtime/server_pubsub_p=
ublisher_rt_level.c:173
       |     ^~~~~~~~~~~~
       |     pthread_kill
=20
-Upstream-Status: Pending
+Upstream-Status: Backport [3a02b5c59d267a8286c4fb72d4308adc8e0f3e4c]
=20
 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
--=20
2.34.1


