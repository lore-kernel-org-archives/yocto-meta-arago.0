Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709ABC98327
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:05:23 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73654.1767643515348511762
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=et/ZBc8m;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.50, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9kuK1dhQ/Blclh3uGxMTn04NccPQErkACTtn+cx/b2zl6M9kCrDUFPTMbhxQEe6YqL8Bwgdh50klRdKPxXfYzQQzDRGXerLXa3or9a1j9+WYiJYh5IINxyF45vbj2sOkDYP5aUsBW5pMQx4+lHAHx0OaPihXRNJwf0pfOwhb460z7f/0LI0PO3UGbJeVhdp+IdIHDyJGLVtFWwrB/rOfoowQHcTYaLyIZUPTEdKnY3/k8Z6ckCQwr2wC2jVdPewMNvx6jMrermT3CHqRcsYf1SkqfosQUGWKcfENECtjh6s6Zw4bcZmLUJAEkhln0iHU13sZ9Bbr/ulI/a0g7EZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsefs2yKFoqcX4PYmrzF3KabUsaJdGyTyfoFHENfF+8=;
 b=zByHk/+O5NNPmXR4Rp+F7dtfDnQD5/NZM97KMCEzMHoR0Uz61ccoWP0PTIC+ref718GpuzQRmYMIQOsYg12PLNzd5JyD2zTaspAe6WPcI3INJrK7EBlazfoI6Tbqmius0oOaokQAUUTRLw/wWbbytF5vHsL38jbYOR1ebdIigRKK3CR8opbMqLY1HAsTpr2v3bO7MdHLFg5amUUS3NCQT6I/lxrtXWBiK7jGMNbYzLrDw3Om3G0WRiyAsjgMVm1XUP97an3ByBM9WcnQtkbjYBdixQvmn4FYWzAcLIYIrS8pACBLVoaJMpUd0DNZrk2y00TmcDXJd0nUY4x1Z9ub/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsefs2yKFoqcX4PYmrzF3KabUsaJdGyTyfoFHENfF+8=;
 b=et/ZBc8m7UgSemsBUm+3DUjGtUepF7VOXTS6ecDePAZSdsZxGBJE8TpSiTLNaqgMf41JzuEM2DFpjBToPVea1HpTFOphIzcFYaDgNXz/N6TqKOyZotet8WmbZ1WPYhVY70pKKewvQQS1B/jt5P2dlktjkmsrCDAod5Nfh9+La8M=
Received: from SJ0PR05CA0133.namprd05.prod.outlook.com (2603:10b6:a03:33d::18)
 by BL3PR10MB6018.namprd10.prod.outlook.com (2603:10b6:208:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:05:12 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4a) by SJ0PR05CA0133.outlook.office365.com
 (2603:10b6:a03:33d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 20:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 20:05:10 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 14:05:04 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605K53Ba1831190;
	Mon, 5 Jan 2026 14:05:04 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 3/5] remove-net-rules: Do not remove udev net rules
