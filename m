Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E21CD041E
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:22:24 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77036.1767651742800934651
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XkN44Z8o;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.51, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk4hLnNnUccNMHlpqrQ/7mG3Xq24SKrzmP6EqB3z/rGvxImcBhiV7STL6meoiLEp0qexSqzidQ6jcFm3T72zsaZrbaQde2k60WydP5QndwjJenLc8R+Ldv1xFhvcf3IVMEfM2AxKeM89ajMTIWeq90fu1sNLo9uOsMHyV+0excXNrUpH+9SupL61pJ14H/RnVZRKYiipZZXs/R9C+XfqxdT9HJ9xgB7jqCGZrHDA6UtK1ffx0Ac8PUjPU9O9qBt2EdaeS384BRg4KkkaouTqYegGuE5Z/zXigsXlVcvKi8LKqBgfO7OOuzeR9GGqTReIhmyxu4eWwuXwAe+MNPafvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnOZrNXvnF4aIIJJs3kFMXhjx1o/y7vzSARl7Oayx/Q=;
 b=XaZS7Fuurb1Uxq4Uu5ueA2GygqgqXX2PDBC+6muFPoPa0Fhg41xU9BUxeWaS4B18mF+rsrOu8tSuaQF+lBNqqZMOeVsWWKLby7aFM7i9j7c3+cNr1VdSdV55FV+MFLhPr4DFZjmLRtBLYL1RZH4NurMbDUwGqN9/bHaoN1M7xFn/P0ChrKlLfPeozhIyyed0m5ZHwr6lGxrm+ItexWyxZxwCAF3hVhvJxIWLcgnhSvqWdIanbL3+JUmRo86yqap0KaXl5iIHr3ikoG6CrJ1489ZOXILEAbATw1n2DpEaUHnXlWjZDmCTIFH7vW0I6u93d5wORBRfZRTk8aTCeRrTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnOZrNXvnF4aIIJJs3kFMXhjx1o/y7vzSARl7Oayx/Q=;
 b=XkN44Z8owgNmuu2t85y3KhuZSKup6adjyd0f+tqiU9M1koiuS1fCBJEqvgFm7886Lqw+hW/8yLk4pFUlc9qyiKjEF+K9qXumm1PJ0iJMbyvJqVCkqTA9gKyQ37jC+YDGeXQbp0xC5jKgt8ta/yDpYhc+AZ1kn0IjzyAu6wMoL68=
Received: from SJ0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:a03:39f::24)
 by DS4PPF20A8CDC0B.namprd10.prod.outlook.com (2603:10b6:f:fc00::d10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:22:19 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::7) by SJ0PR03CA0229.outlook.office365.com
 (2603:10b6:a03:39f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:22:17 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:22:12 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:22:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:22:12 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MMCLA1865663;
	Mon, 5 Jan 2026 16:22:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] ti-world: Use core packagegroup to include valgrind
