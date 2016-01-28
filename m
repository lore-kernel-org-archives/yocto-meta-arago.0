Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D6DDE52976
	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 22:40:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SMenSn015090
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 16:40:49 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SMenbD031080
	for <meta-arago@arago-project.org>; Thu, 28 Jan 2016 16:40:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 16:40:48 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SMem2x021022	for <meta-arago@arago-project.org>;
	Thu, 28 Jan 2016 16:40:48 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 Jan 2016 17:40:41 -0500
Message-ID: <1454020841-57046-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Add two necessary patches on top of weston 1.9.0:
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
X-List-Received-Date: Thu, 28 Jan 2016 22:40:51 -0000
Content-Type: text/plain

- Enable DRM-backend with multiple displays
- Allow visual_id to be 0 at function match_config_to_visual()

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-Enabling-DRM-backend-with-multiple-displ.patch | 60 ++++++++++++++++++++++
 .../0002-Weston1.9.0-Allow-visual_id-to-be-0.patch | 31 +++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
new file mode 100644
index 0000000..3efceb5
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
@@ -0,0 +1,60 @@
+From 15d9f155fdb3abffc348e81b1560702801994715 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Mon, 11 Jan 2016 11:51:30 -0500
+Subject: [PATCH 1/2] weston1.9.0: Enabling DRM backend with multiple displays
+
+There are three main issues that this patch tries to address
+
+ 1. Black screen when running weston
+ 2. Support for multiple displays
+ 3. Handling missing VBlanks
+
+There is an issue with missing VBlanks for LCD and
+HDMI connectors which leads to display not getting refreshed.
+This patch can be considered as a workaround.
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ src/compositor-drm.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index 6777bf8..15ddba8 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -686,7 +686,7 @@ drm_output_repaint(struct weston_output *output_base,
+ 			.request.sequence = 1,
+ 		};
+ 
+-		if ((!s->current && !s->next) ||
++		if ((!s->current && !s->next) &&
+ 		    !drm_sprite_crtc_supported(output, s->possible_crtcs))
+ 			continue;
+ 
+@@ -847,6 +847,7 @@ page_flip_handler(int fd, unsigned int frame,
+ {
+ 	struct drm_output *output = (struct drm_output *) data;
+ 	struct timespec ts;
++	uint32_t bail;
+ 	uint32_t flags = PRESENTATION_FEEDBACK_KIND_VSYNC |
+ 			 PRESENTATION_FEEDBACK_KIND_HW_COMPLETION |
+ 			 PRESENTATION_FEEDBACK_KIND_HW_CLOCK;
+@@ -864,9 +865,14 @@ page_flip_handler(int fd, unsigned int frame,
+ 
+ 	output->page_flip_pending = 0;
+ 
++	if(output->vblank_pending) {
++		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
++		bail = 1;
++	}
++
+ 	if (output->destroy_pending)
+ 		drm_output_destroy(&output->base);
+-	else if (!output->vblank_pending) {
++	else if (!output->vblank_pending || bail ) {
+ 		ts.tv_sec = sec;
+ 		ts.tv_nsec = usec * 1000;
+ 		weston_output_finish_frame(&output->base, &ts, flags);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
new file mode 100644
index 0000000..72d067f
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
@@ -0,0 +1,31 @@
+From 27cf7d0c260fa4754a021e9f6f92f83e2c99f5f4 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Mon, 11 Jan 2016 11:59:19 -0500
+Subject: [PATCH 2/2] Weston1.9.0: Allow visual_id to be 0
+
+The inquiry of visual id from egl API eglGetConfigAttrib(EGL_NATIVE_VISUAL_ID)
+is an optional feature. The visual id will be set to 0 if this feature is
+not supported. Therefore, the return condition @function match_config_to_visual()
+should be (id == visual_id || id == 0) instead of (id == visual_id)
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/gl-renderer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gl-renderer.c b/src/gl-renderer.c
+index d7231f4..e1b925e 100644
+--- a/src/gl-renderer.c
++++ b/src/gl-renderer.c
+@@ -2194,7 +2194,7 @@ match_config_to_visual(EGLDisplay egl_display,
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 4aff58d..c4623df 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -8,6 +8,8 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
+            file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
+            file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
 "
 
 # Add custom Arago Wayland Environment script file
-- 
1.9.1


