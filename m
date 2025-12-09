Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41108D3B992
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:37:05 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16555.1765309014761525854
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 11:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=umFpisnG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDzPWyvlGe5LLmC87V6kZp2XILWPNIgBADAuL1zhOGU6S/OSO5NwpP5ngFAHwWirPuPOY1pbnS3Cs4U8twsQGagDvmNxJcgxKrES4BOUp6vyDQd2xbAPQHijLsCBTjkbeQd5wWk4OuClL/xalrLsXTbORI+C2fW2qOdKsdeyW1U802wF18LYdxhpt7AGw27ECp+R3dKW+cVQlJHBbyDJronhy2wv1ciug0MJ9TjBUh0hQOtmHIZWMaD3rPZeYJFJVv6+SuQZGJUVXcHLsBFT1AxEHLiepCGxCCZQWmgb/MgDCVzTXzTq0YrMjr4vXFzIK2B2IN5Mz8hxlE1mFeZIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U1gHlGeaGrfjii7/aPG7O1eu6bUF2CggVW+CYvki3M=;
 b=sMULg154I4vjNdJoBBdsWt0B7OYXuvB8jmUvVkZSEJm7xV57o/4HcmKrNxQ5OYel3Fnz7ZhF9J6ayLxmTo4fO+78CfmLS1Oq59Y5bBrGkx+RGxUW+ocWMJ1kORK5r90PkQXbLllsY9Qm29ipt/X4m9VarjmK6lZ1b6ZbBb42v3cayC0D80BnedGeYlb+EKfLAd1q7ykpoAd3TgYGotLHlYaMluRDqMWpLEzJIPMEMyTp3SfnJrspGmJtsFISzlvzsq+Dn+6FrHmG5LtvGde78RjglGdZOZTIZ30nPU/oiG95t+dhd5V3WuehdIk9Id1wv9wIPw9t5cXY5pqRhu40sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U1gHlGeaGrfjii7/aPG7O1eu6bUF2CggVW+CYvki3M=;
 b=umFpisnG/pCZ9fXmPzwM2CePYncpsr4rClNg6NlHKiStwjaiP5baOkPiOCxunXt7Tg9F3D/uje/esNV+W6SyRK1ocsd4VQfl8fLVERv0JHS/Ol3lEojBvoy697mGqoMNYxkTod5YN4pM9LG/8jFwMJdurQq1/WETmReL1/ddGRA=
Received: from SA1P222CA0142.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::24)
 by SJ5PPF1D8DEF14F.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::791) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 19:36:51 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::5b) by SA1P222CA0142.outlook.office365.com
 (2603:10b6:806:3c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 19:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 19:36:51 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 13:36:48 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 13:36:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 13:36:48 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9Jamas1701254;
	Tue, 9 Dec 2025 13:36:48 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT3Vw-0000000F1iF-1gx8;
	Tue, 09 Dec 2025 13:36:48 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] cryptodev-module: Add patch to fix 6.18 build issue
