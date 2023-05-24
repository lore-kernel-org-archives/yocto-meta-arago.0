Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA93C7EE39
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 18:11:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1297.1684951892001139585
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tm1opurv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOZ0099638;
	Wed, 24 May 2023 13:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684951884;
	bh=Y9QOhDLuBgwR/OCTnZJepeMS2cenhS14xgfMKjuX734=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tm1opurvXFglUFZUenol9mELgT5Nuc0OX4/KGyvjKdXBGAYtlqt5wiyf+HaKhv7Nd
	 kev0Jz78n/3maaUPZUrwaHBt4Y9RvF598oU33VT/Hx93K2nVinW0PZre1gUhpsY8FD
	 fwn8SiBbvD4qYX4iVHm5LSe+uICWisDrWF0bL1wA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34OIBO9Q008290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 13:11:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 13:11:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 May 2023 13:11:24 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34OIBOq2005029;
	Wed, 24 May 2023 13:11:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [arago][kirkstone][PATCH 3/7] weston: drop allow-visual_id-to-be-0 patch
Date: Wed, 24 May 2023 13:11:18 -0500
Message-ID: <20230524181122.35202-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14467

From: Randolph Sapp <rs@ti.com>

Weston 10 now checks to see if eglGetConfigAttrib returns anything
before handling the actual EGL_NATIVE_VISUAL_ID value.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../0002-weston-Allow-visual_id-to-be-0.patch | 34 -------------------
 .../wayland/weston_10.0.2.bbappend            |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
deleted file mode 100644
index a354d947..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5695eab02bb88318bf99d568b6d0e4592d5f9981 Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Mon, 12 Mar 2018 10:47:02 +0530
-Subject: [PATCH 2/4] weston: Allow visual_id to be 0
-
-The inquiry of visual id from egl API eglGetConfigAttrib(EGL_NATIVE_VISUAL_ID)
-is an optional feature. The visual id will be set to 0 if this feature is
-not supported. Therefore, the return condition @function match_config_to_visual()
-should be (id == visual_id || id == 0) instead of (id == visual_id)
-
-Upstream status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- libweston/gl-renderer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
-index c6091af..9299dc6 100644
---- a/libweston/gl-renderer.c
-+++ b/libweston/gl-renderer.c
-@@ -2575,7 +2575,7 @@ match_config_to_visual(EGLDisplay egl_display,
- 				&id))
- 			continue;
- 
--		if (id == visual_id)
-+		if (id == visual_id || id == 0)
- 			return i;
- 	}
- 
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index 16ed6e67..dd67eec1 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 PR:append = ".arago1"
 
-#        file://0002-weston-Allow-visual_id-to-be-0.patch
 SRC_URI += " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
-- 
2.40.1


