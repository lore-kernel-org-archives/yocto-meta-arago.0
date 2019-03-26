Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C19FD529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 17:58:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QHw14Y091878
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 12:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553623081;
	bh=8QpdvCEpczf0WPjW41Sj7ZIzLgBVYmVXggFtyrpFdlE=;
	h=From:To:Subject:Date;
	b=q3mU3KtETX8AN5iPVioCGB9+MPQB/QReROyIf4JryBEmdO3EKoGAmJgQwYslZbmcB
	VeF6hamWVTrjHWisXD3m2ngX/pc4dFQpfOIsiaZWHIPVmSvkLkrSkYmRqGx52nuLxx
	LgR0P9INx6ZtxU8M8MftBO5i3zeLuusRuKB1/Ruc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QHw1lU117312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 12:58:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 12:58:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 12:58:00 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QHw0C9097505
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 12:58:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 13:57:55 -0400
Message-ID: <1553623075-12631-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] weston: fix dual display issue
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
X-List-Received-Date: Tue, 26 Mar 2019 17:58:16 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0005-weston-drm-fix-dual-display-issue.patch   | 79 ++++++++++++++++++++++
 .../recipes-graphics/wayland/weston_5.0.0.bbappend |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
new file mode 100644
index 0000000..9b06b81
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
@@ -0,0 +1,79 @@
+From db6f5ce008d9b8a4cc7db71659ce1d21d3d7f97f Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 26 Mar 2019 13:32:31 -0400
+Subject: [PATCH 3/3] weston: drm: fix dual display issue
+
+This patch fixes the dual display issue by enhancing the primary plane
+search algorithm to keep the plane which is connected to the crtc of
+the output because the direct switching of active planes is not allowed.
+
+Upstream status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ libweston/compositor-drm.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index 3891176..fa694c3 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -428,6 +428,7 @@ struct drm_plane {
+ 
+ 	uint32_t possible_crtcs;
+ 	uint32_t plane_id;
++	uint32_t crtc_id;
+ 	uint32_t count_formats;
+ 
+ 	struct drm_property_info props[WDRM_PLANE__COUNT];
+@@ -4073,6 +4074,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
+ 	if (kplane) {
+ 		plane->possible_crtcs = kplane->possible_crtcs;
+ 		plane->plane_id = kplane->plane_id;
++		plane->crtc_id = kplane->crtc_id;
+ 
+ 		props = drmModeObjectGetProperties(b->drm.fd, kplane->plane_id,
+ 						   DRM_MODE_OBJECT_PLANE);
+@@ -4097,6 +4099,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
+ 	else {
+ 		plane->possible_crtcs = (1 << output->pipe);
+ 		plane->plane_id = 0;
++		plane->crtc_id = 0;
+ 		plane->count_formats = 1;
+ 		plane->formats[0].format = format;
+ 		plane->type = type;
+@@ -4157,6 +4160,7 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
+ 			      enum wdrm_plane_type type)
+ {
+ 	struct drm_plane *plane;
++	struct drm_plane *plane2 = NULL; /* secondary plane */
+ 
+ 	if (!b->universal_planes) {
+ 		uint32_t format;
+@@ -4204,11 +4208,22 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
+ 		if (found_elsewhere)
+ 			continue;
+ 
++		/* The output should keep the primary plane connected to its
++		 * crtc since the direct switching of active plane is not
++		 * allowed. */
++		if ((type == WDRM_PLANE_TYPE_PRIMARY) &&
++		    (plane->crtc_id != output->crtc_id)) {
++			if (plane->crtc_id == 0) {
++				plane->possible_crtcs = (1 << output->pipe);
++				plane2 = plane;
++			}
++			continue;
++		}
+ 		plane->possible_crtcs = (1 << output->pipe);
+ 		return plane;
+ 	}
+ 
+-	return NULL;
++	return plane2;
+ }
+ 
+ /**
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index 68e53cc..cc456b4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago30"
+PR_append = ".arago31"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -13,6 +13,7 @@ SRC_URI += " \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
 	file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
+	file://0005-weston-drm-fix-dual-display-issue.patch \
 "
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


