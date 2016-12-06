Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0C9DA52983
	for <meta-arago@arago-project.org>;
	Tue,  6 Dec 2016 20:12:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB6KCGAh002181
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 14:12:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB6KCGsC018913
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 14:12:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 14:12:16 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uB6KCGWp003635	for <meta-arago@arago-project.org>;
	Tue, 6 Dec 2016 14:12:16 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Dec 2016 15:12:09 -0500
Message-ID: <1481055129-26965-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: fix hotplug weston termination problem at compositor-drm
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
X-List-Received-Date: Tue, 06 Dec 2016 20:12:17 -0000
Content-Type: text/plain

The weston_compositor_exit() is always invoked at function update_outputs()
if all connector ids are greater than 31 because the 32-bit b->connector_allocator
will be zero. Need to increase the size of both crtc_allocator and
connector_allocator from 32-bit to 64-bit until a better solution is implemented.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...drm-fix-hotplug-weston-termination-proble.patch | 110 +++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend |   3 +-
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
new file mode 100644
index 0000000..35f289c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
@@ -0,0 +1,110 @@
+From 1d956770aa7d1ba4ca1bbb7eff469f27d7267b02 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 23 Nov 2016 16:54:51 -0500
+Subject: [PATCH] compositor-drm: fix hotplug weston termination problem
+
+The weston_compositor_exit() is always invoked at function update_outputs()
+if all connector ids are greater than 31 because the 32-bit b->connector_allocator
+will be zero. Need to increase the size of both crtc_allocator and
+connector_allocator from 32-bit to 64-bit until a better solution is implemented.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/compositor-drm.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index 6485b39..e4d889f 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -103,8 +103,8 @@ struct drm_backend {
+ 	struct gbm_device *gbm;
+ 	uint32_t *crtcs;
+ 	int num_crtcs;
+-	uint32_t crtc_allocator;
+-	uint32_t connector_allocator;
++	uint64_t crtc_allocator;
++	uint64_t connector_allocator;
+ 	struct wl_listener session_listener;
+ 	uint32_t format;
+ 
+@@ -1360,8 +1360,8 @@ drm_output_destroy(struct weston_output *output_base)
+ 		       &output->connector_id, 1, &origcrtc->mode);
+ 	drmModeFreeCrtc(origcrtc);
+ 
+-	b->crtc_allocator &= ~(1 << output->crtc_id);
+-	b->connector_allocator &= ~(1 << output->connector_id);
++	b->crtc_allocator &= ~(1ULL << output->crtc_id);
++	b->connector_allocator &= ~(1ULL << output->connector_id);
+ 
+ 	if (b->use_pixman) {
+ 		drm_output_fini_pixman(output);
+@@ -1842,8 +1842,8 @@ find_crtc_for_connector(struct drm_backend *b,
+ 		drmModeFreeEncoder(encoder);
+ 
+ 		for (i = 0; i < resources->count_crtcs; i++) {
+-			if (possible_crtcs & (1 << i) &&
+-			    !(b->crtc_allocator & (1 << resources->crtcs[i])))
++			if (possible_crtcs & (1ULL << i) &&
++			    !(b->crtc_allocator & (1ULL << resources->crtcs[i])))
+ 				return i;
+ 		}
+ 	}
+@@ -2404,9 +2404,9 @@ create_output_for_connector(struct drm_backend *b,
+ 
+ 	output->crtc_id = resources->crtcs[i];
+ 	output->pipe = i;
+-	b->crtc_allocator |= (1 << output->crtc_id);
++	b->crtc_allocator |= (1ULL << output->crtc_id);
+ 	output->connector_id = connector->connector_id;
+-	b->connector_allocator |= (1 << output->connector_id);
++	b->connector_allocator |= (1ULL << output->connector_id);
+ 
+ 	output->original_crtc = drmModeGetCrtc(b->drm.fd, output->crtc_id);
+ 	output->dpms_prop = drm_get_prop(b->drm.fd, connector, "DPMS");
+@@ -2511,8 +2511,8 @@ err_free:
+ 	}
+ 
+ 	drmModeFreeCrtc(output->original_crtc);
+-	b->crtc_allocator &= ~(1 << output->crtc_id);
+-	b->connector_allocator &= ~(1 << output->connector_id);
++	b->crtc_allocator &= ~(1ULL << output->crtc_id);
++	b->connector_allocator &= ~(1ULL << output->connector_id);
+ 	free(output);
+ 
+ 	return -1;
+@@ -2658,7 +2658,7 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
+ 	drmModeRes *resources;
+ 	struct drm_output *output, *next;
+ 	int x = 0, y = 0;
+-	uint32_t connected = 0, disconnects = 0;
++	uint64_t connected = 0, disconnects = 0;
+ 	int i;
+ 
+ 	resources = drmModeGetResources(b->drm.fd);
+@@ -2680,9 +2680,9 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
+ 			continue;
+ 		}
+ 
+-		connected |= (1 << connector_id);
++		connected |= (1ULL << connector_id);
+ 
+-		if (!(b->connector_allocator & (1 << connector_id))) {
++		if (!(b->connector_allocator & (1ULL << connector_id))) {
+ 			struct weston_output *last =
+ 				container_of(b->compositor->output_list.prev,
+ 					     struct weston_output, link);
+@@ -2707,8 +2707,8 @@ update_outputs(struct drm_backend *b, struct udev_device *drm_device)
+ 	if (disconnects) {
+ 		wl_list_for_each_safe(output, next, &b->compositor->output_list,
+ 				      base.link) {
+-			if (disconnects & (1 << output->connector_id)) {
+-				disconnects &= ~(1 << output->connector_id);
++			if (disconnects & (1ULL << output->connector_id)) {
++				disconnects &= ~(1ULL << output->connector_id);
+ 				weston_log("connector %d disconnected\n",
+ 				       output->connector_id);
+ 				drm_output_destroy(&output->base);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index cde8374..9cc1023 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago15"
+PR_append = ".arago16"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -16,4 +16,5 @@ SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 	file://0001-Add-soc-performance-monitor-utilites.patch \
 	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
+	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
 "
-- 
1.9.1


