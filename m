Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4168C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 17:40:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1549.1706809233805062494
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 09:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A25B40C50;
	Thu,  1 Feb 2024 17:40:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9EwwwBFPykF; Thu,  1 Feb 2024 17:40:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 06FDD40AB7;
	Thu,  1 Feb 2024 17:40:31 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 85383163DEB;
	Thu,  1 Feb 2024 12:40:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] weston: update to version 13
Date: Thu,  1 Feb 2024 12:40:28 -0500
Message-Id: <20240201174029.2592430-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Feb 2024 17:40:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15101

From: Denys Dmytriyenko <denys@konsulko.com>

Update bbappend from 12.0.2 to 13.0.0 and rework the local patch to apply=
 cleanly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 77 +++++++++----------
 ...12.0.2.bbappend =3D> weston_13.0.0.bbappend} |  0
 2 files changed, 38 insertions(+), 39 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_12.0.2.bbappen=
d =3D> weston_13.0.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Rever=
t-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes=
-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commi=
t.patch
index 8b77e4c8..1a466e7b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requi=
re-GL_EXT_unpack_subimage-commit.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requi=
re-GL_EXT_unpack_subimage-commit.patch
@@ -1,4 +1,4 @@
-From 14513f40b8776b2c75d28368cbeb6393fe89fef1 Mon Sep 17 00:00:00 2001
+From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@konsulko.com>
 Date: Thu, 6 Jul 2023 01:48:41 +0000
 Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
@@ -13,40 +13,41 @@ Upstream-Status: Inappropriate [specific to TI SGX]
=20
 Signed-off-by: Andrew Davis <afd@ti.com>
 Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+
 ---
  libweston/renderer-gl/gl-renderer-internal.h |  2 ++
  libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
  2 files changed, 26 insertions(+), 5 deletions(-)
=20
 diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/re=
nderer-gl/gl-renderer-internal.h
-index 888df84..cabf1ed 100644
+index 5032035..85616c9 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -153,6 +153,8 @@ struct gl_renderer {
-	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
-	bool has_platform_base;
-
+@@ -160,6 +160,8 @@ struct gl_renderer {
+ 	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
+ 	bool has_platform_base;
+=20
 +	bool has_unpack_subimage;
 +
-	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
-	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
-	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
+ 	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
+ 	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
+ 	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
 diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl=
/gl-renderer.c
-index 4a6da14..3cddf6e 100644
+index ccb41e6..38a0e0c 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -1970,6 +1970,7 @@ gl_renderer_flush_damage(struct weston_surface *su=
rface,
+@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface *su=
rface,
  {
-	const struct weston_testsuite_quirks *quirks =3D
-		&surface->compositor->test_data.test_quirks;
+ 	const struct weston_testsuite_quirks *quirks =3D
+ 		&surface->compositor->test_data.test_quirks;
 +	struct gl_renderer *gr =3D get_renderer(surface->compositor);
-	struct gl_surface_state *gs =3D get_surface_state(surface);
-	struct gl_buffer_state *gb =3D gs->buffer;
-	struct weston_view *view;
-@@ -2012,6 +2013,24 @@ gl_renderer_flush_damage(struct weston_surface *s=
urface,
-
-	glActiveTexture(GL_TEXTURE0);
-
+ 	struct gl_surface_state *gs =3D get_surface_state(surface);
+ 	struct gl_buffer_state *gb =3D gs->buffer;
+ 	struct weston_paint_node *pnode;
+@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface *s=
urface,
+=20
+ 	glActiveTexture(GL_TEXTURE0);
+=20
 +	if (!gr->has_unpack_subimage) {
 +		wl_shm_buffer_begin_access(buffer->shm_buffer);
 +		for (j =3D 0; j < gs->buffer->num_textures; j++) {
@@ -65,13 +66,13 @@ index 4a6da14..3cddf6e 100644
 +		goto done;
 +	}
 +
-	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
-		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
-		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
-@@ -4103,11 +4122,9 @@ gl_renderer_setup(struct weston_compositor *ec, E=
GLSurface egl_surface)
-	else
-		ec->read_format =3D pixel_format_get_info_by_pixman(PIXMAN_a8b8g8r8);
-
+ 	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
+ 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
+ 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
+@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec)
+ 	else
+ 		ec->read_format =3D pixel_format_get_info(DRM_FORMAT_ABGR8888);
+=20
 -	if (gr->gl_version < gr_gl_version(3, 0) &&
 -	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))=
 {
 -		weston_log("GL_EXT_unpack_subimage not available.\n");
@@ -80,17 +81,15 @@ index 4a6da14..3cddf6e 100644
 +	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
 +	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
 +		gr->has_unpack_subimage =3D true;
-
-	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
-	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10=
_10_REV"))
-@@ -4194,6 +4211,8 @@ gl_renderer_setup(struct weston_compositor *ec, EG=
LSurface egl_surface)
-		   gr_gl_version_minor(gr->gl_version));
-	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-			    ec->read_format->drm_format_name);
+=20
+ 	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
+ 	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_1=
0_10_REV"))
+@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
+ 		   gr_gl_version_minor(gr->gl_version));
+ 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
+ 			    ec->read_format->drm_format_name);
 +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
 +			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
-			    yesno(gr->has_pack_reverse));
-	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
---
-2.25.1
+ 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
+ 			    yesno(gr->has_pack_reverse));
+ 	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_12.0.2.bbap=
pend
rename to meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappe=
nd
--=20
2.25.1


