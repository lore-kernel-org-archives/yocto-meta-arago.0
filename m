Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7B2CDB467
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5624.1763074226600929642
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Hax0v+4Z;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.69, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lk7wJ4kPR0wQXX1/zJg2H2xlSQJoUZX4FYdeMFY7bSqnMxBDpBJO2Bewx1uAuDcDQPfr8PBCfKGC9IVEX4uUZsad5ZYJPgf3Jg38Ctu89geNr8at/sky8huzSeWEyTTo2nT/cvGCWFk3TyeLboo9eLBCuoeu5Lr9X1zBESQxjLiwe9Ywze7W2IIfYyCEzT95ksR/IV9cDt5FCEfr4/pZIp+91ul7NPRg5FTG4nc/XYewOYoZPTHgOoNK6qFzT9AVHFQFBdCW+ugWYs0QO65pNdIWwi/TM+qLDVxahD5iMHHMeauEuyGFKSlEqPuaKG1S3kN6EK8D0ifqM7sTi//d+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51GuG9UkQsmf79YpERAxd5TECWCQ3QfaMn7irFdW8dE=;
 b=XWUaYb/wG+xam4upGDEEou85XKMIFk0lS9R8rJAUv6AHtF57BEBwVSNatwRKJM6ViLSdl5ZH968JVlPSxPjXUOJHR2/bljdl93qC7LLmOeoUI7JaZCN7jTYVj0j5fSKO0FLgQ92DKm1oe/fxA/QNvHz/kz8ID6TTSO+VSOvCBEocY4z4+Y7qFJD1ls3NCXKwaffHnioE0S7ELBdD16QG1Gg/boq/cqAL6B7tH42AfSZ6AyoXxwKeCyzxiQuDki6K8LR6tG3gY5uTS+xtjZV72ENnnr4ZHD+WSdMjSsWvvAriIusozpmdfYqsduTPktmD6rnQUzsqKYFBKq6ok6P1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51GuG9UkQsmf79YpERAxd5TECWCQ3QfaMn7irFdW8dE=;
 b=Hax0v+4Za7AqYZv9fKjgLlucU6jLuowhhZBN+YgzS0ZzqJFaLdTzSL6ZwtymKYd5dZ9PJncno7cIUOfex6eG7/N8Ior3D3k984hRL2jz5EZRN1CZ8GcAfXZAEBaV6WbdjdPLTVJLDOGVm83dvOMrCKgIP+JMa+hs4WFnS1U+Ptk=
Received: from DM6PR02CA0042.namprd02.prod.outlook.com (2603:10b6:5:177::19)
 by BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 22:50:22 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::3) by DM6PR02CA0042.outlook.office365.com
 (2603:10b6:5:177::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 22:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:20 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:17 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoH9A976584;
	Thu, 13 Nov 2025 16:50:17 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8v-0005zq-Na; Thu, 13 Nov 2025 16:50:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 03/10]  packagegroup-arago-tisdk-graphics*: Add DISTRO_FEATURE check for some packages
