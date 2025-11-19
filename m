Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED2FCF58F1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:44:01 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17246.1763585025563317571
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LRh6jspp;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.93.198.68, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnWaTJx2G6eUKtXi6u8frB7ba9kjk5tnNrNBMhTHp1/aegFqjKdeErteTItMI46Bbu5viYB1d4FcEW9mmCpzFPCWGNrB04oLWLK7Vfi+79Z1WCquEKCLiEYMok6/8CPiwgTEzzDOAurrL7cmkUxebtDYQI4k6QTkNP0XFZBJHtCKJn/mElRYIicImYR8AqBqVyO/OZHTfWcsMBodqnW/Idz7KFSA5OAhtx2PL9h9zizxyJIn3SYT6VIaKu6o7g1k7S2dy6skATTLyPn0qaNPv8JuG4IaLEOcucVngYHXMZBr0eJ/RqTBtAGm9YzB/kxlo8LENR8B6PUcY2tdsodXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNbZcSnmP990qVGJ+Zn0LnQEHXnrvbugvon23b2DuHY=;
 b=vjXf37q4xwPhj/gWcWJvnwkQ8T/pfc0NWgkRs4uBuJeVUipXRbpwsbFDmYSDDXAyfu7NAfRCHWI/mIFz7fXD8uoyg/hkRArvDygA0+0/7zJU8SVIbvOhKWSVQOG7bg2/lpK6zYS/OxpByaPdcrGMP7g+/o/MC7gKFzo8ssINHinEuVnjoqmJgaEZILDi+QMCgyhedlGdJWbJgCLBST3DE0Vzq3Bs5+IucY44sQJds+uUdR6gxotpA2RSzBf4RRli7w4g+7v8eb7LqMz0to9dehuDD/sG4/htu7UDP25/uyRsb3TLSCDW4SLCIzcmLweGZ9P7GDfZgp1a/LOq8BLaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNbZcSnmP990qVGJ+Zn0LnQEHXnrvbugvon23b2DuHY=;
 b=LRh6jsppc+Ngax1tnDIbwtbb3w4QjLK9p6TqnBqLWH6wrxysU/pMNaaqoB1pmg/QXbxxIUORUAlLFldZwVmzs8k5sZcjRFkiYT05iISQ044Fbhoob9v0sIPoodfKMsWCl3dlTVVfOCBKPBBLG8jDCRgPVt5QV+yytum+aE8b85Q=
Received: from BLAPR03CA0092.namprd03.prod.outlook.com (2603:10b6:208:32a::7)
 by CY8PR10MB7146.namprd10.prod.outlook.com (2603:10b6:930:74::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:43:42 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::ab) by BLAPR03CA0092.outlook.office365.com
 (2603:10b6:208:32a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:43:39 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:43:34 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:43:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:43:34 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKhYtn2500439;
	Wed, 19 Nov 2025 14:43:34 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] udev-aragoconf: remove touchscreen related sections
