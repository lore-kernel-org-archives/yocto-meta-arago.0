Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D71CF2584
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 05:25:14 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72.1763529902728265451
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 21:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=D/CX+qkM;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.209.4, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf38WbceXebg6R6XVCvLbASHe8ZvPUqEpzBf/KhBPcaseTkMChAaVO7Ux8omQz+Z0Ni630hBeCM3g0jPCE30/MgSPE/qQ4lvkcSaFc0G6Bs5EQZnGfbmBI9m/SsvgnQnPeZvw5s8ntENK9TXMlvxpPGBunIwK3oj2XHK0JQE9Xs5YwLOgnzWvzlRXoqJpjlJ564vevfaCJoDZrG27MJs2WMret6wgmsTFhVLLixEM1PakImaKxhq4Tef57He1Y2vl+wBbrLP6KNuNxklXokXG9WuJRFpSjHVQYFx4OLz/h4mkUJmL62yYmU2xQk4zbvrQEfQNHMIm9IRDnOW3s6Tpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwhZgc+Jkpf0qHT55WBRfVyQFw/2fezCw0TeIo8tMWw=;
 b=E/RYmJRrTEDiy7Rsj9ZHOXqZa1WSk+oR3ZZndbnB10RkXBzuq1mZOhcO8LbDYtBA7/zvHlqGr2yDOH27LqQvipvfQpUuoWZIL+0/h8BR4YRmkxZimnnZhkZBlJ/hOIudnaFJVlStNVxbbIQzkzl1qZPWkvamnOoUZL4DAtxuCVKXvFk4ZAmiWtZCHnyr+1bPEPs/9D+/taljv1XSd0zgqJBzqi72+DhdDtFlR/K4Ma69UCls18yMkWNbQum0oc0d83vuiJNBWoZi4RETu1cpYKADqcvBQ/h3zXpKt8P1svD7GHAvuw2Z63ojjmQqNo6I+SI31i3uNz5LjR4+/LnyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwhZgc+Jkpf0qHT55WBRfVyQFw/2fezCw0TeIo8tMWw=;
 b=D/CX+qkM2BR65haxewGSi8mM3lN3uYNH+wyrqfDgxVSs9G60KFVI0nBNuaGccAQiW/lP9G08aQjdY1nQYsF8c1iMCkz7afKe8NRAvsH+/CJgxqg7hquDE9SfaM5tcwzBLCLDA3s0giYIPkEFoVI4v77FMwMPP9Y7lpV7WtivUGY=
Received: from PH7P220CA0138.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::31)
 by MN6PR10MB7491.namprd10.prod.outlook.com (2603:10b6:208:47c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 05:24:59 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::98) by PH7P220CA0138.outlook.office365.com
 (2603:10b6:510:327::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 05:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 05:24:57 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 23:24:56 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 23:24:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 23:24:56 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ5OsBT1328107;
	Tue, 18 Nov 2025 23:24:55 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <s-tripathi1@ti.com>, <k-malarvizhi@ti.com>,
	<denys@denix.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2] packagegroup-arago-base: Add libp11 package
