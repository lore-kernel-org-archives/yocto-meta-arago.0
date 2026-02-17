Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F24E909DF
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:05:58 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17031.1771347949721612862
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=k8ZK/CwI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.0, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqFiBTv+nGc2xmGIzACfIXgO/a+U+l3GYMsfLOxOLYhb2y7+ZA+Q3y8pCXBZXG6xDELFThHEo/hlOmZ6M4/YkKKLWugD3POucI43V/pcdpC1T4vGmKH6oQVh21iyU2Dualy3BxJ+dvkreLKoyMvDxeZCDDirusHpeGLfsWsa7wAqbJJ2HS6xoJsl/lkYPeHHyhTLmOoN3Yc/fzgGhVM7maD6DajdjGxu3moX4f2DUfQoikxAzHa2pcVbN8OzZwdegprmZYHualizDGxR/Wc686kth8CsX1ygYmW8JKBjGh65UO1l/OhBVqibpurqb1I+h72gOvVO0H518gHLiQ+2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKvpXn76s5Je1b0utrCCjJPLSLcazeguyHbQoTsLavU=;
 b=WYYf+586kbBLFTDEQK6iKkg+pmhqajIEs+z1sjEp8C1b0RZ4B81j3WysalY+DjQIdFNkUGX6UZ0KsyX0QTItjCSCLMbQbYmQEfWa0ZzV4FPzLe+l3Z+Y+IsA2FFPlySwec97OlVip6sqXb6LWrczO385ffofqOjC4dE2tJzs+iYC1EHQxo0EpT9Pd01gtipX2FSu6jV5/fhOLYx2oRW1pNTXiaab/p1hELAFnqFNzdcPzEJ3gebdtCHFFxYQzKkaGWBz1cijqWD2spwkKvel9FHY24BNOVGhhuebzKbMYgUuWp/6/r8ZqUSdqpcNvYsjC6MGBb+bF4mo+BCA53S5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKvpXn76s5Je1b0utrCCjJPLSLcazeguyHbQoTsLavU=;
 b=k8ZK/CwIxcwL8j//7wF9Uxfp0xm0lM9THWlAA2NBP0LU1S4XyRrjiFEP4TdUYtgrOlMDzcLFPSozqKpEjThGuEj8ybpURRYzcvx6czAlT8AUr7/gHPrTk6M2dL3Bv6UweZntoAAiJC+/mGIiLkU/8zzPad6Rc2nz6tUH+zMz5Yg=
Received: from DM6PR07CA0084.namprd07.prod.outlook.com (2603:10b6:5:337::17)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:05:47 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::47) by DM6PR07CA0084.outlook.office365.com
 (2603:10b6:5:337::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 17:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 17:05:45 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:05:44 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:05:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:05:44 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HH5iS53674855;
	Tue, 17 Feb 2026 11:05:44 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsOW8-00000003TuN-2XOy;
	Tue, 17 Feb 2026 11:05:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] busybox: Turn on sha3sum support
