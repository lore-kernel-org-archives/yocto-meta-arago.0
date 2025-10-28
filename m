Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BCACCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:37:19 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.36])
 by mx.groups.io with SMTP id smtpd.web10.13446.1761662233112895520
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 07:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=J7E4QE/n;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.36, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqle4ZJh04jdlMVYmgRvPTVwzmXWSvU8GCJsWxdD8tF9ksWhMC4Oal9T/QRGIG2UAlnya7FGtc0hANbnNRCTGEnP7oC9+w2RJ3EAkOUiV60xmofciHMO/ho4Y+k9efaO8mrsO4c5t/IzophSuTs8mzpBJtjCdLeoER5lUKwaPgPAueeERi+KB+E4HXovphh2GHm3kakV2reBOlocG7JyeEwgTxz20vQUQhweVkQPunSRSPCC+BMoT8Xm7HwphNQyinr/Oj9I5BUFgFI0IoZnEb2LeopGaIyEx0wOHruOkOoK4z2Jf9dCfclXnchMFF5R2DBvn9KOgItZZI8nfWZNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1uX4UkSiq2Z+F2ByYnDRsjVQ3TG+OPwMb42+Mzpf7Q=;
 b=zOjd7BjpoX9vzpLPRCxB928fj7iliRuEq/c9xHHoLraq9VhrfVs2AuRP449FqBCLwTxV0BbU6Vb7im4wb8RMtV+oeipugyCoBvuSUvStvAaoyQqZsDT7GJEBY1iLo556thXS9PmnNl/z6NoUjUg7STQ0kN6PYserRb8mbq+r3FiSH31BUw+jF21/umFcDlwp1nZ6FyxLaJXeoGOB/9iwxJe5VCIRii0aR1vrAmvCdJ0V91pnhAy20zLdWDF7xWSNhAXhTLRFaTbySMK+sYAlmyFpSKbdj8q4204SdvWClGwzBq3OHhCVzi3UFlELZBLQPO25NpC8Zd1j3NSrOJrA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1uX4UkSiq2Z+F2ByYnDRsjVQ3TG+OPwMb42+Mzpf7Q=;
 b=J7E4QE/nUamGrjg82B1t8BUYTgaGh64dwKeepZKFs1RtPLg1qhGrHJpHt6V7kym151N7LH1aUOIE1JKx0KSFEGP5AJ4z3Jo9DvRBDG0QfORjZtVhrV84/Bq1JE7HoanplTm8bt4pEE+Oq0+ClE8V4Eg8m7QFcmC3TjdwhJVgCg8=