Date: Wed, 19 Nov 2025 10:54:40 +0530
Message-ID: <20251119052440.3800939-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|MN6PR10MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a79e17e-1ec0-46dc-bfbc-08de272bfad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hpMpXnsnhNYkZhfESaCqZPiWfuuL9FFcBtADlw1kUJ6lRfu+zrroiR2x0YQ6?=
 =?us-ascii?Q?9kpDcyQNz6apCfpNUhxvk/FXluhZA9YvlqsRS/B+Ixb5wiDvrP8eZSfmWL/8?=
 =?us-ascii?Q?vLSiCUnHf53D8IFZMXliBnMup5xD2q0uSgPCg9Xa4Ic5dfyIb+S8q+DDk+mm?=
 =?us-ascii?Q?ZC6l0gi51hdWhq7UUB3xv/SXQOdXP3Oa1uoZYT+zFhIS8KfRL8dSDIFgqtkA?=
 =?us-ascii?Q?KZ/am+/BiO6zKbne6Gk3dufNJtjPvNgYQxCcUbeNb/lxMbTyQvIeAGEgFecM?=
 =?us-ascii?Q?gN1Av1jhwJyH/YAE1jOUlem6++5Gz6ip5fOB8J5HwD5G/UiBw5F/2oqWpgc0?=
 =?us-ascii?Q?uXEOW5LLVO8hVQbbHHUL5ExsoA6at68CYBpR4dy9vQpLK919TO/J3RB2Y6hS?=
 =?us-ascii?Q?gDW/4JfWqJZEwMP5YpwT/+/lH+RVDGCX/ssgYYW5GdJ3y2DgjD576wPb/TrE?=
 =?us-ascii?Q?GDNuw710jiNNIWy0sbl/HfjbXgB+2EDgdUL3iRBGjSuhHJBimtVvBiV0vkrb?=
 =?us-ascii?Q?xcv4nN3rLsYNNICqgXSO+UoghcbNWecVXesdTFg6TJPu8o8drAA8SqLCFkjp?=
 =?us-ascii?Q?TpZn3filI1RFopOyn/UdUoil7MfQweoHtbzMwA4vNLA4lpIYeJP0KZ+hNWRn?=
 =?us-ascii?Q?pQQvBYAO2lJC72mjJtL+HIZh/EATYVNa+TA3xYG4IeMprOZ3mpbVuKj7PDvy?=
 =?us-ascii?Q?HNyQv9zUxsPkg8s0HAXAnq5XZ23Bj8IxHSP62a53T5SiEQvxZng28PxQO+Ud?=
 =?us-ascii?Q?MD2m4ie+XuTq+J0w0fezss/rP8rqn1yIZd4klREU6neDfrLuDpn8QUM1bHHZ?=
 =?us-ascii?Q?XsKEFGOVli7OT7vSMUWjEMS8gPTpYWresPMZwLuNHXxAitoJrA52AaT3w9bz?=
 =?us-ascii?Q?qOPfVgycHlKU3bl1aqg1ljfbgy8ZKJHIJVQc61AkIl0r9spgHNJ/wrIVoJ7d?=
 =?us-ascii?Q?OLdD/h5kuj3kRik6f4x3Oj0qXMiVqV8Hglu8f1mt0lGD1BYXC+NmD+Fg6+5g?=
 =?us-ascii?Q?xYpV08wJEMU0riutYsxRcbFXyKTAwcetss1yStzG+VJjCwZaNKcG8fmQMGmq?=
 =?us-ascii?Q?DQQFN6glUiMaXgjeCU4xiCnRZlR0eSyIKT48VhrxoPK1nAXysXJCp2BBg4sW?=
 =?us-ascii?Q?fhY8f9FK5Lwxs7lxryIAzhzvQug15lGnsetezrj7InVeAd+W//u0X1h2SAFE?=
 =?us-ascii?Q?DOmTYlQNYrwVtN9prg3SftfBndEo5rGYEOwwQmCxX0INwwQlLVGINMrWu+y9?=
 =?us-ascii?Q?G6WFikN+ryfGPtwtRrrZdJ46+DNmudDOJygd022MW6GK5flCzPJA5NMLR+13?=
 =?us-ascii?Q?yA5ZMHiRk46djd+ZoFtb84nXHwuTIQj5cmH5EJmheSNGnEIdS+BLmE64S9In?=
 =?us-ascii?Q?Os5Q8DOLCfQYoj3B3ggbJnGHwKZysAyX1ellNe+SMVUcj2pIubF7UPiAAvc5?=
 =?us-ascii?Q?IBXnU3vNYkDo4V5l/U0nhg1L2P+VVwfXXMI0URIl6m3UnarZyBtTOwXLfnV3?=
 =?us-ascii?Q?w5A5O8pGZDzWgEjcCyBPr8ZVZTDXxm6005k/?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 05:24:57.8008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a79e17e-1ec0-46dc-bfbc-08de272bfad1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7491
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 05:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16790

Add libp11 library to packagegroup-arago-base. This library provides the
pkcs11.so engine, which OpenSSL uses for its PKCS#11-related operations.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
v1 -> v2:
* Change subject line to not include meta-<layer>
* v1: https://lore.kernel.org/yocto-meta-arago/20251118192005.GF3125@denix.=
org/T/#t
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index 5cb4e30c..f0f5b66c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -49,6 +49,7 @@ ARAGO_EXTRA =3D "\
     cifs-utils \
     phytool \
     lldpd \
+    libp11 \
 "
=20
 ARAGO_EXTRA:append:arago =3D "\
--=20
2.34.1


