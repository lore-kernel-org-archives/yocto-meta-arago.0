Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7FEC98307
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:05:23 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73684.1767643515016623909
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uJyUAT4x;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.27, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2TgoPnwhOebUGHzj1pUx23mqb10m3lj9uMJjUGPk2S8TiiCWW4MJcLzZ/LsPT3jdKoqbkRcLfTN2IitLM1RzSaububnBcqot2coBvyP74P9dogKGpju77tXDEPgfPoafomsxsQ6r2AZyUQXXWuy6FDp+Q8uy/adrDforMbZzE79dFfJnN6GB4UCT7jj6szq7WBd4CI6tc5eaEJgQUi7vkWf/YrARAOWqS8aUohgasXszmdrDs+txC8M72pSV0SCeVJ8lbjdxfaFVPtdtNffBFic2u4AmEZ4o9Oq2Xq2n2XGbAmKaCkPLhcHqG6sN4masWsq6tHyFxCmBwal1e5vKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plAykIypjT0XuqMBt4n/yay3DfV7Y2VCbQWpZ/1Yb4A=;
 b=QWigZkS/PYcfPdESxkholDeQXMhCWeUtbPO7qNX9oucc6zgxEzRKXQSKc7nsfsPN0z6NwXT72mWtl8BV+2JAa5pMujYhDRG6IXTiD9BW/yJ4pbib2cFJ3qQPEX+0HIk0tjELhNGQ/5lusz0FN1gCr7hniXU97ALmF8uKTVNP8RKAgeB3P53YVIvNEJ6ETI5JSDIJqBqyAMGkLwH7Fh9QrJCheEJAo4pnRFLM/xm9+QPJCtWDdfSOI3csyugP7qkeVXV4w8Qa8D5DOt6UuTbeB6fMfzkx7al85qyctW6x/jKQcakPeBKkpLMg7sOvjJv1VefUot8I7aNLEpYCPn2lmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plAykIypjT0XuqMBt4n/yay3DfV7Y2VCbQWpZ/1Yb4A=;
 b=uJyUAT4xtp0weZmrso3Gm47Fq8Q8MI++eWxNgNANKEtHFe5rX60gJJWQt/FpcaG3OOeaf7KnVhBt4hEIY69FUbuiTLzrSJNsiP8wTWwqqbZb+bojeG2PpOz290Pn94UeedqHUemV6jwt9dZcXB01dqJB0n0k7sj/2qCEPJR9qX4=
Received: from BN9PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:fb::22)
 by SA2PR10MB4795.namprd10.prod.outlook.com (2603:10b6:806:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:05:09 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::6c) by BN9PR03CA0047.outlook.office365.com
 (2603:10b6:408:fb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 20:04:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 20:05:09 +0000
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
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605K53BY1831190;
	Mon, 5 Jan 2026 14:05:03 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/5] arago-image.inc: Set IMAGE_FEATURES in each image recipe
