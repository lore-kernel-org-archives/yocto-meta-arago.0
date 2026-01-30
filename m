Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DF2D49C9F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 11:06:39 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8016.1769771192906966858
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Q6kdVFZh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.58, mailfrom: a-dutta@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6t+EmOESS7daAX4i6lZCPync70qU9S422mbJ9iTVzf93dCiwoJ0hzqZRGZyPRhg/m8qKIlwyLJW/wnnOWt0Qa+j76mvNjkVHKw7rqM5qtJYmjTypR7ceLD5kcvXNbeixid0grdBMprPAIMZfLKLqA5FLRoE3EFf5d1aV5s+Q4LvWV1Fxy05LscaCZgHxo+Rdk7CG/Brr4MbAlFLDiOkTFPKPgc5JhJPHgIAdZ01wJskzegyPOevT6lRl9rYsoX6gY7XncfrN97WOdFhNU2nuuJjcZoraNonQ5gVWeGZTtCg7IbTv20MBUrnv2Xz4QTxI88A+VT8EyC2qHbLZjxBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BjbuRtdDXNFBQRzQyL7wOhQFXISMcorp9DE2f4CYGo=;
 b=KUEBgTfTbdDJ9xLwNvUyr0FkQ6gC/P+E4QfU0PRFdEE3bJ77Jkncr/mTeOqgA0ACcI+3VeehPK3j8u/RaYt9by94hFUGyaOL6/rKzBft3dHbz4wstvsuSvU2IjE4dJN/rDDS7djYoWiD1oXVd4v1e3p8+JnVMBl60Zzi1x7xnywEUZRnkvyJv4Ouh8XJNFyXhxfxTyAF+A8qAl05oJ5D7KUPhkPudbKZZwPO1SEoHqBR+Rls1nTAb38um5a/bplMdeHdO1rtMK+PK2bPHeg0ZRbFEq5tOs4wKPK+DfEpkv5LQrdN/5KR7lkXr/OcmStA6rIQyJrygkk7sY3ZCuiVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BjbuRtdDXNFBQRzQyL7wOhQFXISMcorp9DE2f4CYGo=;
 b=Q6kdVFZhiWSWtzrwIxwj/Fy7XlM+KEAa2kSDbqm4EJ6NGe0CRupf0O7T3M/jzEW4SohMBrxo2iuFnJQPZlpMa3sMh6Bm1IhxxblFvjaCjNYSiQ3LHaW70reXvXHr3dEOFKVX3NWopfybblxtaWTgwxr02iFjQh9SAoavwuAjW5g=
Received: from DS7PR03CA0062.namprd03.prod.outlook.com (2603:10b6:5:3bb::7) by
 SA1PR10MB5844.namprd10.prod.outlook.com (2603:10b6:806:22b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 11:06:27 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::ec) by DS7PR03CA0062.outlook.office365.com
 (2603:10b6:5:3bb::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 11:06:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:06:25 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:06:25 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:06:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:06:24 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.235.228])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UB6MeB1611894;
	Fri, 30 Jan 2026 05:06:23 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>