Date: Tue, 9 Dec 2025 13:36:43 -0600
Message-ID: <20251209193648.3581363-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SJ5PPF1D8DEF14F:EE_
X-MS-Office365-Filtering-Correlation-Id: 7263a1e1-ca03-4ba8-74e2-08de375a4d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P6OfQTMqPXZ9ORLR54QiDNRr/1ZRuE8udPNuaRqCPDRfIs+5MAXg4zGZBJ4t?=
 =?us-ascii?Q?qfP4p7JY2hj+hCh/zK/Rx456noKLeHHdLreqTp5PnU8M1G5oZwGbcM2o4GPF?=
 =?us-ascii?Q?fmOuzkoPCBf8pTD0yZduSXRtEM8KV3IVc2qIdOqldypYfrj3ZkUwxutZzTwm?=
 =?us-ascii?Q?IQ2Ia9Gzh6n8Zp4yGPSBgtAAQX0NoKfzgYfSF2utTnZzFm/tem0ip6H6Ke1V?=
 =?us-ascii?Q?jc7smW7nHz8NIn3e7oxAxOt/MXpIpez/tDwhdXxYVZomrBU8wEuYMPnpACEj?=
 =?us-ascii?Q?0EY8299IyJEU3QyvDqHaUipVBcy57uxa2fVQFr0S7CMEYs0d2z0L5si7JWG8?=
 =?us-ascii?Q?P+JJj6OVTUSG799hJrAo3Ge0xABLeu6IWMmEarWydJL5tZ10FM/P7b+UBaAd?=
 =?us-ascii?Q?w0voc2YFywEcYc55hB/l1jGh55EWKjkJF5IZjit9wZ+nMuN7nPVLlayiI/fl?=
 =?us-ascii?Q?z/boTBxHeh+Ma/14UKRgkdC3sNpbMNPZ88fVcZ0KmQ749+W/ycDGSYFf28Uo?=
 =?us-ascii?Q?lwlU44VUn5MDzVEtGC2a8nmW7Iq8tmHLrRCc9+r4g84sirSZKVhsbXA+PV9T?=
 =?us-ascii?Q?/NYiWszVt5NI6SJw64Q6MA0A5GQYsz/xbiAIfSFJ7XxgcHfdOLrl2BaZo1pn?=
 =?us-ascii?Q?gZf9Ez5En9toOnL8L0ApYOklGSQKwAeLJd3qSV1CHpBYk8M4FJ2EiSyWm+Nj?=
 =?us-ascii?Q?xn9htxW7ckwOtP7BGvMpA6/Njz3A9j86URqieoybuv4AcXuu/IFjzkrg23uT?=
 =?us-ascii?Q?2FQEO8Rzh86HlOJKLAGHm5ZMDaT6QmVke/nhR3bAGubOniWpSKcMyZ9o/U0K?=
 =?us-ascii?Q?UudCDcwyr/POp6OSE6/wQWJocNy5sN0fG9MA5YBuUbakD2QEzI1LYKtvPp6E?=
 =?us-ascii?Q?BIt1TyiZSuwiAkPo4Sf1W0K8HyQFNc/QUdhYBbAF3SsTBE3LozdulYIuukhM?=
 =?us-ascii?Q?NEzMxHBEAZvn9wBF0B1XBdhBcvfOdc78rxumqG+c8MeXPwDLxJ+/ctTeslQk?=
 =?us-ascii?Q?q8aCKE04ouP+V0+hoAD41Zq8Wp/IrhhQnb8Ck31M4PSx8QOGhmDgY5Nl6rpF?=
 =?us-ascii?Q?KL4nETFBF9sODhLxJxLCsz7dHGI52QsSrhtuXHjfdKwv/6ArlOYTaEKXptqT?=
 =?us-ascii?Q?/jHHSUn+kocWkU4Mxp1n3uan0nxIjCgKJpxQTpZo+bb6bObgco42kEH6Abr6?=
 =?us-ascii?Q?CkT3AYdHGKyV2ZnUZj/P84g2XmUVd1CWtMj1+uAzUJld6dc7oFqZA36nL9pH?=
 =?us-ascii?Q?mWzbKdGadD7fqU8CI7PMdBCW0Tj+Tf2NKt3JPwwzQ1mNK9Jedq2iJR8e5bd1?=
 =?us-ascii?Q?H8SYF2fbxRjSw6SMp/PLiACELvgLhg7RRjOa7oZ7z0CBKRXvTdz1SmPe+bdz?=
 =?us-ascii?Q?KZ0G+XjSnehCXiliHgHulktMkbVUzQ1eYPqsCllv0BXf1jNFj8HfOkQyHnbn?=
 =?us-ascii?Q?JR0Yjd+EGzdLAeIpT+28NZn55k0n2PyxOdNo30/xoPdphrO3flFbzCSFET47?=
 =?us-ascii?Q?Ca6bbTQ/k3nY3ZhDl/wc5nR4ar7/+ON9SzjozkXsGMfy/UlS6Q/yfo4/6p7a?=
 =?us-ascii?Q?zJ3770/Z6fEOsn8pt00=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:36:51.4435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7263a1e1-ca03-4ba8-74e2-08de375a4d2f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1D8DEF14F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 19:37:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16883