Received: from SA0PR11CA0116.namprd11.prod.outlook.com (2603:10b6:806:d1::31)
 by SN7PR10MB6406.namprd10.prod.outlook.com (2603:10b6:806:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 14:37:09 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:d1:cafe::f9) by SA0PR11CA0116.outlook.office365.com
 (2603:10b6:806:d1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 14:37:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 14:37:07 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 09:37:05 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 09:37:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 09:37:05 -0500
Received: from sneezy (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SEb5w42481428;
	Tue, 28 Oct 2025 09:37:05 -0500
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vDkoq-0004BC-4G; Tue, 28 Oct 2025 09:37:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] opencl-*: Cleanup bbappend guards
Date: Tue, 28 Oct 2025 09:37:03 -0500
Message-ID: <20251028143703.16027-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SN7PR10MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d08996-928d-457e-ff70-08de162f7879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34070700014|34020700016|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8/nBysCeJeGXcwodb+E988i9QW3O0FryIi6awiOIFHD4KTBapvExuX0gN/Si?=
 =?us-ascii?Q?pfIJvO5aBdwZn0oLpaSrljFtgTGRlIwPHTaIpq7wZXEQmUFmN4lfP484kRhO?=
 =?us-ascii?Q?WF5VBtoAe40ZQNxZWsV0QzmMaC8XUL4YUOa3hfwR7ri8gc+jk8pk4nnHGJ1T?=
 =?us-ascii?Q?0bih2BJ8INxwQooZuKldzYHecgw0ilsDIu4vd1yx0Qsk2tewl8GtXyl4ykQj?=
 =?us-ascii?Q?WdJKtQr2sIcAwL8kMM482l535Jlx6QVt/zILb2ufujF5JHzy/A/rKlV6DzwD?=
 =?us-ascii?Q?/GD81yyHYTy7L5O7OfOTER6wkqvMlLwQTmw5dP3O6xLfL1zl6kQatd5+BxXh?=
 =?us-ascii?Q?zwpGXDqlC1pN7qvgBnvMeeUU19qoJawHPSRoh76pAMgml00g234tz1jOIMlO?=
 =?us-ascii?Q?HTTD2GjOVeuVOBGbjz9lqpyxaEdTGlESycbez7eh8AeKagKSOK5gPgWz2vV6?=
 =?us-ascii?Q?4Ak0Q18ymux8diVyqjZW2kE85OZWAxj2y8eaAfHW5j6ReZzCHsDC4h2nBZbG?=
 =?us-ascii?Q?XLntwoYEGVL4HgxL+I3cNb472skerWqSZHu/iN4Rmg5ij5CXLnNIvhaJv8gm?=
 =?us-ascii?Q?a8wfIi++YU9txK8dibozHgEW+GaFWybxNhATQ5LR7yXVXdTkIv3oqVfksF3F?=
 =?us-ascii?Q?j6KKT0GKrM62GEyMkh9fJDTj6KpRuTr4acECYGdKLC8xTsIu0snE3Wzm3ERQ?=
 =?us-ascii?Q?d/eYwMsFOT+5IgR8VxNKT0N0QuZtlIxdlu/vrJ22UnhW62b7fU2M1lmEE5YY?=
 =?us-ascii?Q?yISOX8ty+CsMYRMARQPlHdaBA+qfvNy0DyFEzZQHAJwu3+ErWFF/Kd1fk1Cp?=
 =?us-ascii?Q?/lOwBbr/bu4ewy2aaSDmeDoPQ4Y/Ny7h93RbW8vJ2QvaDgFavzNuKci7OHDW?=
 =?us-ascii?Q?CQs0wivhx4azjo/xt0fr8Vt3rZ4CVAUER36pEh7zeiFQ6vvs9BwvZiDa8xrE?=
 =?us-ascii?Q?ReyCXZ3hrUcgIg0EP2gSHohsOeYv0RBgn6JEogpLVdR+wTqHu3Rf1/Ky8X2o?=
 =?us-ascii?Q?JBqhdZBVlTZrxKZIBwwtUrgVSbgkj56oHI2IhJwicXDNEdh4b1T9p0EAFbeT?=
 =?us-ascii?Q?b1FYIC2jrVZ0pCh6K2Fa7P/dAKAXPDgcFXhcXsAJJiGcPyy4u5D0ObUbcLKF?=
 =?us-ascii?Q?6fHJ7hN3uqX9j6Ezh5nMTpbe2HmJ8tkuOEiSdv74CEYiQ5N6cA8REd+yzndE?=
 =?us-ascii?Q?J/G11Eqb8o8QLypPPcBXJS7cW6pf7M38ZrpkJck33VT05NSEJYIbaRG7YxGd?=
 =?us-ascii?Q?gO+mG172FSybj3ihJbNkoK5o6CiHO/O9eYqtJwwaTorQzB6GhCalnvFNBtx/?=
 =?us-ascii?Q?Ninx1HlexO18zwMQF/kU6R2QNzOQTwm/1LZrNm8YvZh84C6muJ2WNIQwXAv1?=
 =?us-ascii?Q?GvtkuywuprgWJF7VMo1hoRXXScav11XiaxY1r6+xUIfYeFJQmUSGuFCVIhV/?=
 =?us-ascii?Q?19mP26PpE8kXs2xISm7y9uKIBpzEzW6GZINs4IcCewK4ieAFGv7Y6jeYB10b?=
 =?us-ascii?Q?35jPOdZoK51iwx9BSkWhZqcSJ2nsMVAViVUSLqBfl02R0W4KigHQVapeejct?=
 =?us-ascii?Q?TohyB6VeB8lLYRatzL0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34070700014)(34020700016)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:37:07.2985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d08996-928d-457e-ff70-08de162f7879
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6406
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Oct 2025 14:37:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16710

Enforce a standard where the include file name should match the recipe
name.  In this case, _ was used instead of - in the include file name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../opencl/{opencl_clhpp-ti.inc => opencl-clhpp-ti.inc}         | 0
 meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend | 2 +-
 .../opencl/{opencl_headers-ti.inc => opencl-headers-ti.inc}     | 0
 .../recipes-extended/opencl/opencl-headers_%.bbappend           | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-test/recipes-extended/opencl/{opencl_clhpp-ti.inc => opencl-clhpp-ti.inc} (100%)
 rename meta-arago-test/recipes-extended/opencl/{opencl_headers-ti.inc => opencl-headers-ti.inc} (100%)

diff --git a/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl-clhpp-ti.inc
similarity index 100%
rename from meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
rename to meta-arago-test/recipes-extended/opencl/opencl-clhpp-ti.inc
diff --git a/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
index 6e486f4c..0ed8bf36 100644
--- a/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
+++ b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
@@ -1,4 +1,4 @@
 OPENCL_HEADERS_TI = ""
-OPENCL_HEADERS_TI:ti-soc = "opencl_clhpp-ti.inc"
+OPENCL_HEADERS_TI:ti-soc = "${BPN}-ti.inc"
 
 require ${OPENCL_HEADERS_TI}
diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl-headers-ti.inc
similarity index 100%
rename from meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
rename to meta-arago-test/recipes-extended/opencl/opencl-headers-ti.inc
diff --git a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
index c890ecb7..0ed8bf36 100644
--- a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
+++ b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
@@ -1,4 +1,4 @@
 OPENCL_HEADERS_TI = ""
-OPENCL_HEADERS_TI:ti-soc = "opencl_headers-ti.inc"
+OPENCL_HEADERS_TI:ti-soc = "${BPN}-ti.inc"
 
 require ${OPENCL_HEADERS_TI}
-- 
2.17.1


