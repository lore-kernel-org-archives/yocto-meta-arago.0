Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD6EE95A8B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:37:51 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63310.1767098264230189529
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 04:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=A7xQc5PU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.27, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIc2LgInlpYM0sTQjjdCzSZvCNJ9jm0NXRxnqXls43D7qkJSM2cNmD9WpXfZHmMt9E5rcI5QeeY020tBuU7QFasDlJauUHoOSBY0zPALe1CWYhgd5rx+L2LJL2RG5dDR78MG0ghr2m2ungaFWHxLXP/ntYHSw8I7LUlmFMQCFap6bN5TXRKabBmiGcmudYEt58Z3z5wNrFTSCw6zY27NrsvoUmf/pjfftMJ63qWajGFo1vquPk6qN0J+X5dQ3g7o2nfd0mhE0ig4hsAu0STPo+8wrnfXcV1Is9t0dtEc+W7ve8gaowps4aYZQcQxj4wyWvYOqKsU5ixG+diCYaBdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX69Sx03WH1HochycCCPhLmfDDFk76hVAcuRRau8xDE=;
 b=rjl1T3RCESLO/YJnrJqEr2yGxFg10ow2XKLFPJxyI9Hz65Wn1enq7wTKib3xx/84UTGExW74l9sjIATX9LEQQnmQufH4AQeqam4pNQKllIII2jwSAcO1Sbg3OyUyLvgN3wPrMZa/0mDqHSpkpOup3Ko807pVzhD0SjE2fEPrY0+qR2KK22deP5KkGPix3nahV3CQ0UOe2v+WHvXnNmgzGEli/deVxJkvimWHsadh/tFm7VUcj2Iz1u1s8UeS0rU0sPbhT2uAZRK2dTLLevusdjCCxfv/DActVop9NuFEYLFxPJPYr9BgxOZfXqZ9Lxtmk2G7ZE+Iky/JMGlEaXcCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX69Sx03WH1HochycCCPhLmfDDFk76hVAcuRRau8xDE=;
 b=A7xQc5PU9SfPdMRnNRKhQ6/wmE+fDCqExr3PXxaXsBPumtY2JMAU211DF4b+CYe2cIcCuSQra6OjNbjKrrkYfiwBng7el0IE4fC/detDHnjw2WZmqxTg80snTMwH6Pyq/RdgvS9hqvo8FqxwSPt3tRWMvS0Urj9hg4VUiLlybB4=
