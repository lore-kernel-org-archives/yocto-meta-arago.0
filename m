Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C829AC44508
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:56:13 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19606.1769021766578904141
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 10:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PC5HccXG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.9, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgtkE8gsjZYzhKsL5dkpYD9HuIy8wuPXPZxn1uvRxV2vlfiXYm3fDx9fiXxX3zFIouQQJF7piwqq4Ien8aBNyVxa16fZnIcFVCBHmmRyPuuREw3rhAV71nDUKLZvGlTYtKnsiZ649hQ21CWeHETteQMoI2Y4iVMr2sIHAwJZaDERntWUx96mqiLbxQsCWlHcByibkM58pN0sIsgNPFjRNw1z299nEa/Tkx0i4a5tYQQCGo2AXmJcO0PNFmW4DxnPYsZ0xQfFrwK2N38aJzSOwolckqiKXNWUINTVLPpqxvmW7lBvUMz6tn+V9k6gQZXwZSmV1lPwQIryR9/uPpV/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Oisg7/9ddXUnWSBYeMkI91zAbyzXfpPkJJTHZU3+p0=;
 b=YbGGvN2/WRekeB8gNvAN1jg7GAcBVyHoqDObPl1Itumjp2OTq/9hBkjryS/C5ZbTyW3TzRpP2F9LZ0BesJbgsCSC1l6S0pYY7socLHBTUPbiBY0t9JgccAu9U8zDkhln3yGM/IWEWsagjbh09O+divstpGwhCjI0rlXQX1O7K0XWJtH/zqI95XGsvCAN3SFZ0nHuh6XB7ExdPXZbAQINebpWR9/ovneB+6M+EGWxOIw1gJLk9Xz7EESB9lTGKDGs4H1malwx3z2MAjh6shmWvUnDtsRUOQMG/Vhe0oDQ3BZKQsiAqd58jqrXimu3aA+KJX3HT9vZ6LXa2SVqgGobAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oisg7/9ddXUnWSBYeMkI91zAbyzXfpPkJJTHZU3+p0=;
 b=PC5HccXGpbBtHDve48qmhBZGqmXbKQNrenuUzZHMZ2CJpPGog6IL5ke64M58SyaWEwjBbAGggQYhGlLFkMF0eYuaBnn8jna4LdFcOh3c/446mdcO43c5IVdBN+czNRKnAM0VnDrNDH9v9cV67lwbtP/QulVUJ4dE8JFly0Ixwhc=
Received: from SJ0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:33b::16)
 by MW6PR10MB7657.namprd10.prod.outlook.com (2603:10b6:303:247::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:56:04 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::bb) by SJ0PR05CA0011.outlook.office365.com
 (2603:10b6:a03:33b::16) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:02 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 12:56:02 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LIu04n3358457;
	Wed, 21 Jan 2026 12:56:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 5/5] arago-image.inc: Set IMAGE_BASENAME based on package name
