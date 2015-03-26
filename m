Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 378B9529A9
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2015 13:03:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QD36PM026144
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 08:03:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QD35Dl016250
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 08:03:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 08:03:05 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QD33oS004293;
	Thu, 26 Mar 2015 08:03:04 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Mar 2015 18:33:01 +0530
Message-ID: <1427374981-18646-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: weston: Add support for DRM backend
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
X-List-Received-Date: Thu, 26 Mar 2015 13:03:07 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...abling-DRM-backend-with-multiple-displays.patch |   60 ++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.6.0.bbappend |    7 ++-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
new file mode 100644
index 0000000..2f215c9
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
@@ -0,0 +1,60 @@
+From b1829ce962aa4e13d737edb54130bdce05f068f0 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Wed, 17 Dec 2014 09:21:49 +0530
+Subject: [PATCH] weston: Enabling DRM backend with multiple displays
+
+There are three main issues that this patch tries to address
+
+ 1. Black screen when running weston
+ 2. Support for multiple displays
+ 3. Handling missing VBlanks
+
+There is an issue with missing VBlanks for LCD and
+HDMI connectors which leads to display not getting refreshed.
+This patch can be considered as a workaround.
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ src/compositor-drm.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index e4496e7..3b22aa3 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -646,7 +646,7 @@ drm_output_repaint(struct weston_output *output_base,
+ 			.request.sequence = 1,
+ 		};
+ 
+-		if ((!s->current && !s->next) ||
++		if ((!s->current && !s->next) &&
+ 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
+ 			continue;
+ 
+@@ -757,6 +757,7 @@ page_flip_handler(int fd, unsigned int frame,
+ {
+ 	struct drm_output *output = (struct drm_output *) data;
+ 	uint32_t msecs;
++	uint32_t bail;
+ 
+ 	/* We don't set page_flip_pending on start_repaint_loop, in that case
+ 	 * we just want to page flip to the current buffer to get an accurate
+@@ -769,9 +770,14 @@ page_flip_handler(int fd, unsigned int frame,
+ 
+ 	output->page_flip_pending = 0;
+ 
++	if(output->vblank_pending) {
++		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
++		bail = 1;
++	}
++
+ 	if (output->destroy_pending)
+ 		drm_output_destroy(&output->base);
+-	else if (!output->vblank_pending) {
++	else if (!output->vblank_pending || bail ) {
+ 		msecs = sec * 1000 + usec / 1000;
+ 		weston_output_finish_frame(&output->base, msecs);
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index e636ffd..4e9901d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -1,12 +1,17 @@
+PACKAGECONFIG[kms] = "--enable-drm-compositor WESTON_NATIVE_BACKEND="drm-backend.so",--disable-drm-compositor,drm udev libgbm mtdev"
+
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor WESTON_NATIVE_BACKEND="drm-backend.so",--disable-wayland-compositor,libgbm"
+
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
+            file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
 "
 
 # Add custom Arago Wayland Environment script file
-- 
1.7.9.5


