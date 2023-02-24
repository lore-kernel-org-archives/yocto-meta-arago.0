Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0D1C678DB
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14476.1677233561232535830
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 915D940C88
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY6Tx1DVzK2Z for <meta-arago@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 840A440C46
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7AD17163763
	for <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:12:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 2/2] weston: drop patch reverting GL_EXT_unpack_subimage requirement
Date: Fri, 24 Feb 2023 10:12:40 +0000
Message-Id: <20230224101240.4132411-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224101240.4132411-1-denis@denix.org>
References: <20230224101240.4132411-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14224

From: Denys Dmytriyenko <denys@konsulko.com>

With the updated graphics recipes in meta-ti this hack is no longer neede=
d.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 90 -------------------
 .../wayland/weston_10.0.2.bbappend            |  1 -
 2 files changed, 91 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/000=
1-Revert-require-GL_EXT_unpack_subimage-commit.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Rever=
t-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes=
-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commi=
t.patch
deleted file mode 100644
index 8b03ddd6..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-requi=
re-GL_EXT_unpack_subimage-commit.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 6 Oct 2022 15:49:31 -0500
-Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
-
-This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
-
-That commit removed support for GPU drivers without GL_EXT_unpack_subima=
ge
-which SGX does not support. Add back support for GPUs without this
-extension.
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- libweston/renderer-gl/gl-renderer-internal.h |  2 ++
- libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
- 2 files changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/re=
nderer-gl/gl-renderer-internal.h
-index 72101b47..7a6e2f48 100644
---- a/libweston/renderer-gl/gl-renderer-internal.h
-+++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -133,6 +133,8 @@ struct gl_renderer {
-	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
-	bool has_platform_base;
-
-+	bool has_unpack_subimage;
-+
-	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
-	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
-	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
-diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl=
/gl-renderer.c
-index a5f5eae4..410ba85c 100644
---- a/libweston/renderer-gl/gl-renderer.c
-+++ b/libweston/renderer-gl/gl-renderer.c
-@@ -1835,6 +1835,7 @@ gl_renderer_flush_damage(struct weston_surface *su=
rface)
- {
-	const struct weston_testsuite_quirks *quirks =3D
-		&surface->compositor->test_data.test_quirks;
-+	struct gl_renderer *gr =3D get_renderer(surface->compositor);
-	struct gl_surface_state *gs =3D get_surface_state(surface);
-	struct weston_buffer *buffer =3D gs->buffer_ref.buffer;
-	struct weston_view *view;
-@@ -1872,6 +1873,24 @@ gl_renderer_flush_damage(struct weston_surface *s=
urface)
-
-	glActiveTexture(GL_TEXTURE0);
-
-+	if (!gr->has_unpack_subimage) {
-+		wl_shm_buffer_begin_access(buffer->shm_buffer);
-+		for (j =3D 0; j < gs->num_textures; j++) {
-+			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
-+			glTexImage2D(GL_TEXTURE_2D, 0,
-+				     gs->gl_format[j],
-+				     gs->pitch / gs->hsub[j],
-+				     buffer->height / gs->vsub[j],
-+				     0,
-+				     gl_format_from_internal(gs->gl_format[j]),
-+				     gs->gl_pixel_type,
-+				     data + gs->offset[j]);
-+		}
-+		wl_shm_buffer_end_access(buffer->shm_buffer);
-+
-+		goto done;
-+	}
-+
-	if (gs->needs_full_upload || quirks->gl_force_full_upload) {
-		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
-		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
-@@ -3932,11 +3951,9 @@ gl_renderer_setup(struct weston_compositor *ec, E=
GLSurface egl_surface)
-	else
-		ec->read_format =3D PIXMAN_a8b8g8r8;
-
--	if (gr->gl_version < gr_gl_version(3, 0) &&
--	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))=
 {
--		weston_log("GL_EXT_unpack_subimage not available.\n");
--		return -1;
--	}
-+	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
-+	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
-+		gr->has_unpack_subimage =3D true;
-
-	if (gr->gl_version >=3D gr_gl_version(3, 0) ||
-	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10=
_10_REV"))
-@@ -3977,6 +3994,8 @@ gl_renderer_setup(struct weston_compositor *ec, EG=
LSurface egl_surface)
-		   gr_gl_version_minor(gr->gl_version));
-	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-		ec->read_format =3D=3D PIXMAN_a8r8g8b8 ? "BGRA" : "RGBA");
-+	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
-+			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "EGL Wayland extension: %s\n",
-			    gr->has_bind_display ? "yes" : "no");
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
index b1b7d26a..dd893f1e 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
@@ -7,5 +7,4 @@ SRC_URI +=3D " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap=
.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C=
.patch \
-        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
 "
--=20
2.25.1