Date: Wed, 19 Nov 2025 14:43:24 -0600
Message-ID: <20251119204324.367838-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|CY8PR10MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9343d0-c629-4251-dfda-08de27ac5214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rtQhgIc2Ji/wwSoBDt3CA0ogItmJJid0zfXv8WSOHUfeujZCjxBLwXK2egm4?=
 =?us-ascii?Q?qQ2q4XarTGzjKthfgvmS5Tmvi8f5DmU8rkRi+Up7C0flCCs706qC/IgH3Eba?=
 =?us-ascii?Q?Oxw2kAoLdAl9BA5w06zSV+Cw7TOBsB4LzmH7xRxJiQkaLnzp9YdrKvAwysST?=
 =?us-ascii?Q?mS/7ysjMpygsnTU5RDgFxmoWZ1fw1pPOhE6q/vhXmxUtUE7MdvSgQPJDlert?=
 =?us-ascii?Q?/56cjvM8CziZI15VsX3R+v0BnMJaBWxV4xK7cLBBkkUJErU/2LvtiwjkRrKZ?=
 =?us-ascii?Q?7xW7tKTpmhqlBRvvjbGI2bXVcFl0X7UTM9BQcwA8f7mXryBpDF3ooy3SgIGo?=
 =?us-ascii?Q?YL/71clVfmoVkj5I+MSduu5UUghWQoAmQqLRlxKRG+fXCUbx79ETO2Q8Ovhx?=
 =?us-ascii?Q?ihXlQZo1xZIjtCt1XNLP8yXHS/hULESIOzvxrdkAKrS/bTF5dkMEyu7fBbiy?=
 =?us-ascii?Q?4PBUpRw+0tp9qEN7mDLJyQA7AicpYzHBqKN1rSY9gcqHbzenGG+hqmTAbidL?=
 =?us-ascii?Q?85kq0JGkTJXtHLt+zOn6rtLw8SmBhKSNFLq2yie0Tu7TruhSH4DbxjOpVIE0?=
 =?us-ascii?Q?wxgdKW1LB6bTxXuik8kQMGz/3c4oikeDE6qpAdyUAu+UL8X2IUCfJoTRVcIc?=
 =?us-ascii?Q?K3JCWM1FpvFD93scGJyq0X2khH9GdhbIx5UVoQ9/QoIbwPSc1LOoOeFga2+I?=
 =?us-ascii?Q?A+h93cJV96QBvgfZmCYJoL6/DIMH0Np6h2cnXBYpIa+TDDk6sfxBuZw+BN5s?=
 =?us-ascii?Q?XOgA+7oI5MSnoeO1lMBFCNjRRwtcZDpF0+jmOJz9+Pki2WD10QZURIHzdSQg?=
 =?us-ascii?Q?1r9VAhFJsK6cewV0/bUdpUpfSO5TYicXmhsymgSgiSR/9ygmrPfMapTPIl0B?=
 =?us-ascii?Q?1qbj/thkNX1fdQ+43Vtzis9Khu9LmOQUi9LUpu10n/G01NqO0xg0wGeEb7dn?=
 =?us-ascii?Q?NFButBnqnGFfJ5WonyJZGgwKdjUybgLOaQW1kcOEvVzJ7Qwl+Xo6X5JkDkxt?=
 =?us-ascii?Q?EwzYVTYv4tX6nbDbP4BzWvOX8kmDTPFMCshqA3xIOXgtOhQV2zUuwdJ9WyUj?=
 =?us-ascii?Q?ObAU+ZJiAteyJgBC6qlhelNT4Sv+rz/B72EA4gKYaVrjzFTbws5IbT1jXw9e?=
 =?us-ascii?Q?dD8Lod9c6/Ze3jp9me3RreWE3G4E2feZAw6FOAfeWr3GeJWpoOZ5dnxQFn/r?=
 =?us-ascii?Q?ZpXBSUj0N0gIqSCrBFEnXnkk4+FGuYWq85HT94y7bU5hmCD8sC+fyzfO/hFf?=
 =?us-ascii?Q?4f6kM4AwakN4Nd7TvFE6XZ0mI7uqvvNLR2MPv0z9pO47VnxOEUymYJTRYaJ9?=
 =?us-ascii?Q?ICyMVLrUObuLUWvYYSdGBlmh7yRAjVnCbgxhzPgVbADUg0n+hUEZ1lHZa6mF?=
 =?us-ascii?Q?yMkmTxprgUYWxQXhEnbi8GiebHmOVH6W7LzsYRCmLCO5HWrQTLe88HLoPcZ4?=
 =?us-ascii?Q?W9Y0H0mUf0uEVum9Nt8YljP5r8K784DaQFZ1A9QvXRTNPSr4TlVr8ZiG19eb?=
 =?us-ascii?Q?vs1ehwCJfMwW5hkEdG0uluqLMvMwLys76L4NWNAgHiEdGLqQmvVfW3QiKzbZ?=
 =?us-ascii?Q?HEE8if4REtAP6L1B6+4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:43:39.7097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9343d0-c629-4251-dfda-08de27ac5214
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7146
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16804

From: Randolph Sapp <rs@ti.com>

In the originally cited commit, this section was upstreamed and could
be removed post Dora.

dd269c76 ("udev: fix touchscreen detection rule")

Also, the attempt to probe drivers for detected hardware as part of that
commit never made much sense. The default behavior of udev is to load
modules based on modalias values, making the rule redundant.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../udev/udev-aragoconf/50-arago.rules        | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.ru=
les b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
index 3ff14eb0..d5ec735f 100644
--- a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
+++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
@@ -1,24 +1,3 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing =
node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Try and modprobe for drivers for new hardware
-ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RUN=
{builtin}+=3D"kmod load $env{MODALIAS}"
-
-# Create a symlink to any touchscreen input device
-SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID_INPUT_TOUCHSCREE=
N}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
-
 # Auto-mount any SD cards
 ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"block"=
, RUN+=3D"/etc/udev/scripts/mount.sh"
 ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"blo=
ck", RUN+=3D"/etc/udev/scripts/mount.sh"
--=20
2.51.1


