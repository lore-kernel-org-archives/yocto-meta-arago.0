Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864F0CD98F6
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5641.1763074230104478760
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vPiVrupm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.24, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwePWgy4OudAQO/GisL4XYVL5C1nBFgMMKLXlTWNFAAaJv/rHq4+TRBLgXBsV+H12qteKIA53qabPsv5M52TBj20q88gI9VE0H3qs3BFHxsjgrJnWmWIT4xPczXI3Ur4gozUgHlOtP4FSUQfb7gbVG9nOtBr34h4z/RKqnzyRezbxZ7i2j0JqQii2NwS7j2heLifUxWFRIBkMrunQHWvTz75s2Dwy9aCQYo7XfU/CtKlajLk2mVC6uQNCq3qnRDeIuAaly/xOPKjrQf75sUNr2aHXKNKCL/gBA7t/n1ufynpTQ8fZ6Dn0v0f7E0ZvUcVEpRXGxL8XMnwnISRScomJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch/JNEc8M5oen6sW8ljwwbslu9tuIuftmjZ1YcMTUj4=;
 b=DFXNTitJvcOukmFnrtTP7jK2rxDcE6I9Mxy12Nswj2ookR9tb8wRqt6tGasF8XYW0TO0p3t/BFVrF/lC33pYXADDdDl3SVIaImTOoGJ9dqY+74gtSQSqTFUOcDUdQLBugMDT/yL/eQBKv/DSXMPtBRXUXNhLBFdDfP7xJjemV5MTiNSvipQCXunitPDU4lHF+HH/UJRk3ko6xpIUr8rGwY08Ib5YfgCKrYPwlZYCzJcioSgWfZE08uHZLZGrl/YeT7n/tu2TfM7N5l4wed3kVeujw7wUDrE/9kljUhLZvnHZLUXOcXdLIT2NuT5Bfm/QWgoU0mHwQ8Cr0ghkbpSYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch/JNEc8M5oen6sW8ljwwbslu9tuIuftmjZ1YcMTUj4=;
 b=vPiVrupm4CRGCo1tspKUknvIOL2u4txI738rPta+5lwUVbl61lKdcig2G++4BG1IdYlXrOm7xaZOtuUKvWvwlWaYszcS4lrn1uJv8SU7MJTmfCDYh0pLu8mUEVAmN/H5tqESRo8qMO20Pf2lsWNW1yNPby3il7we11DGvAGeKyo=
Received: from MN2PR18CA0018.namprd18.prod.outlook.com (2603:10b6:208:23c::23)
 by DS4PPF751CD7230.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:27 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::1f) by MN2PR18CA0018.outlook.office365.com
 (2603:10b6:208:23c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:17 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoHH31018038;
	Thu, 13 Nov 2025 16:50:17 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8v-0005zk-Jl; Thu, 13 Nov 2025 16:50:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 02/10] ti-test: Gate some of the packages behind DISTRO_FEATURE check
