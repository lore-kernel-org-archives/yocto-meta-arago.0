Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E721CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:07:47 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13292.1762358865414797493
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 08:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=kDkQl8k+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un8eCT1KB7RY60ffpLHcVA3QZgQx4Oa5KTVd0BlqWryraMy8gnPr4T9qTkGMhGbTglp53z6V+IUCPqssADeHf2MCdqCVUM5TWVqGa1id9/pQXo914uon+VJP21OHJQ8Ol+yDAaHlyTXHtKEr/vTv1ayYNPZ+JtjBVPhiacFGGK983yvzUBkM9R2iSTKwNaM2xtiSJscb1uFimSktRqb0GsKCmnCf/lWrl2ejp9Oja7QoCD29jGdkBO/pLRtT9yfbTiX1xgXzJt/Mqn8l21dESxy0Qc+X77NEuq9DJaTVwAfAKmRDgLML7ah3yvFOjBNEMsZdqhZB5u4tMQDC6I9xEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxXZR4ISKGaP+XgwdQMO4gUjjZguJXPPl07HG3wGwKA=;
 b=ZA/McPgc6z9ICH2FL9GfD3EgCHW2iL9wfBWYzuJxe4YoCtc5fGyB1+YiyAI4XX2jotUzDEEqGjeFnesOu2zuzWULy5nY3gHBrPbre2GeM0E/FoD2xN2PIHSGerM0SHRCVBiA/9aoc0G05xcp0bz3W+dZleEgDe5B1sgqN03toeyD365bEZNSnm8mIQ4Y9yUOVd0PRvy7yn8ftvvAST+RPPE8KHNXKdZIWl3YUl1stwSuxmxXFxS4hksAS1QFVGcQ3iow0nbrNENBJidC1Sb0cuEiZwiRRd+XXl/W99JcPbfq/8cMRGZXIfNtmuhAParvxMG3dTb2USw7WWylL6qmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxXZR4ISKGaP+XgwdQMO4gUjjZguJXPPl07HG3wGwKA=;
 b=kDkQl8k+vUjsa3MYQ8HjZcYg8hBQKPHI6n5qARfKNpwWvEaY81Yzncwg28lXo8zfjA3CyKjSoiFsoL3E4pa+GKZJ+Spvr8KK+o/L1Kk1EkKw/C7W1+Ru9N4PZItyJ6hBiACvgL8PHghN4jvONf7SstrgVCDpu7EpLvELouYjZ1U=
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by LV0PR10MB997661.namprd10.prod.outlook.com (2603:10b6:408:343::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 16:07:43 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::eb) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 16:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Wed, 5 Nov 2025 16:07:42 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 10:07:35 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5G7Z4n3930671;
	Wed, 5 Nov 2025 10:07:35 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vGg2p-0006Hr-BW; Wed, 05 Nov 2025 10:07:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/3] ti-test: Gate some of the packages behind DISTRO_FEATURE check
