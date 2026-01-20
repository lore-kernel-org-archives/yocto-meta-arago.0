Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9860DD2ED1B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:25:47 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8971.1768922741402127145
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=V/UzsjE3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.37, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF5OivTBNg7DEF7w0ko0fbLFtwt+jKektMCnqON9pi17rpouOPJyoI2ZQAjWNC3eAOf4lD41FxGmf3J0SkHvHGINK3njMl75IdTEefLQ2mNGIrgxbj1yXn/zQXBBiD1MqL3cuxLcf6unITd4NabU/XLhfw7u4Z/eY1fUw3Mt4mkYRIL9eJ2/aIrjdat1UM6mtYQUUX+PPWJK/f9kygvRJg1geaeLkEwmIoGx7MR8uE1wIc4u7LFCN3T2C5CaQ7d0ktQN1UvpTT+cy1MOjz1FPBp8R09mcXoZtST3OPFCyFqKERQNVhNoOs7Ej/S/1hx6Cqpw8nyJvBwKzy556IenHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkqoZPmEa7IlZpfDyPnZpK5X6vA/W76j5rru+hIgFkU=;
 b=ULcC83rclvZtDKokExgrRiYMBvogspYhKFc8zyzMhRlF4eG4ODCIKxV8t+5XctjWMGKv/+GKXsPd6zQB+MBb6ms5V38eljO9y6YVB78GiDgjxC1F1GtNv8dww37n8xTgm3zPZvIJlHDTn3FDAQksdpGhghrUYTEmggwwiR7p2rHiNFkpS5m2A0snbeCun+t7B3W5XDfXk2G0nagdqMx2w4uUog3qhCFqy8a6dYkKAfI5EMIdR4FLHbeoI5Zh1577dhr69a9CPWJvO6mamlqvOZxiHzs67LB3KbUqrm3DCs7jG8IKeTY3RnQrobWer+SFjUnhdrbnH+FVhBCt1u/u+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkqoZPmEa7IlZpfDyPnZpK5X6vA/W76j5rru+hIgFkU=;
 b=V/UzsjE3sCFMl9xwjkFtQbD70UGMaEN5J7GFu9I6Kqd9ZuXhSdCEqeYXD7dl+u3kVAVsmv8PbZvbK6TcBuf25OH0GPZEW/BzYNoprdoNkgZKwL78EyZgOKpR8+xUdyokf3ZMCLI6bjJbKMVQurCUDCaXOupxphbzNm6Sbs6rvPI=