Date: Tue, 17 Feb 2026 11:05:44 -0600
Message-ID: <20260217170544.829944-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 811e57dd-df7e-4ced-a2a6-08de6e46ca5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pDe8Jg+yrXZLB0HVgUbnhZl1ekg/t8UBGlUfSw7j+uklPXiS/tCBvMK9ebsR?=
 =?us-ascii?Q?NeYOmZISAd3mfu3uRSzqX1eE+ba3Y3ncSaXKzhuuErMlYh9CUoKyE5FtVazj?=
 =?us-ascii?Q?wnWCuap6pMphQ/FBOxV+7TrXsnh0DJXWyENBT9fR3f6UsYEufDMWSzRT6Coj?=
 =?us-ascii?Q?En15/lXTDEM0TMpq/IoxOHFkqfUCtpuMhlQQE1QbcA7u1wiHkYMWdHaJqhXi?=
 =?us-ascii?Q?kue9JVM/aGjcqfbcnLb9BPW0vhdpCwGVwEVEuTvA2DF7rQmKs5qx46WPL7vl?=
 =?us-ascii?Q?IvdZh6RwSvyKh6+tzyKPmsQ33nNT6fvQrYUdfz3N/YxYBxPr64fco1jIAcGM?=
 =?us-ascii?Q?ZO9UUb+q9whtnLqm2m7gHUuOWrBPK9+MSja2/rLKA9jgKvuWkUKCaVTO29Ob?=
 =?us-ascii?Q?hItcBlfnA3IsA54ZcfunYkwhqMomxxDJiLq692e8CRlRk8jhXgrOhY6phxfX?=
 =?us-ascii?Q?khI+5VEYl5Fyp9cW1g3WQmsPrnBd6EPyntlp7f+qk4PNd0QNjA6hcLQrII/7?=
 =?us-ascii?Q?TnW9hLFCSQRn1XbbKlesE9hu/nbnJkU8zQQ37WHj21kKmCePKMqdENaOfQjH?=
 =?us-ascii?Q?FG0Cr6wmkXdQF/5muTqudJG2C+dVP3kLiBQGQHn2uLtEamoYQ+mLB1v1rjvd?=
 =?us-ascii?Q?v6KjGJSe3xPsAzg748NwORs1WufdVsJRH8d4rrNZJTSu8WXzDsLbviaOZEzQ?=
 =?us-ascii?Q?CjDu4AOi8qkxA1oguU7v6urZ80MfEpSVfXgRjj5BQYYdKZ7cLdmNu7prTj8i?=
 =?us-ascii?Q?desa6qTWOihowB4OWsPLq0K3G6G9dYLvHbfZ2lk1EPprE34spsY//opynK4S?=
 =?us-ascii?Q?g5ZU1YjAoG6BJ9zGHIuasrKT4hH0NrV1hnZseHqOBiwAd+uf7mycV94bqTSP?=
 =?us-ascii?Q?KwP4g3ho1lNTpSqSwA9OlHxr9p863MBAZeC43WDe5LqFUO3MMq4UTf1DyDnp?=
 =?us-ascii?Q?6UH7ACCICgcxecNe8cqxS3jW6vtBHPPDWpfR5l6ANqwLXFMjCn6bAMUsVdS3?=
 =?us-ascii?Q?VgUwmehaqbLxfJwJBf+6uwrVIseDubdZdfVMv3gzXDpi+1k7XO22k2x816Sq?=
 =?us-ascii?Q?z0WitKxvoT6O8xjAR/BOxT7YBiObXLKbuRLLDkErGL6C803oSjeJJ7nWMQT2?=
 =?us-ascii?Q?02wB34VbbV9djdp5qXRYmWfdB09JlGC73JvHWwGYFYpL+PsM11jZpchRLr8X?=
 =?us-ascii?Q?FFJ5mQfaizG6Wwpvs0RnpZxcGhjGuxj3QrQaatGHG/zKVCNi+l2v+cA1Ez/P?=
 =?us-ascii?Q?p2HGtC9AU/4CXLPEOZPzQPv3yna4BQ8jh0CuGD+x7uvZl/KK7hpzGxbPW/yZ?=
 =?us-ascii?Q?Kylaqdh7Yh+3DnvlH1ixsQ/suL+W3rm2SJ//TU15Li3BQ/CP/ugnLgLezjJH?=
 =?us-ascii?Q?ZQ8yYMIeHKG3uNHbTW/9bh+/TVK78ZQZGTFomHk9yi1IeN+fp7hjF5xOfuZe?=
 =?us-ascii?Q?HXest46KYzY0jdmgUBIl475P04g7nxVbEwxpES8bo23hDF6at7VD5KQl08s5?=
 =?us-ascii?Q?U3rP8RNhTPIl8NXGbvEpwJg6yC1Q510AZEPnsPwjbg1eWTwirVAO2ojJu3JU?=
 =?us-ascii?Q?BvhImqXJy21vV3SZioxjsWrCfbtuiajqvazqYj4Xc/JfVWRPNu10QHXxX6LZ?=
 =?us-ascii?Q?bfq2CMPM98PbNM6+tL8Y46R4gKaMF8zj5/8CziYS9hYIEFTAKs7hWyc8ZQaW?=
 =?us-ascii?Q?CPMkvw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qUjzgz9Pd4NlXUW0zahSmFtCz2Jh67w7M77gGaNhMrWW/AJfFzVxXWz1gm1Qym4RRgzEBCjlYWFVQOn2SGkqlaDD7YOLyVppx8L3fAEKgGZdys45QMtcFtKTBwUBTGr0rZ6wlOloKUlpBpppwLvk0Jnnb699IwWbbTDHl0jBKdaGMxhGGUEwkm3yILEG7pU2kJ/8TUHGb7K1WoO7cFlTZ6HU0pqHnzxsB7aHbnZlCxrvVbsg8coiPcbA4OTJrxAgWVEMne/IlhqN16y058kGjXyQvHAfJ7GredqEwlWA8xsrjeUvtTPMq/uLslqMlCNssEEvwUtTftQfThvJVyQU1EPjUkq62SoqXwJc/FN8pvakpvqxJ2KIK0CsgCy7CRpMb9aiqFSAvAUH9idxUyduJpZDsX0Sdr38xKHu7qjrKHEHJdJGjiDXNQ9mOY1YmXWR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:05:45.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e57dd-df7e-4ced-a2a6-08de6e46ca5d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:05:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17107

When we moved [1] from our old defconfig to the upstream oe-core
defconfig, there were a few config features that were lost in
translation.  There were items that were not specified in our defconfig
at all, but were marked as "not set" in the oe-core defconfig.

We have had a customer reach out complaining that sha3sum is missing, so
add it to the utils.cfg file to make sure it is included in busybox.

[1] https://git.ti.com/cgit/arago-project/meta-arago/commit/?id=3Db49f3a05d=
1e3c7ad3458fae6b1359d7fd7619280

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/utils.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg b/met=
a-arago-distro/recipes-core/busybox/busybox/utils.cfg
index c020f638..0a5b4481 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg
+++ b/meta-arago-distro/recipes-core/busybox/busybox/utils.cfg
@@ -9,6 +9,7 @@ CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS=3Dy
 CONFIG_TASKSET=3Dy
 CONFIG_FEATURE_TASKSET_FANCY=3Dy
 CONFIG_FEATURE_SHOW_THREADS=3Dy
+CONFIG_SHA3SUM=3Dy
 CONFIG_TIMEOUT=3Dy
 CONFIG_UUDECODE=3Dy
 CONFIG_UUENCODE=3Dy
--=20
2.43.0


