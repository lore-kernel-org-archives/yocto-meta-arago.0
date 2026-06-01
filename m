Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A191ECD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:09:14 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4242.1780333746611902550
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Wq6hxiO+;
 spf=pass (domain: ti.com, ip: 52.101.46.6, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbRuoPCvZMxrw6qRiHoNHr9UPvofCYGe8AApB4ikXiSNs8pZSUAiQiZTAsqxpNjYDDweqkcHgnEQbwi7rEerlSoO7zDPrv//NGCx0AxPtmvEGyDMPFUKXZ4rqtI7I2BiFypJPnhPBdNqzwXEk9COpn30NfklAEzWzj/QUlF/1Ri0RpLBdzWnwAVvyo6BxOZCuJZSmMi2SLKta1pAqMTBSxRoYRBUnYW2qbMShFEpI1VCvh/ypIf7SVZ//zIYfTaRTI7UHuROOR/a1tBYOwSPrT5ovXMX+I4ClsT/YdkCELUQa9bQVNPlftR9PUegYcgV3Osk6lHIrPW5mSUzzAIf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH38/1smQKhZPSiww2sojW0zUiHsVnwLe87X2MnpoQk=;
 b=O5N6j0+sK/LyY37iaIq32L2u+duqFdrlLyC9MgJZgbJCnELOqlKAf/c95p/fo+a234gukzvvkZG1ZBwXb1NCihq6Zy5HiwyxKDOfAJTFAu6NsZTRl7CYZpU5S7Eo2jpuqrhlZKcdekba4/fh3csb8d+a72/PNuUN6QTuDQlYVAwQ54dC3YM+9jafrApjoq70uk51LL6on5bW90OH8WjIp34V22eYwzqxFgxbGVS4+8kd+Tcc+13ljAU5exwfvwBf2HL9OwJPPnzak0Disgk+6YLr3QPNjHgkL7tdhEV7hwzQT/OWKi71zY2HfuZnC7l+BSO6R93lX5hGTrNZYxaAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH38/1smQKhZPSiww2sojW0zUiHsVnwLe87X2MnpoQk=;
 b=Wq6hxiO+XJDSVGto+JidNffH8oGa81M8zrjTNxMmI/UeojVPOuPxktMH+CbnU1YnGVfC3UAXYtXDi/3f4OOfETDfSrEcCvmZzJPVB6nPWfgEWy0MH7xIlKa9DsAAfZH59MXswxd3AIWMo3DTpqgex3XTIegVi0YCYu6AjB1stJo=
Received: from SJ2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:a03:505::20)
 by DM4PR10MB6064.namprd10.prod.outlook.com (2603:10b6:8:bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 17:09:02 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::13) by SJ2PR07CA0011.outlook.office365.com
 (2603:10b6:a03:505::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 17:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 17:09:00 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:08:47 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:08:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:08:47 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651H8liW1496063;
	Mon, 1 Jun 2026 12:08:47 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master/wrynose][PATCH] weston: fix assert firing when subsurfaces have no views