Date: Wed, 21 Jan 2026 12:55:58 -0600
Message-ID: <20260121185558.1330658-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260121185558.1330658-1-afd@ti.com>
References: <20260121185558.1330658-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|MW6PR10MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6029a1e0-bd6f-482c-facb-08de591eba10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e070jMEDtI+NpwjBCb5Nw/vRuDO/dK+hfOhUTUA1uNf31TxALucYWsQWJyOY?=
 =?us-ascii?Q?GWMHG6OIKkcClXbwEqCqfXrxvYJ9XQPGr9TAsoh4pIyNokQUDdeXhnKOJJDI?=
 =?us-ascii?Q?wR8syXPuWAm5r7lerVwyDX5Kbt4jedM0etaUkRbWyJmSkyzkz/lvEvK8vwxo?=
 =?us-ascii?Q?0hTry/D/6VlEu9SYTByfYHG+MYt/M9QWgI/p8zX2RZB0W3zZRY/AzrDDNU0t?=
 =?us-ascii?Q?qfud1/xagnx5SWa0zizesYz1o5ScTdnluB1dI5A6PziheI9bsnIpvRUJIQDl?=
 =?us-ascii?Q?w8vvFjRz1fb/cJ4KyU3mqme7dbb9qLH0PC/SXycworABqm7JTxht7a/ydk7q?=
 =?us-ascii?Q?3FjA2n+RikdPXImBEjK6sfJ2x2JNAPzN/4wWfIQr7zMaMaytHxWQU59szc12?=
 =?us-ascii?Q?PonPLcvGketk41a+6fGHWOXXPzDG50DWvq33loicp+bY5jgw+BkQkf/sGqaO?=
 =?us-ascii?Q?cz4sXiHP0D8Lw4CXy7XqKxGP4h0FrwAsx4enU770zSFqJG4mRcv0IFAqH5Xu?=
 =?us-ascii?Q?0By73g67MVVcXz5CY+LDn3h99mZE0jBrTaEwDWURoR7v+gQ6elKFqNvMWD8A?=
 =?us-ascii?Q?lHyE+Lu3lS7Tk0MAkWRWRUH4jn4DL77TTXByjcQeO0OXkOyTc/itZYMPRpYU?=
 =?us-ascii?Q?UGklCViO6Sw0IaKgdEHMksg5zzlZ4fD8QF8sfqoc+hieU0M1DRQVfwiTUroZ?=
 =?us-ascii?Q?sEteJ2v9DNUggEGxOZpwexQ4tUc4wO5yIky58VWKUldhjdiErcknu0Iug0Uh?=
 =?us-ascii?Q?5zmqOppiXDypvzSsxrRLksiKB9Nj9UOaLRWdtEsczlzyeXE7U2IoFOiZhhWp?=
 =?us-ascii?Q?jIr6wzR4yV0h2KcQ9Q0MkaTLpghv1efoLYZ7VeRsd6BHw5lVLUHXjgMWPngI?=
 =?us-ascii?Q?uttXYso0kSJgWPvtsSzhxd7pvQOz2neVILuglf6CndTff4QH085kyUFCsxyd?=
 =?us-ascii?Q?S8g3q00vbi4KRPMkGO4svvh/c8rOlppxrbFndWV1psAAYPYq1MhG+Fws8vu0?=
 =?us-ascii?Q?I+ZVQQMAMFZvnIIbVYJaLIKKSZOzLGEEZ9/ZTyvy7W35ftf18WkOgbaWtD6y?=
 =?us-ascii?Q?5QB9qYX69MgcFvkO2pHoAaiuwdA4laqT2uofpCbbXjZJTrGXy3R4gF6fyi6u?=
 =?us-ascii?Q?fpwsJNiLYm72wOAvEvm2cX/rLRRuWLM73u3aTzOXMMqT6UD614h0BdPEO2uw?=
 =?us-ascii?Q?q8L3eeQOBQRGhMX+nz8jAYTFWCB9eZMUg7RtDWzSwFujA86v1XzVbTLDoIj7?=
 =?us-ascii?Q?DcFuxgrsXh83JRApwaP78Ud3ZyhDsmJCNpbAV60wiBmw3tFRSv4zdb648lu7?=
 =?us-ascii?Q?auaPxMBJyqO8m/mpbRjMYP7s70trGne05U6PSno4O3XDyd3T3C4o2xuxONPc?=
 =?us-ascii?Q?Z6xu2+BU7EqPzrRC6+Fyi7vLGTCMk/0vtFi//PVrC2tT/z7jkrSrHnSuiTGb?=
 =?us-ascii?Q?bqjRrxR2xN6VwULAL/ZF7rK6SzRnIlDpd5QVAka40YZKCG3alzrB/RKrcpjM?=
 =?us-ascii?Q?RJHQyVgpyNzFGIIK2x8JV+LeKKFsKIo6LcBjj5i413Xw4iGqpvwjSgNcyxty?=
 =?us-ascii?Q?yyV5R3muZ4yXV3ZEpdMomMCZjBts4Mc75uulYqsOsevUO5cDTgCSXG/Z/+bs?=
 =?us-ascii?Q?6Vz6N03vBAE96G8Vlzco1jDGhWE1O2VCxPpSyGprhYWuMn1y7ug+uWlxLxTK?=
 =?us-ascii?Q?8wBZpA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:56:03.7412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6029a1e0-bd6f-482c-facb-08de591eba10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7657
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 18:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17000