Date: Mon, 5 Jan 2026 16:22:05 -0600
Message-ID: <20260105222205.2503660-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105222205.2503660-1-afd@ti.com>
References: <20260105222205.2503660-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DS4PPF20A8CDC0B:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c11b889-1b22-4159-b003-08de4ca8e2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7QJu/IH8MnYD2ReJbYRIMy1n9Gvc8iMPBwTec4TMKodDIFLctqGvmEiaxwo7?=
 =?us-ascii?Q?tTNb7zJSlCQS82YSbDccyyBgBVKXzlgSeEgWYRGPRBPy92HHTQW9pHgiucmq?=
 =?us-ascii?Q?wta7kbzNbCVym7aoyXAXJfEoi90E/9trsEUy76qQanGVRqHTdNUlYDsxyFUd?=
 =?us-ascii?Q?3uM7+mk3M2Up352EieIB8ZfSH175xoIl0KnKkHWoXqZi6KAgoIt1rcLBrtii?=
 =?us-ascii?Q?rb6oKYRRgkhiudTd1eJPQwmVnWGqhByZKU1UT8Q8JtQVRgBLE/yKeB458xPg?=
 =?us-ascii?Q?Mz111SibmCIp2WRt9QBM2u5KyfLM5Y3LX9V7uuDUI3ov5sr25sy62mAzbMrI?=
 =?us-ascii?Q?mWSr25lfw+gEtqbiWf/ggg7mJ11Ivxd4HlqI3WVY5kcvAJfrnuIdf6Ipm1oL?=
 =?us-ascii?Q?hGtmPauBv9hDf1PzvFAJixplEGKOYNqNQPZEnoixQoXEvZCdbmmHvyhGvsp4?=
 =?us-ascii?Q?lP8c3g+VgRXgVBMT1SWgiRwBNyskjt8EGr4A3JshYJGvgQAY8X7sG2v2kT4L?=
 =?us-ascii?Q?mKLKR71Iv6P+WncC1Zix//lXU4bxcRmjHHir6ONVTY0pNk1D52Tg1VLrVq8k?=
 =?us-ascii?Q?tQvSPM48Wq5XtbCNKkxkRhLsXzCfkC6NidUDOBJAduXSYNdqEzp9xq1La6ml?=
 =?us-ascii?Q?HK0GihDvF6bPRJ6hYjfrWchytFNNKnP6fvV6mELnH51vI04WA8ABpfZx1SfF?=
 =?us-ascii?Q?WucFB5/Q5IwxqNouSvp8ePhEG3YJUFEsWMSbnGtgRHRnezsPLHIAq6pcD4S2?=
 =?us-ascii?Q?JTryx26Pf/E+aT255oNbgdTBDn4sOx3PNCNRecLgIK/SLAsC37IBpicjFX0D?=
 =?us-ascii?Q?Fd9VuFnJYyMcUP+f7KaOca/OLp5JmOLHx9+EB/QcF+jOmrXOyL6WgSS2ZOh8?=
 =?us-ascii?Q?Hi1y6mJaT9VR3Yh8rJAEwGFNqRld7AXyUiBIiu4jsDXxuCcmot/SbojTqJsU?=
 =?us-ascii?Q?3PcVf+ftam9mncBcqlLWJt+dXnwijHrsFwBpwPhiNmWKIkO//nS4De2KX3BW?=
 =?us-ascii?Q?Mj8So2z5JebmyoTR9ukzfH1CZyW6g19/b9OTd9gjKucwAZzM3T4B2xBkTq3f?=
 =?us-ascii?Q?sHQn2q6iAq4Wpam6G8Yps/GDu+pHPJd5kKXx4gearcapuupFfDQvT8VMaVKJ?=
 =?us-ascii?Q?2ShwiBVEQ/1MHM7pb3HjlSDwbZypaD8Vxwrt+HE7iCS0s+K6RYmALWhc55D6?=
 =?us-ascii?Q?EuHPz0qfZpeYDtP3ILUpoHBaQ1vhNkKooDnirDSppU4rV/ZUiTYIEjWCN1ff?=
 =?us-ascii?Q?DvxTkWB9PefLStYKa7iJFVgILagG0Sf4iOcl9LZ4cn9bvIbSlTRAYQ2VjcfT?=
 =?us-ascii?Q?4U4YSEp23YNOZOIiyTHcvnhONsCEcv616B+CUTkPNrHyPCMLoNODY5VZDQ2H?=
 =?us-ascii?Q?Ze3WtwHooj12bxYdUXUnri+GJ2UPebyj2CcsjMeujx1zoV4aasJY7rfcYWM2?=
 =?us-ascii?Q?Aw/ZO42AqLnhBWsx+HsnGi7FRBbc6I4bJTllJCBaXiyTU7K3Vk11OmBhghsY?=
 =?us-ascii?Q?qYMNcI9iv+EmCWFh/p0vQmZ8b/+kpJj1zedtj9uO2X9+nfvQFhJrIYCIK2fZ?=
 =?us-ascii?Q?F3e2s7n8tO3yx6ZO1jg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:22:17.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11b889-1b22-4159-b003-08de4ca8e2f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF20A8CDC0B
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16925

This packagegroup includes valgrind and handles the arch compatibility
selection for us.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/met=
a-arago-distro/recipes-core/packagegroups/ti-world.bb
index 25642831..be7720e7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -23,6 +23,7 @@ DEVTOOLS =3D " \
     linux-libc-headers-dev \
     build-essential \
     packagegroup-core-tools-debug \
+    packagegroup-core-tools-profile \
     git \
 "
=20
@@ -40,7 +41,6 @@ RDEPENDS:${PN} =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago=
-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2A=
PPS}", "", d)} \
     ${DEVTOOLS} \
-    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
     ${PREFERRED_PROVIDER_virtual/docker} \
 "
--=20
2.39.2


