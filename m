Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D1BEE52968
	for <meta-arago@arago-project.org>;
	Mon, 12 Mar 2018 15:55:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2CFsOaL031491
	for <meta-arago@arago-project.org>; Mon, 12 Mar 2018 10:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520870064;
	bh=JtSyynF0sq2d1C46guH7U75j+N/aw46jwJB5oj4uYes=;
	h=From:To:CC:Subject:Date;
	b=v9H20M0FYSiy45xp0+1zK9Xkf3dZRFe25BPi3bIgVas/r6b6g5bkQiIYMij3BgxNP
	aGmQaLmfuQe67w+p9JZbgRaG4bsgkeT+1PmIerqRImdehHkVBOklbvaCKXeKXOy4nf
	yzebuDR1v3MA0j9Yjbh8IBbqJb9QNrM0mivdPaTs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2CFsO5L030167
	for <meta-arago@arago-project.org>; Mon, 12 Mar 2018 10:54:24 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 12 Mar 2018 10:54:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 12 Mar 2018 10:54:23 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2CFsMSE024661;
	Mon, 12 Mar 2018 10:54:23 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Mar 2018 21:24:19 +0530
Message-ID: <1520870059-125228-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko] weston: Update to weston 2.0.0
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
X-List-Received-Date: Mon, 12 Mar 2018 15:55:15 -0000
Content-Type: text/plain

 * also clean up the older patches

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...drm-fix-hotplug-weston-termination-proble.patch | 112 ------------------
 ...r-drm-support-RGB565-with-pixman-renderer.patch | 125 ---------------------
 ...v-seat-restrict-udev-enumeration-to-card0.patch |  36 +++---
 ...abling-DRM-backend-with-multiple-displays.patch |  60 ----------
 ...-Enabling-DRM-backend-with-multiple-displ.patch |  60 ----------
 .../0002-Weston-Allow-visual_id-to-be-0.patch      |  31 -----
 .../0002-weston-Allow-visual_id-to-be-0.patch      |  34 ++++++
 ...virtual-keyboard-display-issue-for-QT5-ap.patch |  39 -------
 ...virtual-keyboard-display-issue-for-QT5-ap.patch |  42 +++++++
 .../0004-Weston-Fix-touch-screen-crash-issue.patch |  36 ------
 .../0004-weston-Fix-touch-screen-crash-issue.patch |  39 +++++++
 .../recipes-graphics/wayland/weston_2.0.0.bbappend |  13 +--
 12 files changed, 140 insertions(+), 487 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
