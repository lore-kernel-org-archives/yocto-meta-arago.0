Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4C5EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 16:47:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29710.1688662038232400004
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 09:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8D3F840C16;
	Thu,  6 Jul 2023 16:47:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxpMLjjLFJhr; Thu,  6 Jul 2023 16:47:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6DDFE40C13;
	Thu,  6 Jul 2023 16:47:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 25942163BC2;
	Thu,  6 Jul 2023 12:47:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] weston: update bbappend for version 12
Date: Thu,  6 Jul 2023 16:47:14 +0000
Message-Id: <20230706164715.1889150-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 16:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14774

From: Denys Dmytriyenko <denys@konsulko.com>

Remove upstreamed 0001-backend-drm-Select-plane-based-on-current-attached=
-C.patch
Modify 0001-Revert-require-GL_EXT_unpack_subimage-commit.patch to apply t=
o new version

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 84 ++++++++++---------
 ...ct-plane-based-on-current-attached-C.patch | 63 --------------
 ...11.0.1.bbappend =3D> weston_12.0.1.bbappend} |  5 --
 3 files changed, 44 insertions(+), 108 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/000=
1-backend-drm-Select-plane-based-on-current-attached-C.patch
 rename meta-arago-distro/recipes-graphics/wayland/{weston_11.0.1.bbappen=
d =3D> weston_12.0.1.bbappend} (55%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Rever=
t-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes=
-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commi=
t.patch
index 0c0d9089..a1ef4cae 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requi=
re-GL_EXT_unpack_subimage-commit.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requi=
re-GL_EXT_unpack_subimage-commit.patch
@@ -1,6 +1,6 @@
-From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 6 Oct 2022 15:49:31 -0500
+From 14513f40b8776b2c75d28368cbeb6393fe89fef1 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Thu, 6 Jul 2023 01:48:41 +0000
 Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
=20
 This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
@@ -9,43 +9,44 @@ That commit removed support for GPU drivers without GL_=
EXT_unpack_subimage
 which SGX does not support. Add back support for GPUs without this
 extension.
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [specific to TI SGX]
=20
 Signed-off-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
 ---
  libweston/renderer-gl/gl-renderer-internal.h |  2 ++
  libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
  2 files changed, 26 insertions(+), 5 deletions(-)
=20
 diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/re=
nderer-gl/gl-renderer-internal.h
-index 72101b47..7a6e2f48 100644
+index 888df84..cabf1ed 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -148,6 +148,8 @@ struct gl_renderer {
-	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
-	bool has_platform_base;
-
+@@ -153,6 +153,8 @@ struct gl_renderer {
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
-index a5f5eae4..410ba85c 100644
+index 4a6da14..3cddf6e 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -1793,6 +1793,7 @@ 			 struct weston_buffer *buffer)
+@@ -1970,6 +1970,7 @@ gl_renderer_flush_damage(struct weston_surface *su=
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
-@@ -1835,6 +1836,24 @@ 			 struct weston_buffer *buffer)
-
-	glActiveTexture(GL_TEXTURE0);
-
+ 	struct gl_surface_state *gs =3D get_surface_state(surface);
+ 	struct gl_buffer_state *gb =3D gs->buffer;
+ 	struct weston_view *view;
+@@ -2012,6 +2013,24 @@ gl_renderer_flush_damage(struct weston_surface *s=
urface,
+=20
+ 	glActiveTexture(GL_TEXTURE0);
+=20
 +	if (!gr->has_unpack_subimage) {
 +		wl_shm_buffer_begin_access(buffer->shm_buffer);
 +		for (j =3D 0; j < gs->buffer->num_textures; j++) {
@@ -64,13 +65,13 @@ index a5f5eae4..410ba85c 100644
 +		goto done;
 +	}
 +
-	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
-		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
-		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
-@@ -3896,11 +3915,9 @@ gl_renderer_setup(struct weston_compositor *ec, E=
GLSurface egl_surface)
-	else
-		ec->read_format =3D pixel_format_get_info_by_pixman(PIXMAN_a8b8g8r8);
-
+ 	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
+ 		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
+ 		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
+@@ -4103,11 +4122,9 @@ gl_renderer_setup(struct weston_compositor *ec, E=
GLSurface egl_surface)
+ 	else
+ 		ec->read_format =3D pixel_format_get_info_by_pixman(PIXMAN_a8b8g8r8);
+=20
 -	if (gr->gl_version < gr_gl_version(3, 0) &&
 -	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))=
 {
 -		weston_log("GL_EXT_unpack_subimage not available.\n");
@@ -79,15 +80,18 @@ index a5f5eae4..410ba85c 100644
 +	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
 +	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
 +		gr->has_unpack_subimage =3D true;
-
-	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
-	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10=
_10_REV"))
-@@ -3945,6 +3962,8 @@ gl_renderer_setup(struct weston_compositor *ec, EG=
LSurface egl_surface)
-		   gr_gl_version_minor(gr->gl_version));
-	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-			    ec->read_format->drm_format_name);
+=20
+ 	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
+ 	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_1=
0_10_REV"))
+@@ -4194,6 +4211,8 @@ gl_renderer_setup(struct weston_compositor *ec, EG=
LSurface egl_surface)
+ 		   gr_gl_version_minor(gr->gl_version));
+ 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
+ 			    ec->read_format->drm_format_name);
 +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
 +			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
