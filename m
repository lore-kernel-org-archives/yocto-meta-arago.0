Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A970D26D83
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:11:21 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16392.1767982279693088455
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VAcoCxO6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCEmi2X0HXqJH9MWNSW8cYfu8spGhso+WaHlHfXwVNGG0rDhTtHj+vDD1PfiOaAQ/XDvLEynjKtaIa2De1LZ0KnE8ROVebRCxVgJMrne/gqa4vOwh8YOMDqfrYtUqNwWfgpQ0qODlvu/7Zo050KK3xQAvhGmtUai663faWB79Uzy3eYDT6X/4fl/RYvvmah7WPbNvbL0wN6bJyB4P1cm+ydyANroH7TZ2Vbl63mSxmaMoi30j+TIzVRhV+v4B4cwwUyL5LzEapmzAEeA1QugWQZbdiLuW6E9oYpf0Z3AOxlKWKcT/ReH+LU6qNJx5wJln9NGadWJMuWrzXBcr1cO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0lVyBbumbKA9XU3lx5FOupDf0y+6cHe9tVHenVPutM=;
 b=p2r/tC6jUK2QGTxHLBwdqowfOlec+WWEZSmB0bWAgRfuoL7ROmSiuCxPWS1rXiutG1J24GyS0R+x+49sU46Hb8sFvpuzBQrsENKtBxrDhuhnWDpSvDx9jdak1cp0tWhy1MsZ/QNxAE7bPOIxGDdTfX80EXbZuGPu3AtDSuGtdf1E+2HKYzlNAUq17iefjqczCkKOD05NtPilJjGvMnmKcUDrDrp9ufQlrhFX123MKDwRpKgks51uhbZ055BlJzrtm6LJ6OIIVpj7HWEF5gNeRQRLWJKWtCED2xqq9HG2qYczYgkBOsgHYNp+ghc2XQYeenfHqcKY0plnKqH1eMcJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0lVyBbumbKA9XU3lx5FOupDf0y+6cHe9tVHenVPutM=;
 b=VAcoCxO6TD4c5c0MvOPwKerPO/JqHQ2XADHaBZuNDC+4ACh7qFuKlHlmX+DDWMczaG8tFIPGgVch94a3YKsqYFydqmTZ2tRarijbb+mJDK+TcCXvL0lxr0kf1Ab5SXINoynGGV97D5S5m4v7scVq49uROTR46SPpHpCiFWrbz7Y=