Date: Wed, 5 Nov 2025 10:07:34 -0600
Message-ID: <20251105160735.24123-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251105160735.24123-1-reatmon@ti.com>
References: <20251105160735.24123-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|LV0PR10MB997661:EE_
X-MS-Office365-Filtering-Correlation-Id: b660984b-7221-475e-8ea9-08de1c85735c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HDCVyVoGpBIlx2WqBqrAWsY1fBPLo0b4uyPnXRdt4OO6+BFqme8Jq9h8fL6y?=
 =?us-ascii?Q?jeMrvr8A+fA3Ge8IeNAe6RP3UbO3zIg2J4WI1sLP48J1azaZW9qo8OY47IdA?=
 =?us-ascii?Q?XOErpHUkEVVnHbb1GEKdiVeSiY1g3cupNvhq2vHox27sS8wesKBgz1ZWZkpp?=
 =?us-ascii?Q?QvvbgRwiWlCE3caRd28dB4JL2NbigxFj6YmU44ocad1SusgMOWoNKjBrH21g?=
 =?us-ascii?Q?3Ey+K6YYBCO3n7spzgZVoZa7NlURPWgbmXCSKOjAkftgIoFBO3lcxq0YZacx?=
 =?us-ascii?Q?4fXNCiH4kU6/D8gPf42H9vkGULcUV9IzOXS3DF/6io8UTtDnca0HpzuidUzL?=
 =?us-ascii?Q?/4CzdjALKzEp1qk752tdq5S+TmrM5hHlsFPkT/F5rz/OnnyIi0Rtyarjy1Zl?=
 =?us-ascii?Q?DkCzq7E+VO9nSMtfJ4i1oCpdwT+CDEyljyjcf2n+4//3eitfMKsN2cVYxkxM?=
 =?us-ascii?Q?bTw6Aswbzx0f/wLhr5XiKIWp0Iv04XJ/RcgIgWwjNHoeiXlxXxGGDe+0vVpP?=
 =?us-ascii?Q?H/7Bv7YU8yTe/7SomXk//kqtXSrA0/EoXCr4Q8Qi4+rfwBsOOzUiMKVX71md?=
 =?us-ascii?Q?D8VmaLvDKEHpjKVGYc3lTqsPQrGL/YxNHY6FbgBO1rpoovt03hwywMhkKoDj?=
 =?us-ascii?Q?sJlibXrmfTVB5L5ZlS22erqHjjlTXXs28y2FunHLnZdGA6eT22Kp3X1rzUaF?=
 =?us-ascii?Q?TpSArg9MrjOfrPeSDrGXoGe+T26WUO5ogNP3I6BOX+Glk3T4DvemG9riuemw?=
 =?us-ascii?Q?6xOoO0bSt9MImFbzI4UeghebKYWd8Hj6P08vQOaaQ/UrjXbIec2sj7R9Jnpl?=
 =?us-ascii?Q?dlhHCblkuoqC0ES39buWIHyKqjnLU63BplyQWvPnVL5ZWUnsWn8trQQEwDcK?=
 =?us-ascii?Q?9zwKWvHCRHR3qEnjTKk/J0hbRBgqmzyQ25Sz+2ac4KJZUS5LTJ+grxNYhE1I?=
 =?us-ascii?Q?/gr3+RVp49PJwreFrquBBrCMiOdR6kw2tWUoWUmEq0WXJG4CwOw0No4y5qud?=
 =?us-ascii?Q?Q/wq1WdDwRv4FbZ2HOEYWNDjkmnPZkD5tnGqpnbujQHFa/hp9jw8kcF64qdW?=
 =?us-ascii?Q?AOWB+23BymItuW9P0GurdYQGB9/uZEB6W9c1eREkd2xEAD07rxkEKwJkgbNO?=
 =?us-ascii?Q?H/sT12tk8XtLTaHU55czbGg8BHfxFmShspVmvs6H7S02Qed5PZszbUXNVu/W?=
 =?us-ascii?Q?ANvSzJRMJBH1zmAjM6Tm7sY1w/iWpVVuI7H83/ITJBviN7V/8TuXiElxURbM?=
 =?us-ascii?Q?Y+h0W9YPCY1lRQ8ChbsKIJMX7+mXohEN5HDQLLZZXvarrqtf5U7AM5Kgxb52?=
 =?us-ascii?Q?3JJcFTYddjsXvBG4xHiZDky7g2xPV5YLTKtR2/PeD5Hur3FB+gHByruEo7F7?=
 =?us-ascii?Q?ZLJmhc3tUOMV6gDc5KqSn/mqNSDyiLtruA7bbdALH8PlStuULlUNKT7WG1b7?=
 =?us-ascii?Q?HsRKjHgtgysfo0op6OxbM+WW3H3lBhFZO9Kak8X5/1TqKJOYhSd539UMsuIC?=
 =?us-ascii?Q?50tr9ZYhNrA+QsKkYju8EOk6Fl6H7zWEAHw0prScrwuIujzqtdeN4F6mCOFV?=
 =?us-ascii?Q?B5CkzAglm9UnuCHfy2U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:07:42.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b660984b-7221-475e-8ea9-08de1c85735c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997661
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 16:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16724

Create two new variables to group packages that depends on "opengl" and
"opencl".  Then add a DISTRO_FEATURE check to include the new variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb          | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 03ec9063..cb779123 100644
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
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl-cts', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OPENGL}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
 "
 
 TI_TEST_BASE:append:armv7a = " \
-- 
2.17.1


