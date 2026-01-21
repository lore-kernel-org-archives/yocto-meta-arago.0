Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C046FC44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:56:13 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19379.1769021766748820252
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 10:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g7ru0Xkk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.36, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqMBFZmqYyNUSma7QjAjg2S4OWwfoQPzKy+1uer3VTmY8vpGB3Uo3aFoGIkIJcboycd9d2cLVOs9eItaRbtnGc/iGkwRNpn6jtDFlwi+OYBQeaTTxqZmLljBPfvhjCirz5G2EzkR57WVQhsptw1Y9t70pC6sJ2O/2N6G6u0+OodXBoJ7DXlEHzRoYcHrIRGKrrF4OuAtGimVoEcr/CUTKq0jvtkkZGK7UE+lWFfO3kBYrk9f0nJeHiarJ9OwsHbe0isafk5PbmvidDxIGzRNE7BJ8hJFJ3ETxpgs9ljOIqA3DOYxGjInGRLjflTQ0wC/BUP2Pbg/ksJB/hJ4YT4rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsefs2yKFoqcX4PYmrzF3KabUsaJdGyTyfoFHENfF+8=;
 b=CIy9H3KLzlHhzEE7WQmFvqPEGro1le+K96L6r0DgFPphyPRs5iPTS16CD+TKJHYbOKxjdST/pJGWCzZwmm97S/ubCE6ymF6lCVJxbwYhGs4+UuBxHrmC33p1VlOLgjG4843BYIfGkM4gXHfM7oi+EbEqk0RouCVjIm2wBy7FaIt1f9nd+6NzRjwX/kI7VZq5fMUpIDG3aTm6iC24oSQ3syhFNjGatZRp2OhcyfuMR2dnQLbHGNFgSiyO6llgXHh6Pus5Lu9Ksim9T1cUuU3wbl0l4J3bCG87AW4ClWeIOhTpbEu8DCqaN0DgqdZG1iHbTEuULIcPl7qIRLmxU5BLaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsefs2yKFoqcX4PYmrzF3KabUsaJdGyTyfoFHENfF+8=;
 b=g7ru0XkkDLedEvQwsgq3Hl5lK7UAZTieRnxdJ7lAFse2wIMq57i50629Uw4DNQ873h0rL0qimpKp/ZgsPJEZr2659NBQrMyBSp80356U7a17mwGUFJ+rKhKH5Sg6TY+aYC7OKDvkukPjPCsthc0p6I3iYbSxqDAf/ZyHJ6K5Z5Y=
Received: from SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13)
 by SJ0PR10MB5550.namprd10.prod.outlook.com (2603:10b6:a03:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 18:56:03 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::e3) by SJ0PR05CA0008.outlook.office365.com
 (2603:10b6:a03:33b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 18:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 18:56:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 12:56:01 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LIu04l3358457;
	Wed, 21 Jan 2026 12:56:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 3/5] remove-net-rules: Do not remove udev net rules
