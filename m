Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5E9B752ABE
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:28:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRqhq027471
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094872;
	bh=ZZFzoEW/GHpDekcLNKBInaVl13u/QdK9BpVrTB/XqL0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fDmXpikC5m1tSr2iC7MvHcxULU7f8QuTGYBcSdjyRbIRqJxnjEo7vjcs+BVxKBY2g
	T8f8vNMd7M+op6JzTYXEEg3Yw7kRF/qmmR0pqwB3rKMrZEatdmQCtlz1vLLziW+f/c
	4523zWwB8nFtmWO5QY2KWDYJytYLfReYTTTJ7aAs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRlLo004846
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:46 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEp025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:46 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:33 -0500
Message-ID: <1489094857-27497-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
References: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH V2 1/5] weston: allow visual_id to be 0 to fix EGL config failure
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Mar 2017 21:28:02 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...to-be-0.patch => 0002-Weston-Allow-visual_id-to-be-0.patch} | 10 +++++-----
 .../recipes-graphics/wayland/weston_1.11.0.bbappend            |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0002-Weston1.9.0-Allow-visual_id-to-be-0.patch => 0002-Weston-Allow-visual_id-to-be-0.patch} (72%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
similarity index 72%
rename from meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
rename to meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
index 72d067f..39c8401 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
@@ -1,7 +1,7 @@
-From 27cf7d0c260fa4754a021e9f6f92f83e2c99f5f4 Mon Sep 17 00:00:00 2001
+From 5b5de6a814b43ca023a92b85b407b3d061dbc64f Mon Sep 17 00:00:00 2001
 From: Eric Ruei <e-ruei1@ti.com>
-Date: Mon, 11 Jan 2016 11:59:19 -0500
-Subject: [PATCH 2/2] Weston1.9.0: Allow visual_id to be 0
+Date: Thu, 9 Mar 2017 14:32:24 -0500
+Subject: [PATCH 2/4] Weston: Allow visual_id to be 0
 
 The inquiry of visual id from egl API eglGetConfigAttrib(EGL_NATIVE_VISUAL_ID)
 is an optional feature. The visual id will be set to 0 if this feature is
@@ -14,10 +14,10 @@ Signed-off-by: Eric Ruei <e-ruei1@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gl-renderer.c b/src/gl-renderer.c
-index d7231f4..e1b925e 100644
+index 23c0cd7..4c1f170 100644
 --- a/src/gl-renderer.c
 +++ b/src/gl-renderer.c
-@@ -2194,7 +2194,7 @@ match_config_to_visual(EGLDisplay egl_display,
+@@ -2462,7 +2462,7 @@ match_config_to_visual(EGLDisplay egl_display,
  				&id))
  			continue;
  
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index 60a752b..9a2c3a7 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago17"
+PR_append = ".arago18"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -11,4 +11,5 @@ RDEPENDS_${PN} += "weston-conf"
 
 SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+	file://0002-Weston-Allow-visual_id-to-be-0.patch \
 "
-- 
1.9.1