Date: Thu, 13 Nov 2025 16:50:09 -0600
Message-ID: <20251113225017.22994-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS4PPF751CD7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 7804396c-6962-4045-e252-08de23070797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NaH9US5IRWXM755yIaWNeJNR5IT3FO71BXmYz1sqfyFtluza7H8cSTKEeoEa?=
 =?us-ascii?Q?FdV0QUg63M0Yra1IwVQxOrLCcODJ2IBOGb1Jj7ORY+M6gEzCbmVHOiZdTmvX?=
 =?us-ascii?Q?NUQZ3tvwHHeMeC7l+GB8ni53t7re5rw3RZwZxcpLOFAbidW3sy7Mj7gbz0zF?=
 =?us-ascii?Q?OxgPVgoAj9yG+bYrAjqaH6BS10Ev6jMTt+FJj/dMED+rH3d+Gt2dplUiRJKI?=
 =?us-ascii?Q?5o7kAe8Ea1lZrx7XaC69BANyLfEi3yrjHuYAKUColIa7UaNfbnA1FcKeoqf3?=
 =?us-ascii?Q?LcmejwIk7HF8tXsx07qpQ5hO8Dj8d/FxFvM0pCdQTm6JYXKmYpM3s5wCvqj3?=
 =?us-ascii?Q?C9t/Et3cQ+u2FNJhrkdxUqvcEMlxx7QM9F62xwighFm6QcjSxOXKPooh/dhF?=
 =?us-ascii?Q?7BmOuxOR/v2TYlGXftskF+RLJ0Q7SlPnBeMQI8URaRTbDjvYqYxyUPc/73yE?=
 =?us-ascii?Q?RymRjlwPt8vQ+22IB4pisWEyP4x9WhEiHhe8OqqohxA1pIVu9+739NnV+YlP?=
 =?us-ascii?Q?eJf9IR9rnN48jKAKxfg+d/a05AttwqVl/MZ+aAzuRl3dr3aomrazRTberX+N?=
 =?us-ascii?Q?2cYORIy6dRqKLqVmCDmEO892tEu8qMcVHXRKPOfQ0/T+xh0yTL9FJ0O9GBqx?=
 =?us-ascii?Q?++5PeRkwM+yaFn3/0np2CKwZ48qYs2dOc3VZzSSEUhmi9+m1obS/S4UqZTXC?=
 =?us-ascii?Q?uwHw41rDXDPArIo1u21rV2hrq4JhbJ691kb0IyX4MYTmINkgOarXT+3L4ta4?=
 =?us-ascii?Q?3gLIT5nf5d1kcJeAhIJPY2UTAhyjDVEbVdwYXCmHFdIjd6ySyTkGv9iofamp?=
 =?us-ascii?Q?f0XMDXzrtA0O6kHZWM82623NbYl7mPNVuubdtoOQprW0RRyzdqdCYlMFrDVP?=
 =?us-ascii?Q?Ogga9WGVjhMSo/PGOFK3dh2J9w5G+JFVYXo2q1w5/1+pqFRIq/2OXcgBXbfN?=
 =?us-ascii?Q?WFcmFLxg9N/GCaLVyg4J991iZwlxaB6xRR4MtPnQ7Azb5rvqBhUTy4QK2wQr?=
 =?us-ascii?Q?d8DOvsZAXYS9ab6bZLa+Uc1+6IUASP1JXSP8Qr73cEhakXTOV0T1508nMS3v?=
 =?us-ascii?Q?RufpacCfKRTlhpD3CNo5QuPqcDD/K15geRuEUJjHaCOKiPJbUFNSIpDEfRlM?=
 =?us-ascii?Q?CQp9S4gFBFrsNFIPji8YqvN4/ntoQ/O2wYkWZ7TsqL14Z1yMgDUju8QQ0G29?=
 =?us-ascii?Q?AaER0JV+lpYLQvglJGQbVmj7roWZpzuoKKDikPt9kZl0oKxlH+/VdjIcfjs9?=
 =?us-ascii?Q?yDvgq5ohoy+mMY1ggbDjBovDCiQj9DR3ha2O8Qn9Sce/O4qi9nl8BF5mMt6s?=
 =?us-ascii?Q?fH9la87c7OZnkFzQPeCtf4rE+Tb8ie6UynCAdZG4FcxgDxdbFvwMfzweBULA?=
 =?us-ascii?Q?MQae+uEYwT9RnoifxJQwk8TCI5L1pZHDm6ohwIDpRGw69ABOe14KNRfDHVhY?=
 =?us-ascii?Q?ksrN9ddEqo2pApYv+wlRvpqGJh6fqMHfXPHgEDL2EK03x9ohGzevi4fqgUZB?=
 =?us-ascii?Q?nhZjDYmLOjV7Zcxb8Wd8Y304W7E5N2bu27zWjlrHUN2RBaziW+NFIcDOy/5H?=
 =?us-ascii?Q?ZmiR/k7xOkEULzRYdM8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:23.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7804396c-6962-4045-e252-08de23070797
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF751CD7230
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16762

Create two new variables to group packages that depends on "opengl" and
"opencl".  Then add a DISTRO_FEATURE check to include the new variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb          | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index c73f42f9..960e3c18 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -67,14 +67,22 @@ TI_TEST_BASE:append:ti-soc = " \
     mtd-utils-ubifs-tests \
 "
 
+TI_TEST_EXTRAS_OPENGL = " \
+    piglit \
+    offscreendemo \
+"
+
+TI_TEST_EXTRAS_OPENCL = " \
+    opencl-cts \
+"
+
 TI_TEST_EXTRAS = " \
     python3-pillow \
     pytesseract \
-    piglit \
     python3-numpy \
     wayland-utils \
-    offscreendemo \
-    opencl-cts \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OPENGL}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
 "
 
 TI_TEST_EXTRAS:append:ti-soc = " libsdl2-tests"
-- 
2.17.1


