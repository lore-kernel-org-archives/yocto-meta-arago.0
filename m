Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D71C98324
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:05:23 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73685.1767643515765230009
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SqMKadBl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.45, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIQn133Ic0XLS4P0Bh2SNB8DfBoEv+5MTow1bzh3dqzCDu1nGpc7KEzScugJiq5qORyk/qs4bpbVQstZC+Vzgr+dV7B+bUZSE/Yk6OgCupMQnXofhDCOunPzj1xJcWbvKj8w2hJ4JXfk+M3RNjRGBV128HZdfNxFh9uc7wPSAt9p4EHnggtlP4hjGW9VMrlbjXGDELumuth6De8qisXLMm0fJPFKZdAx6DiMskwP3iuIpLRKat7R6vPPWFoBKKDXj4tbpn1U15/zpH/6WskTgnlhBK8XyQgfnlKrF1IbWojiGnnYkSuaJkczTez5eZCcGhwhpuWr4BokuRLIZZGI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29pygshxPaZJMwh2YbEIefbL2k7Mx9Jz9rW9lL9CFlQ=;
 b=f6wudiBGhO54ldWqlFw8PhaTnK82rM2G/Djgo6P5rGwPpP1Ss1+tnHJMnaRWDhEZRT90sBPfC4+E4Xgxe4WWVgnAC992S7+NsJM/CLIGCsOKVIrk59z0Knuo3vjbLxObm7FEKTT7JwFt1YOIjkPwo+jntL00LYaW2UdJ9vVcperq8loLeJtemDgw7epgldRyGszVekDk8jawZ4JppE+UtG6goWu8lwWKxH+f44LNGZv69LZ5GQywWHFWndIgX3CwpbWc5J2lQ2UoY3nYdZUPDZub86uRiKphuVExouO5gyVw/xc1q3alBbfHi4wSbIG4ByUALNSnW7ZF+mQ9cR11ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29pygshxPaZJMwh2YbEIefbL2k7Mx9Jz9rW9lL9CFlQ=;
 b=SqMKadBliZTfsxS0PNknqW9FMuFO92k/QtDdHRYPYlLWWj3CiRvjpyW3ujM+wzE+basZeh294om05YazuAqYOMI46Put8YL4gezxIVaZZjVQto+blDZLlX3lCGSPLFf6beGXowJ8C6LUaAe/2krWTVB+BKQx9dimkiW97tkqk9Q=
Received: from BN9PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:fb::25)
 by DM3PPF0275307EB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:05:13 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::32) by BN9PR03CA0050.outlook.office365.com
 (2603:10b6:408:fb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 20:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 20:05:12 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:05 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 14:05:04 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605K53Bc1831190;
	Mon, 5 Jan 2026 14:05:04 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 5/5] arago-image.inc: Set IMAGE_BASENAME based on package name
