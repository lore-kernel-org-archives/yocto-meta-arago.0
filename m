Return-Path: <e-ruei1@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 731D2529A0
	for <meta-arago@arago-project.org>;
	Thu, 27 Oct 2016 22:24:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RMOiwd015170
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 17:24:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RMOiYZ000516
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 17:24:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 17:24:44 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9RMOiLW025157	for <meta-arago@arago-project.org>;
	Thu, 27 Oct 2016 17:24:44 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Oct 2016 18:24:41 -0400
Message-ID: <1477607081-16103-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: Add RGB565 support for pixman renderer
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
X-List-Received-Date: Thu, 27 Oct 2016 22:24:51 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...r-drm-support-RGB565-with-pixman-renderer.patch | 125 +++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend |   3 +-
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
new file mode 100644
index 0000000..add2b48
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
@@ -0,0 +1,125 @@
+From 4d81723304c8260a295ed8be50e9b6cc6cc45543 Mon Sep 17 00:00:00 2001
+From: Tomi Valkeinen <tomi.valkeinen@ti.com>
+Date: Sat, 13 Aug 2016 21:30:23 -0400
+Subject: [PATCH] compositor-drm: support RGB565 with pixman renderer
+
+At the moment only XRGB8888 is supported when using pixman renderer.
+This patch adds support also for RGB565.
+
+Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+---
+ src/compositor-drm.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 55 insertions(+), 7 deletions(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index a06c98a..6485b39 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -270,10 +270,12 @@ drm_fb_destroy_callback(struct gbm_bo *bo, void *data)
+ }
+ 
+ static struct drm_fb *
+-drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
++drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height,
++		   uint32_t format)
+ {
+ 	struct drm_fb *fb;
+ 	int ret;
++	uint32_t bpp, depth;
+ 
+ 	struct drm_mode_create_dumb create_arg;
+ 	struct drm_mode_destroy_dumb destroy_arg;
+@@ -283,8 +285,20 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
+ 	if (!fb)
+ 		return NULL;
+ 
++	switch (format) {
++		case GBM_FORMAT_XRGB8888:
++			bpp = 32;
++			depth = 24;
++			break;
++		case GBM_FORMAT_RGB565:
++			bpp = depth = 16;
++			break;
++		default:
++			return NULL;
++	}
++
+ 	memset(&create_arg, 0, sizeof create_arg);
+-	create_arg.bpp = 32;
++	create_arg.bpp = bpp;
+ 	create_arg.width = width;
+ 	create_arg.height = height;
+ 
+@@ -297,8 +311,29 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
+ 	fb->size = create_arg.size;
+ 	fb->fd = b->drm.fd;
+ 
+-	ret = drmModeAddFB(b->drm.fd, width, height, 24, 32,
+-			   fb->stride, fb->handle, &fb->fb_id);
++	ret = -1;
++
++	if (!b->no_addfb2) {
++		uint32_t handles[4], pitches[4], offsets[4];
++
++		handles[0] = fb->handle;
++		pitches[0] = fb->stride;
++		offsets[0] = 0;
++
++		ret = drmModeAddFB2(b->drm.fd, width, height,
++				    format, handles, pitches, offsets,
++				    &fb->fb_id, 0);
++		if (ret) {
++			weston_log("addfb2 failed: %m\n");
++			b->no_addfb2 = 1;
++		}
++	}
++
++	if (ret) {
++		ret = drmModeAddFB(b->drm.fd, width, height, depth, bpp,
++				   fb->stride, fb->handle, &fb->fb_id);
++	}
++
+ 	if (ret)
+ 		goto err_bo;
+ 
+@@ -1874,17 +1909,30 @@ drm_output_init_pixman(struct drm_output *output, struct drm_backend *b)
+ {
+ 	int w = output->base.current_mode->width;
+ 	int h = output->base.current_mode->height;
++	uint32_t format = output->format;
++	uint32_t pixman_format;
+ 	unsigned int i;
+ 
+-	/* FIXME error checking */
++	switch (format) {
++		case GBM_FORMAT_XRGB8888:
++			pixman_format = PIXMAN_x8r8g8b8;
++			break;
++		case GBM_FORMAT_RGB565:
++			pixman_format = PIXMAN_r5g6b5;
++			break;
++		default:
++			weston_log("Unsupported pixman format 0x%x\n", format);
++			return -1;
++	}
+ 
++	/* FIXME error checking */
+ 	for (i = 0; i < ARRAY_LENGTH(output->dumb); i++) {
+-		output->dumb[i] = drm_fb_create_dumb(b, w, h);
++		output->dumb[i] = drm_fb_create_dumb(b, w, h, format);
+ 		if (!output->dumb[i])
+ 			goto err;
+ 
+ 		output->image[i] =
+-			pixman_image_create_bits(PIXMAN_x8r8g8b8, w, h,
++			pixman_image_create_bits(pixman_format, w, h,
+ 						 output->dumb[i]->map,
+ 						 output->dumb[i]->stride);
+ 		if (!output->image[i])
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 6b00ae0..cde8374 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago14"
+PR_append = ".arago15"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -15,4 +15,5 @@ SRC_URI += " \
 	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 	file://0001-Add-soc-performance-monitor-utilites.patch \
+	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
 "
-- 
1.9.1