-			    yesno(gr->has_texture_type_2_10_10_10_rev));
-	weston_log_continue(STAMP_SPACE "wl_shm 16 bpc formats: %s\n",
+ 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
+ 			    yesno(gr->has_pack_reverse));
+ 	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
+--=20
+2.25.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backe=
nd-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-distro=
/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-c=
urrent-attached-C.patch
deleted file mode 100644
index f4dce134..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-=
Select-plane-based-on-current-attached-C.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 8c4445d4dbd4c2d5de5a19370fcc5d8777a7e6d4 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Fri, 6 Mar 2020 13:06:55 -0500
-Subject: [PATCH] backend-drm: Select plane based on current attached CRT=
C
-
-When doing plane selection for an output CRTC check if the plane
-already has a CRTC attached and if so prefer that plane only for
-the corresponding CRTC.
-
-This prevents changing a CRTC's primary plane when it is active
-which is not allowed by the DRM framework.
-
-Upstream-Status: Pending
-
-Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- libweston/backend-drm/drm-internal.h | 1 +
- libweston/backend-drm/drm.c          | 9 +++++++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/libweston/backend-drm/drm-internal.h b/libweston/backend-dr=
m/drm-internal.h
-index 48600880..b381ca31 100644
---- a/libweston/backend-drm/drm-internal.h
-+++ b/libweston/backend-drm/drm-internal.h
-@@ -468,6 +468,7 @@ struct drm_plane {
- 	uint32_t possible_crtcs;
- 	uint32_t plane_id;
-	uint32_t plane_idx;
-+	uint32_t crtc_id;
-=20
- 	struct drm_property_info props[WDRM_PLANE__COUNT];
-
-diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
-index 42787702..b5b7c4ba 100644
---- a/libweston/backend-drm/drm.c
-+++ b/libweston/backend-drm/drm.c
-@@ -776,6 +776,7 @@ drm_plane_create(struct drm_backend *b, const drmMod=
ePlane *kplane)
-	plane->state_cur->complete =3D true;
-	plane->possible_crtcs =3D kplane->possible_crtcs;
-	plane->plane_id =3D kplane->plane_id;
-+	plane->crtc_id =3D kplane->crtc_id;
-
-	weston_drm_format_array_init(&plane->formats);
-=20
-@@ -866,6 +867,14 @@ drm_output_find_special_plane(struct drm_backend *b=
, struct drm_output *output,
- 		if (found_elsewhere)
- 			continue;
-=20
-+		/* If a plane already has a CRTC selected and it is not our
-+		 * output's CRTC, then do not select this plane. We cannot
-+		 * switch away a plane from a CTRC when active. */
-+		if ((type =3D=3D WDRM_PLANE_TYPE_PRIMARY) &&
-+		    (plane->crtc_id !=3D 0) &&
-+		    (plane->crtc_id !=3D output->crtc->crtc_id))
-+			continue;
-+
-		plane->possible_crtcs =3D (1 << output->crtc->pipe);
- 		return plane;
- 	}
---=20
-2.38.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_11.0.1.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbappend
similarity index 55%
rename from meta-arago-distro/recipes-graphics/wayland/weston_11.0.1.bbap=
pend
rename to meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbappe=
nd
index eea28ba5..80a768f2 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_11.0.1.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_12.0.1.bbappend
@@ -2,12 +2,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 PR:append =3D ".arago1"
=20
-# Drop 0001-backend-drm-Select-plane-based-on-current-attached-C.patch o=
nce we
-# get past version 11.0.1 or commit 94afcbcdc3f1b1cfc050da242c9c70009b00=
7fc6
-# upstream
-
 SRC_URI +=3D " \
-        file://0001-backend-drm-Select-plane-based-on-current-attached-C=
.patch \
         file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
=20
--=20
2.25.1