Date: Mon, 5 Jan 2026 14:04:56 -0600
Message-ID: <20260105200456.2472163-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105200456.2472163-1-afd@ti.com>
References: <20260105200456.2472163-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM3PPF0275307EB:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a3547b-af48-4e24-bb6c-08de4c95bc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GIHAmnAQUL9DkFHNddldudCoYMCb8BTuR20Xc8fDyz6W8w6JBqagdHxFnydY?=
 =?us-ascii?Q?PS9TdjZ5Zefo4D0suUifNu/JNWwPXL4vMsx5XMPgkwQxyxID4Jr3ubnl3nDZ?=
 =?us-ascii?Q?Mz3Yf+mFk30ERq6huBG2r5RpYZqcjnFQJS998jBuiU5nxpg9NjflLf5Bfo9Y?=
 =?us-ascii?Q?xP4r8BUdRbVDKuOqapXykgVuc/8RhCTcrt0gj2wOUZxbtExTDI8+CJ6Fx4gQ?=
 =?us-ascii?Q?HLh5ENz8Vv2MtOpR0PzcIIWsXDW0byqOcxR8uLzWZfSfpj/+HdPWPvQWBhAq?=
 =?us-ascii?Q?8PGb4BgyPW9tLgIedMkRGae7B7LPQGQP3GRiZy9KQPYDISi3jB/DmWiSYDiG?=
 =?us-ascii?Q?x2O2EPN9soMMrnX2XDE02KLF6gmi3RV2udRk4eqBr3igzataJLc9qdn3RHbS?=
 =?us-ascii?Q?WPuiVmFWZLgiJMTUMveQ05cSRvlCJ5EsCSvUJoNpuOXrTV2Ls5PnNkuxW3Ze?=
 =?us-ascii?Q?KS5kj8nHD65bEh7aj2WAlrq+bR4yMNOIaU1/H9iV9Np/pKFaVGbe3Vz6I3On?=
 =?us-ascii?Q?RETBfjAMzFpR7xANtPGDjlGfSwSGD0WKcl3aiJhz4lPbP1Cj+Gky9lMXXbfL?=
 =?us-ascii?Q?k62+TPvLHCnF4fJIKnqtFqs+gIfW88uszr0/1JNdsU2WIpx0pXF5crNnO4fZ?=
 =?us-ascii?Q?8qHTwZn6gO7fYdVD8teMprBKY8J2rzc++wMDBU1HRuJT2KEryvn9+SiagE5d?=
 =?us-ascii?Q?hp08/DYotAVSG6ScwC48l3zVD8dfzuqiQlmGfPW36w/PMuOZcuqZtFgq1To6?=
 =?us-ascii?Q?lyO/SUtwv8eJLw6mRyZMOGgqIxrkU/FqLIS7rkNrLCmJjZRpR2Yfokfm5eUN?=
 =?us-ascii?Q?b1KbqaNsaaRXTC21tG83cWmkB9T/D9KaEu3wBgw2K6ZA8d6gh2VS+uB88WjM?=
 =?us-ascii?Q?gUO5BjeVgm8ZzRg22duwXCtUGHeGKoZery7Oo/5zi1SzqLJRzvTGu0JaAnak?=
 =?us-ascii?Q?V2HDQ1bYTrwPhhnUJAMTw01bP0MVXffKs2Vj6izX5OpAqrnPyTMN4bIJKYjl?=
 =?us-ascii?Q?E7nxG2zBgAf6OX9FduIcW0AECxXQd1zgJ0zNiaQ4VL/isExq5DeaM1p+bw7b?=
 =?us-ascii?Q?9h4dk70AFXgBbpAs9xCHDWuVZm8MJpuDqzO6wc/T7u+ZcB1+BCOuF+Kn9Byi?=
 =?us-ascii?Q?uOLb1DeA6cS595uZprDSxB9HK7aGMpWgX8pJiX0JVmTh9bkhNkcl1OCwma2Y?=
 =?us-ascii?Q?xNZSIlC5FzOOTGZddbmVwg+r49shEjVl66UFoto6dgCBNfKr39nInB9gf/by?=
 =?us-ascii?Q?lMTZ0V5TQeHswLZhnZwKl+9hUgx1f1zZDYJZzim9pwKt3VjAtP2LImDCw2pz?=
 =?us-ascii?Q?ZdC9SW9v1oq8ea1yR1qDd6owW1kzYSGhgYuiiHh3o0/PSTPH2fR8pWuTJ/y2?=
 =?us-ascii?Q?LfG6Dx81x6wDT4OYtlWnrB9eSe68qNgw8em3ax7GZTppqJcjsi8hsmdAtX3p?=
 =?us-ascii?Q?XZvMRu6u6TF91+YCPd3AUgHkt3hkof/7QwsoSKtbIlySU32xAIIe3O+CQ9Dv?=
 =?us-ascii?Q?Fb64Fl2Fxx2aJVHN0SwXQd+/KBbvrn6XihvNZx0LH5bH31yc+fa6uHxNCbpc?=
 =?us-ascii?Q?4J/7TGjjtNEKvYUScHk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:05:12.9335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a3547b-af48-4e24-bb6c-08de4c95bc8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0275307EB
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16918

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
index f367fa30..fd444be8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -21,8 +21,6 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
=20
 PACKAGE_INSTALL =3D "packagegroup-arago-initramfs"
=20
-export IMAGE_BASENAME =3D "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
-
 # To further reduce the size of the rootfs, remove the /boot directory fro=
m
 # the final image this is usually done by adding RDEPENDS_kernel-base =3D =
""
 # in the configuration file. In our case we can't use this method. Instead=
 we
--=20
2.39.2