Received: from DS7PR03CA0275.namprd03.prod.outlook.com (2603:10b6:5:3ad::10)
 by SJ0PR10MB5568.namprd10.prod.outlook.com (2603:10b6:a03:3d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 15:25:38 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::d8) by DS7PR03CA0275.outlook.office365.com
 (2603:10b6:5:3ad::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 20 Jan 2026 15:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:25:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:25:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 09:25:19 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KFPJ2I1419269;
	Tue, 20 Jan 2026 09:25:19 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
Date: Tue, 20 Jan 2026 09:25:17 -0600
Message-ID: <20260120152519.12538-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SJ0PR10MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4c4b57-b7af-4ed3-9eba-08de583829cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b1YpIflxkrUtnkZvcmJttJhd1RLqjKbGUXfMd34/g/H0QjpXDEatkwo2ZzpU?=
 =?us-ascii?Q?2Evd5HRdRJlWwScSoqSYTlmzyRxO8btFObY/9un6itbJx0FIlVKxDGjqWzJJ?=
 =?us-ascii?Q?kKcxB6XARC4hhLFoOKSllTydQDJqxUuWHIGXs/maHhHbtR/Byf36U5KBuXcv?=
 =?us-ascii?Q?Ys7D44nSSjRvLHI5z8ji+u7ZpBG8J9h+3PRK6C27PHOhNZmhvsI636l76jgc?=
 =?us-ascii?Q?7RDHK9tbxnI3nxS98qab5HvXbmD5bd5ufWubaEZAr+1t8EKuZDvYaIFDoxXw?=
 =?us-ascii?Q?Q3s21sefyQbkWi9UiAz2xCTEdx+J2OA94chK3EY2aGY0RY4o5tQI4Okte72l?=
 =?us-ascii?Q?E1nmDZj+HGniSFD/PMxeruBbbKqkKTFkgpbDqu1dnMQBehijv0GrwXx73D5L?=
 =?us-ascii?Q?CSuR8D6qBhDfLBBVR4M9FuCL2+2yydzvlhnn22CWg/Tec0xTpTXudl37kvQI?=
 =?us-ascii?Q?hYT1Ad1dgnIMzHR8llfNLTN6tT6+RRC1ECcnU4rJqb5F33IdH+S7g527Q9a4?=
 =?us-ascii?Q?BbjzcSCKfJNG6NvJ829wFxprfrrkxLwoG/GJBNXXGNpNxeuCGNg9en19Wiaj?=
 =?us-ascii?Q?fSXte2oNyfECuSXIlHG408c+3/UIRg9GjohQRA8YbrgLq3JKC2FnUysVE1z7?=
 =?us-ascii?Q?7qQZsN8IZ+Q6iEpR2b62gSKAay8452dMkxp+gmauMq84h4qJPqldt9LzrzIu?=
 =?us-ascii?Q?/bByV1pme5x0kMwYaCgrmeudeRzIzTRiCUcgbma1mb3e2w4lGxhweYu0RmDy?=
 =?us-ascii?Q?Td94Ri+kZ6NU07q5CcY8kUGZ/qKj0CKssV4ckb4buZbJt6wQSN6y9nyrHGLz?=
 =?us-ascii?Q?5ocIHZkvb/WxcvJ00KVivNlXnkK/yPWl3/p3AP6tQXrPXLhuyz6BOC6VndPd?=
 =?us-ascii?Q?7XxqmIg4EhpOF5twbin7MpK+tcWVNo6K6oWFaViXfh7HjdBZ3vdkC5EelQJG?=
 =?us-ascii?Q?XC64Ndzs4yY5XdzAxjjrHecHwd+jDAUo/Vdko29LOY3crtiteW01NEIiA7uI?=
 =?us-ascii?Q?4jh1wfKS2j/1Dj82gtqKjSuQPyjo4QkyeCcRIyf+TjPPuTVumqifFp43N6jn?=
 =?us-ascii?Q?eQlWsp7Uj4AzqmAbWETOTdBWJRoxsZH2xvO3UhkHrd7zd3lhA/X0wCQbpa4c?=
 =?us-ascii?Q?Jj5+qz2YMwu2UpJvFtXipq+cn4jqq9VI42hA44gKqT4zVmEAZn4Hb7Pca2+v?=
 =?us-ascii?Q?y9LR5xNTdKutHYyVnwKO30Bx7L+8KQe8Wn8ebpsY42KxofTzmzytAwiGt0UK?=
 =?us-ascii?Q?bxODB2sLWKKKe3LEXlreoE1rrEFzSxZdFQqnwRWPLfRI7vruRaOUl8MW8QWn?=
 =?us-ascii?Q?uk+T1hfaG6HyWlOBs+OGIqa/Oh1wrG6eUbpWynlJla+fmbFFjepFjFwccU5X?=
 =?us-ascii?Q?PQ+5jy+fUshuYZQ7YPTJXHACMxSpWo3esLWAp+He/iIr6UzzdtyxIIYOoNND?=
 =?us-ascii?Q?TLENCqeySTwkyHYoHOqyeFwi1U36TjXmLAGfjJkqyu9bjLuGogEuo6ozTV9y?=
 =?us-ascii?Q?j5mFMvkXPduivLG0wXPp8V2ExbIp4xCA3e52/aKggMFSiTQACxE3jV5Mat1F?=
 =?us-ascii?Q?1/TiT9jPbLiJ4X1nYNbo5AXdra+TvAL0IZqRVbYRn3MwITKwn2loLsnBRMLJ?=
 =?us-ascii?Q?pjyKyeLuifrJK92363ZHKlg/1Tvg/B6CHriAIUaLaPc6hzfQvthNRsU8T331?=
 =?us-ascii?Q?oAoEWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:25:37.5069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c4b57-b7af-4ed3-9eba-08de583829cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16985

From: Antonios Christidis <a-christidis@ti.com>

Dear all,=20

LTS migration related efforts to fix the recipe.=20

Kind Regards,
Antonios Christidis

Antonios Christidis (2):
  open62541: Remove deprecated examples patch
  open62541: Add patch for implicit declaration error

 .../open62541/open62541-arago.inc             |  2 +-
 .../0001-examples-Remove-sys-io.h.patch       | 68 -------------------
 ...plicit-declaration-of-pthread_create.patch | 30 ++++++++
 3 files changed, 31 insertions(+), 69 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-examples-Remove-sys-io.h.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0001-fix-pubsub-Implicit-declaration-of-pthread_create.patch

--=20
2.34.1