Backport a patch [1] to address a 6.18 kernel compile issue.

[1] https://github.com/cryptodev-linux/cryptodev-linux/commit/08644db02d434=
78f802755903212f5ee506af73b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../cryptodev/cryptodev-module-arago.inc      |  4 ++
 .../0001-Fix-build-for-Linux-6-18-rc1.patch   | 53 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-mo=
dule/0001-Fix-build-for-Linux-6-18-rc1.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-ar=
ago.inc b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago=
.inc
index 74688f1c..9bd89679 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago.inc
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago.inc
@@ -1,3 +1,7 @@
 PR:append =3D ".arago0"
=20
 KERNEL_MODULE_AUTOLOAD +=3D "cryptodev"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/cryptodev-module:"
+
+SRC_URI +=3D "file://0001-Fix-build-for-Linux-6-18-rc1.patch"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/00=
01-Fix-build-for-Linux-6-18-rc1.patch b/meta-arago-distro/recipes-kernel/cr=
yptodev/cryptodev-module/0001-Fix-build-for-Linux-6-18-rc1.patch
new file mode 100644
index 00000000..d7f1d05c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-Fix-=
build-for-Linux-6-18-rc1.patch
@@ -0,0 +1,53 @@
+From 08644db02d43478f802755903212f5ee506af73b Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Joan=3D20Bruguera=3D20Mic=3DC3=3DB3?=3D <joanbrugueram@g=
mail.com>
+Date: Sat, 6 Sep 2025 20:36:38 +0000
+Subject: [PATCH] Fix build for Linux 6.18-rc1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+It's no longer required to use nth_page() when iterating pages within a
+single scatterlist entry.
+
+Note I believe this code path in `sg_advance` is currently unreachable:
+It is only called from `get_userbuf_srtp`, passing in a scatterlist
+copied from one created by `__get_userbuf`, which only generates
+entries such that `sg->offset + sg->length <=3D PAGE_SIZE`.
+On the other hand, this code path in `sg_advance` requires that
+`sg->offset + sg->length > sg->offset + consumed >=3D PAGE_SIZE`.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Df8f03eb5f0f91fddc9bb8563c7e82bd7d3ba1dd0
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Dce00897b94bc5c62fab962625efcf1ab824d3688
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-li=
nux/commit/08644db02d43478f802755903212f5ee506af73b]
+
+Signed-off-by: Joan Bruguera Mic=C3=B3 <joanbrugueram@gmail.com>
+---
+ util.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/util.c b/util.c
+index 9eba4836..d4267816 100644
+--- a/util.c
++++ b/util.c
+@@ -21,6 +21,7 @@
+=20
+ #include <crypto/scatterwalk.h>
+ #include <linux/scatterlist.h>
++#include <linux/version.h>
+ #include "util.h"
+=20
+ /* These were taken from Maxim Levitsky's patch to lkml.
+@@ -44,8 +45,12 @@ struct scatterlist *sg_advance(struct scatterlist *sg, =
int consumed)
+ 	sg->length -=3D consumed;
+=20
+ 	if (sg->offset >=3D PAGE_SIZE) {
++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(6, 18, 0))
++		struct page *page =3D sg_page(sg) + (sg->offset / PAGE_SIZE);
++#else
+ 		struct page *page =3D
+ 			nth_page(sg_page(sg), sg->offset / PAGE_SIZE);
++#endif
+ 		sg_set_page(sg, page, sg->length, sg->offset % PAGE_SIZE);
+ 	}
+=20
--=20
2.43.0


