Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4896CD61037
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 11:06:49 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8017.1769771204723483969
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 03:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OnayhfEf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.67, mailfrom: a-dutta@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKsDT7qqiWnnm+RHEgdvEGOw0PnOM9i1HkRdIoy2tv3tgpKQZH5rEuSEJJ13YVIDq+KEFEEjpb7hT+EzYpP4J9LHSd0LkuZAM/UxJT+37VvfUpoPTzGrUAba9J7Z4/9K+t1XDm3uzNUGMwhqaBSHAP4+Sj7XmCsY5yZoFVgPltyLDsx3PSZ9XOscCKK31JEyJBGmi488pZJw9ggl8/3rudig/aIxT6RaQUDbpud2JKXCHR4lYp9+9p+1jESlARjZT6t8xlxXi1gDK0WGnEiKSx0zah5Jkc9bP5ibKoCa1R+9f7bYTgHvWbYcRp3NsstNeEfbHre3DmGTMqd0QkVsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku4YGd3qiAzyo7RSMn0cDvSh43FslqydB63mh1B2xjs=;
 b=g2CEGviqSXI/i6vKC/V9iH557VQ/eyzeOIl6fwpYzmF9o09bjmjKFpeebT4oKqXpx4xyWck/jgu5DDWaRoHfWjlOu26O/2gKXWkm9HMucOaJMNNp8fL7tWK8cSR8khnvPxIl2mf/281y2whHVaqCqicYCCJms932zKIWCg9sJEdvl8H9YZkDrMS6bcxwIn0r4Vu3p+h7HP0PxU9fYWAyQxld2zUqdxCnM1WBso6WYZs9HR57zuU+fPm1y8EzAH2oTaPTrH7w9EBdmSSWPrOQKjb0zfkvsKmSDLkM/jPujCHbMR6d0UICmGfcCn2Q0cQOSPtQrEUymsgkhp3eAqhOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku4YGd3qiAzyo7RSMn0cDvSh43FslqydB63mh1B2xjs=;
 b=OnayhfEflpesRzLeAkoGPCB6G53kTS0jJyK0AIjgl1qq5mC7GOVxDY0QCXtTtaF/Pau/nlecgW495s2d6fhfqM/NtzlDUupfYg6ovW9ELv6H9NLPM/kEYo6FR5QR97VET8AUth6ScgPYtsUtUU8RvMTVq535p7eH+6Q7J1gtIUM=
Received: from CH2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:52::20)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 11:06:42 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::f) by CH2PR04CA0010.outlook.office365.com
 (2603:10b6:610:52::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 11:06:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:06:40 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:06:40 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:06:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:06:40 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.235.228])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UB6b2H1209988;
	Fri, 30 Jan 2026 05:06:38 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>