All the image base names are just the package name, so use PN here. This
is also common to all images that include arago-image.inc so drop it out
of all the individual image recipes.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc          | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb      | 2 --
 .../recipes-core/images/tisdk-bootstrap-base-image.bb          | 2 --
 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb | 2 --
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb     | 3 ---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb   | 2 --
 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb | 2 --
 .../recipes-core/images/tisdk-jailhouse-inmate.bb              | 2 --
 meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb | 2 --
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb      | 2 --
 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb  | 2 --
 11 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-a=
rago-distro/recipes-core/images/arago-image.inc
index c6e79118..f085fa23 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -9,7 +9,7 @@ IMAGE_INSTALL =3D " \
 	${CORE_IMAGE_EXTRA_INSTALL} \
 "
=20
-export IMAGE_BASENAME =3D "arago-image${ARAGO_IMAGE_SUFFIX}"
+export IMAGE_BASENAME =3D "${PN}${ARAGO_IMAGE_SUFFIX}"
=20
 IMAGE_LINGUAS =3D ""
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-base-image.bb
index f6a33f13..25738059 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -17,5 +17,3 @@ IMAGE_INSTALL +=3D "\
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} =
\
     ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME =3D "tisdk-base-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-ima=
ge.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
index 12ea697a..ed964415 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -20,5 +20,3 @@ IMAGE_INSTALL +=3D " \
 	packagegroup-arago-bootstrap \
 	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME =3D "tisdk-bootstrap-base-image${ARAGO_IMAGE_SUFFIX}=
"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
index f39e2e35..d0aef0de 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -20,5 +20,3 @@ IMAGE_INSTALL +=3D " \
 	bootstrap-initrd \
 	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME =3D "tisdk-bootstrap-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/m=
eta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index ed2eb5ae..0711ec10 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -18,6 +18,3 @@ DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " sysfw-am65x_sr=
2-gp-evm.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-hs-evm =3D " sysfw-am65x_sr2-hs-evm.itb"
 DEPLOY_IMAGES_NAME:append:ti33x =3D " extlinux.conf"
 DEPLOY_IMAGES_NAME:append:ti43x =3D " extlinux.conf"
-
-ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
-export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 077fe05f..27c5671c 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -30,8 +30,6 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-tisdk-sysrepo \
 "
=20
-export IMAGE_BASENAME =3D "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
-
 DEVTOOLS =3D " \
     linux-libc-headers-dev \
     build-essential \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 1f96781a..b7bfc825 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -10,5 +10,3 @@ require recipes-core/images/tisdk-default-image.bb
 COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
=20
 IMAGE_INSTALL +=3D " jailhouse"
-
-export IMAGE_BASENAME =3D "tisdk-jailhouse-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.b=
b b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
index 1a051161..bcde33d6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
@@ -12,5 +12,3 @@ COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
 IMAGE_FSTYPES +=3D "cpio"
=20
 PACKAGE_INSTALL +=3D "jailhouse-inmate"
-
-export IMAGE_BASENAME =3D "tisdk-jailhouse-inmate${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 1eb864a6..477986e4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -22,5 +22,3 @@ IMAGE_INSTALL +=3D "\
     docker \
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME =3D "tisdk-thinlinux-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/me=
ta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 8e7712a8..40c58e99 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -17,5 +17,3 @@ IMAGE_INSTALL +=3D " \
 "
=20
 DEPENDS +=3D " tisdk-tiny-initramfs"
-
-export IMAGE_BASENAME =3D "tisdk-tiny-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index c1c1f358..8a4262b1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -14,8 +14,6 @@ INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
 INITRAMFS_MAXSIZE =3D "65536"
=20
-export IMAGE_BASENAME =3D "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
-
 INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev"
=20
 PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} ba=
se-passwd"
--=20
2.39.2


