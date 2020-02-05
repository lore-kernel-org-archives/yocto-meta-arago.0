Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 56180529A5
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2020 23:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5EC6740C0A;
	Wed,  5 Feb 2020 23:09:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e8B-ND5eMnSj; Wed,  5 Feb 2020 23:09:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DECBE40A4E;
	Wed,  5 Feb 2020 23:09:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 487ED1743DD;
	Wed,  5 Feb 2020 18:09:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  5 Feb 2020 18:09:20 -0500
Message-Id: <1580944160-32892-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Scott Murray <scott.murray@konsulko.com>
Subject: [zeus/master][PATCH] Revert "HACK: weston: revert EGL_KHR_partial_update changes that require EGL 1.5"
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
X-List-Received-Date: Wed, 05 Feb 2020 23:11:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Now, that our SGX DDK UM libs support EGL 1.5, these can be dropped.

This reverts commit 5ab873a1b06648286711ec2b9acb849b07a5443c.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reported-by: Scott Murray <scott.murray@konsulko.com>
Cc: Andrew F. Davis <afd@ti.com>
---
 ...renderer-Add-EGL_EXT_partial_update-query.patch | 47 --------------------
 ...l-renderer-Support-EGL_KHR_partial_update.patch | 51 ----------------------
 .../recipes-graphics/wayland/weston_7.0.0.bbappend |  7 +--
 3 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
deleted file mode 100644
index 556440e..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e9ce4695a1ea78434b7244705ef3fd2af7b360f7 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 12 Sep 2019 21:03:18 -0400
-Subject: [PATCH] Revert "gl-renderer: Add EGL_EXT_partial_update query"
-
-This reverts commit 0a86a81cc251330b15e213fde8434f291e35bf88.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- libweston/renderer-gl/gl-renderer.c | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
-index 6c2a56d..590ef09 100644
---- a/libweston/renderer-gl/gl-renderer.c
-+++ b/libweston/renderer-gl/gl-renderer.c
-@@ -233,8 +233,6 @@ struct gl_renderer {
- 	bool has_egl_image_external;
- 
- 	bool has_egl_buffer_age;
--	bool has_egl_partial_update;
--	PFNEGLSETDAMAGEREGIONKHRPROC set_damage_region;
- 
- 	bool has_configless_context;
- 
-@@ -3515,8 +3513,6 @@ gl_renderer_setup_egl_extensions(struct weston_compositor *ec)
- 		(void *) eglGetProcAddress("eglUnbindWaylandDisplayWL");
- 	gr->query_buffer =
- 		(void *) eglGetProcAddress("eglQueryWaylandBufferWL");
--	gr->set_damage_region =
--		(void *) eglGetProcAddress("eglSetDamageRegionKHR");
- 
- 	extensions =
- 		(const char *) eglQueryString(gr->egl_display, EGL_EXTENSIONS);
-@@ -3539,9 +3535,6 @@ gl_renderer_setup_egl_extensions(struct weston_compositor *ec)
- 	if (weston_check_egl_extension(extensions, "EGL_EXT_buffer_age"))
- 		gr->has_egl_buffer_age = true;
- 
--	if (weston_check_egl_extension(extensions, "EGL_KHR_partial_update"))
--		gr->has_egl_partial_update = true;
--
- 	for (i = 0; i < ARRAY_LENGTH(swap_damage_ext_to_entrypoint); i++) {
- 		if (weston_check_egl_extension(extensions,
- 				swap_damage_ext_to_entrypoint[i].extension)) {
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch
deleted file mode 100644
index f6fd845..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c4e7764e9062729a320d2a81f4b4f1a2392454cb Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 12 Sep 2019 21:20:01 -0400
-Subject: [PATCH] Revert "gl-renderer: Support EGL_KHR_partial_update"
-
-This reverts commit df2095fa35fe84e4ebc30754dd9f25e50bd1aa47.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- libweston/renderer-gl/gl-renderer.c | 18 ++----------------
- 1 file changed, 2 insertions(+), 16 deletions(-)
-
-diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
-index 590ef09..a95e873 100644
---- a/libweston/renderer-gl/gl-renderer.c
-+++ b/libweston/renderer-gl/gl-renderer.c
-@@ -1531,8 +1531,8 @@ gl_renderer_repaint_output(struct weston_output *output,
- 
- 	/* In fan debug mode, redraw everything to make sure that we clear any
- 	 * fans left over from previous draws on this buffer.
--	 * This precludes the use of EGL_EXT_swap_buffers_with_damage and
--	 * EGL_KHR_partial_update, since we damage the whole area. */
-+	 * This precludes the use of EGL_EXT_swap_buffers_with_damage, since
-+	 * we damage the whole area. */
- 	if (gr->fan_debug) {
- 		pixman_region32_t undamaged;
- 		pixman_region32_init(&undamaged);
-@@ -1560,20 +1560,6 @@ gl_renderer_repaint_output(struct weston_output *output,
- 	pixman_region32_union(&total_damage, &previous_damage, output_damage);
- 	border_status |= go->border_status;
- 
--	if (gr->has_egl_partial_update && !gr->fan_debug) {
--		int n_egl_rects;
--		EGLint *egl_rects;
--
--		/* For partial_update, we need to pass the region which has
--		 * changed since we last rendered into this specific buffer;
--		 * this is total_damage. */
--		pixman_region_to_egl_y_invert(output, &total_damage,
--					      &egl_rects, &n_egl_rects);
--		gr->set_damage_region(gr->egl_display, go->egl_surface,
--				      egl_rects, n_egl_rects);
--		free(egl_rects);
--	}
--
- 	repaint_views(output, &total_damage);
- 
- 	pixman_region32_fini(&total_damage);
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
index fc448b4..c2f4ef3 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
@@ -1,15 +1,12 @@
 PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/libgbm mtdev"
 
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-SRC_URI += " \
-        file://0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch \
-        file://0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch \
-"
+#SRC_URI += " \
 #        file://0002-weston-Allow-visual_id-to-be-0.patch \
 #        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
 #        file://0004-weston-Fix-touch-screen-crash-issue.patch \
-- 
2.7.4


