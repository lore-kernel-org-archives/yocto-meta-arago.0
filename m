Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DC8CE529A9
	for <meta-arago@arago-project.org>;
	Thu,  9 Apr 2015 12:34:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39CY6o7001453
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:34:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CY5Si014139
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:34:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 07:34:04 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CY3NU002912;
	Thu, 9 Apr 2015 07:34:04 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Apr 2015 18:03:59 +0530
Message-ID: <1428582839-30047-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: weston: Add support for DRM backend to support multiple displays
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
X-List-Received-Date: Thu, 09 Apr 2015 12:34:07 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...abling-DRM-backend-with-multiple-displays.patch |   60 ++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.6.0.bbappend |    3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
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
index 495ef36..b0e8985 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,12 +2,13 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
+            file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
 "
 
 # Add custom Arago Wayland Environment script file
-- 
1.7.9.5