Received: from BY3PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:39b::33)
 by BL3PR10MB6236.namprd10.prod.outlook.com (2603:10b6:208:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Fri, 9 Jan
 2026 18:11:17 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::6d) by BY3PR05CA0058.outlook.office365.com
 (2603:10b6:a03:39b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via Frontend Transport; Fri, 9
 Jan 2026 18:11:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:11:15 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:11:12 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:11:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:11:11 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IBBqd353026;
	Fri, 9 Jan 2026 12:11:11 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veGx5-0000000AUkl-3UNm;
	Fri, 09 Jan 2026 12:11:11 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:11:11 -0600
Message-ID: <20260109181111.2501386-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|BL3PR10MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 62296b58-a608-44db-0b60-08de4faa7ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|1800799024|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a1mVyfC9V/NU9xlEKJ81VcYev+JyF7ovaH4VbMZbibmjkYSrhRGfF4axdNGj?=
 =?us-ascii?Q?L+Hglq/XNZ8/gd/CQHlCes/iJ/c2K/hyw+DMly62v/XXVmKUGZMa5ZuRNjPa?=
 =?us-ascii?Q?z7mhO6uoqQxZraR6gd5gKxXO+1dPdBIkn+kcbVUNIS1Si6mYCLJTAkO49zoY?=
 =?us-ascii?Q?6Us/zYu/F0EjCAw/Y71EPUkokOhpis8xAqrCsBTRfbT3yD6kWM5C/YYQ8nX0?=
 =?us-ascii?Q?zojpeZOHibNsphM2Lk9uwYWQ/VPPn+frm39RS+pX2zGW5cxkN0syznp7a4QN?=
 =?us-ascii?Q?PKc0hhabWICmRZxzQ+p/6jeEDdyZePNcYUdfkKrYbFDz60DIAhoqwDx3RIJC?=
 =?us-ascii?Q?sI4Ft7IcLAmMMxjE27/+4aEcgDzMpyojcF1jHABpdd+FbN5huWve5f/O/j86?=
 =?us-ascii?Q?dFYlvDrQCEArCGomZg2bKutkjh3/PN8ZyP8/4obl7IiX3OW51VgPWt3dt8mY?=
 =?us-ascii?Q?8FpkHvFvIFM9/7emQe0XQCypsJCUL2pRwinnLMnwSrJGJ2osexRlnIYlJl4M?=
 =?us-ascii?Q?QIUMab64X/wKtpVAhHVbSRyr+WBFx2IP9rG2KVOds8g+uJFxVJe/pA6xK52T?=
 =?us-ascii?Q?4s0dPi8yCohYTvM5PSWNGrOcsxMQ7HRTnpPaN5Ac7sfMtzsKt3RT9tB2VabC?=
 =?us-ascii?Q?xS6wAkW551FnW7RO/S7MEYS9mBaCVZ/huoCOX8tuZlr+35In3ktyL4ueTvTu?=
 =?us-ascii?Q?U+CoziLXGFAVHO5TcwNcnW2vftprdNmAVCTTszJz4gcdXyYAYLlj+RBbojeI?=
 =?us-ascii?Q?M2dPfafSsT7U17bwYWy3kiGbZgKzlW+OoHfUnlNvYNcYJdOCLEeXSfJTVezk?=
 =?us-ascii?Q?WTLfbiPIBr9mzfJafKXdyQt69PkV6Oikhwbyo2xXaojdNdlCBqTgiP+9Eof6?=
 =?us-ascii?Q?v2Ft/ZgufrcXvduHXI5o4UD030nwIQUK8dA94RjRO2Nfc3RZFq9VNhhF6YQS?=
 =?us-ascii?Q?0XKyjK+xrmZSaL8CAHSQNr/oDlL9vISsJWUYy+/ORBjRwuKKQdSP2Yr2tBpr?=
 =?us-ascii?Q?A8I//KQWo+heGiRzHm38RAx+AICwnrwlUoIY5HIaVWZksb8FHLv0iqkhDm2Z?=
 =?us-ascii?Q?vZdJZxBZDwW9nrULQAPyN9navTlWfPB4S2nRqIC9YdJWXQerM6KuSRWqpUe6?=
 =?us-ascii?Q?AyMKVdd80I0svmQxDZ/YeuHV5HsEeAoKlS01F8wxu0OCQNjem0mNYMsZC1hE?=
 =?us-ascii?Q?yjNz5vQ5iowVbK9sE4vv6izfe0gd7VBUxPm97oOhex4v5b53NWK7dM/FtxNw?=
 =?us-ascii?Q?P7z+u4QX7wghW9dHoHfoOshFTBJsImCyQ4MkhoPzfKiAbp1Qx9YHQRRui5Vu?=
 =?us-ascii?Q?cnWzIGMoq1XlQe5ruzP+uJZJV3TgRb6dfgzgf8D6ZxWaihBS7hLsWobVFYUy?=
 =?us-ascii?Q?wu7UI2Q6WzSEY9nDKSVJg9HpzI/smas/Ta+7Yw3WbjNcZXf7a5lhrK9PjkLy?=
 =?us-ascii?Q?rG4kfBWYN7P3kFGpda6h1hDrSnRd1QmdG1Ekv156zQ5vqVbmkceHqE3F6u/0?=
 =?us-ascii?Q?Nr6ok4dBWJ67fPfLvPjZO1yXeP86Y0vdAre9mslUpUo9gQ71KP8e6de+NC63?=
 =?us-ascii?Q?hVmWihjM0rWnJTc8yDw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(1800799024)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:11:15.4249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62296b58-a608-44db-0b60-08de4faa7ab7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6236
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16939

It looks like we were modelling this initramfs off of the wrong example
from poky.  This setup produces a much smaller initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../images/tisdk-tiny-initramfs.bb            | 33 ++++++++++---------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 157248e1..c1c1f358 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -10,26 +10,27 @@ DESCRIPTION =3D "Image meant for basic boot of linux ke=
rnel. Intended as\
=20
 LICENSE =3D "MIT"
=20
-inherit core-image
+INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
-IMAGE_FEATURES:remove =3D "package-management"
+INITRAMFS_MAXSIZE =3D "65536"
=20
-INITRAMFS_FSTYPES =3D "cpio cpio.xz"
+export IMAGE_BASENAME =3D "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
=20
-INITRAMFS_MAXSIZE =3D "200000"
-IMAGE_OVERHEAD_FACTOR =3D "1.3"
+INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev"
=20
-IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} ba=
se-passwd"
=20
-PACKAGE_INSTALL =3D "packagegroup-arago-initramfs"
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
=20
-export IMAGE_BASENAME =3D "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
+# Don't allow the initramfs to contain a kernel, as kernel modules will de=
pend
+# on the kernel image.
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?=3D ""
+IMAGE_ROOTFS_SIZE =3D "8192"
+IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=20
-# To further reduce the size of the rootfs, remove the /boot directory fro=
m
-# the final image this is usually done by adding RDEPENDS_kernel-base =3D =
""
-# in the configuration file. In our case we can't use this method. Instead=
 we
-# just wipe out the content of "/boot" before creating the image.
-ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
-empty_boot_dir () {
-	rm -rf ${IMAGE_ROOTFS}/boot/*
-}
+inherit image
--=20
2.43.0


