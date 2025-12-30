Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56391EE498E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 16:51:44 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67795.1767113503573165315
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 08:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TCkvMXlM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVEnCmkMfDvOpghNZV9+TZN/M1aCG3OL5v8DfAr/UiyGtQJxYzNfVg2DA+ChbWY4VETjjd94MU06PBkr0GuuP0Sa4TLWK9U/AUijAZegm8ShJkMEeGu562wbdDub7W1a0Iksj14B51/mNqO2RO9g4WSiGCBcDuerk6ejTRq2smWyUD8lOzJn5/EQydQXppfyHmOWvGvcvaiA1g90qvxArG9tDcw03I4NGDzRmrvSpwazS34aRNjX79SDPSZ2L5xblSrsCcUg3ZR3je2iYiN5fQygnU9b9GVVAu+peuZGGeTwPHn3wWjuaSrvQ63glP5+CbqDTtNkp6xkp/yegHZ/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXsbXN3nTcK1qTSNZMl9YHWQN14zF9qqwDyJdeVu6pc=;
 b=N+S+IXRdkYtXTgcT1SwHiS17PIRcGW1tGjjtZeK0deP78rR+2ZYhvHPzaL0er0PfM8WmHa9/yVvWKMqxZH3XfLj45KX7AMIwlRq1xh8gO9Ki1jeY0P6xHweOB40EaHCOyxbeQvYRClXIfTuqvNgG6yzHbTVOjHx07W511EzaWvH7xJUwzJLxwBzvFy6HRw6hPlakS4eRQB3uFufn0sSDKPtKAhL7CyktRFCM6iTxuJQkV9qtqHZ2b2ouXz8jYioPX3Q7/qUJU5B8ftJAtb9Nlowu8OK+CPcDKHgUta6M/kWaTpJvR60/nZ5rMexrGZxpd98N6Ntt6CHsgi1gZ1/Drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXsbXN3nTcK1qTSNZMl9YHWQN14zF9qqwDyJdeVu6pc=;
 b=TCkvMXlM5cRG56DO4ztSwuHjdp2Dm1utZYRAIt5NOecu63MJ4QqyUajGwqBj+vG7OGwFhng5v9lm3Rv88St38ixsAyPCZ8ZekiFC34FMafqqN+9Bah/qt0uDPyb8QWfggheiLH/QEu0d/GK2Fjk3JmntVoGNF8R2xxl14ox3mc0=
Received: from CH0PR03CA0277.namprd03.prod.outlook.com (2603:10b6:610:e6::12)
 by SJ0PR10MB5802.namprd10.prod.outlook.com (2603:10b6:a03:426::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 16:51:40 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::ad) by CH0PR03CA0277.outlook.office365.com
 (2603:10b6:610:e6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 16:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 16:51:37 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:51:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 10:51:35 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUGpZdM997570;
	Tue, 30 Dec 2025 10:51:35 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vacwZ-0000000Ei0z-2Qlw;
	Tue, 30 Dec 2025 10:51:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/4] cryptodev-module: Remove patch
Date: Tue, 30 Dec 2025 10:51:30 -0600
Message-ID: <20251230165135.3505628-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230165135.3505628-1-reatmon@ti.com>
References: <20251230165135.3505628-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SJ0PR10MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: fefa0892-0b11-4885-75b3-08de47c3b2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qbKhftL624ZFSbEGI5VQ8DFbtcSSq45+5XS4vIxn4xgQzCVkJed50L/ElpO3?=
 =?us-ascii?Q?7/BaFSPR1aCViX2ygLb1ejlsBcJjt5ki7v1eCFg8AfGXkFd3tkNzm7amwtd8?=
 =?us-ascii?Q?U8BoOCWk/6RJ13YvXHKTw4bNapIdtKzelDz7v/3wf3CxttVToaPVSy0HHCXz?=
 =?us-ascii?Q?5jQzKM2E329QN4KcRFnZg6wxL8gZWqmzqK+x88FI3mVbvqnUXOFjw3fwV6lR?=
 =?us-ascii?Q?j6+6fsOs8XXxyJeTtXgxd7ppLIa8/IA1Sw6pVCqhQ0P3L/b0hA3hnsPJK+wu?=
 =?us-ascii?Q?ouEOU3JturT5XDvKXHduVzthjxM46cd62OfaE7KmczMQy9LAv/8FM0Uhju2Y?=
 =?us-ascii?Q?j70Mc2WN5ygaOFQZt7TI4Q+psihSxxSfQNTp0WUtXswZpBG8W4mWoM7XlVrO?=
 =?us-ascii?Q?kFi94AREzVd+zriK8ZXL4PPpchawen2KObcKPoO/dwmtSgYQQ7O9InTNDLvv?=
 =?us-ascii?Q?md/WqyG+YRyvJZXbckFzQX2tarmFsbjaiXf1F8eeQ2OZ4ggbaEZhFrisKRq1?=
 =?us-ascii?Q?5ZjoH2sKEv9TgOnhPfd3wgJHYHKurlfS7yE41+FgoPdsLFau9k/iNj0gO+EO?=
 =?us-ascii?Q?kJ3aQi4IgXfWgeEBrp0+kvoSvq9KdZp8zxSh/dj/dBrHIQvqFG0hW7I79oNY?=
 =?us-ascii?Q?mQMbQdrKnkYFcykY3L5DG0sVieJrDC7t8Vfh7mZ6grnANyovJ083fLmFardZ?=
 =?us-ascii?Q?y3SE8yImPFxN8rvcJ57t/akrX2mKmxNp2FD2Otk4obHVLh+tQ1YKt+Cq4eoY?=
 =?us-ascii?Q?47ekx18APNYFFmE5Ao0REXAt15mqrT3R1htF7XiukgheBrzLs08UwzEEf5yN?=
 =?us-ascii?Q?juvWdQfR7BUeQ/TKK7zYIMc4M1omnqUZNR3ddU9Ne/TVkATGxB5XzLWwj3cn?=
 =?us-ascii?Q?ux6Vsbx/2SKLlg/7KE4hcUo8CNKQLlTipZh3zrko76W49RIr5EJnPK+A9Bp3?=
 =?us-ascii?Q?fBLjvymWpyLK0/upaJRdpQ5QkksU/BIz2xC24HD9fQ39YGhl8ZeT9zAQhAdQ?=
 =?us-ascii?Q?7CjpSs7fXcowV9LkYCH1byJQ+YqcmoVf0HAkfUgRyQuApPFPXEBY7cA6Sh7V?=
 =?us-ascii?Q?an0WUITcdTLmccIEAKXnS+symf/n/XpziV5lbr7vbr6KilBnGL+7h07Xlhwo?=
 =?us-ascii?Q?dY9T85kI0xPocxyyS5q8IHHDj+eDOyWJ36ZQkNPI086D2gtPPBNCFC4F+oBB?=
 =?us-ascii?Q?0PasAj3JPZWPPpJfgtBEYHVTZVX1yYMI/LK2rbnnK8qyq4gQWuhYZy0CiaS7?=
 =?us-ascii?Q?LISJPb6MjrhbJO/Y5azW9dU+Ee/ruCS3+Uh82bTeOPJFVRiCdeanScVhGFI9?=
 =?us-ascii?Q?NTk9Yf+btSZijbFh3Ziy72XoXoJWsdRW99S2zajS2KPaeRzsYAphcMCdslt5?=
 =?us-ascii?Q?tWdwUciNeBxumWFZ5RNCGhw8p5OdJSO8WGT1TrRZB/Pdh/s5Pi7cgTQZQTE5?=
 =?us-ascii?Q?n5/lGqwTcOcXoSVEb2eNMgaDWu/rRvmiZW7FiP6WP/Hc1Fp7JmB4ZBshh1eQ?=
 =?us-ascii?Q?1R2hsnrTjLqNl/awwN6x3FdZc12gS9jrlGGUqt4yYa7yFyQiqGlb/MoMgfnw?=
 =?us-ascii?Q?eE7/fSn1HtioXLGq+cg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:51:37.8199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefa0892-0b11-4885-75b3-08de47c3b2ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5802
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 16:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16910