deleted file mode 100644
index fde38d5..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 8497d95cc77af9bbdbbce03878e9fd273d94ba7f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 7 Dec 2016 15:25:25 -0500
-Subject: [PATCH] compositor-drm: fix hotplug weston termination problem
-
-The weston_compositor_exit() is always invoked at function update_outputs()
-if all connector ids are greater than 31 because the 32-bit b->connector_allocator
-will be zero. Need to increase the size of both crtc_allocator and
-connector_allocator from 32-bit to 64-bit until a better solution is implemented.
-
-Upstream-Status: Submitted [wayland-devel@lists.freedesktop.org]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/compositor-drm.c | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index 6485b39..e4d889f 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -103,8 +103,8 @@ struct drm_backend {
- 	struct gbm_device *gbm;
- 	uint32_t *crtcs;
- 	int num_crtcs;
--	uint32_t crtc_allocator;
--	uint32_t connector_allocator;
-+	uint64_t crtc_allocator;
-+	uint64_t connector_allocator;
- 	struct wl_listener session_listener;
- 	uint32_t format;
- 
-@@ -1360,8 +1360,8 @@ drm_output_destroy(struct weston_output *output_base)
- 		       &output->connector_id, 1, &origcrtc->mode);
- 	drmModeFreeCrtc(origcrtc);
- 
--	b->crtc_allocator &= ~(1 << output->crtc_id);
--	b->connector_allocator &= ~(1 << output->connector_id);
-+	b->crtc_allocator &= ~(1ULL << output->crtc_id);
-+	b->connector_allocator &= ~(1ULL << output->connector_id);
- 
- 	if (b->use_pixman) {
- 		drm_output_fini_pixman(output);
-@@ -1842,8 +1842,8 @@ find_crtc_for_connector(struct drm_backend *b,
- 		drmModeFreeEncoder(encoder);
- 
- 		for (i = 0; i < resources->count_crtcs; i++) {
--			if (possible_crtcs & (1 << i) &&
--			    !(b->crtc_allocator & (1 << resources->crtcs[i])))
-+			if (possible_crtcs & (1ULL << i) &&
-+			    !(b->crtc_allocator & (1ULL << resources->crtcs[i])))
- 				return i;
- 		}
- 	}
-@@ -2404,9 +2404,9 @@ create_output_for_connector(struct drm_backend *b,
- 
- 	output->crtc_id = resources->crtcs[i];
- 	output->pipe = i;
--	b->crtc_allocator |= (1 << output->crtc_id);
-+	b->crtc_allocator |= (1ULL << output->crtc_id);
- 	output->connector_id = connector->connector_id;
--	b->connector_allocator |= (1 << output->connector_id);
-+	b->connector_allocator |= (1ULL << output->connector_id);
- 
- 	output->original_crtc = drmModeGetCrtc(b->drm.fd, output->crtc_id);
- 	output->dpms_prop = drm_get_prop(b->drm.fd, connector, "DPMS");
-@@ -2511,8 +2511,8 @@ err_free:
- 	}
- 
- 	drmModeFreeCrtc(output->original_crtc);
--	b->crtc_allocator &= ~(1 << output->crtc_id);
--	b->connector_allocator &= ~(1 << output->connector_id);
-+	b->crtc_allocator &= ~(1ULL << output->crtc_id);
-+	b->connector_allocator &= ~(1ULL << output->connector_id);
- 	free(output);
- 
- 	return -1;
-@@ -2658,7 +2658,7 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
- 	drmModeRes *resources;
- 	struct drm_output *output, *next;
- 	int x = 0, y = 0;
--	uint32_t connected = 0, disconnects = 0;
-+	uint64_t connected = 0, disconnects = 0;
- 	int i;
- 
- 	resources = drmModeGetResources(b->drm.fd);
-@@ -2680,9 +2680,9 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
- 			continue;
- 		}
- 
--		connected |= (1 << connector_id);
-+		connected |= (1ULL << connector_id);
- 
--		if (!(b->connector_allocator & (1 << connector_id))) {
-+		if (!(b->connector_allocator & (1ULL << connector_id))) {
- 			struct weston_output *last =
- 				container_of(b->compositor->output_list.prev,
- 					     struct weston_output, link);
-@@ -2707,8 +2707,8 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
- 	if (disconnects) {
- 		wl_list_for_each_safe(output, next, &b->compositor->output_list,
- 				      base.link) {
--			if (disconnects & (1 << output->connector_id)) {
--				disconnects &= ~(1 << output->connector_id);
-+			if (disconnects & (1ULL << output->connector_id)) {
-+				disconnects &= ~(1ULL << output->connector_id);
- 				weston_log("connector %d disconnected\n",
- 				       output->connector_id);
- 				drm_output_destroy(&output->base);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
deleted file mode 100644
index 0d77f52..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 91b452fa515b94928d32af6e1b1b0405469747fd Mon Sep 17 00:00:00 2001
-From: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Date: Wed, 8 Mar 2017 13:05:38 -0500
-Subject: [PATCH] compositor-drm: support RGB565 with pixman renderer
-
-At the moment only XRGB8888 is supported when using pixman renderer.
-This patch adds support also for RGB565.
-
-Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Reviewed-by: Daniel Stone <daniels@collabora.com>
-Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
-Signed-off-by: Daniel Stone <daniels@collabora.com>
----
- src/compositor-drm.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 55 insertions(+), 7 deletions(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index fd89627..443b69a 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -262,10 +262,12 @@ drm_fb_destroy_callback(struct gbm_bo *bo, void *data)
- }
- 
- static struct drm_fb *
--drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
-+drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height,
-+		   uint32_t format)
- {
- 	struct drm_fb *fb;
- 	int ret;
-+	uint32_t bpp, depth;
- 
- 	struct drm_mode_create_dumb create_arg;
- 	struct drm_mode_destroy_dumb destroy_arg;
-@@ -275,8 +277,20 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
- 	if (!fb)
- 		return NULL;
- 
-+	switch (format) {
-+		case GBM_FORMAT_XRGB8888:
-+			bpp = 32;
-+			depth = 24;
-+			break;
-+		case GBM_FORMAT_RGB565:
-+			bpp = depth = 16;
-+			break;
-+		default:
-+			return NULL;
-+	}
-+
- 	memset(&create_arg, 0, sizeof create_arg);
--	create_arg.bpp = 32;
-+	create_arg.bpp = bpp;
- 	create_arg.width = width;
- 	create_arg.height = height;
- 
-@@ -289,8 +303,29 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
- 	fb->size = create_arg.size;
- 	fb->fd = b->drm.fd;
- 
--	ret = drmModeAddFB(b->drm.fd, width, height, 24, 32,
--			   fb->stride, fb->handle, &fb->fb_id);
-+	ret = -1;
-+
-+	if (!b->no_addfb2) {
-+		uint32_t handles[4], pitches[4], offsets[4];
-+
-+		handles[0] = fb->handle;
-+		pitches[0] = fb->stride;
-+		offsets[0] = 0;
-+
-+		ret = drmModeAddFB2(b->drm.fd, width, height,
-+				    format, handles, pitches, offsets,
-+				    &fb->fb_id, 0);
-+		if (ret) {
-+			weston_log("addfb2 failed: %m\n");
-+			b->no_addfb2 = 1;
-+		}
-+	}
-+
-+	if (ret) {
-+		ret = drmModeAddFB(b->drm.fd, width, height, depth, bpp,
-+				   fb->stride, fb->handle, &fb->fb_id);
-+	}
-+
- 	if (ret)
- 		goto err_bo;
- 
-@@ -1879,17 +1914,30 @@ drm_output_init_pixman(struct drm_output *output, struct drm_backend *b)
- {
- 	int w = output->base.current_mode->width;
- 	int h = output->base.current_mode->height;
-+	uint32_t format = output->gbm_format;
-+	uint32_t pixman_format;
- 	unsigned int i;
- 
--	/* FIXME error checking */
-+	switch (format) {
-+		case GBM_FORMAT_XRGB8888:
-+			pixman_format = PIXMAN_x8r8g8b8;
-+			break;
-+		case GBM_FORMAT_RGB565:
-+			pixman_format = PIXMAN_r5g6b5;
-+			break;
-+		default:
-+			weston_log("Unsupported pixman format 0x%x\n", format);
-+			return -1;
-+	}
- 
-+	/* FIXME error checking */
- 	for (i = 0; i < ARRAY_LENGTH(output->dumb); i++) {
--		output->dumb[i] = drm_fb_create_dumb(b, w, h);
-+		output->dumb[i] = drm_fb_create_dumb(b, w, h, format);
- 		if (!output->dumb[i])
- 			goto err;
- 
- 		output->image[i] =
--			pixman_image_create_bits(PIXMAN_x8r8g8b8, w, h,
-+			pixman_image_create_bits(pixman_format, w, h,
- 						 output->dumb[i]->map,
- 						 output->dumb[i]->stride);
- 		if (!output->image[i])
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
index 515f06c..5ec9cd7 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
@@ -1,7 +1,7 @@
-From e8e7a9f7dfa164a75fdbdca87622a2e13334478a Mon Sep 17 00:00:00 2001
-From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sat, 23 Jan 2016 22:48:07 +0530
-Subject: [PATCH 1/1] udev-seat: restrict udev enumeration to card0
+From e57e9245dcb5d1349467c7fc36d153f3336f6a1a Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 12 Mar 2018 10:46:29 +0530
+Subject: [PATCH 1/4] udev-seat: restrict udev enumeration to card0
 
 In case of separate GPU and Display devices as found in embedded systems, we
 could have modeset node and render node controlled by different drivers.
@@ -16,22 +16,24 @@ to display is returned as the primary DRM device.
 Upstream-Status: Pending
 
 Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
 ---
- src/compositor-drm.c |    2 +-
+ libweston/compositor-drm.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index 6777bf8..59c2cc5 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -2827,7 +2827,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
-
-	e = udev_enumerate_new(b->udev);
-	udev_enumerate_add_match_subsystem(e, "drm");
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index 1d38f05..649b4f5 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -2957,7 +2957,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
+ 
+ 	e = udev_enumerate_new(b->udev);
+ 	udev_enumerate_add_match_subsystem(e, "drm");
 -	udev_enumerate_add_match_sysname(e, "card[0-9]*");
 +	udev_enumerate_add_match_sysname(e, "card0");
+ 
+ 	udev_enumerate_scan_devices(e);
+ 	drm_device = NULL;
+-- 
+1.9.1
 
-	udev_enumerate_scan_devices(e);
-	drm_device = NULL;
---
-1.7.9.5
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
deleted file mode 100644
index 2f215c9..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b1829ce962aa4e13d737edb54130bdce05f068f0 Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Wed, 17 Dec 2014 09:21:49 +0530
-Subject: [PATCH] weston: Enabling DRM backend with multiple displays
-
-There are three main issues that this patch tries to address
-
- 1. Black screen when running weston
- 2. Support for multiple displays
- 3. Handling missing VBlanks
-
-There is an issue with missing VBlanks for LCD and
-HDMI connectors which leads to display not getting refreshed.
-This patch can be considered as a workaround.
-
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- src/compositor-drm.c |   10 ++++++++--
- 1 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index e4496e7..3b22aa3 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -646,7 +646,7 @@ drm_output_repaint(struct weston_output *output_base,
- 			.request.sequence = 1,
- 		};
- 
--		if ((!s->current && !s->next) ||
-+		if ((!s->current && !s->next) &&
- 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
- 			continue;
- 
-@@ -757,6 +757,7 @@ page_flip_handler(int fd, unsigned int frame,
- {
- 	struct drm_output *output = (struct drm_output *) data;
- 	uint32_t msecs;
-+	uint32_t bail;
- 
- 	/* We don't set page_flip_pending on start_repaint_loop, in that case
- 	 * we just want to page flip to the current buffer to get an accurate
-@@ -769,9 +770,14 @@ page_flip_handler(int fd, unsigned int frame,
- 
- 	output->page_flip_pending = 0;
- 
-+	if(output->vblank_pending) {
-+		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
-+		bail = 1;
-+	}
-+
- 	if (output->destroy_pending)
- 		drm_output_destroy(&output->base);
--	else if (!output->vblank_pending) {
-+	else if (!output->vblank_pending || bail ) {
- 		msecs = sec * 1000 + usec / 1000;
- 		weston_output_finish_frame(&output->base, msecs);
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
deleted file mode 100644
index 3efceb5..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 15d9f155fdb3abffc348e81b1560702801994715 Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Mon, 11 Jan 2016 11:51:30 -0500
-Subject: [PATCH 1/2] weston1.9.0: Enabling DRM backend with multiple displays
-
-There are three main issues that this patch tries to address
-
- 1. Black screen when running weston
- 2. Support for multiple displays
- 3. Handling missing VBlanks
-
-There is an issue with missing VBlanks for LCD and
-HDMI connectors which leads to display not getting refreshed.
-This patch can be considered as a workaround.
-
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- src/compositor-drm.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index 6777bf8..15ddba8 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -686,7 +686,7 @@ drm_output_repaint(struct weston_output *output_base,
- 			.request.sequence = 1,
- 		};
- 
--		if ((!s->current && !s->next) ||
-+		if ((!s->current && !s->next) &&
- 		    !drm_sprite_crtc_supported(output, s->possible_crtcs))
- 			continue;
- 
-@@ -847,6 +847,7 @@ page_flip_handler(int fd, unsigned int frame,
- {
- 	struct drm_output *output = (struct drm_output *) data;
- 	struct timespec ts;
-+	uint32_t bail;
- 	uint32_t flags = PRESENTATION_FEEDBACK_KIND_VSYNC |
- 			 PRESENTATION_FEEDBACK_KIND_HW_COMPLETION |
- 			 PRESENTATION_FEEDBACK_KIND_HW_CLOCK;
-@@ -864,9 +865,14 @@ page_flip_handler(int fd, unsigned int frame,
- 
- 	output->page_flip_pending = 0;
- 
-+	if(output->vblank_pending) {
-+		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
-+		bail = 1;
-+	}
-+
- 	if (output->destroy_pending)
- 		drm_output_destroy(&output->base);
--	else if (!output->vblank_pending) {
-+	else if (!output->vblank_pending || bail ) {
- 		ts.tv_sec = sec;
- 		ts.tv_nsec = usec * 1000;
- 		weston_output_finish_frame(&output->base, &ts, flags);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
deleted file mode 100644
index 39c8401..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston-Allow-visual_id-to-be-0.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5b5de6a814b43ca023a92b85b407b3d061dbc64f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 9 Mar 2017 14:32:24 -0500
-Subject: [PATCH 2/4] Weston: Allow visual_id to be 0
-
-The inquiry of visual id from egl API eglGetConfigAttrib(EGL_NATIVE_VISUAL_ID)
-is an optional feature. The visual id will be set to 0 if this feature is
-not supported. Therefore, the return condition @function match_config_to_visual()
-should be (id == visual_id || id == 0) instead of (id == visual_id)
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/gl-renderer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gl-renderer.c b/src/gl-renderer.c
-index 23c0cd7..4c1f170 100644
---- a/src/gl-renderer.c
-+++ b/src/gl-renderer.c
-@@ -2462,7 +2462,7 @@ match_config_to_visual(EGLDisplay egl_display,
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
new file mode 100644
index 0000000..a354d94
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0002-weston-Allow-visual_id-to-be-0.patch
@@ -0,0 +1,34 @@
+From 5695eab02bb88318bf99d568b6d0e4592d5f9981 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 12 Mar 2018 10:47:02 +0530
+Subject: [PATCH 2/4] weston: Allow visual_id to be 0
+
+The inquiry of visual id from egl API eglGetConfigAttrib(EGL_NATIVE_VISUAL_ID)
+is an optional feature. The visual id will be set to 0 if this feature is
+not supported. Therefore, the return condition @function match_config_to_visual()
+should be (id == visual_id || id == 0) instead of (id == visual_id)
+
+Upstream status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ libweston/gl-renderer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/gl-renderer.c b/libweston/gl-renderer.c
+index c6091af..9299dc6 100644
+--- a/libweston/gl-renderer.c
++++ b/libweston/gl-renderer.c
+@@ -2575,7 +2575,7 @@ match_config_to_visual(EGLDisplay egl_display,
+ 				&id))
+ 			continue;
+ 
+-		if (id == visual_id)
++		if (id == visual_id || id == 0)
+ 			return i;
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
deleted file mode 100644
index bdf5626..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0d15218ced5bf2e6f3d05758f0f5f21c2a0303f2 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 9 Mar 2017 14:33:08 -0500
-Subject: [PATCH 3/4] Weston: Fix virtual keyboard display issue for QT5
- application
-
-The virtual keyboard does pop up as expected, however, it will never hide
-even when the application is terminated. This problem is due to the order
-of the text APIs( text_input_activate and test_input_show_input_panel) are
-invoked in QT5 and a potential bug of the API implementation. The virtual
-keyboard works as expected if the test_input_show_input_panel() is invoked
-prior to the test_input_activate() as most of the weston sample applications
-do. However, the problem will show up if that order is reversed and the reason
-why is that the current_panel is not set in this case and hence this panel
-cannot be hidden.
-
-It is required to set the current_panel to the text_input when the input_panel
-becomes visible at the first time.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/text-backend.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/text-backend.c b/src/text-backend.c
-index ab4667f..36c70a5 100644
---- a/src/text-backend.c
-+++ b/src/text-backend.c
-@@ -337,6 +337,7 @@ text_input_show_input_panel(struct wl_client *client,
- 			       text_input->surface);
- 		wl_signal_emit(&ec->update_input_panel_signal,
- 			       &text_input->cursor_rectangle);
-+		text_input->manager->current_panel = text_input;
- 	}
- }
- 
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
new file mode 100644
index 0000000..8d285fa
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
@@ -0,0 +1,42 @@
+From 9c3cf93336b77a1eecc1d72ffec3b113161a822b Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 12 Mar 2018 10:54:45 +0530
+Subject: [PATCH 3/4] weston: Fix virtual keyboard display issue for QT5
+ application
+
+The virtual keyboard does pop up as expected, however, it will never hide
+even when the application is terminated. This problem is due to the order
+of the text APIs( text_input_activate and test_input_show_input_panel) are
+invoked in QT5 and a potential bug of the API implementation. The virtual
+keyboard works as expected if the test_input_show_input_panel() is invoked
+prior to the test_input_activate() as most of the weston sample applications
+do. However, the problem will show up if that order is reversed and the reason
+why is that the current_panel is not set in this case and hence this panel
+cannot be hidden.
+
+It is required to set the current_panel to the text_input when the input_panel
+becomes visible at the first time.
+
+Upstream status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ compositor/text-backend.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compositor/text-backend.c b/compositor/text-backend.c
+index bf5c45c..d8b0bb1 100644
+--- a/compositor/text-backend.c
++++ b/compositor/text-backend.c
+@@ -340,6 +340,7 @@ text_input_show_input_panel(struct wl_client *client,
+ 			       text_input->surface);
+ 		wl_signal_emit(&ec->update_input_panel_signal,
+ 			       &text_input->cursor_rectangle);
++		text_input->manager->current_panel = text_input;
+ 	}
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
deleted file mode 100644
index 673ca3d..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0004-Weston-Fix-touch-screen-crash-issue.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8958bf21960a475d2933e688d0da9a0d2186d509 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 9 Mar 2017 14:34:18 -0500
-Subject: [PATCH 4/4] Weston: Fix touch screen crash issue
-
-Touch screen operation causes the weston to crash with segment fault sometimes.
-The crash occurs when the coordinate (x,y) passed to the weston input module
-is outside the view window, hence the weston compositor is not able to pick
-up a display view and there is no code to detect this condition at function
-notify_touch().
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/input.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/input.c b/src/input.c
-index 8fe898c..0f72d23 100644
---- a/src/input.c
-+++ b/src/input.c
-@@ -1848,6 +1848,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch
new file mode 100644
index 0000000..4849d5b
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0004-weston-Fix-touch-screen-crash-issue.patch
@@ -0,0 +1,39 @@
+From 60250e9dc57fe56148c8a24bba107bce8a873fb4 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 12 Mar 2018 10:56:28 +0530
+Subject: [PATCH 4/4] weston: Fix touch screen crash issue
+
+Touch screen operation causes the weston to crash with segment fault sometimes.
+The crash occurs when the coordinate (x,y) passed to the weston input module
+is outside the view window, hence the weston compositor is not able to pick
+up a display view and there is no code to detect this condition at function
+notify_touch().
+
+Upstream status: pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ libweston/input.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libweston/input.c b/libweston/input.c
+index 4fedc55..bcb2f28 100644
+--- a/libweston/input.c
++++ b/libweston/input.c
+@@ -2185,6 +2185,12 @@ notify_touch(struct weston_seat *seat, uint32_t time, int touch_id,
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
index 4a6c580..ce6f56d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago22"
+PR_append = ".arago28"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -10,11 +10,10 @@ RDEPENDS_${PN} += "weston-conf"
 
 
 SRC_URI += " \
+	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+        file://0002-weston-Allow-visual_id-to-be-0.patch \
+        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
+        file://0004-weston-Fix-touch-screen-crash-issue.patch \
 "
 
-#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch
-#	file://0002-Weston-Allow-visual_id-to-be-0.patch
-#	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
-#	file://0004-Weston-Fix-touch-screen-crash-issue.patch
-#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
-#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
+INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