Date: Wed, 21 Jan 2026 12:55:56 -0600
Message-ID: <20260121185558.1330658-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260121185558.1330658-1-afd@ti.com>
References: <20260121185558.1330658-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SJ0PR10MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d6c29a-897b-4ba5-4cb1-08de591eb9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2V3+2uoVx7BYq1nhhxuI0DHMkykHvFF5cbvCM76zU5bcAB8XcxH7qkMPcgmS?=
 =?us-ascii?Q?OysYX+hac2gk9d1ZGfrrOqlZt6fgJvTZ+wwUbZfTEdBkqJaS16XORlzK6B+k?=
 =?us-ascii?Q?TbKq/Wp/wK/pQeeVNqYfkeTrEftNJTkHW4eU+Yykgo76mKKQph0WbCXXmco3?=
 =?us-ascii?Q?krPgEcrMxp9BbKbz5zAXG0fz74qbkXLPuxFd1+XKx2ArCt1VwQA/2Kyd6zzE?=
 =?us-ascii?Q?7EKwbRHvIsja+lFBdaxVVeM4eR6iNWIzdFu5f/WVbYx6WVjr33b3Bo6t8v+0?=
 =?us-ascii?Q?AIhp3GueDaqRgHufGrA6YfhzFtMFvarUWOrtg42R+RHuGKgvx0XMpaINvwim?=
 =?us-ascii?Q?GpZCU1W6NpZwnZSaIQSqcHvCQjcOm9tZ/mf/nJE2M+ouIAaACmhF5M1yj66B?=
 =?us-ascii?Q?Hn2/eTnPGX+MhDDpCpFxiBpaglREFCjEJFDgCMwjPw/Z/BN5W8nfCi4qKFda?=
 =?us-ascii?Q?ah2DizSV+oAHlF6L3NEfsFQ84807SztWxBVTdHzuZoUVcAhn9dTX0OGduZpi?=
 =?us-ascii?Q?MoGhrQ4dcQfvdOgVdG9jNGklFwiy6nnbvLOPaY81igy5S+G7zQsewn8Zdegp?=
 =?us-ascii?Q?bun9XbcIGo0aoWoQt6fLHMZ3Go46oJ3PoMonYMbGHQ7wRaebhUAe9vP0xE3z?=
 =?us-ascii?Q?M1Ojg+EpE13RUEp7XTutrAxO9RUNL9f2HVBBNm0BRrSOPoYX25RglQcLBrJE?=
 =?us-ascii?Q?g0XZVcAHcvsntScM9F+FlIMRzUU5mxPr8O9AvlQt2vycbJK5kDWeeJvbRT2I?=
 =?us-ascii?Q?8pvwd5fHu8Jwr7bPh0+LFKkVIk5mGPRhrs+EWYbiRcEmZ2uA3w9uhIU3nPHG?=
 =?us-ascii?Q?FxYFOWIj7HN4/kzBtuSFJTpYkDSrp8h7lbJkIDDmzsio9nmBCBFhYA7v0LhO?=
 =?us-ascii?Q?8R08nJaBzfOd/ztL7O7/gyZll+wU6gkPwvvQ6R0JZQz1y4EDqR7Sz15A4Kph?=
 =?us-ascii?Q?6xFiEVYAqKsBY5jJcTIKkL+04ugVJ9oFkFliNjXARhW7udaHh9U/p43J031p?=
 =?us-ascii?Q?fxFlujVWDFvcnvZdUMqiQ3y2F9tlVlZpoEz8Jk+uJC6wMfw2tBYt7qBGy/+L?=
 =?us-ascii?Q?hGDMR2Md0jb1osadsvOa/MjwqQFm00b5RgDClH8SQzLMxvk410PVHZkLt8+F?=
 =?us-ascii?Q?ZZWlIuu0kk1q/Ze6fmXVVNObFBkuUWxgtzFn1gYVaLSWyrwKXuoWjPybMVUh?=
 =?us-ascii?Q?7rrWYQ0uTwU0Mn4wgK0eMOp0neXRqj6SpqFwJ+e5mcAf7RrfLbFzvqaWjA/5?=
 =?us-ascii?Q?E9nDwG/6hQeYKzh8gePLW7VwYznx27+WIHhg/n7nVbXZu0g47J47HfqXvQya?=
 =?us-ascii?Q?9tiNR70yleLKIyxdNptHb+q240rwQRfBqpAgZWPEc49lLcMlpDFrdOq0Q4l4?=
 =?us-ascii?Q?fyoQplAZKHqOeqpTYshMnqAYN0mYpfEKJPivDx+eNfWnhqsw5CV6rzqvuP13?=
 =?us-ascii?Q?xepNUYTBc/qldTUmhgl7mMM2VSfvmgDPvPAArBewagZHNEnwdu3qNIBYB+pL?=
 =?us-ascii?Q?6DtCXBCZMaOhKnlJQ0uSvUQCmn1BGh4prh2jjffer3/M48lZ0etUpedLSTef?=
 =?us-ascii?Q?CYGb9zo4UV3ClaosWdkVIOyUQCBIxMfpIhOyducloQu5kvb7XBwscPwcL8LF?=
 =?us-ascii?Q?GSO3S9YjkVF9K8UxtRtrNLhM7j8nakqI4QTzYFT1+wptnPkCiekMa4neSOgN?=
 =?us-ascii?Q?SNasCw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:56:03.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d6c29a-897b-4ba5-4cb1-08de591eb9a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5550
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 18:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16999

This isn't the issue it used to be, remove this bbclass.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/classes/remove-net-rules.bbclass | 14 --------------
 .../recipes-core/images/arago-image.inc            |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta-arago-distro/classes/remove-net-rules.bbclass

diff --git a/meta-arago-distro/classes/remove-net-rules.bbclass b/meta-arag=
o-distro/classes/remove-net-rules.bbclass
deleted file mode 100644
index 2764f7bb..00000000
--- a/meta-arago-distro/classes/remove-net-rules.bbclass
+++ /dev/null
@@ -1,14 +0,0 @@
-# Add a ROOTFS_POSTPROCESS_COMMAND that will strip the write_net_rules
-# executable from the file system.  This will prevent the
-# 70-persistent-net.rules from being created.  Not having this file
-# will allow moving SD cards between EVMs and similar boards such as
-# beaglebone and the EVM.
-
-ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_rm_net_rules;"
-
-rootfs_rm_net_rules () {
-    if [ -e ${IMAGE_ROOTFS}/lib/udev/write_net_rules ]
-    then
-        rm ${IMAGE_ROOTFS}/lib/udev/write_net_rules
-    fi
-}
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index f4f74310..c6e79118 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -24,4 +24,4 @@ BAD_RECOMMENDATIONS +=3D " \
 "
 BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER", "sysvini=
t", "", "busybox-syslog", d)}"
=20
-inherit core-image remove-net-rules
+inherit core-image
--=20
2.39.2