CC: <denis@denix.org>, <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>, <a-dutta@ti.com>
Subject: [meta-arago][master][PATCH] meta-arago-distro: recipes-core: udev: Remove MCAN rules from meta-arago-distro
Date: Fri, 30 Jan 2026 16:36:37 +0530
Message-ID: <20260130110637.2338476-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6b0a92-4a36-47b0-76eb-08de5fefa563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YzFZk9TqcE+y9W9H2VR1XyHxUjQ5FP4HUIWCpssfcd4sbhdM/3shxwRe04/D?=
 =?us-ascii?Q?AXUhbdiEGhjLiD1m8Th+Gf/F+sK1c2Oi245N0/BKMl1uZ4oFfq/HaZpvCtLL?=
 =?us-ascii?Q?FHFc+C8ErwMUCHIotf01Y2lguQzXMtznZeSi1LIhWrVD50puRm8ojpoObUB9?=
 =?us-ascii?Q?+hymRCWyYtpLi31LXV+MM927tzJTZvTanjCZUpLuH13lYahHNnB7JX8+bFB0?=
 =?us-ascii?Q?ErR3ZuhADp5mcWRc3pek9GXd4uxGhR5lSIoqQ28NtBNifKTxzGyHjmwjckb0?=
 =?us-ascii?Q?Vusl4hPQJc/ibX+Sm4plkCTMc7kJn0RkvgriA6EAv27g9NKCXcBkfsMZB3wj?=
 =?us-ascii?Q?CuC8APjsyBxlYMOsjY7t06oeEtcJzeaCiX59RDk5wXdI1gMCd7n9U3fbh05t?=
 =?us-ascii?Q?WEXvB0HauGWet0v+8fj/mTT5YANoFkDMiq7L/uUWYlkQOCa9PXn58iWnWEBB?=
 =?us-ascii?Q?YwgmtAKAtUTB2N2Z1mci2Gin9h4mzaMRnKXcZTLPmUzlLAU7j6O932GcS2Q+?=
 =?us-ascii?Q?nT1K0B7cyw13emnlaElqZuUPHJbAdhsGHsAoXya2OLxb07PcUIxZQOhAsnSz?=
 =?us-ascii?Q?ruqA9PWI5JBgeKQXShE72KO81RggVqH+L5ch/WgfTVsb8FddhHbo1WT2M4wF?=
 =?us-ascii?Q?Dlr6MlNXUggim2pH7Ghz3RwFFu4+Cvgh5BT6ywPYSnDm+fnbQOfyt/U2xojr?=
 =?us-ascii?Q?OBfiZZDNsZsrG8W8Juw5qYo8/O3Xqd3kzThGliFcEx4+Ut+KBmrHLW8ozg8C?=
 =?us-ascii?Q?S8xnc4ylao6mDafeubUKG84sTF/S54DMXRLBwBlAtp4gIjzYcIn70mUVdUpF?=
 =?us-ascii?Q?tkqlt23c+KU+pR3cO5w1jq3oeSuWCnF/a8cE/q6s7IXHAknSq3XzZ1vACnBz?=
 =?us-ascii?Q?dU02c0kwDy4wtE89PiYWaGWQ0cbAqzNJb6CbYOkdihRtXuquGNznwJEtNh/s?=
 =?us-ascii?Q?SQtKQwRNAERdmKJRoRWIL82sWShWeremcX+HKlhAnXM/WH/0FWu/bMGGqPMq?=
 =?us-ascii?Q?2XTWVMk0BdXXbLBhexqi4uwJhV4/omvDH6dYbyrU7QGng5EZIiBDsCBLq5Eu?=
 =?us-ascii?Q?Ky5HrTdHZcqGHowk50XvRPmUTdZcUk3BrYDaOsruraE0SFSemsuz1NC1dsc1?=
 =?us-ascii?Q?Jf3qnLwwczsZ84lonYS40A8DileJNwsNFu4q/L7wvqPpeb55dagpu+UTBJYV?=
 =?us-ascii?Q?8GCe9kTWfgVatTvzyCnNjGe5JDvO9t18Rh6h3q26XK99B008z78HuJdkG9sk?=
 =?us-ascii?Q?6XCvr9fAxdbwJtPXsNd14riF8IF+U9tzT84RBXHjOtzVYdBCXMjh3nUdgiic?=
 =?us-ascii?Q?yT6LNbvoIWxjoIUYMAT8aaTOreK2YJdEq1iOqu1GzHeywNkxYRwb12JJMg2K?=
 =?us-ascii?Q?6m9Y0OI88CjcEpHB0ArJOnjpWy3uYVkTh7sUkP16ub3UECJ6IwnEOiBkeDHA?=
 =?us-ascii?Q?UnKzKo85HxIUU2kHsQXcFZDq54b13OlZ7/IpEad0sMaDiSsqepkaQGPGZa3y?=
 =?us-ascii?Q?TnMFn0YJ3w+ZiGdTF48sNhrQ5Um0rUBRawEBI3td16VaiwmorjJICY3u9GUt?=
 =?us-ascii?Q?ZJtVgCi8GYWp14ZokvwmSzyx6DPLztdbRrRXoJ8TOMf56b+HtOR98kGXh1re?=
 =?us-ascii?Q?UjJdm6nKDS1fRcJAa4ApJhOGk6twxWui/WKcecjo4q4Tr3lhxW87VQ6wOxkM?=
 =?us-ascii?Q?/FdN3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FXsWQUpNmAIeWnZ5RExoJb+vFTVfMhBvidM6GY3PCpiBI+aJHYw5a22N0P+1C8h1QPS+HPb45LkLCvIhslCCq82gM3nbrwNUEvQiXncqKXmTozPPI/Ej5ITvS+xKfr45jWD1oUnfvbqr95sd4Cm4dJd3cXyDIlLp/qhEtRdn412eM5ZezWHi5ntMkwDPt5FBc0ERZSZ9hSAad6IHmnY3W8sf6yTRGslXrYs+J325Nq0ZqYfFOtnr0PJ2mYl2gWcCWbeol+dPRhLGFungIl9LWTuFY45M9NlIyb7bGnouCNGYWjDymPEaS/lcC9k5wraE8WXPYZH48jFvMScvi+7SU+zu4XEmkCEakV1UiUAMi0XJKaSxneZ0I4rxC66LdSQbPa8csy5iDCw8yqGN+KigHWUihL59b9+1eQnx7u3PQ4kkzMdLrAgdQcRZFbhdelFo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:06:40.8793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6b0a92-4a36-47b0-76eb-08de5fefa563
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 11:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17045

