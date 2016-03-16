Return-Path: <e-ruei1@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D99EE52A65
	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 21:52:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GLqXCf015281
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 16:52:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GLqXBB001304
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 16:52:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 16:52:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2GLqX1P019594	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 16:52:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Mar 2016 17:52:27 -0400
Message-ID: <1458165147-37453-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: Add touch screen crash patch
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
X-List-Received-Date: Wed, 16 Mar 2016 21:52:34 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-Weston1.9.0-Fix-touch-screen-crash-issue.patch | 37 ++++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend |  7 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
new file mode 100644
index 0000000..c221d1c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
@@ -0,0 +1,37 @@
+From 9a7c0e7b6ae9700069756b33d2ea726e58b552ed Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 16 Mar 2016 16:50:31 -0400
+Subject: [PATCH 4/4] Weston1.9.0: Fix touch screen crash issue
+
+Touch screen operation causes the weston to crash with segment fault sometimes.
+The crash occurs when the coordinate (x,y) passed to the weston input module
+is outside the view window, hence the weston compositor is not able to pick
+up a display view and there is no code to detect this condition at function
+notify_touch().
+
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/input.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/input.c b/src/input.c
+index e230c83..fd8e53f 100644
+--- a/src/input.c
++++ b/src/input.c
+@@ -1566,6 +1566,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
+ 		 * until all touch points are up again. */
+ 		if (touch->num_tp == 1) {
+ 			ev = weston_compositor_pick_view(ec, x, y, &sx, &sy);
++			if (!ev)
++			{
++				weston_log("notify_touch: weston_compositor_pick_view(%d, %d) failed to find a view!\n",
++							wl_fixed_to_int(x), wl_fixed_to_int(y));
++				return;
++			}
+ 			weston_touch_set_focus(touch, ev);
+ 		} else if (!touch->focus) {
+ 			/* Unexpected condition: We have non-initial touch but
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 99b6d07..e6e9c78 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -11,6 +11,7 @@ RDEPENDS_${PN} += "weston-conf"
 SRC_URI += " \
 	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
 	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
-	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
-	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
+	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
+	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 "
-- 
1.9.1