Date: Mon, 5 Jan 2026 14:04:54 -0600
Message-ID: <20260105200456.2472163-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105200456.2472163-1-afd@ti.com>
References: <20260105200456.2472163-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|BL3PR10MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ccffea-ed4c-43a0-f636-08de4c95bb5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dO8i9pacvYVd7EfgfCOklmWcE5d3c9Fs8LPw2XZswVDIxQI5jjQBot74BJXm?=
 =?us-ascii?Q?jhIe1i7QIWzQ8fKhJmpeaetNMU8EQDJjjjlTAvmUBgb7ToqY5LfkW4137yaH?=
 =?us-ascii?Q?ZLg91IJKG64cOi+xLpB7+kL1vqPpv49Sw+mHAJ+FlYzZWOWB1KRKgdFBrXYm?=
 =?us-ascii?Q?oPn/H8/co/jR97L1gqoEW0+0KVqCs027SR6OLS70Z6s2FuCXaFEnxGv94uE3?=
 =?us-ascii?Q?GJyiXUB4OpziVeUfLg8ppLi6Q/rfNuB9y/xqcNK3WqxxBjCGhGNxxC3SLygg?=
 =?us-ascii?Q?szReKjCKAjt/SY189LvUzf6Szs8q1R0g1XCqmuxke2n18/lHENiczsy+h/Mt?=
 =?us-ascii?Q?K5XeiRs4x0iThdEMNqgGX4rlkl2XYMXtiL/VMM2MmNjV6LDKpUAg+Sx62Sg8?=
 =?us-ascii?Q?FMkF3RuKyW2YhPP98UhraC1O0Pc7DZt8kOHNczqoqxid/0ae0sWmtTJ6OwH8?=
 =?us-ascii?Q?4YujuRrFLseNS6F5k39+Z81goWg+gmO0moTn8NkqXl0+LssMKn4AUbl3VqJd?=
 =?us-ascii?Q?17nhjoUVA1VlQUIvujNizU0gM0oapd4TvAItHK2Wu5mxAXLC+AEKIQixoSph?=
 =?us-ascii?Q?K4MVVxzETUyf4fntzKzPXL6DC7bELUDMt8ZgeDi4RX3DOIMFS0FMUOpR/sDq?=
 =?us-ascii?Q?ZNWGMj2qhw/rNl1fdjzBkMVhUTAIcsI307uzUsoVRYdsIFQrXAcwIFHZPvSL?=
 =?us-ascii?Q?2i6xst1bTza2QAkJ4PJ0Z9QJWG9v4CqPt7OCilT/LdMgvoCpBpOMeigcYZBw?=
 =?us-ascii?Q?qS1IS4+r9y0IrZF5I+ory0iDMi42fyIra22PhxPIWPhuaRbIrgfyxP0rYJZB?=
 =?us-ascii?Q?OxGqEBMJ9jUKl3nkcJlb4YMRfN9ORurTdXfmMMkhZ0rircaa17B8HIipAXKq?=
 =?us-ascii?Q?G9fFvXpYtJ71DIpGepWBxE9aLblglpXMAC10UEl/+aoKurj+4OXq9szBAnbJ?=
 =?us-ascii?Q?Zugdobldh9S/574r+PXXrZECVhsr/lx9YcLpYgb6wq35egErc09owMAWlZIf?=
 =?us-ascii?Q?I7DPGYMSt1UJK5x6AMOB0qDOOIWaiDPbFAJvMUq8xjgccgYj5xYB2cxTlza9?=
 =?us-ascii?Q?wvroT/O3Bhr4EzNvCxPtAQejmqNaMZGAGjTZDkpBPWTSGZf5w5gQM/lQ+U05?=
 =?us-ascii?Q?SLN3ITKJXk7vz/a0GU5+i4YzP2WhqHiX5KbYSFDljFm7OcWJwKTMbWVEAB8F?=
 =?us-ascii?Q?T5DS64KS5y7yhHEGqg7izSHRcPOEnpTKexAXrneV6RhCZOieVjZnB8JTeliK?=
 =?us-ascii?Q?Ku/gFhDeg+a8GaP1e3eZmjjRnJN82T24Z1BnU86lQm+H0a5+qfCJURTAS2ji?=
 =?us-ascii?Q?Tw5r7KIQfuxiQwt93IKZNBbuBVn67KGuPrMPt5HqnrJrK4I4FemLUruI5WHp?=
 =?us-ascii?Q?4PhLPUB1l83qEIIKnrbBd4GVmTSZgRzBcvm0ZuX+Wt+8Qi7GopTaE/4cwt8B?=
 =?us-ascii?Q?UuMRuLLybaETG2PpRHvDtyCAF+tQzDgZsF94G3TLqKMzn1jJlHSOAWKpnaet?=
 =?us-ascii?Q?5x+Gd0nuykpX87Xibavet+eysvS2XAxPSvUEdd5Lr0zXNNgkB1D8QqTR/ZIk?=
 =?us-ascii?Q?PvDeUvY8Fkzopiwcrdk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:05:10.9865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ccffea-ed4c-43a0-f636-08de4c95bb5e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16917

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


