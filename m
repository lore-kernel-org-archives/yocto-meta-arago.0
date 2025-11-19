Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CDECF2587
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 05:50:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.369.1763531432095347155
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 21:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hAKcdot1;
 spf=pass (domain: list.ti.com, ip: 52.101.48.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZMGNjQYPAqlAnMx816d2KInH/K7V/uN+H3YjaoEQCb1XTe2XvypZ1V8fHvssAkY33/ex5hi8xtEUPH8wl8b+C+p9tE2TkO9zNf/CR2mvSoOvuaJwQS0SLZ+LaG8q7CcsJG+ccKLcnNx5n+4WgR1PV1Q4JX8Vg+KyBJxnMsMYPyhjnNMzhIWydUqPcqhU/1I0U7SjlbPjbyCTGFy0KVC7bTctjH8NEBNOJF8NuoJf0yo3swj6UHEI91k7spuUUEVPnsMb97OpgQIP1MRK2bt+6T1T96+rSJEnOuvATwAoErmYawGr4/4NdzEkUP5unMD0FliLW/dZ7JL+YF+qhMvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaubWgLe7rQd9ZnbCOYX1v35xWIgLXCZbnMmXfvEHMU=;
 b=lr1T0b7MCx3peioJJE6AIImB/9LzVU7ElaVdBQ0u8BV26KehFWh6tmhD5HQbIxNcSQjF/k0uNQbZLGK1/K98tMdRotnQuNpWCpnq++uYhvJV3Ecb/97MQQBAUJ3vZQ/r9pCjEyjeTfoTZAITySAXSKyDiAWVzJKP6qfeTaAGnjKeVGsnS09OAFWhRrEcSOC9T/GxlmSL0DMMZ4Vty7PLhq9PhhHaQTClotdW78khRFK73zQJNbl/7gugmUH9/2RUdtJtbi114mj457StA0tpQNrRUTga5oBptisFxscvS4Opr4isqhd8h2HOlP05SoJHw1tYNnya0+7PlpHA3BAoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaubWgLe7rQd9ZnbCOYX1v35xWIgLXCZbnMmXfvEHMU=;
 b=hAKcdot1on8M5q2UwAgGp4C4lbgTDHlV8j+p0rsWi/xyzEx7ZU9+T6Fe4dCqdy2zt+oRpWRTniVCddKxYRzet5M+nK21gqcIQvYTBjUFTsu/DrsDp1UDqd0/S4Mq5Z5md8uJJaM7PxxJRuneYVYrhqY6axtTaan6icmK+PhR9NE/wbUA+MLuymb/OdUUgNHHre9dfQWYGJoTyi+8l//IfSC1MHjGPNuum5nuVecDo+2i3KLbWs+JaNVyfSsE9Sn2TkGLqH3TVvPRJdeQqOSCZbXH2swBgpIGdEgCXH0e7uqe5JPyil2S93AcgGFhPIfHLHIsCwEczvbUSFLlDwXlBQ==
Received: from DM5PR08CA0029.namprd08.prod.outlook.com (2603:10b6:4:60::18) by
 CO1PR10MB4722.namprd10.prod.outlook.com (2603:10b6:303:9e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 05:50:29 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::c8) by DM5PR08CA0029.outlook.office365.com
 (2603:10b6:4:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 05:50:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 05:50:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 23:50:17 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 23:50:17 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 23:50:17 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ5oHbs1308442;
	Tue, 18 Nov 2025 23:50:17 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 280DF18565B; Tue, 18 Nov 2025 23:50:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <kamlesh@ti.com>,
	<s-tripathi1@ti.com>, <k-malarvizhi@ti.com>, <denys@denix.org>,
	<reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] packagegroup-arago-base: Add libp11 package
Date: Tue, 18 Nov 2025 23:50:17 -0600
Message-ID: <20251119055017.292118-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119052440.3800939-1-s-joshi@ti.com>
References: <20251119052440.3800939-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CO1PR10MB4722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4babfe8a-f980-4738-6275-08de272f8b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5xvVsbx542zL/iNOdQuvypYIutWiHcQbmW60X7svFDtrfT3FiQOB1X58MvG+?=
 =?us-ascii?Q?t3pTuCo26nzvl8m98DuuHyJ5rqHQuybApJhAmew7pMGO81mlT7TKa283NHRv?=
 =?us-ascii?Q?//8snJ18yN7/szyzUE//Qb6phpCTO9ZVhBA3H2v0YS2dbyPszVGsjOvH2LNk?=
 =?us-ascii?Q?ECS1TxUytglseFt4FRmF2chVk5fxTLN9wL5OQx4pyiNriv/xBSBLKClvWnLg?=
 =?us-ascii?Q?V75fmGFMAFhXgxRDgHZoYOUuG1g59SA6rinLFTJS1HaC7//alqKBKP4o0ory?=
 =?us-ascii?Q?+AuBY8VBWpIzPSxInp0c+e2J1s+38O620Vrs2nEzg/hB+Lbvmm4iDgMmEGXb?=
 =?us-ascii?Q?oKP2CN4nr5wtVwbCkaVO24KDgfRUM97t+3lYe98YaG5k5VeGxTUUiCA1pk/M?=
 =?us-ascii?Q?wACIGFYpUdVPTMFS0JFNUwhA1JiMQDxyZCnjIwTsu8i9ca7tuY8gU0FDAQ5X?=
 =?us-ascii?Q?vX9do282JgCbHEtcVWKu5W6/s5kG0exJasWg3hDslN5CvKEXS7ybfZ1j15YV?=
 =?us-ascii?Q?io4Km7zPyPxZtoiaJ7IKGt5ynX8Cc5T+Og1YeZ6htAxuE8i2jMuxf209gfnt?=
 =?us-ascii?Q?z6ugpms4fmybZeYI7j6N/wgU11oyx1JwWTkcZnvUX8MZXpelbHNApFXtlGIK?=
 =?us-ascii?Q?q9KiKRlgEjKMZ9Vhj4PZYSV3rRSHwnkT4E6lQgclhCwVTtbPjOwz9NQ+EWzS?=
 =?us-ascii?Q?fvVt/jJGtbENuYd2wf2gTlOk2ZkTLdr1/lcvAF7L5a3dg6bNV+d+tam6YiCq?=
 =?us-ascii?Q?3neyXa3OZzMn5Gh9E3tRyZQDISqBzo6pBCG6p3sLiZ+T02Hw+bl443y7m0g4?=
 =?us-ascii?Q?/lbCHCgR0oEH77lmA76K/zcfd+FcqW3Ep5ExmU4yYgv7fDCVcm7zCusiChqh?=
 =?us-ascii?Q?aiYqZD5G0pmlqbN74ygQwd5zS45iP8QKG3uB4AER+4q3+TSWsCKirMLu1QAK?=
 =?us-ascii?Q?m5T9tnp5XO10m+Y/npJw2g68KFQmGGbXOdIItYSqYm7Voo5TjBzG5VH7y3UU?=
 =?us-ascii?Q?WW77Vjl5UwRTD1YuDstQcCWgJ+n+xDMqJmIb++q1YQ9ODdcUUzdjldcI/kY7?=
 =?us-ascii?Q?E9oVLeCp0gIPh7+ej8AAwqVwP8a0lNNKOBKkJIkxn1wuLsfZoS0N+4cEV5UD?=
 =?us-ascii?Q?CzC0Qr14D3unQj1JIDeNQoI0npDt6+Zw3eb6yiA0v+5QpJAq+l4uanF1scvi?=
 =?us-ascii?Q?0w+ytedWwa/l9yCvpCnkk5JJb8060y4evyW9zcsluKIBDBM9l7DHLgaAdcf5?=
 =?us-ascii?Q?1xFJRdoO0PVsYUfNWbZ448H3y5AjS2i7hGLuaa14hvfkdpzsdKtjjwNNbzaD?=
 =?us-ascii?Q?mjxmJak657cPPomh5q4fKvxW3KPUr4QTTjtE8lj3tm5NdaJbPndU9ShqjI9m?=
 =?us-ascii?Q?NhTbJJVXjRc+CtFHBrAmjaGN45ONaGfiqvLpyARrqiZyeUAYUD5AVGK7xv3o?=
 =?us-ascii?Q?0RNEy43hAD5j0n/v7r6kxevGP6UUWC6MV/tdXqEz/JaJRYVxbtSoa9h695EV?=
 =?us-ascii?Q?Yd93qnbsPCp4eyFOeMs/9m/RIyt5EUn9K4JfghXrakntbg4pqjNpHM4mt6HZ?=
 =?us-ascii?Q?gOMXLFySr9SWuzGfeU4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 05:50:28.6655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4babfe8a-f980-4738-6275-08de272f8b4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4722
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 05:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16791

meta-arago / na / 20251119052440.3800939-1-s-joshi

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
- Patch Series: [meta-arago][scarthgap/master][PATCH v2] packagegroup-arago=
-base: Add libp11 package
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Wed, 19 Nov 2025 10:54:40 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 49d5da8358d41e863456bba37b8475ba9=
9af8987

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

Patches
----------------------------------------
All patches applied

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap/master][PATCH v2] packagegroup-arago=
-base: Add libp11 package
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Wed, 19 Nov 2025 10:54:40 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 49d5da8358d41e863456bba37b8475ba9=
9af8987

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511180100
- Commit SHA: 82a437373896b01cd89d456dcc9cb28521b64ac7

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

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




