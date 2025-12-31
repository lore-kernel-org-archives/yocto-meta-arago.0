Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259FCEEB571
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 22:07:45 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94527.1767218854728423952
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 Dec 2025 14:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JHt4bmgx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKkROjPegVpwwjixk3C5fqC3By85D5yHfKaEh7OTd91adJvxKvUAcDPbC1mGvseMzrjQDUcpMw0adUeSGJn43MErfTf4WOEtJL5mSF6p6O8C5zbzE1eXejw0VCvy1DTj4PtDXalCW+0twAllOYlPHMsF3Ahn6kRwwtqcNIdH2Q2s5NZPLYnKzEfYZy27wD/zr2HEVKnOqQYTxpDvzINGgqdi4j36CKUpkToQ978KNYLcgMBs/PqWvr+7RrltbyWTPS4XQoGlyJj4zEa4uA7Fv+HtnZaVQrfYNeJ280rLvTt81BHCJZNvLkQbuOlPuv+VeAs24PeQ33yoGyESLaPP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdp9UyfXy46sRcikwxr/mQqD2uAhaTZloqWbH/fzvHI=;
 b=N64fznUIDDMGPp5KfZ7RO6iCaASWc2RHdUsOJaURDk3ssPZ8PbSg6HYDG6Hfp+xX+Qq7x6t9qtdfa/QoSe1XUdtxpuntlwS5RYEUUpu0ziu/Btcpux/X/MR4jkF05WaikoW1r/Ft4SZW4ZUkFciBrLtvQE26pz2P6//1fWBTSAG2sGFx/VPDJWsJM8vt2162d4tTmu5sKYcuAlXFRg5Qn4OLsz17bSvq/koDLrpPXpgvuJ2xUqB7hM4er4utH8oaHL1QlZ9YC/8DTuxhbi6fECKHz0MOe/qhOWP4XA/ERBYGXyM0G/8yFTo1OOBETQRcQ46JCuXprpLt5u0qMwpU8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wdp9UyfXy46sRcikwxr/mQqD2uAhaTZloqWbH/fzvHI=;
 b=JHt4bmgxvpitupgqGu5uY+7UUi+n81G/vxozdIzWuvpwVBLhvjAmLlX8IbHyTbC1YYYSddrSbnHnU8x+W7vnY+yBPnoH5wfQGtuST987SPRH3PYFSplh0zl8Btd3RDx9NB4MWlsglQDZZIzIiVJ3lFzIWY2/jO5Q9AkpqjmF2JM=
