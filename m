Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 33A2052AC5
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:27:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRlrx006569
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094867;
	bh=B+9ouKB/YFEOBEj+/YufhfHOgTjLYbaKvc/u6dzX4d4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VqhueZCV97dQUqFMuppGe/jTLh6w/23cJcXWb2OyvNPhP8sqvFuGhYcDVDeHhz5Rg
	hFbkqfmFgGvDx9BY6GD+/WR5nXUUa9o5kQYdYp7GIcgxUJaj9+GI7xniUuG5sKDoEh
	t96/8hWZmG3gAeT8ledZ7RwFBqKRjjyeSSoysV9I=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRl2r021906
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:47 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEr025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:35 -0500
Message-ID: <1489094857-27497-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
References: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH V2 3/5] weston: fix touch screen crash issue
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
X-List-Received-Date: Thu, 09 Mar 2017 21:27:48 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e.patch => 0004-Weston-Fix-touch-screen-crash-issue.patch} | 11 +++++------
 .../recipes-graphics/wayland/weston_1.11.0.bbappend           |  3 ++-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch => 0004-Weston-Fix-touch-screen-crash-issue.patch} (79%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
similarity index 79%
rename from meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
rename to meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
index c221d1c..673ca3d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
@@ -1,7 +1,7 @@
-From 9a7c0e7b6ae9700069756b33d2ea726e58b552ed Mon Sep 17 00:00:00 2001
+From 8958bf21960a475d2933e688d0da9a0d2186d509 Mon Sep 17 00:00:00 2001
 From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 16 Mar 2016 16:50:31 -0400
-Subject: [PATCH 4/4] Weston1.9.0: Fix touch screen crash issue
+Date: Thu, 9 Mar 2017 14:34:18 -0500
+Subject: [PATCH 4/4] Weston: Fix touch screen crash issue
 
 Touch screen operation causes the weston to crash with segment fault sometimes.
 The crash occurs when the coordinate (x,y) passed to the weston input module
@@ -9,17 +9,16 @@ is outside the view window, hence the weston compositor is not able to pick
 up a display view and there is no code to detect this condition at function
 notify_touch().
 
-
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
  src/input.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/src/input.c b/src/input.c
-index e230c83..fd8e53f 100644
+index 8fe898c..0f72d23 100644
 --- a/src/input.c
 +++ b/src/input.c
-@@ -1566,6 +1566,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
+@@ -1848,6 +1848,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
  		 * until all touch points are up again. */
  		if (touch->num_tp == 1) {
  			ev = weston_compositor_pick_view(ec, x, y, &sx, &sy);
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index f2e22ca..08f2f22 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago19"
+PR_append = ".arago20"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -13,4 +13,5 @@ SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 	file://0002-Weston-Allow-visual_id-to-be-0.patch \
 	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
+	file://0004-Weston-Fix-touch-screen-crash-issue.patch \
 "
-- 
1.9.1