Date: Thu, 13 Nov 2025 16:50:10 -0600
Message-ID: <20251113225017.22994-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|BLAPR10MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 7251b10c-20a8-474a-babc-08de2307062f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8nLOBIRwZHVGyzrGdZgqV1YdqquDDgC6jGjJbm1e75gfh5TXgQP3bhndHAQP?=
 =?us-ascii?Q?vX9TDz7xTACjEbd2peBTfBs0l+ZymkBOL8bdPnwFFhB0dn5qWi1+XnB8+31V?=
 =?us-ascii?Q?kJtHDq66x17wXobIz+bEMxDdnr7di6GUu/BGoYtoQkY8BDXkeir7leSDUfcp?=
 =?us-ascii?Q?PoxMVVAYwoavXIGDsOWNz/lNLsCOVlUujCruQWROEGZ26cpLRgNZQ3UHniEZ?=
 =?us-ascii?Q?D3Xxod0z8RbquqEuSTqwM+O5v8KWvcfsaRzmSAtvNs1q5PvEKKhszP/VbJ1j?=
 =?us-ascii?Q?WqhKbfYz/j06bZf+LhU2DFIX+6DzuKqqu5wwzUiTS/IIfMeowdES5VKD1xWn?=
 =?us-ascii?Q?QTgwH7mQa/PWVWcmem0iezXc+eXY2FF+a31elPlg6X6CemZlh/xFi0WqLP1y?=
 =?us-ascii?Q?zn6IqHRcuja8Nco/Q4hSuv9/UGn7AwKptiJ7awK2U8vnZtdzQY1dFFnrBd5H?=
 =?us-ascii?Q?bYyDglspOneH6vLiXEmr8zuX7o2SGDZJQ4AxgtBRTTIhmhgb8c2o6TsHWccH?=
 =?us-ascii?Q?1S0LXT2AbzlybeCaYPesyUdXjrr7dkcgApt7+ZXU586GKukgGFSm4bMQpIVr?=
 =?us-ascii?Q?dzT+8ccaZ4JTZpj8lkB/BqnlDq5oAN9jDlCr+geEP/Zvy67Id8UGVUzam55e?=
 =?us-ascii?Q?6ZoGBT/4p34tQuGvA/2SiWg/q+WZXMJLE7rw9dVRBKtNCMq3Hv4/ryUoOoI3?=
 =?us-ascii?Q?QVQKesc1xoCCeoSCToeMapQIg21oUE9R1QpRVeyCeW/ndxuEvo3y66b3MDMr?=
 =?us-ascii?Q?fpRTLwvuKxYjQ+lHMjlpRUadg2VQpdqd8HZikWbCowZ/3viAbpnuHNwTNTzv?=
 =?us-ascii?Q?pVt2oucLYpXYKED4UGtZZvVAuDVp+/bXMJaErHUxLtYs8d+HZCytZUJjCLxq?=
 =?us-ascii?Q?ps7ay0VtLBzDRJ8PIsCvcOIDvMZlWBYsWNmMuGJ0ySGGANJnuxvT7s5B7wg3?=
 =?us-ascii?Q?LtL8INQjiPgXicxcHS1UXsZlAR9Pv/ZpIP5GmdcxqF3rA5IiIzLbQ8xZSMkU?=
 =?us-ascii?Q?mqqD0DWu5qsKQIGS7Z6b6lYSwKiGrpj1RO84A1cwS0HmBnCA0AKaaSoSM6IB?=
 =?us-ascii?Q?AhNYZre5X6GWV6+waHU4tpliHhnazFwhUxvQClxA49g7e409nAtT1L9nzwlW?=
 =?us-ascii?Q?yi/QZkqtdPDXzyL3MzKFzN8qhqRu7vSi7EJko5LjBYku3tJuFvBos+ImYAKQ?=
 =?us-ascii?Q?NzjSXuOmnjGmuQ70tK+9YP+S5zsvsaTdwV1fEcOy10DbGxHzQQ/OK2RJ9OHX?=
 =?us-ascii?Q?af+ElkoWOo7qODI23g0pFhd0qAgPNnlyTLYnscITJkOaxh30hBRNjOYYORsH?=
 =?us-ascii?Q?Ahcx+BI77BuJbAC9pezBn5CEN4sMsMkK58mv7H8FHQmdj4YVXtkTa+gNA2rL?=
 =?us-ascii?Q?Pvw8dp56cvnjuSJECQhCKG3HnmJx8/JgyJdtfcLRVNRlKdwTwXyD/VaRmZD1?=
 =?us-ascii?Q?FLyqj1e+80RRwpAGBXVEx3TzDymZxwLaJ/iLrrigAobYWZzieHCkbKQecLGX?=
 =?us-ascii?Q?7DOTUNvBxeYkEhVzUumDCTRL67ZvCRwhFAldLtlBCAevWuQNxgETefaZrnQ+?=
 =?us-ascii?Q?pk1qHQPhxoXT7JcJsDY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:20.7783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7251b10c-20a8-474a-babc-08de2307062f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5075
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16758

Create new variables to group packages that depends on "opengl".  Then
add a DISTRO_FEATURE check to include the new variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 14 +++++++++++---
 .../packagegroup-arago-tisdk-graphics.bb           |  8 ++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 4e792845..c0ab3a28 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -6,18 +6,26 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-RDEPENDS:${PN} = "\
+OPENGL_DEV = "\
     libegl-dev \
     libgl-dev \
     libgles1-dev \
     libgles2-dev \
     libgles3-dev \
-    libdrm-dev \
+"
+
+WAYLAND_DEV = "\
     wayland-dev \
     weston-dev \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
+"
+
+RDEPENDS:${PN} = "\
+    libdrm-dev \
     libsdl2-dev \
     ktx-software-dev \
     nlohmann-json-dev \
     stb-dev \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_DEV}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${WAYLAND_DEV}', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index fc1a5be3..deb3bb71 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -11,10 +11,14 @@ GFX_WAYLAND = "\
     weston-examples \
 "
 
-RDEPENDS:${PN} = "\
+OPENGL_PKGS = "\
     libegl \
     glmark2 \
     kmscube \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
+"
+
+RDEPENDS:${PN} = "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', "${OPENGL_PKGS}", '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
 "
-- 
2.17.1