Date: Mon, 5 Jan 2026 14:04:52 -0600
Message-ID: <20260105200456.2472163-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA2PR10MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d41440-dcae-4f18-3b88-08de4c95ba66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qYzsTQvmEPDbDLtBTdFJMxC33nOhx5omyl03/vmSk73tjgNlZTJydYydFG1i?=
 =?us-ascii?Q?P28E7eAGFKC4x9qrCYUHhJCXo4GW845jpinhWrxmzmmrXys3wwWnXTHRQPuV?=
 =?us-ascii?Q?nP9SG0uVszOGXCeUWUjBFt8TtHhuD9fgUwC4SwIMbNwARsOrTXGenbP7Z2pf?=
 =?us-ascii?Q?0aibFwc9vZ6qq8L9ritV+XuUbgmSvV+430bWhCbtH4nyXlMzMe+JMoH29dPy?=
 =?us-ascii?Q?6/a5OTyCe8wyeu9S+GPnHbe5/w1Ler1MVsSJ+5nalnEqXHYKI1sTLMSVwJdz?=
 =?us-ascii?Q?Ln9f7Va7nJq16V74DAjJr9WW7bGwGebajvHj2hv9KAcmka76DXOTs2zUHhcO?=
 =?us-ascii?Q?LRdPofwPjpzMyaL81K3x6xI1yKwDRPHabeKYcT/r3/MYfqB3cBaJYOMOzu+R?=
 =?us-ascii?Q?QZV9t9cdeqszNHj5cSIlqRJWkcTJvtg4v59iBJL8qWIoz8YtUfEDm5yTSBqm?=
 =?us-ascii?Q?HlnB5mRzr5964lACZDO4TXNlpKX0B4dugQHBdJlSJ4UCjNa4T8Ge5JVtBEW2?=
 =?us-ascii?Q?4/qALqlJeaxP+wMKEv8boXO12/OTude7d5vBeDz8/hf8g/2jiURdJ8ArKoT9?=
 =?us-ascii?Q?6wp2Tqg+xlqXgO21V2F/K2lmCxA3uB9+sN2CyRMl2wV+E0O4vq88WO2hOD+E?=
 =?us-ascii?Q?eslo3sWrRD/X46PBH1BU4u8XP+/fOmlJ99ba+7UnRKQHItYUJ1w3WapwusTA?=
 =?us-ascii?Q?0N86YqwPTMrS44RFxW+wurWc+nPHZdPJC8gj551qaKU1yeV+j3IHoa2/5P/n?=
 =?us-ascii?Q?o2F1r2BvMkXxmwfZXd+2HvVhI4ZF+q1ZHFlm5Us6g7m9wrRMBmhLbOHmJEB8?=
 =?us-ascii?Q?LyBt5FbqOZNIrSCA3QOzjo3OrgnbunmXV0dugp279kNpvIZXxg66WuWwCZt/?=
 =?us-ascii?Q?ZDJEFQPTMYdPLXm1/Q7aK6kjSMBzK9eFaKgXhPIiQyz/01EMS+szGdrWQuLP?=
 =?us-ascii?Q?HQ2QsKN35kvbHL7hy8yZxRQbQSMMY2i3tSlnEoUOJh0HVbRQ4Uzx0K5X6GK2?=
 =?us-ascii?Q?eI2aUJpHRZf+E3vvyg60ICQKmiKxnXZRftaUdvFMG3V/JWlU2g+TsGxbLO01?=
 =?us-ascii?Q?iduSWhzmtoIpGYIxCqRBV7fk7jllPsYvkXDcJ6U0sQnLmcAqjl/oq2e+0dJx?=
 =?us-ascii?Q?Q1aoLgw7C1Lwo8qec4sFEYx+zwbiyPNy7kmJASu65yF4fFbNcsbt5bbBnYNj?=
 =?us-ascii?Q?1C6122iwuGdIQ04l5GbvI8Rp4AsqJcQoreuyNNviq5WYJFhR3cNko5+M8WX4?=
 =?us-ascii?Q?luD3X8jt3cqgE5Ghf9CH51quoHP/2YI+PpzzYb6bd5VZpcY6dJ/QC3vypLPo?=
 =?us-ascii?Q?2rg7uI3wU59V2/ZkQwXA31KSDWmwyHiKWqsNBCgOB3b9Xy660WomzMzAo4UM?=
 =?us-ascii?Q?yY94jr1XGwqDoR8EDNJ8MwViPPuVzwzS4N34YDwxL+czkjpyOFk4sAznOn5U?=
 =?us-ascii?Q?fQZnkZxICzBEjz0Bj5FFNeEjZukmXezKG9+hB9rjWCwraH3uPIKwfkvpnkTD?=
 =?us-ascii?Q?sg4AOGrWkebPaeCgx2mW3nizTunllCYcOBBfYqw3bePjfROs/PXXjTLr70UO?=
 =?us-ascii?Q?JoVbjIiJjWM7RJXeqgY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:05:09.3099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d41440-dcae-4f18-3b88-08de4c95ba66
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4795
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16916