Upstream has bumped to a version that already has this patch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../cryptodev/cryptodev-module-arago.inc      |  4 --
 .../0001-Fix-build-for-Linux-6-18-rc1.patch   | 53 -------------------
 2 files changed, 57 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-mo=
dule/0001-Fix-build-for-Linux-6-18-rc1.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-ar=
ago.inc b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago=
.inc
index 9bd89679..74688f1c 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago.inc
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module-arago.inc
@@ -1,7 +1,3 @@
 PR:append =3D ".arago0"
=20
 KERNEL_MODULE_AUTOLOAD +=3D "cryptodev"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/cryptodev-module:"
-
-SRC_URI +=3D "file://0001-Fix-build-for-Linux-6-18-rc1.patch"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/00=
01-Fix-build-for-Linux-6-18-rc1.patch b/meta-arago-distro/recipes-kernel/cr=
yptodev/cryptodev-module/0001-Fix-build-for-Linux-6-18-rc1.patch
deleted file mode 100644
index d7f1d05c..00000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-Fix-=
build-for-Linux-6-18-rc1.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 08644db02d43478f802755903212f5ee506af73b Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Joan=3D20Bruguera=3D20Mic=3DC3=3DB3?=3D <joanbrugueram@g=
mail.com>
-Date: Sat, 6 Sep 2025 20:36:38 +0000
-Subject: [PATCH] Fix build for Linux 6.18-rc1
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-It's no longer required to use nth_page() when iterating pages within a
-single scatterlist entry.
-
-Note I believe this code path in `sg_advance` is currently unreachable:
-It is only called from `get_userbuf_srtp`, passing in a scatterlist
-copied from one created by `__get_userbuf`, which only generates
-entries such that `sg->offset + sg->length <=3D PAGE_SIZE`.
-On the other hand, this code path in `sg_advance` requires that
-`sg->offset + sg->length > sg->offset + consumed >=3D PAGE_SIZE`.
-
-See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Df8f03eb5f0f91fddc9bb8563c7e82bd7d3ba1dd0
-          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Dce00897b94bc5c62fab962625efcf1ab824d3688
-
-Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-li=
nux/commit/08644db02d43478f802755903212f5ee506af73b]
-
-Signed-off-by: Joan Bruguera Mic=C3=B3 <joanbrugueram@gmail.com>
----
- util.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/util.c b/util.c
-index 9eba4836..d4267816 100644
---- a/util.c
-+++ b/util.c
-@@ -21,6 +21,7 @@
-=20
- #include <crypto/scatterwalk.h>
- #include <linux/scatterlist.h>
-+#include <linux/version.h>
- #include "util.h"
-=20
- /* These were taken from Maxim Levitsky's patch to lkml.
-@@ -44,8 +45,12 @@ struct scatterlist *sg_advance(struct scatterlist *sg, =
int consumed)
- 	sg->length -=3D consumed;
-=20
- 	if (sg->offset >=3D PAGE_SIZE) {
-+#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(6, 18, 0))
-+		struct page *page =3D sg_page(sg) + (sg->offset / PAGE_SIZE);
-+#else
- 		struct page *page =3D
- 			nth_page(sg_page(sg), sg->offset / PAGE_SIZE);
-+#endif
- 		sg_set_page(sg, page, sg->length, sg->offset % PAGE_SIZE);
- 	}
-=20
--=20
2.43.0


