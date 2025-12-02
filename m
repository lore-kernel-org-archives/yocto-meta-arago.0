Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A500CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 11:16:30 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5555.1764674181970658513
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 03:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uXk5f+49;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.62, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joUPLQ01yDl/FVSs6xuOEbjygw789OtvjXqaVLdqznJun1EC4Ds8jQdmmZqgAj9j1Kxa9BkYyotwvVgdPKhRy/Hjv1wFv+gEpu+hFvKCIIrhRMCJjl/i1WT4jmemDAh/FxRF7d4AU6XVLgfJj6edZcxqMweDtuv0gOHkQn4vc05e4gWpDC2P9JAjZ9NZdP8wP4r+khVAk1yQ70DS/L4/CRM2RQ5M+h1F+aE9ul2oO6nTe6W+fSjkrNf2li2fcUwG7xJexw8ZPphxo3EsPNu6CoMjVR93l9F842+ssovyu4BFv2tRUr4v1KjPv+ZMIFrWJXFozOecfuYlYx+1kACGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsOhTvSRxr4mRqW7sv3OA4t2KRSOlrUw1DHOAw8huZ0=;
 b=w00Wd0ptnbwMW4leNVQpvRkKPNhMx6alYomwpNP7r68irwtrYL6YIgGxqoSzfd1quF1Bvav1zEK+oDA4Y5JD8CQx2GPVtpTrUbnAKKCYPzqhPwDvcnfohz7+Ld9KmCLmdFzST0ybz8GlBvT0pgUfpbpPm8W9lvFm5Eata0zPV4KmvmgI/P25y3zGkc+KCaYbjqWm1A8i514ZSFwsIXba5ISkjrMr8X3gYorGEEWDIsNbYOYfCMxMzjsOyEm0iXZlQCn3BqObmf+hVG0ieH4TyD2wjzLebgTDQ8vxqlbEZKNNLQfCowldmBpQmfMe0YTtV0b/MTbVdhDiHj9UHo08lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsOhTvSRxr4mRqW7sv3OA4t2KRSOlrUw1DHOAw8huZ0=;
 b=uXk5f+49kl3zt7hhd3rmZOiBMNj+0CbwKtiC9nNHN1FdY1TT2JoSpZ+bFkUphTqmqQzO6viErArxY3/b4QP4brEoZXNfeZ57LsujkbDOGprWDLrmmLmGBFWghsimFQt/HZUzwWo5biaBZAOCCw0tgF+s2jy4m7sqcCHT52BPg6M=
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 2 Dec
 2025 11:16:18 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::58) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:16:16 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:12 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 05:16:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 05:16:12 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2BGB712143148;
	Tue, 2 Dec 2025 05:16:12 -0600
From: Anshul Dalal <anshuld@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>, <denys@konsulko.com>,
	<reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH RFC 2/4] swupdate: add creation of update image
Date: Tue, 2 Dec 2025 16:45:59 +0530
Message-ID: <20251202111603.1616989-3-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW4PR10MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c63f78e-982c-4a08-6437-08de31943632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aXCZwMFbzE6t/klS35l8Tgh3xBDEnFf+PgpF3Ghq/6e3kY7Chp1jdt7xTkF+?=
 =?us-ascii?Q?YbpKDJskojNlCe5H6RYVRPfa+DpalIGigo4HmzsxPruCHraib0iB94IruUrO?=
 =?us-ascii?Q?yeCh1FSeMnCojXgT5Q7p2XxCXEdHPo5On7GHf3sehiNFlnC6RVf9N7SWQzto?=
 =?us-ascii?Q?WtTWe1dXQdOLf00giQU75emCpmEWdmxb3euHta3UioXe6rvSf9pSyt1LgXZU?=
 =?us-ascii?Q?mMSvOq2CjOB12Zti73BQ3W4UL4qUIy28FDC+5tdRlRsb3H+HP545agfwDxpq?=
 =?us-ascii?Q?S/G3fWtDF2JqcfDTJ8T52sgHOzlm8u0poE9hmd+pDfCXk4X7Aerov62cdKka?=
 =?us-ascii?Q?QLtCR6Q3CknjCQp1KVssvDrDk1u/SbXRAp7p06nhX4vmmORt0N5W7TbH+SMe?=
 =?us-ascii?Q?fucIQ6e1+IzBnLkwC4ax0Ujplv+Y83Yobgi8iyZdjHL8hHlzSNpYjhZRE8Ch?=
 =?us-ascii?Q?6MWL3eKthox8yYlhtQ63i2OyWl7zYy+bIbzMYCczdaGM6kOLwdgdVIkc1yZo?=
 =?us-ascii?Q?N+yCnOrdFp/DGJ45S22iJsvarGN/APnym2VhaoqjCFXaEe921XPQUav7Jqdg?=
 =?us-ascii?Q?TmzpzVpH2TFooUv+0E/oUzPr9IS7eeII2IE5xV9KSAKsJPgchVV+bVGvHdNX?=
 =?us-ascii?Q?s94jLxzrJqcidr8/MH6edoX2uP1FEy5jUX+QWgsQ3WugKLqxLUbZeT7u38zN?=
 =?us-ascii?Q?AqkEBn6gH1KZGnlDUAMz622OO+717G9ghGuQvTenuPernKm2ZFIsah0Uy8te?=
 =?us-ascii?Q?DgRj0nW/RMvRnZCXLJawu7QY0l1YrRyas/UdJbseeJLfulJE4dK2jCb+bmQQ?=
 =?us-ascii?Q?BmolbAhZVs/J0p7xGKExC0FQvKsjc/jXm6952PASG5gXb+8QDSNj9lqFHnVJ?=
 =?us-ascii?Q?YjqYETUJdTzXJczVCNqMDlgfi9eUUD8VY+RY80gsqsIh1WCUozlDV6qeG/VI?=
 =?us-ascii?Q?4992XBjSMmLn4WDu4sBIli9tq4MyAy+kSPocrJrqWz9R5S/SpgOv3zAJeDFt?=
 =?us-ascii?Q?LfHynYl9hdxVRP932d/eVhVhQJWdNkYfsvXsz2ih04MLvylUiaRjPyLV4X9G?=
 =?us-ascii?Q?xIaJwWODu1+hf3rwZUp9yJyZb9TBCoXuWZ21kN3k8xdPbRbLy3Ks4qAXNgh3?=
 =?us-ascii?Q?YWYP76iRp2haDFPTpQ/s//VkOHLmi4+Jwi1KjtNaS6rVZex0w08iBldTzQKM?=
 =?us-ascii?Q?ANONJz1DP7hjtk8wmdPaQzc7PkhHVZHpUVLb4nGeqlYQpb0PWvkhNllgm0VY?=
 =?us-ascii?Q?GodhkuywhjDLvMjGpVGFewhpQLZbOAJqDUjaGL5jWDLdD0E1S1yEdGG1X3uf?=
 =?us-ascii?Q?AkIg30iWWtj7hCYbr6O0ieX6u8mWUIkQpr76AfaD8IHTeaxHvE7HE7cKGMdT?=
 =?us-ascii?Q?tH2HUosz6GOMhkEBh83tOLDligToKfx0uLdhEyQtPCk9eouO2+ga5ITblruC?=
 =?us-ascii?Q?O0NC3MiXU/1vXWkYUZK9IYoH6TgQatqLYZqorr241pRDD6qxNgeAKEPuvuMj?=
 =?us-ascii?Q?EJZJPWYLgwlktDcEM1Py7rQPAVaR4CTNUT5lW59cha/gZuIzpVN7zi9Ocz7a?=
 =?us-ascii?Q?no98hZpbPz6LZXFFkc4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:16.6216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c63f78e-982c-4a08-6437-08de31943632
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6535
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 11:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16848