CC: <denis@denix.org>, <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>, <a-dutta@ti.com>
Subject: [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for MCAN to meta-ti
Date: Fri, 30 Jan 2026 16:36:22 +0530
Message-ID: <20260130110622.2338091-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SA1PR10MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c5577e-fc0d-4819-ec87-08de5fef9c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ty7pONkavUsN17ubtktNqJnlrhYkrc1LBbEZsck1sQpHDwtYbpWTLKVqJh27?=
 =?us-ascii?Q?4+oHKah8eAAOFYTrMypQJLwiikTdTCuRcj68LOZ45aI0UxHpgxmvUjz1KklH?=
 =?us-ascii?Q?9640j9KetDm6r0mifCbGEziPx9mddOHBxwqWhGBMTSWhZLU5xOOTzPNHGPhO?=
 =?us-ascii?Q?YmkuwOr3iRn2yUU3fZKK9J9BFtdY1zDlbk7b8VbJ8ksSG39I0R845I5Z7AyU?=
 =?us-ascii?Q?Fir6wukRI9MIbeU9EyDFZeC0IAmNAPYcwsXc8QERyat6dXsY77S5N3yORm36?=
 =?us-ascii?Q?eOo5uHI+nWAbI84tpny+wNSlleyZczQqT6NiirH2mKbvzJA9TSS1mNMJbEsr?=
 =?us-ascii?Q?h3FHMj80mXQb62+v4XX7yLYaJ9rU/jdQknYghx8hjAn14F0hCRHAckCkAovc?=
 =?us-ascii?Q?5Qi6W3t6vHDrvupxFowuo/fDRcwCQya7mC+iNkK8Uti8HxjEj3Rj0Q5ih85Q?=
 =?us-ascii?Q?McCGF/HIIPqKLIgC4ugg7rRHP0kN/rJRuCBHa7VWgeVvYbi1iB6hbGrRu9Yo?=
 =?us-ascii?Q?UmbMtn110SMRFTwmOPljbfiqla1gHC4BLKxtG0ZVD18d7VesO8MAx4MO3Anb?=
 =?us-ascii?Q?h+7wyt9CgJxDpjcXeJVMT70NMC8OW7AETheRDKMMnlFcSCGGcCLujhdOVwYm?=
 =?us-ascii?Q?4uwa+W0nHa5f3t1IIzJvrbbOAjD1bldGfCFK5+Tkqz5Tqu3eNqMnxhoNtuiK?=
 =?us-ascii?Q?PkjYJWLOH56t7lQUlPbgHhdnRWW2JEBtBQ+XhGgpJOPQn/I7bCpFr7zqBV57?=
 =?us-ascii?Q?3xpxD+K6tRGaQ+ggQIp84zrA+47Y4mwUNFYnIRjk2k4wn1/kCW2s/vQY3ER0?=
 =?us-ascii?Q?UxbYZRF959R5zTcqqD5Wzsm1BB1Ec5EZwHmQlYCxMhFtlSTuq5GHBbqhc+rW?=
 =?us-ascii?Q?XgrozY7QV6hM5xpO0q+GJsD5yF4fkw/Q8yYbNHQusZnUMHIPJVJ68PixPOZm?=
 =?us-ascii?Q?haPy5e35jep1+xndo+07ZW7CnbKfKJ3DLIvZoo4ZkJUoxteQ85lWDhQXm2DO?=
 =?us-ascii?Q?pxk5eYxBkZ3Jw/cqmiCigQodCBbzzuwjFJPkzMJFKbbjuOSAy6CPrWNb2Ghp?=
 =?us-ascii?Q?H4UUnmyBsZesdapB77jcl1/kPaE4A5kSDkuiKhPt2TW205hXic/jvQsdYLNA?=
 =?us-ascii?Q?I79/g/qKHUiYkoP0iaEk2Z66X0wiKaRDRATrN7B1IDRB9KhTN3LHKIPKU9oH?=
 =?us-ascii?Q?lQ6owVco9go4ZIbJBFGggRNIogNkraBJEFyaqooUXr2cqwg0J5QJz8UmjXW0?=
 =?us-ascii?Q?ujnUu8xlXO3CDET51FGrAQLkcWgDKifCIov2NovH4El+XAeFYfat1DTQjxdg?=
 =?us-ascii?Q?9MqxphWrmRuQfqDozaNpHOFjqWxa/PloT2Fg7lCwFudQPqg9PgdXRQYyNuzk?=
 =?us-ascii?Q?Ytu7hcN8NZkQj+f5z+DbjBGJ/3GUrPp4AAA0wNJUbHZ7pfZ6AnY4ZHt7oY84?=
 =?us-ascii?Q?7vcackiwXmCb/sicx6ztPDcUhCNGrGkIkIggBW2G37gM3EhI8p8CgyGVAHOk?=
 =?us-ascii?Q?mjBVE9Cf3L1eMIVG0pQsv7k+h00ZeD41bqG33aAHGck8Gv7zkFJhgtjYBLs7?=
 =?us-ascii?Q?jNk1Mk9tCRd9DZMIEv3tjRLneWWib7F/t6LRAyi64xoPebXfGsgQq+1CKBu9?=
 =?us-ascii?Q?WzDAyU23fnNDzxpmeaYWdEw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2ITYAMdsOgTUGl1IufwcUEUcU2fjYc+SsKS0durG8z3hC9o1XntPZ7D3QFcQiFJiHLuA/dfxU808OPadwliFwn8UHoKNPrNGy+Mwk+yBT/Ai6yiiksU0yDyA8QJhk2IBbZP3B1UHAhApKqC8t6LFgLp1PH1TzuTh5Q8c/63CroIBw14EJ4+yrDOBniZ3DOX8cGGb5rQjREDP5ecHvykONE1y+h/BUUGZsoLiTMcY7YsK8NLcuAf0RMobFHEWqaqRkDRD1tCWIFQxperHfLfHZAN/FmAeylsm0cVA1jNqfoFiSaMVMQWOODMpxfISLssGO+RFRIloj/Io81qAETokxz6J1+jWCDz+8hUzJ6DPrUf9tLgf6doykkX3NJnN++NSFQmAxo9reO0pd93CZlSqZzqClNbFt4Xm6IdbR7qFtTcRvAtqmHDF1RNFAvfzp3A/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:06:25.9210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c5577e-fc0d-4819-ec87-08de5fef9c78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5844
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 11:06:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17044

Add MCAN udev rules to meta-ti so that MCAN tests run
successfully.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
Tested on j721s2 (poky) : https://gist.github.com/anuragdutta731/67c24da161=
6e74efa2b117a3bd88ada6

Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti=
.com/
changelog v2:
1. moved all the rules from meta-arago-distro to meta-arago-test
2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base.bb

Link to v2: https://lore.kernel.org/all/20260107052154.1598698-1-a-dutta@ti=
.com/
changelog v3:
1.Added the udev rules to meta-ti

 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
 .../udev/udev-ticonf/37-can-am62.rules        |  4 ++++
 .../udev/udev-ticonf/37-can-dra7.rules        |  2 ++
 .../udev/udev-ticonf/37-can-j7.rules          | 20 +++++++++++++++++
 .../udev/udev-ticonf/37-can-ti33x.rules       |  2 ++
 .../recipes-core/udev/udev-ticonf_1.bb        | 22 +++++++++++++++++++
 6 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.r=
ules
 create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.r=
ules
 create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rul=
es
 create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.=
rules
 create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 698b46d7..68129df9 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -39,7 +39,7 @@ UBI_VOLNAME =3D "rootfs"
=20
 # List common SoC features, may need to add touchscreen for specific machi=
nes
 MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-fw udev-ticonf"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
=20
diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules b/=
meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
new file mode 100644
index 00000000..59dc8075
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
@@ -0,0 +1,4 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can", NAME=
=3D"mcu_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can", NAME=
=3D"mcu_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can", NAME=
=3D"main_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can", NAME=
=3D"main_mcan1"
diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules b/=
meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
new file mode 100644
index 00000000..3b14150d
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can", NAME=
=3D"main_dcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can", NAME=
=3D"main_dcan2"
diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules b/me=
ta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
new file mode 100644
index 00000000..f2804ecd
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
@@ -0,0 +1,20 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can", NAME=
=3D"mcu_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can", NAME=
=3D"mcu_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can", NAME=
=3D"main_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can", NAME=
=3D"main_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can", NAME=
=3D"main_mcan2"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can", NAME=
=3D"main_mcan3"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can", NAME=
=3D"main_mcan4"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can", NAME=
=3D"main_mcan5"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can", NAME=
=3D"main_mcan6"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can", NAME=
=3D"main_mcan7"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can", NAME=
=3D"main_mcan8"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can", NAME=
=3D"main_mcan9"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can", NAME=
=3D"main_mcan10"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can", NAME=
=3D"main_mcan11"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can", NAME=
=3D"main_mcan12"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can", NAME=
=3D"main_mcan13"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can", NAME=
=3D"main_mcan14"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can", NAME=
=3D"main_mcan15"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can", NAME=
=3D"main_mcan16"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can", NAME=
=3D"main_mcan17"
diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules b=
/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
new file mode 100644
index 00000000..62d650fe
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can", NAME=
=3D"main_dcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can", NAME=
=3D"main_dcan1"
diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb b/meta-ti-bsp/r=
ecipes-core/udev/udev-ticonf_1.bb
new file mode 100644
index 00000000..1ef487c2
--- /dev/null
+++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Udev rules for assorted TI SoCs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+inherit bin_package
+
+SRC_URI =3D " \
+    file://37-can-j7.rules \
+    file://37-can-am62.rules \
+    file://37-can-dra7.rules \
+    file://37-can-ti33x.rules \
+"
+
+S =3D "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules=
.d/
+}
--=20
2.34.1


