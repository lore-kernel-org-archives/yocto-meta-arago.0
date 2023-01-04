Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41562C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:07:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.22118.1672859262511559102
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 11:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AdW5+VEO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304J7dwZ021336;
	Wed, 4 Jan 2023 13:07:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672859259;
	bh=QcHJe32Dd4i9D5+qHoj1j0UzQd3yEDW+THD5ztd3KKM=;
	h=From:To:CC:Subject:Date;
	b=AdW5+VEOjUHqsuZc3anxOWYl6/0joWtN2B2IONKZN3cKRTSx7Rzyweb0pBGkqSazM
	 ec3fbbuk0BR4eJsBaTXyYfV67RlVleH2XGvM/OazjBqcVYgw8hvaqGj6YRKikJ2y+x
	 9FUuDOCdzjFP8oZs+kdIVgjaPrIiKReZ4oBcgEo0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304J7dhQ117468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 13:07:39 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 13:07:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 13:07:39 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304J7dKk059070;
	Wed, 4 Jan 2023 13:07:39 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] weston: update bbappend 9.0.0 -> 10.0.2
Date: Wed, 4 Jan 2023 13:07:39 -0600
Message-ID: <20230104190739.27676-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 19:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14151

To match upstream oe-core/master.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 91 +++++++++++++++++++
 ...ct-plane-based-on-current-attached-C.patch | 52 +++++------
 ..._9.0.0.bbappend => weston_10.0.2.bbappend} |  3 +-
 3 files changed, 115 insertions(+), 31 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
 rename meta-arago-distro/recipes-graphics/wayland/{weston_9.0.0.bbappend => weston_10.0.2.bbappend} (78%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
new file mode 100644
index 00000000..8bc882fb
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
@@ -0,0 +1,91 @@
+From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 6 Oct 2022 15:49:31 -0500
+Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
+
+This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
+
+That commit removed support for GPU drivers without GL_EXT_unpack_subimage
+which SGX does not support. Add back support for GPUs without this
+extension.
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ libweston/renderer-gl/gl-renderer-internal.h |  2 ++
+ libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
+ 2 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
+index 72101b47..7a6e2f48 100644
+--- a/libweston/renderer-gl/gl-renderer-internal.h
++++ b/libweston/renderer-gl/gl-renderer-internal.h
+@@ -133,6 +133,8 @@ struct gl_renderer {
+ 	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
+ 	bool has_platform_base;
+ 
++	bool has_unpack_subimage;
++
+ 	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
+ 	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
+ 	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
+diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
+index a5f5eae4..410ba85c 100644
+--- a/libweston/renderer-gl/gl-renderer.c
++++ b/libweston/renderer-gl/gl-renderer.c
+@@ -1835,6 +1835,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+ {
+ 	const struct weston_testsuite_quirks *quirks =
+ 		&surface->compositor->test_data.test_quirks;
++	struct gl_renderer *gr = get_renderer(surface->compositor);
+ 	struct gl_surface_state *gs = get_surface_state(surface);
+ 	struct weston_buffer *buffer = gs->buffer_ref.buffer;
+ 	struct weston_view *view;
+@@ -1872,6 +1873,24 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+ 
+ 	glActiveTexture(GL_TEXTURE0);
+ 
++	if (!gr->has_unpack_subimage) {
++		wl_shm_buffer_begin_access(buffer->shm_buffer);
++		for (j = 0; j < gs->num_textures; j++) {
++			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
++			glTexImage2D(GL_TEXTURE_2D, 0,
++				     gs->gl_format[j],
++				     gs->pitch / gs->hsub[j],
++				     buffer->height / gs->vsub[j],
++				     0,
++				     gl_format_from_internal(gs->gl_format[j]),
++				     gs->gl_pixel_type,
++				     data + gs->offset[j]);
++		}
++		wl_shm_buffer_end_access(buffer->shm_buffer);
++
++		goto done;
++	}
++
+ 	if (gs->needs_full_upload || quirks->gl_force_full_upload) {
+ 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
+ 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
+@@ -3932,11 +3951,9 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
+ 	else
+ 		ec->read_format = PIXMAN_a8b8g8r8;
+ 
+-	if (gr->gl_version < gr_gl_version(3, 0) &&
+-	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
+-		weston_log("GL_EXT_unpack_subimage not available.\n");
+-		return -1;
+-	}
++	if (gr->gl_version >= gr_gl_version(3, 0) ||
++	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
++		gr->has_unpack_subimage = true;
+ 
+ 	if (gr->gl_version >= gr_gl_version(3, 0) ||
+ 	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
+@@ -3977,6 +3994,8 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
+ 		   gr_gl_version_minor(gr->gl_version));
+ 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
+ 		ec->read_format == PIXMAN_a8r8g8b8 ? "BGRA" : "RGBA");
++	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
++			    gr->has_unpack_subimage ? "yes" : "no");
+ 	weston_log_continue(STAMP_SPACE "EGL Wayland extension: %s\n",
+ 			    gr->has_bind_display ? "yes" : "no");
+ 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
index ef445797..76569645 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
@@ -1,5 +1,5 @@
-From 943323d177ef33494d9d063aeb7f0e9785d9b3c1 Mon Sep 17 00:00:00 2001
-From: "Andrew F. Davis" <afd@ti.com>
+From 8c4445d4dbd4c2d5de5a19370fcc5d8777a7e6d4 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
 Date: Fri, 6 Mar 2020 13:06:55 -0500
 Subject: [PATCH] backend-drm: Select plane based on current attached CRTC
 
@@ -11,45 +11,37 @@ This prevents changing a CRTC's primary plane when it is active
 which is not allowed by the DRM framework.
 
 Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Andrew F. Davis <afd@ti.com>
+Signed-off-by: Andrew Davis <afd@ti.com>
 ---
- libweston/backend-drm/drm-internal.h |  1 +
- libweston/backend-drm/drm.c          | 10 ++++++++++
- 2 files changed, 11 insertions(+)
+ libweston/backend-drm/drm-internal.h | 1 +
+ libweston/backend-drm/drm.c          | 9 +++++++++
+ 2 files changed, 10 insertions(+)
 
 diff --git a/libweston/backend-drm/drm-internal.h b/libweston/backend-drm/drm-internal.h
-index 6f5a9880..65b7486d 100644
+index 48600880..b381ca31 100644
 --- a/libweston/backend-drm/drm-internal.h
 +++ b/libweston/backend-drm/drm-internal.h
-@@ -398,6 +398,7 @@ struct drm_plane {
- 
+@@ -468,6 +468,7 @@ struct drm_plane {
  	uint32_t possible_crtcs;
  	uint32_t plane_id;
+ 	uint32_t plane_idx;
 +	uint32_t crtc_id;
- 	uint32_t count_formats;
  
  	struct drm_property_info props[WDRM_PLANE__COUNT];
+ 
 diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
-index 041a15a5..544b1aff 100644
+index 42787702..b5b7c4ba 100644
 --- a/libweston/backend-drm/drm.c
 +++ b/libweston/backend-drm/drm.c
-@@ -819,6 +819,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
- 	if (kplane) {
- 		plane->possible_crtcs = kplane->possible_crtcs;
- 		plane->plane_id = kplane->plane_id;
-+		plane->crtc_id = kplane->crtc_id;
+@@ -776,6 +776,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane)
+ 	plane->state_cur->complete = true;
+ 	plane->possible_crtcs = kplane->possible_crtcs;
+ 	plane->plane_id = kplane->plane_id;
++	plane->crtc_id = kplane->crtc_id;
+ 
+ 	weston_drm_format_array_init(&plane->formats);
  
- 		props = drmModeObjectGetProperties(b->drm.fd, kplane->plane_id,
- 						   DRM_MODE_OBJECT_PLANE);
-@@ -843,6 +844,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
- 	else {
- 		plane->possible_crtcs = (1 << output->pipe);
- 		plane->plane_id = 0;
-+		plane->crtc_id = 0;
- 		plane->count_formats = 1;
- 		plane->formats[0].format = format;
- 		plane->type = type;
-@@ -950,6 +952,14 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
+@@ -866,6 +867,14 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
  		if (found_elsewhere)
  			continue;
  
@@ -58,12 +50,12 @@ index 041a15a5..544b1aff 100644
 +		 * switch away a plane from a CTRC when active. */
 +		if ((type == WDRM_PLANE_TYPE_PRIMARY) &&
 +		    (plane->crtc_id != 0) &&
-+		    (plane->crtc_id != output->crtc_id))
++		    (plane->crtc_id != output->crtc->crtc_id))
 +			continue;
 +
- 		plane->possible_crtcs = (1 << output->pipe);
+ 		plane->possible_crtcs = (1 << output->crtc->pipe);
  		return plane;
  	}
 -- 
-2.17.1
+2.38.1
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
similarity index 78%
rename from meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index 804507e3..b1b7d26a 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -1,10 +1,11 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-PR:append = ".arago3"
+PR:append = ".arago1"
 
 #        file://0002-weston-Allow-visual_id-to-be-0.patch
 SRC_URI += " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
+        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
-- 
2.38.1