SWUpdate makes use of a CPIO archive with a sw-description header that
contains the metadata for the update image.

This patch adds a new update-image recipe which enables creation of such
image based on what the user sets IMAGE_BASENAME to.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf      |  2 ++
 .../images/files/sw-description               | 32 +++++++++++++++++++
 .../recipes-swupdate/images/update-image.bb   | 23 +++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta-arago-distro/recipes-swupdate/images/files/sw-desc=
ription
 create mode 100644 meta-arago-distro/recipes-swupdate/images/update-image.=
bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index d8630718..42124577 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -31,6 +31,8 @@ SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATHINSTALL =3D "/opt/${SDK_NAME}"
=20
 IMAGE_FSTYPES +=3D "tar.xz.md5sum"
+IMAGE_FSTYPES:append:ti-swupdate =3D " ext4.gz"
+IMAGE_INSTALL:append:ti-swupdate =3D " swupdate swupdate-www"
=20
 # Extra boot files for WIC images
 do_image_wic[depends] +=3D "tisdk-uenv:do_deploy"
diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-description=
 b/meta-arago-distro/recipes-swupdate/images/files/sw-description
new file mode 100644
index 00000000..8dc4e2b2
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
@@ -0,0 +1,32 @@
+software =3D
+{
+	version =3D "0.1.0";
+
+	@@MACHINE@@ =3D {
+		hardware-compatibility: [ "1.0"];
+		stable : {
+
+			copy1 : {
+				images: (
+					{
+						filename =3D "@@IMAGE_BASENAME@@-@@MACHINE@@.rootfs.ext4.gz";
+						device =3D "/dev/mmcblk0p1";
+						type =3D "raw";
+						compressed =3D "zlib";
+					},
+				);
+			};
+
+			copy2 : {
+				images: (
+					{
+						filename =3D "@@IMAGE_BASENAME@@-@@MACHINE@@.rootfs.ext4.gz";
+						device =3D "/dev/mmcblk0p2";
+						type =3D "raw";
+						compressed =3D "zlib";
+					},
+				);
+			};
+		};
+	}
+}
diff --git a/meta-arago-distro/recipes-swupdate/images/update-image.bb b/me=
ta-arago-distro/recipes-swupdate/images/update-image.bb
new file mode 100644
index 00000000..33b0b74c
--- /dev/null
+++ b/meta-arago-distro/recipes-swupdate/images/update-image.bb
@@ -0,0 +1,23 @@
+inherit swupdate
+
+IMAGE_BASENAME ?=3D "tisdk-default-image"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+
+SRC_URI =3D "\
+    file://sw-description \
+"
+
+# images to build before building swupdate image
+IMAGE_DEPENDS =3D "${IMAGE_BASENAME}"
+
+SWUPDATE_IMAGES =3D "${IMAGE_BASENAME}"
+
+SWUPDATE_IMAGES_FSTYPES[tisdk-base-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-tiny-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-default-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-bootstrap-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-jailhouse-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-thinlinux-image] =3D ".rootfs.ext4.gz"
+SWUPDATE_IMAGES_FSTYPES[tisdk-bootstrap-base-image] =3D ".rootfs.ext4.gz"
--=20
2.52.0