Received: from PH7PR02CA0027.namprd02.prod.outlook.com (2603:10b6:510:33d::16)
 by DS4PPF6D651AD93.namprd10.prod.outlook.com (2603:10b6:f:fc00::d27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 22:07:32 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::70) by PH7PR02CA0027.outlook.office365.com
 (2603:10b6:510:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 22:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 22:07:30 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 16:07:28 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 16:07:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 16:07:28 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVM7Swj2799679;
	Wed, 31 Dec 2025 16:07:28 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vb4Lo-0000000Dtb1-1uVI;
	Wed, 31 Dec 2025 16:07:28 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libdrm: Remove upstreamed patch
Date: Wed, 31 Dec 2025 16:07:28 -0600
Message-ID: <20251231220728.3311872-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|DS4PPF6D651AD93:EE_
X-MS-Office365-Filtering-Correlation-Id: 373b3154-1176-4b60-0895-08de48b8fe0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FZr4aAcspka7Gfeq04t9yU0l/C/KwdRIPi+glfHfR1FsG7bgUqNjKZEO/SgA?=
 =?us-ascii?Q?ef3eWQcDHRYL8i37BzV7H2HUCZ0aPNw0ACpJnMbz16Xjrw9Lv/KKQwidrkq7?=
 =?us-ascii?Q?yGLv8zDw+/rWEg238sEuMkF5Pc21fYJVhbHJdcqjFp4pzhICfeAIA1h9rA2y?=
 =?us-ascii?Q?xVOhzgzRudMczvgGGQiqNLz/76VV15Y/L/MYT9lLwBqB5S4eyBCIQEsltwT+?=
 =?us-ascii?Q?5WgH2UjKdctRyMfB2xa7z7GxKRRLzo54XnJ+dE9JLDlVfNK3y70jQHBCQOFE?=
 =?us-ascii?Q?+YnXNWImQImEpAHt1HssTFiXmgzImEpf+v8ofMEX3D+a+3Y4ihXf8YhxA0E7?=
 =?us-ascii?Q?4AipO+/vKOJSavEi7HaDWSJWpzxMNn4L0FMH4mpg/AwyLSzzx7zb89ROxGzJ?=
 =?us-ascii?Q?k7+B6DVCdimYf9wdlBz8x8D55a/3AU6aI1LzZT9QX2But5Yqv4eazdnqdMAv?=
 =?us-ascii?Q?owLj5ijh2mN43YSi93JobDpKeJg67Gq0nHeCaxR9JjghCuMJQfdELo9UaI22?=
 =?us-ascii?Q?wBRHoBaPoY78MXhSARm1vyCLNPYesHlIHHLv4thxTpAhyZh0bevJK2grYyXi?=
 =?us-ascii?Q?heDXUfFP7ocNSdmy/NV0L3OBiPHlrrkbrvoxIIaHROFb37Ef3wOWV7teHjkI?=
 =?us-ascii?Q?9fVswniS9c/d7EMY9HUqFVjR4T7wEldrjyEPRCGotyw2g8HV62aszZZO/7An?=
 =?us-ascii?Q?MyTI01+UfUvayBdCGvT4xk9doibghm/YPj8JWhT8C41oADr9XTMX5unQI4jt?=
 =?us-ascii?Q?jfXFN9pv0DHOMSEbm4KGOwAywb6IjijGDicYawpZtaQxUM5zGF1WEswEcd+h?=
 =?us-ascii?Q?ZwsWl8hi5X+yCu2uoNFP0O7xGahsWbdfyrecFteZs7OVTMLII/4CsY/X+Y+4?=
 =?us-ascii?Q?VECFllBF+2fr3dr233fMNNULsD59YlV1XQQwyySnt85ySUvB7qhOH1LKe9EZ?=
 =?us-ascii?Q?izeKQJzZD1c+YQ4DZS6ulxyCAD8/Hg7sELjaUGBbVj04OZ5SPNEWwflPkhyz?=
 =?us-ascii?Q?/oassFHeyHwYYbMfl/UTV0JQEaU+95ZKuy8ZLhgk0tU1vMRadA3CUZ06CQ8v?=
 =?us-ascii?Q?CdR6UB1kxtm4IyDKixCwWLPtl5YL9KJ45SUGu4pbQnS3ZK7SJRrrPWPxDH4D?=
 =?us-ascii?Q?hvSrgg6z10RoKICF0RxsiDkr3OG0m/W/LcmBHa9Z4kBga5/nJUBoCyrdsM9u?=
 =?us-ascii?Q?RqNIPD5/oTtPfYaS+gDfHGoKJxvOk7FpCdz36B2vt/YZdlyqIqMmT10zCAY+?=
 =?us-ascii?Q?EQID8M38sr/vHpfbR7tlloMlgFmv0cFvwVAP0gDA6GpNIkie+dhf48PkI73S?=
 =?us-ascii?Q?NXGYcdZ6Cs15s+dGR6rOi6QsaD71pM9q7QIxhpKB65wltfbJhn9HQzqZIA4m?=
 =?us-ascii?Q?IJWKYpSABo7JCJP2Ps8w+sStXyzhul8YiMsIuzUHeoyjDFQh9Sqb+Bh/o9e1?=
 =?us-ascii?Q?vdFgeMXP/kcAKnSwIabbaA8lKhzpZJNoa07bMr0IZhZ0EiIeuQr+av7nbnYo?=
 =?us-ascii?Q?GAtE5HDgx8uI0LHgH8bDpJoGTadbqjcQ1ZxP4wmlwDH9pJHOmDEbOTAYuIc3?=
 =?us-ascii?Q?wzZWYWDZ0mWzv7Yf+CM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 22:07:30.6150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 373b3154-1176-4b60-0895-08de48b8fe0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6D651AD93
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 Dec 2025 22:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16913

A form of this patch was recently upstreamed and oe-core is now pointing
to a version of libdrm that contains the patch.  We can drop this patch
from meta-arago-distro.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/drm/libdrm-arago.inc     |  1 -
 ...p-fix-omap_bo_size-for-tiled-buffers.patch | 38 -------------------
 2 files changed, 39 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap=
-fix-omap_bo_size-for-tiled-buffers.patch

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc b/meta=
-arago-distro/recipes-graphics/drm/libdrm-arago.inc
index 80c607ca..5b64677a 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/libdrm:"
=20
 SRC_URI +=3D " \
 file://0001-Add-option-to-run-a-test-indefinitely.patch \
-file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
 file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
 "
=20
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-om=
ap_bo_size-for-tiled-buffers.patch b/meta-arago-distro/recipes-graphics/drm=
/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch
deleted file mode 100644
index 3f47243d..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo_s=
ize-for-tiled-buffers.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 999fa7f4c79f9502b4f9d9e6d380f82bf839a250 Mon Sep 17 00:00:00 2001
-From: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Date: Thu, 18 May 2017 12:18:28 +0300
-Subject: [PATCH] omap: fix omap_bo_size for tiled buffers
-
-The buffer size is calculated using pixels, not bytes as it should. The
-result is often correct, though, as the stride is aligned to page size,
-but there are still many cases where the size ends up being wrong.
-
-Fix this by not calculating the size at all, as in that case
-DRM_OMAP_GEM_INFO ioctl is used to get the correct size from the kernel.
-This is better in any case as then the userspace library doesn't need to
-know how the tiled buffers need to be aligned.
-
-Upstream-Status: Pending
-Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
----
- omap/omap_drm.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/omap/omap_drm.c b/omap/omap_drm.c
-index 42d35ef..06221b7 100644
---- a/omap/omap_drm.c
-+++ b/omap/omap_drm.c
-@@ -207,11 +207,9 @@ static struct omap_bo * omap_bo_new_impl(struct omap_=
device *dev,
- 	bo =3D bo_from_handle(dev, req.handle);
- 	pthread_mutex_unlock(&table_lock);
-=20
--	if (flags & OMAP_BO_TILED) {
--		bo->size =3D round_up(size.tiled.width, PAGE_SIZE) * size.tiled.height;
--	} else {
-+	/* for tiled buffers we get the size with DRM_OMAP_GEM_INFO later */
-+	if (!(flags & OMAP_BO_TILED))
- 		bo->size =3D size.bytes;
--	}
-=20
- 	return bo;
-=20
--=20
2.43.0


