Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2316CC678D4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 21:32:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.784.1677706317599037297
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 13:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ns9Y/FQY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321LVuwi081272;
	Wed, 1 Mar 2023 15:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677706316;
	bh=pndYZmOpF9CnYV/r0bZBKEcVye8HIG2Mpbc9Q8KfzqM=;
	h=From:To:Subject:Date;
	b=ns9Y/FQY/g/RNNuyFAps9sqRNC3aMzlttTrz5QcnWpPOt+QelA3vBdxCLHf3lXjFC
	 vUsxeMnuyRIL5SMUMiouai2dmz+kHJQ2+agvLHkQUKC6OBOSFb+iGWc64XpQEGUFte
	 ZEo3NEXKnhnV9J4XwLiv2vd6TK++10fyZkWa4zFc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321LVuOv103416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Mar 2023 15:31:56 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 15:31:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 15:31:56 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321LVuPh073222;
	Wed, 1 Mar 2023 15:31:56 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pXU3I-0000Os-8p; Wed, 01 Mar 2023 15:31:56 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] graphics/weston: Update patch for weston 11
Date: Wed, 1 Mar 2023 15:31:56 -0600
Message-ID: <20230301213156.1497-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Mar 2023 21:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14243

The patch needed to be updated due changes in the files being patched so
that it would build with weston 11.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 39 ++++++++++---------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
index 8b03ddd6..13ab5e98 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
@@ -19,7 +19,7 @@ diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-g
 index 72101b47..7a6e2f48 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -133,6 +133,8 @@ struct gl_renderer {
+@@ -148,6 +148,8 @@ struct gl_renderer {
 	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
 	bool has_platform_base;
 
@@ -32,42 +32,42 @@ diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-rend
 index a5f5eae4..410ba85c 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -1835,6 +1835,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+@@ -1793,6 +1793,7 @@ 			 struct weston_buffer *buffer)
  {
 	const struct weston_testsuite_quirks *quirks =
 		&surface->compositor->test_data.test_quirks;
 +	struct gl_renderer *gr = get_renderer(surface->compositor);
 	struct gl_surface_state *gs = get_surface_state(surface);
-	struct weston_buffer *buffer = gs->buffer_ref.buffer;
+	struct gl_buffer_state *gb = gs->buffer;
 	struct weston_view *view;
-@@ -1872,6 +1873,24 @@ gl_renderer_flush_damage(struct weston_surface *surface)
+@@ -1835,6 +1836,24 @@ 			 struct weston_buffer *buffer)
 
 	glActiveTexture(GL_TEXTURE0);
 
 +	if (!gr->has_unpack_subimage) {
 +		wl_shm_buffer_begin_access(buffer->shm_buffer);
-+		for (j = 0; j < gs->num_textures; j++) {
-+			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
++		for (j = 0; j < gs->buffer->num_textures; j++) {
++			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
 +			glTexImage2D(GL_TEXTURE_2D, 0,
-+				     gs->gl_format[j],
-+				     gs->pitch / gs->hsub[j],
-+				     buffer->height / gs->vsub[j],
++				     gs->buffer->gl_format[j],
++				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
++				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
 +				     0,
-+				     gl_format_from_internal(gs->gl_format[j]),
-+				     gs->gl_pixel_type,
-+				     data + gs->offset[j]);
++				     gl_format_from_internal(gs->buffer->gl_format[j]),
++				     gs->buffer->gl_pixel_type,
++				     data + gs->buffer->offset[j]);
 +		}
 +		wl_shm_buffer_end_access(buffer->shm_buffer);
 +
 +		goto done;
 +	}
 +
-	if (gs->needs_full_upload || quirks->gl_force_full_upload) {
+	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
-@@ -3932,11 +3951,9 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
+@@ -3896,11 +3915,9 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
 	else
-		ec->read_format = PIXMAN_a8b8g8r8;
+		ec->read_format = pixel_format_get_info_by_pixman(PIXMAN_a8b8g8r8);
 
 -	if (gr->gl_version < gr_gl_version(3, 0) &&
 -	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
@@ -80,11 +80,12 @@ index a5f5eae4..410ba85c 100644
 
 	if (gr->gl_version >= gr_gl_version(3, 0) ||
 	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
-@@ -3977,6 +3994,8 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
+@@ -3945,6 +3962,8 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
 		   gr_gl_version_minor(gr->gl_version));
 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-		ec->read_format == PIXMAN_a8r8g8b8 ? "BGRA" : "RGBA");
+			    ec->read_format->drm_format_name);
 +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
 +			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "EGL Wayland extension: %s\n",
-			    gr->has_bind_display ? "yes" : "no");
+	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
+			    yesno(gr->has_texture_type_2_10_10_10_rev));
+	weston_log_continue(STAMP_SPACE "wl_shm 16 bpc formats: %s\n",
-- 
2.17.1