Received: from BL1PR13CA0447.namprd13.prod.outlook.com (2603:10b6:208:2c3::32)
 by CYYPR10MB7651.namprd10.prod.outlook.com (2603:10b6:930:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 12:37:42 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::2d) by BL1PR13CA0447.outlook.office365.com
 (2603:10b6:208:2c3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 12:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 12:37:40 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 06:37:38 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 06:37:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 06:37:37 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUCbYmR838348;
	Tue, 30 Dec 2025 06:37:35 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
	<u-kumar1@ti.com>
Subject: [master][PATCH v2] cifs-utils: Remove bbappend and patches
Date: Tue, 30 Dec 2025 18:07:34 +0530
Message-ID: <20251230123734.179359-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CYYPR10MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 804e9f84-62c5-4e2c-6c81-08de47a038de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k19dTIzWsbb/wqSTg431AYdiUJBjrNElHxDGogSHVFSiE08Td0iZeQUUBROZ?=
 =?us-ascii?Q?I06m3NV2Gg5x91TiljLX68bO8A2uezTc0IlEWEcpti2NsuM25Jdbuhj2KWL/?=
 =?us-ascii?Q?K5d6EEal4tIngFCCapJISdgrgYqwd3SLP9Ngb1nLL0bTUtUQOqJhSe8UaalX?=
 =?us-ascii?Q?1Cpj+dRl9AV5AIErjDr3Yc2/FVK8QcBVS/raM7K0OSGnriPI6jjvK/v3CyBD?=
 =?us-ascii?Q?K1RNLC1WxOz9yyQcqXFo6kj0iUbD+rNdqYE6dXZcpXraIC222R6ua1/ohtDe?=
 =?us-ascii?Q?KjQQAljuV2H96YpMgpap1Ufy02Sg6Kia8rRHUgB7Bd039NYjoX9Vdyvl2f0+?=
 =?us-ascii?Q?Wqdhr3Zgd9fLtB092SlPA7Nb7bHcg0NGjusGDQsTilKc0HrfccII/wUluaex?=
 =?us-ascii?Q?vHaAquuFdRlCwNvQWMUX2KZ88y3uTKd2utMIQ1XxlAJqgtsFaJSa60nojCGO?=
 =?us-ascii?Q?mnLVAjVzqmo8G9A8/u1nBoKoIcNa2A/Ry+cb7CXrq9gT6tDvaGCKQHn+TDjV?=
 =?us-ascii?Q?H/NzTM0o3tsIkyE6hYZasTK1YPzCvvxz0tEZmkTDjLVJdkSlyPAanwLem6j5?=
 =?us-ascii?Q?lNPLrhU1WvJN3GqlxOIRkIM84uxPm/HANHfdY9zLCFRzXStLrbM5Rth++biD?=
 =?us-ascii?Q?4bJcalcyq0vVqG9BA4NU1unvx/Oiwzmxj3xdivi+oyNceqCZHFm7JbKKHg3Y?=
 =?us-ascii?Q?SAy4O6BBpSE8msxcGOo+WNbNZsFIX7TGPue5HgVfdVEa2VVVtW5ZywkwRNis?=
 =?us-ascii?Q?+7zHJcgOm3SDB2VknhumIUJT/52y6pdygenrhTsq8lkFATf7sRa24SD9zugZ?=
 =?us-ascii?Q?ZjZiBEsFavI6sVdFirJG/cnQDj8lS5CwgX1HMQxmusYkERKy9lGnxUvCy/zp?=
 =?us-ascii?Q?043l3wfwjwsJNIjcDY6U/nY1j5+asLXq76EjXC1xWVwSiLJtQUO/8B8R4/9I?=
 =?us-ascii?Q?YdLyKP4WmvQdOki+rtv1gwWRWs2/M1JJtP0biGU9nyt1BJZk0X6ycuJN1t60?=
 =?us-ascii?Q?xfUUHRbCdA1E2L+sUpYPZTEuCuVfijY27ll5kEhgBLcBxdHX4XkeRuN5/DAK?=
 =?us-ascii?Q?qevdzB2xZKVvXiAmYH3q5U9ZbGQ+rxA7aG1ia2hkQKz6/dZSKOFGcgIP4cvk?=
 =?us-ascii?Q?wH+VTq9pTuur80PebTrLLKJR38Hw+pzLgt7kEDOrtdvhEJ4HKkifoCuyqUCZ?=
 =?us-ascii?Q?3PnR6AvxE8vF8HGTKfMbs3+l1Lp8I1WBI5gu6aULk2XmPSJkRl7UzYYxE2yD?=
 =?us-ascii?Q?91O5lkttp5wmtMCUZu8uwGQx49Il5MNCM7wbAEZf/lvZpjVaHai/5PAg196u?=
 =?us-ascii?Q?dD6sjMAqBBmcBD4Tqp72k2F3WUGcFoMDy2gAlBYu2mQUvOU6TQh7qCIHo1xQ?=
 =?us-ascii?Q?EhtYuhPay5Abpnu+w/Vq/TVuZknB7VlrQL+Udjcr0ZxUEmt/fMjym4BN0MJ6?=
 =?us-ascii?Q?xHWJ7EE2VOVJg2YQbYJPJp0NhCSplQXsku0KI6r8t3+qyH53nijTVz6QhIEk?=
 =?us-ascii?Q?BjCCRttp9Pvnn5ogcQ9fUarDBGQVPthLYMyD891M4ZzOhziPymAtvD9snkf0?=
 =?us-ascii?Q?u5k8p5vt4J9sExJgaT0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 12:37:40.6460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804e9f84-62c5-4e2c-6c81-08de47a038de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7651
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 12:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16906

meta-arago maintained a downstream patch to modify the build
configuration in cifs-utils [0]. This change has since been upstreamed
and merged into the cifs-utils repository [1].

With the patch now in upstream, the bbappend and associated files are
obsolete. We can rely on the cifs-utils recipe from meta-openembedded
without local changes.

[0]https://git.ti.com/cgit/arago-project/meta-arago/commit?id=3D80145206de6=
c81efc0d0ac6ddbeeb5abf3b52581

[1]https://github.com/piastry/cifs-utils/commit/25d6552c7d8b9fe2ca9dbf85c74=
c9330e4dd7770

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changes since V1:
- Updated commit message referencing the upstream commit[0].

 .../recipes-support/cifs/cifs-utils-arago.inc |  4 ---
 ...automake-treat-sbin-as-exec-not-data.patch | 35 -------------------
 .../cifs/cifs-utils_7.0.bbappend              |  4 ---
 3 files changed, 43 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils-arago=
.inc
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/0001-=
cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
 delete mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.b=
bappend

diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc b/=
meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
deleted file mode 100644
index 87b49cc6..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/cifs-utils:"
-
-SRC_URI +=3D "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-=
data.patch"
-
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-ut=
ils-Make-automake-treat-sbin-as-exec-not-data.patch b/meta-arago-distro/rec=
ipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-ex=
ec-not-data.patch
deleted file mode 100644
index dd9c7958..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Mak=
e-automake-treat-sbin-as-exec-not-data.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
-From: Daniel Parks <danielrparks@ti.com>
-Date: Fri, 3 Jun 2022 15:34:59 -0500
-Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not data
-
-Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
--j1 build and install-exec-hook can fail because it might not exist.
-
-Steps to reproduce this bug:
-$ autoreconf -i
-$ ./configure
-$ mkdir image
-$ make DESTDIR=3Dimage install -j1
-
-Upstream-Status: Pending
-Signed-off-by: Daniel Parks <danielrparks@ti.com>
----
- Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e9be6b3..edb1b7f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,8 +1,8 @@
- AM_CFLAGS =3D -Wall -Wextra -D_FORTIFY_SOURCE=3D2 $(PIE_CFLAGS) $(RELRO_C=
FLAGS)
- ACLOCAL_AMFLAGS =3D -I aclocal
-=20
--root_sbindir =3D $(ROOTSBINDIR)
--root_sbin_PROGRAMS =3D mount.cifs
-+root_exec_sbindir =3D $(ROOTSBINDIR)
-+root_exec_sbin_PROGRAMS =3D mount.cifs
- mount_cifs_SOURCES =3D mount.cifs.c mtab.c resolve_host.c util.c
- mount_cifs_LDADD =3D $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
- include_HEADERS =3D cifsidmap.h
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend=
 b/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
deleted file mode 100644
index 4c9ce8db..00000000
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-CIFS_UTILS_ARAGO =3D ""
-CIFS_UTILS_ARAGO:arago =3D "cifs-utils-arago.inc"
-
-require ${CIFS_UTILS_ARAGO}
--=20
2.34.1


