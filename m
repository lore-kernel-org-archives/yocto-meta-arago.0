Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96764D26D86
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:17:31 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16531.1767982644033416485
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=poBPN+f2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.50, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdN14KgJ4f0iE0AusqP+V3YSuiQOonT0NBLxxOthhiBnLOlhhj5jA46K4+8hqDRGXRNUps373cjqy5L9nAl+kaPhQC5c/Q/b2pZvP0WSpILFrRmWjz0gNKkI20/Jj07cxt8Dt8iQeVPcNTgRxgDVhnVi9xKsKLSbLdcuJAaqnr1S8VLaSX+diCmHpEslgH6Vz5ez+3RDtGx19KFJTDx/j5Rkm/HIBd3nccuHvygWRt8NZE0GSQqPon8JKaU7HxALEoBJu3RPKSukbMMmW7QX2QfOue3ojrpZhEOA4q97tcejN6WFCoIEQ8JzMzwqJpWTdem/6W7RzmMosxWvstsR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGnWH2uB3VgSdwUZV9b1Jqk5wP0mWpnzjRqwK0HSI74=;
 b=loRzJke5N00fp44wp6mLHBgpRmD/OQU9PPCVboRfS4FLSUyLMOqHo4xhhjZQ0eQE7QYDMYQ8EtR474MUZLv3oDa2VFfFJ8UDkIE9czxgc6ew1wwP6Ln2K0PoahSxyptwJVUYrMj99el0RaUVCy7+RZSu/JXHv7sZtBgbxedXMOgWsxcLAr9BEyLkNXgbwLPQLKh0csbpZu+oBGRIxoQfWTPaZ7ptO0oQBRfNHs5liJQc8TkXu7TwAiEZd0eevGMq2aTryD3elSyQns3LogkKgN7t36UoC2AJLnIULvANVxlvgRwjvsI0hSj3dHqLUa4+miyqqkSy/4Fgow7qU0ziwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGnWH2uB3VgSdwUZV9b1Jqk5wP0mWpnzjRqwK0HSI74=;
 b=poBPN+f2O6zX0Sff/jxctUX4Gt4gVkVG7fTMtMG2dcUkG7sNl+rWig341QTQTgxt4yIkqlzqVfFDcPJaGrhFr6jdkCF5zWLg+TT47B+3GBm7/TtlmcGk4KS1DwJ/nv2X4FL5MLYalO4FbWPtCIdJ2N14FgRJtZMx8xLe5cL0CSk=
