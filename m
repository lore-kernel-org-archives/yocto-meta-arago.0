Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C10C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1298.1684951892041190758
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GPHEBnv2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOFW099629;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=XhZP6tkDDZUvuX5OKZORjQW2jhWgbLbFEo357j81a0c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GPHEBnv2GI/S3UUkXqkrYeGvbMC5/xqXo9HkXGdBrlNoEvwKHdoZ2yajh08bN96TS
	 FP1zofwIqMKIUopVZBuDSOQZcEI92Y8JQ/anyC/scES5YjSVsXH04+aXyHub5eRBkj
	 6gTx3Mz8Jt9Qmn5RIlVh5S0igNMi5DppA/6oD2o8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBO7k009187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq1005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 2/7] weston: drop Fix-touch-screen-crash patch
Date: Wed, 24 May 2023 13:11:17 -0500
Message-ID: <20230524181122.35202-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524181122.35202-1-rs@ti.com>
References: <20230524181122.35202-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14468

From: Randolph Sapp <rs@ti.com>

Drop the fix touchscreen crash patch as this is for an older version of
weston and it seems like they completely reworked the way the handle
touch events, adding checks for out of bounds events and extra handling
for NULL window focus events.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...-weston-Fix-touch-screen-crash-issue.patch | 39 -------------------
 .../wayland/weston_10.0.2.bbappend            |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch
deleted file mode 100644
index 4849d5b6..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 60250e9dc57fe56148c8a24bba107bce8a873fb4 Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Mon, 12 Mar 2018 10:56:28 +0530
-Subject: [PATCH 4/4] weston: Fix touch screen crash issue
-
-Touch screen operation causes the weston to crash with segment fault sometimes.
-The crash occurs when the coordinate (x,y) passed to the weston input module
-is outside the view window, hence the weston compositor is not able to pick
-up a display view and there is no code to detect this condition at function
-notify_touch().
-
-Upstream status: pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- libweston/input.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libweston/input.c b/libweston/input.c
-index 4fedc55..bcb2f28 100644
---- a/libweston/input.c
-+++ b/libweston/input.c
-@@ -2185,6 +2185,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
- 		 * until all touch points are up again. */
- 		if (touch->num_tp == 1) {
- 			ev = weston_compositor_pick_view(ec, x, y, &sx, &sy);
-+			if (!ev)
-+			{
-+				weston_log("notify_touch: weston_compositor_pick_view(%d, %d) failed to find a view!\n",
-+							wl_fixed_to_int(x), wl_fixed_to_int(y));
-+				return;
-+			}
- 			weston_touch_set_focus(touch, ev);
- 		} else if (!touch->focus) {
- 			/* Unexpected condition: We have non-initial touch but
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index b1b7d26a..16ed6e67 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -5,7 +5,6 @@ PR:append = ".arago1"
 #        file://0002-weston-Allow-visual_id-to-be-0.patch
 SRC_URI += " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
-        file://0004-weston-Fix-touch-screen-crash-issue.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
-- 
2.40.1