Date: Mon, 1 Jun 2026 12:08:44 -0500
Message-ID: <20260601170844.1723390-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM4PR10MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: f827ffc8-fef0-4a67-5183-08dec000798e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	JuhbWza0B5ANCs/5V5cuexSxWleautF7J/nnFOuG/SKM5xhOPnK5ZMRbzL71KlneL5Ygrp6MeBHZlGvcTF8WwuiqeWLC81dolbW46BC2o4/jy1QLlFrxFsTf7CMBGj+E/RJc31CWvae9jJlc6rBYzAouRuLuuVgY3HYsQF0xwRVnoBWYO9cvHDvGC8JM1IlTO44dJVcrRVbkl9JRxmnA5JT5WKkKqy7Z/P0PU7zwaE3z/gUzNsMndyRhycpglE17qkWH3Z6s5Re+p2hT5DFyAgqFBkU6wW/b9GjYx1DMMUtP5p6E1s2YX0hGDHMacHnY8kkAbcp27MwmZlJnoxgBivAxamj7b94RIK3UfUVhoNIu/oeCetrKi/acujCpsIVkhM78hMuSOKWH26SjbqAkUuDUzG2iJGowVokjbW/awldmKPmf60DWYJHathJdGbzwI/qYmqR9xIYnlPY3q/nDHtVSyBL0GInG1zkDpk4Dfgi6OYOScOfru2tFtyP+kakqdTrV3icqNT/yZvzcCJeyV4f36nP8VVALuXRjuRS3JNzyTxsg3Z7mwR9TqLjDB7zSJMSRu2daB1UuBtmEMRLqe402lgyUPlEJHP0+nNuAQOnZLrmJ4VvpkhKbYBCGLoiCLgLOZCiwKpcyWeivkizbo9B+bqUssbw4IYwABteq/iSncS+OhoIr6LYckiY6vuv3
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HxGN8U7BUcTYxUQ6cV3vUEIdW77vExRhPlmBkqU42LiI/iEtB16Mqjbj8PvWSJhH12M5Cftb4ZvF0h1RNr2wP1ZF4qo+c+RhkNpOPhovQAyh0INCdaZQYr+neoUnW9uJlT57L3wl5OB132CUr8FLwadVkW+0e6X/F1cwnA2e9sM9DQ0v8K9wOGIeGUIjByj9GC6eRy4frqiGgu7MmEDArrwNA10w2T8jVVbIVlnOq/2g4pwxX/LVWGXBGoiV7thQBgu1RbDHXXNvRsxRdbRmF7KE/x9zGc/IHi0IQkDk7v/pTqGXS1cj8/d/HBIiy6I2L9WEXatXLe7WaZ5rro0/Mp1Arh6pdc9a+pqfaCXJpY9xJuryi5wTqspZ3S5SCheyibpRi9Qn1XrAVuGQeW1UKAoX0LHng0++L/D89HwhzncZbI6VHy8Svq8lECeYKd1M
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:09:00.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f827ffc8-fef0-4a67-5183-08dec000798e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6064
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:09:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17544

Apply upstream candidate fix for an assert in
weston_surface_apply_subsurface_order that fires when subsurfaces have
no views. Without this patch, the assert fires when running Chromium
and causes the display to crash.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../wayland/weston-ti-version.inc             |  1 +
 ...x-assert-firing-when-subsurfaces-hav.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0002-surfac=
e-state-Fix-assert-firing-when-subsurfaces-hav.patch

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/m=
eta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
index 42e6b6ac..c8624f0e 100644
--- a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
@@ -4,4 +4,5 @@ PR:append =3D ".tisoc1"
=20
 SRC_URI +=3D " \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
+        file://0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.p=
atch \
 "
diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state=
-Fix-assert-firing-when-subsurfaces-hav.patch b/meta-ti-bsp/recipes-graphic=
s/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.=
patch
new file mode 100644
index 00000000..d370577c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-as=
sert-firing-when-subsurfaces-hav.patch
@@ -0,0 +1,47 @@
+From 12ecd8d4b5095c120efef76493546ead3f41ab5b Mon Sep 17 00:00:00 2001
+From: Derek Foreman <derek.foreman@collabora.com>
+Date: Wed, 27 May 2026 14:12:36 -0500
+Subject: [PATCH] surface-state: Fix assert firing when subsurfaces have no
+ views
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/=
-/merge_requests/2085]
+
+I've not been able to reproduce this, but have a report that this fires
+when running Chromium on aarch64.
+
+It seems plausible that we can get here when none of the subsurfaces have
+views, and thus the flag won't be set.
+
+Let's just remove the assert.
+
+Fixes 6a280a8f
+Fixes #1117
+
+Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ libweston/surface-state.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/libweston/surface-state.c b/libweston/surface-state.c
+index 3c31a0aa..65dc70bb 100644
+--- a/libweston/surface-state.c
++++ b/libweston/surface-state.c
+@@ -268,7 +268,6 @@ weston_surface_attach(struct weston_surface *surface,
+ static void
+ weston_surface_apply_subsurface_order(struct weston_surface *surface)
+ {
+-	struct weston_compositor *comp =3D surface->compositor;
+	struct weston_subsurface *sub;
+	struct weston_view *view;
+
+@@ -279,7 +278,6 @@ weston_surface_apply_subsurface_order(struct weston_su=
rface *surface)
+		wl_list_for_each(view, &sub->surface->views, surface_link)
+			weston_view_geometry_dirty(view);
+	}
+-	weston_assert_true(comp, comp->view_list_needs_rebuild);
+ }
+
+ /* Translate pending damage in buffer co-ordinates to surface
+--
+2.34.1
--=20
2.34.1