Received: from BN9PR03CA0885.namprd03.prod.outlook.com (2603:10b6:408:13c::20)
 by LV0PR10MB997590.namprd10.prod.outlook.com (2603:10b6:408:344::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:17:21 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:13c:cafe::b8) by BN9PR03CA0885.outlook.office365.com
 (2603:10b6:408:13c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 18:17:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Fri, 9 Jan 2026 18:17:19 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:17:19 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:17:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:17:18 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IHIab359902;
	Fri, 9 Jan 2026 12:17:18 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veH30-0000000BZGy-3ZKh;
	Fri, 09 Jan 2026 12:17:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:17:18 -0600
Message-ID: <20260109181718.2757186-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|LV0PR10MB997590:EE_
X-MS-Office365-Filtering-Correlation-Id: d983181b-cb68-4af8-97fb-08de4fab53d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b9OaYjT+sUev38N2Z88L+d72GVJ3Ow158mIbIEB2fz4s3ZVwm9vR0puOx1Ba?=
 =?us-ascii?Q?pI/eJxux8jCX7l0SoostjbOqSsy6kt6aThwl3RYWBdAZtNSUGKPs6r2cOyv8?=
 =?us-ascii?Q?YI33Rst3d+0xhjyzYS1XeMNgYWWPWOeNITD9SODvvrQF+rZGymYwC8R2+F/K?=
 =?us-ascii?Q?H2PGArmT/gsh8k5+d0AS0XctBZrOvF7BlhCUFIoWEYR6kre8X7DuM9+ePiOm?=
 =?us-ascii?Q?sT9ha7mucOQnJxhgt2a+Te3zo1fDdVJA5ZZtnD8T9fBYaWZigNRn4XyVYkJo?=
 =?us-ascii?Q?4khWop6TWAvh/wKs+MH8UfMXHSXKXMrVk/UT9V77Ct3MG2c9InWdWwxS+3Yc?=
 =?us-ascii?Q?f5vUcACgY1m8GffHhRavDlytYIAOxkMzxAKwn/gOpIoCT57c3Wc8N1RgHegM?=
 =?us-ascii?Q?NlCwWb5g4AAiaGTKMRwTi8I0nHClLG6VyYE2UQ9jW6xwm7R5AE5WhEaeupjA?=
 =?us-ascii?Q?SW6LvVQujE1eiXQz6FKhrUcoXoLiEIS5EFY1XgpaK897dUJweSAV+PgCFnDO?=
 =?us-ascii?Q?a2krH6zA+B2xC/LrVXHS5c/6n6NtFPrnPgb2wnGK3tQZrrFlHkqWsYpZXcoj?=
 =?us-ascii?Q?BvHZQJVzk4Z3XtHwk94QnBCd0aURRuKgBdlNkzuWqXnbP6KJS3n4fJLoisH8?=
 =?us-ascii?Q?I4hpfighHjqcjk55vUPbsQo3RWadhhRyepVng5Zscs2YW0XWg5yI8fa3n6wK?=
 =?us-ascii?Q?uWsEfBx0JISONpSx0RBuAWfalcoJUl1xTolT+KCJMXEiLQY2SQeoQ8u9Rwgj?=
 =?us-ascii?Q?xL2uO330FwqCN5E3Tx8yLzOS9F+tH3mrvrVs46tjFZ0lcSZchUmHBnbKWwzt?=
 =?us-ascii?Q?d483DwP8ENX320ksvf990HKMIzw+fUqqdnqUSwzkA9gy0EZsCZUGTIx87rzo?=
 =?us-ascii?Q?zY3ujUitq+qlBTdHtj+bPKtAS32O8dD+B/6yHhbmWOpvkR0ieqC6cXEId0OG?=
 =?us-ascii?Q?ZKE3pLE/CPiS2tcjFOjqNdmbctD65T7KNtsIMjQczuwAymxslhAkKBshQGMT?=
 =?us-ascii?Q?+o080hZCXclGTbXVQPuZXoU+ja71L79Cug7ZgnCY7ws4EjJvGBy6f8FDKeje?=
 =?us-ascii?Q?afXfmodJk4NNOSx0j+eCcyFT3GXo79N0SpaE0aPxdFx9EVUAWV76GuXDBxt1?=
 =?us-ascii?Q?gjblxQUDFtgLdSBALCpa6w50uyF3FPWrHAzFjffiOnxXl3LCaZOROPpsIDtj?=
 =?us-ascii?Q?F0ybPznAjOSxuVkx6/sh5CHG+XI4ZrHvLpay9qMszJtu24+dVrfQpFMaRE4S?=
 =?us-ascii?Q?DTM7azSrzId5o45HicC1pUHs4LYxSZCAzOl/Pyh36kO+BzP6bMuAKoBAfUXA?=
 =?us-ascii?Q?MqHIu9C9I7ns07UiBjFBaqdaX6viqzD1BcOVPQzchq3YCkX7VnvUAq8s7EZu?=
 =?us-ascii?Q?supRNCv/HfYbr82VY6/HUV95Nk2OBHL76ogV7NnVss3COl7YgHybE/TLcfLZ?=
 =?us-ascii?Q?uCwTRjS+4kBKQu1UOaiRSgizfo3ApL3MURcjDzNlYKRQHn4KPptLkkz9xMLz?=
 =?us-ascii?Q?BAUOswuu+s3ilYjUXEpCEbmjGfNxyAoz4J1Mga5mgpQ70MAoyPKnpSb7fEJy?=
 =?us-ascii?Q?c4yVjZ4bcASDkc/o184=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:17:19.6161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d983181b-cb68-4af8-97fb-08de4fab53d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997590
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:17:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16940

With the 6.18 we are moving to using an initramfs to provide non-default
modules for booting.  So add that override to the machines that need it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 5 +++--
 meta-ti-bsp/conf/machine/include/j721e.inc   | 1 +
 meta-ti-bsp/conf/machine/include/j784s4.inc  | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index 08111f82..1fd4a1ac 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,6 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-tps6594=
-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-tps659=
4-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-tps6594-i2=
c kernel-module-tps6594-regulator kernel-module-tps6594-core"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/=
machine/include/j721e.inc
index 5ec43049..29566dac 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -20,5 +20,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_6 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-et=
h-fw-j721e ${TI_VXE_VXD_DRIVER}"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf=
/machine/include/j784s4.inc
index 6ba427cb..42c95b11 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -14,5 +14,6 @@ OPTEEMACHINE =3D "k3-j784s4"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw ti-e=
th-fw-j784s4"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
--=20
2.43.0