Remove MCAN rules from meta-arago-distro as they have
been shifted to meta-ti.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 .../udev/udev-aragoconf/37-can-am62.rules     |  4 ----
 .../udev/udev-aragoconf/37-can-dra7.rules     |  2 --
 .../udev/udev-aragoconf/37-can-j7.rules       | 20 -------------------
 .../udev/udev-aragoconf/37-can-ti33x.rules    |  2 --
 .../recipes-core/udev/udev-aragoconf_1.bb     |  8 --------
 5 files changed, 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf/37-c=
an-am62.rules
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf/37-c=
an-dra7.rules
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf/37-c=
an-j7.rules
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf/37-c=
an-ti33x.rules

diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62=
.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rul=
es
deleted file mode 100644
index 59dc8075..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
+++ /dev/null
@@ -1,4 +0,0 @@
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can", NAME=
=3D"mcu_mcan0"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can", NAME=
=3D"mcu_mcan1"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can", NAME=
=3D"main_mcan0"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can", NAME=
=3D"main_mcan1"
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7=
.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rul=
es
deleted file mode 100644
index 3b14150d..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can", NAME=
=3D"main_dcan1"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can", NAME=
=3D"main_dcan2"
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.r=
ules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
deleted file mode 100644
index f2804ecd..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
+++ /dev/null
@@ -1,20 +0,0 @@
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can", NAME=
=3D"mcu_mcan0"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can", NAME=
=3D"mcu_mcan1"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can", NAME=
=3D"main_mcan0"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can", NAME=
=3D"main_mcan1"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can", NAME=
=3D"main_mcan2"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can", NAME=
=3D"main_mcan3"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can", NAME=
=3D"main_mcan4"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can", NAME=
=3D"main_mcan5"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can", NAME=
=3D"main_mcan6"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can", NAME=
=3D"main_mcan7"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can", NAME=
=3D"main_mcan8"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can", NAME=
=3D"main_mcan9"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can", NAME=
=3D"main_mcan10"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can", NAME=
=3D"main_mcan11"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can", NAME=
=3D"main_mcan12"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can", NAME=
=3D"main_mcan13"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can", NAME=
=3D"main_mcan14"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can", NAME=
=3D"main_mcan15"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can", NAME=
=3D"main_mcan16"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can", NAME=
=3D"main_mcan17"
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33=
x.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.r=
ules
deleted file mode 100644
index 62d650fe..00000000
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can", NAME=
=3D"main_dcan0"
-SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can", NAME=
=3D"main_dcan1"
diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta=
-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
index 49d00b54..e926e901 100644
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
+++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
@@ -6,10 +6,6 @@ inherit bin_package
=20
 SRC_URI =3D " \
     file://50-arago.rules \
-    file://37-can-j7.rules \
-    file://37-can-am62.rules \
-    file://37-can-dra7.rules \
-    file://37-can-ti33x.rules \
 "
=20
 S =3D "${WORKDIR}"
@@ -17,10 +13,6 @@ S =3D "${WORKDIR}"
 do_install() {
     install -d ${D}${libdir}/udev/rules.d
     install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.=
d/
-    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.=
d/
-    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules=
.d/
 }
=20
 RDEPENDS:${PN} =3D "udev udev-extraconf"
--=20
2.34.1


