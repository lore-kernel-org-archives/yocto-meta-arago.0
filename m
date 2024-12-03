Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6861DE64A8F
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:22:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18952.1733232168250129640
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 05:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nU8ShNNx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B3DMkp0097992;
	Tue, 3 Dec 2024 07:22:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733232166;
	bh=qFMz8tTWlU7QgcWr9F8A4UDp+cMmvW1l1e5jYB3qP6w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nU8ShNNxZAUCDsgil8lDWfiwofvYzup+AZP8EwmQqkO4oI8l8sR/QgMtfslFyPLwg
	 gq0rp3YZCjwbwrdQmD4Sm5Lhe15kCqTJRqB+PJO68idej3DPLfXUGQl4BQdkwitlDQ
	 ZDSc6OFS5NBTtOwMle8cgJs1X+AwM4DSN0aBeKog=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3DMkfx022083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 07:22:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 07:22:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3DMkhx024090;
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tISrW-0007jr-6g; Tue, 03 Dec 2024 07:22:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 3/4] weston: Update to weston 14.0
Date: Tue, 3 Dec 2024 07:22:44 -0600
Message-ID: <20241203132245.29696-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241203132245.29696-1-reatmon@ti.com>
References: <20241203132245.29696-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Dec 2024 13:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15639

oe-core move to weston 14.0 [1], so we need to updated out bbapped and patch
to match it.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/wayland/weston_14.0.1.bb?id=fc140d6cb89dc0ddaff9cdc59ab69806096909cb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...equire-GL_EXT_unpack_subimage-commit.patch | 24 +++++++++----------
 ...13.0.%.bbappend => weston_14.0.%.bbappend} |  0
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_13.0.%.bbappend => weston_14.0.%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
index ad252030..fbe8f2bb 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
@@ -23,7 +23,7 @@ diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-g
 index 5032035..85616c9 100644
 --- a/libweston/renderer-gl/gl-renderer-internal.h
 +++ b/libweston/renderer-gl/gl-renderer-internal.h
-@@ -160,6 +160,8 @@ struct gl_renderer {
+@@ -229,6 +229,8 @@ struct gl_renderer {
 	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
 	bool has_platform_base;
 
@@ -33,20 +33,20 @@ index 5032035..85616c9 100644
 	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
 	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
 diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
-index ccb41e6..38a0e0c 100644
+index e694418b..2be6d621 100644
 --- a/libweston/renderer-gl/gl-renderer.c
 +++ b/libweston/renderer-gl/gl-renderer.c
-@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface *surface,
- {
+@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
+	struct weston_surface *surface = pnode->surface;
 	const struct weston_testsuite_quirks *quirks =
 		&surface->compositor->test_data.test_quirks;
 +	struct gl_renderer *gr = get_renderer(surface->compositor);
+	struct weston_buffer *buffer = surface->buffer_ref.buffer;
 	struct gl_surface_state *gs = get_surface_state(surface);
 	struct gl_buffer_state *gb = gs->buffer;
-	struct weston_paint_node *pnode;
-@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface *surface,
+@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
 
-	glActiveTexture(GL_TEXTURE0);
+	data = wl_shm_buffer_get_data(buffer->shm_buffer);
 
 +	if (!gr->has_unpack_subimage) {
 +		wl_shm_buffer_begin_access(buffer->shm_buffer);
@@ -67,9 +67,9 @@ index ccb41e6..38a0e0c 100644
 +	}
 +
 	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
-		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
-		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
-@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec)
+		wl_shm_buffer_begin_access(buffer->shm_buffer);
+
+@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
 	else
 		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
 
@@ -84,7 +84,7 @@ index ccb41e6..38a0e0c 100644
 
 	if (gr->gl_version >= gr_gl_version(3, 0) ||
 	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
-@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
+@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
 		   gr_gl_version_minor(gr->gl_version));
 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
 			    ec->read_format->drm_format_name);
@@ -92,4 +92,4 @@ index ccb41e6..38a0e0c 100644
 +			    gr->has_unpack_subimage ? "yes" : "no");
 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
 			    yesno(gr->has_pack_reverse));
-	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
+	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_14.0.%.bbappend
-- 
2.17.1