The "common" IMAGE_FEATURES found in arago-image.inc are not all that
common after all and end up being removed or replace in most images.
Move the image feature assignment out into the image recipes.

The only thing arago-tiny-image.inc did was include arago-image.inc and
modify the IMAGE_FEATURES, so this can be removed and arago-image.inc
can be included directly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc        | 2 --
 meta-arago-distro/recipes-core/images/arago-tiny-image.inc   | 5 -----
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb    | 2 ++
 .../recipes-core/images/tisdk-bootstrap-base-image.bb        | 4 +++-
 .../recipes-core/images/tisdk-bootstrap-image.bb             | 4 +++-
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 2 ++
 .../recipes-core/images/tisdk-thinlinux-image.bb             | 2 ++
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb    | 4 +---
 .../recipes-core/images/tisdk-tiny-initramfs.bb              | 2 --
 9 files changed, 13 insertions(+), 14 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-image.=
inc

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index 37b20850..33dca89b 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -4,8 +4,6 @@ LICENSE =3D "MIT"
=20
 COMPATIBLE_MACHINE =3D "ti-soc"
=20
-IMAGE_FEATURES +=3D "package-management splash"
-
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD:ext2.gz +=3D "-i 4096"
=20
diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/m=
eta-arago-distro/recipes-core/images/arago-tiny-image.inc
deleted file mode 100644
index 6c726c4d..00000000
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require arago-image.inc
-
-IMAGE_FEATURES:remove =3D "splash"
-
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-base-image.bb
index f5d5f29b..f6a33f13 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Arago SDK base image suitable for initramf=
s containing\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 IMAGE_FSTYPES +=3D "cpio.xz"
=20
 ARAGO_BASE_IMAGE_EXTRA_INSTALL ?=3D ""
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
index ce3b008e..12ea697a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -8,7 +8,9 @@ DESCRIPTION =3D "Image meant for basic system verification =
of linux kernel.\
  maybe used for basic platform bringup (bootstrap) activities.\
 "
=20
-require arago-tiny-image.inc
+require arago-image.inc
+
+IMAGE_FEATURES +=3D "package-management"
=20
 IMAGE_FSTYPES +=3D "cpio cpio.xz"
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
index 5fe0463d..f39e2e35 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -8,7 +8,9 @@ DESCRIPTION =3D "This image is a complete package containin=
g a rootfs\
  content.\
 "
=20
-require arago-tiny-image.inc
+require arago-image.inc
+
+IMAGE_FEATURES +=3D "package-management"
=20
 ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?=3D ""
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index bc067857..077fe05f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Complete Arago TI SDK filesystem image con=
taining complete\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?=3D ""
=20
 # we're assuming some display manager is being installed with opengl
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 5d1c26d8..1eb864a6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -5,6 +5,8 @@ DESCRIPTION =3D "Minimal bootable image with container to s=
tart the next\
=20
 require arago-image.inc
=20
+IMAGE_FEATURES +=3D "package-management splash"
+
 # Allow users to tack on additional packages as interesting.
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?=3D ""
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 0bb6b798..8e7712a8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -10,9 +10,7 @@ DESCRIPTION =3D "Image meant for basic boot of linux kern=
el. Intended as\
=20
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?=3D ""
=20
-require arago-tiny-image.inc
-
-IMAGE_FEATURES:remove =3D "package-management"
+require arago-image.inc
=20
 IMAGE_INSTALL +=3D " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 157248e1..f367fa30 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -12,8 +12,6 @@ LICENSE =3D "MIT"
=20
 inherit core-image
=20
-IMAGE_FEATURES:remove =3D "package-management"
-
 INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
 INITRAMFS_MAXSIZE =3D "200000"
--=20
2.39.2


