Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610B1C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 18:16:42 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.69300.1753985796832255270
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 11:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zKOmdAVD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56VIGZJA3507123;
	Thu, 31 Jul 2025 13:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753985795;
	bh=QQdFnekEbLDuj+olmRl2g9iiBaBWJk8PC6OqtmT+zHQ=;
	h=From:To:CC:Subject:Date;
	b=zKOmdAVDLY2AtteVDkW2Y1EFQA10/To6IE9ZrATQh2v4FTnQ0WFDlEJShVYuDZv7v
	 rXM8xpBvel/KOlcduShORZDPnCDHgei0I9aaoSpmSytna1nxvyf74kGnMWqcbJeJ6h
	 rq8u9SN6h3H3TG06dakxq7qghoaWzojM8wm8S5tM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56VIGZII208371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 13:16:35 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 13:16:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 13:16:35 -0500
Received: from localhost.localdomain ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56VIGYfn3334033;
	Thu, 31 Jul 2025 13:16:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] recipes-graphics: Move weston fix for SGX to meta-ti
Date: Thu, 31 Jul 2025 13:16:34 -0500
Message-ID: <20250731181634.195719-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 31 Jul 2025 18:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16346

This change is needed due to the SGX driver, any distro, not just Arago,
using a TI SoC with SGX will need this fix, so it should go in meta-ti.
Remove it from here so it can go into meta-ti without patch conflicts.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/wayland/weston-arago.inc |  7 --
 ...equire-GL_EXT_unpack_subimage-commit.patch | 95 -------------------
 .../wayland/weston_14.0.%.bbappend            |  4 -
 3 files changed, 106 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc b/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
deleted file mode 100644
index 16518353..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
-
-PR:append = ".arago1"
-
-SRC_URI += " \
-        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
-"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
deleted file mode 100644
index fbe8f2bb..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Thu, 6 Jul 2023 01:48:41 +0000
-Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
-
-This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
-
-That commit removed support for GPU drivers without GL_EXT_unpack_subimage
-which SGX does not support. Add back support for GPUs without this
-extension.
-
-Upstream-Status: Inappropriate [specific to TI SGX]
-
-Signed-off-by: Andrew Davis <afd@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
-
----
- libweston/renderer-gl/gl-renderer-internal.h |  2 ++
- libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
- 2 files changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
-index 5032035..85616c9 100644
---- a/libweston/renderer-gl/gl-renderer-internal.h
-+++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -229,6 +229,8 @@ struct gl_renderer {
-	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
-	bool has_platform_base;
-
-+	bool has_unpack_subimage;
-+
-	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
-	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
-	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
-diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
-index e694418b..2be6d621 100644
---- a/libweston/renderer-gl/gl-renderer.c
-+++ b/libweston/renderer-gl/gl-renderer.c
-@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
-	struct weston_surface *surface = pnode->surface;
-	const struct weston_testsuite_quirks *quirks =
-		&surface->compositor->test_data.test_quirks;
-+	struct gl_renderer *gr = get_renderer(surface->compositor);
-	struct weston_buffer *buffer = surface->buffer_ref.buffer;
-	struct gl_surface_state *gs = get_surface_state(surface);
-	struct gl_buffer_state *gb = gs->buffer;
-@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
-
-	data = wl_shm_buffer_get_data(buffer->shm_buffer);
-
-+	if (!gr->has_unpack_subimage) {
-+		wl_shm_buffer_begin_access(buffer->shm_buffer);
-+		for (j = 0; j < gs->buffer->num_textures; j++) {
-+			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
-+			glTexImage2D(GL_TEXTURE_2D, 0,
-+				     gs->buffer->gl_format[j],
-+				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
-+				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
-+				     0,
-+				     gl_format_from_internal(gs->buffer->gl_format[j]),
-+				     gs->buffer->gl_pixel_type,
-+				     data + gs->buffer->offset[j]);
-+		}
-+		wl_shm_buffer_end_access(buffer->shm_buffer);
-+
-+		goto done;
-+	}
-+
-	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
-		wl_shm_buffer_begin_access(buffer->shm_buffer);
-
-@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
-	else
-		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
-
--	if (gr->gl_version < gr_gl_version(3, 0) &&
--	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
--		weston_log("GL_EXT_unpack_subimage not available.\n");
--		return -1;
--	}
-+	if (gr->gl_version >= gr_gl_version(3, 0) ||
-+	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
-+		gr->has_unpack_subimage = true;
-
-	if (gr->gl_version >= gr_gl_version(3, 0) ||
-	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
-@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
-		   gr_gl_version_minor(gr->gl_version));
-	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
-			    ec->read_format->drm_format_name);
-+	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
-+			    gr->has_unpack_subimage ? "yes" : "no");
-	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
-			    yesno(gr->has_pack_reverse));
-	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
deleted file mode 100644
index c98a62de..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-WESTON_ARAGO = ""
-WESTON_ARAGO:arago = "weston-arago.inc"
-
-require ${WESTON_ARAGO}
-- 
2.39.2


