Return-Path: <afd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9B767529A8
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 18:39:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026Ibdoq004077
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 12:37:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583519859;
	bh=1cqT2XaJccHGmaMJI/RXpdL0UEvAG6xRM3jRbempp7U=;
	h=From:To:CC:Subject:Date;
	b=ig8I1t+1t9/7vmZ0g/Fl7qutF/DHzBWQW0Kt9nZ8tNOUIr2FSxXLjUEYEYlyRJgsV
	Uv78y726AqJ1szebIGjg9qxA6+H1UIJZBBihB/J/xAsqAw4g5BaxTEXzKIcfH2/ifk
	CY5KE3kvvO32TRIWDJ+wIls8LPmDjOBzmQMGUHhU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026IbdRp094311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 12:37:39 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Mar 2020 12:37:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Mar 2020 12:37:39 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 026Ibc8P127132;
	Fri, 6 Mar 2020 12:37:39 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 6 Mar 2020 13:37:38 -0500
Message-ID: <20200306183738.27847-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] weston: Add new fix patch for dual display issue
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
X-List-Received-Date: Fri, 06 Mar 2020 18:39:44 -0000
Content-Type: text/plain

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 ...ct-plane-based-on-current-attached-C.patch | 69 ++++++++++++++++
 ...05-weston-drm-fix-dual-display-issue.patch | 79 -------------------
 .../wayland/weston_7.0.0.bbappend             |  2 +-
 3 files changed, 70 insertions(+), 80 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
new file mode 100644
index 00000000..ef445797
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-on-current-attached-C.patch
@@ -0,0 +1,69 @@
+From 943323d177ef33494d9d063aeb7f0e9785d9b3c1 Mon Sep 17 00:00:00 2001
+From: "Andrew F. Davis" <afd@ti.com>
+Date: Fri, 6 Mar 2020 13:06:55 -0500
+Subject: [PATCH] backend-drm: Select plane based on current attached CRTC
+
+When doing plane selection for an output CRTC check if the plane
+already has a CRTC attached and if so prefer that plane only for
+the corresponding CRTC.
+
+This prevents changing a CRTC's primary plane when it is active
+which is not allowed by the DRM framework.
+
+Based-on-patch-by: Eric Ruei <e-ruei1@ti.com>
+Signed-off-by: Andrew F. Davis <afd@ti.com>
+---
+ libweston/backend-drm/drm-internal.h |  1 +
+ libweston/backend-drm/drm.c          | 10 ++++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/libweston/backend-drm/drm-internal.h b/libweston/backend-drm/drm-internal.h
+index 6f5a9880..65b7486d 100644
+--- a/libweston/backend-drm/drm-internal.h
++++ b/libweston/backend-drm/drm-internal.h
+@@ -398,6 +398,7 @@ struct drm_plane {
+ 
+ 	uint32_t possible_crtcs;
+ 	uint32_t plane_id;
++	uint32_t crtc_id;
+ 	uint32_t count_formats;
+ 
+ 	struct drm_property_info props[WDRM_PLANE__COUNT];
+diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
+index 041a15a5..544b1aff 100644
+--- a/libweston/backend-drm/drm.c
++++ b/libweston/backend-drm/drm.c
+@@ -819,6 +819,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
+ 	if (kplane) {
+ 		plane->possible_crtcs = kplane->possible_crtcs;
+ 		plane->plane_id = kplane->plane_id;
++		plane->crtc_id = kplane->crtc_id;
+ 
+ 		props = drmModeObjectGetProperties(b->drm.fd, kplane->plane_id,
+ 						   DRM_MODE_OBJECT_PLANE);
+@@ -843,6 +844,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
+ 	else {
+ 		plane->possible_crtcs = (1 << output->pipe);
+ 		plane->plane_id = 0;
++		plane->crtc_id = 0;
+ 		plane->count_formats = 1;
+ 		plane->formats[0].format = format;
+ 		plane->type = type;
+@@ -950,6 +952,14 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
+ 		if (found_elsewhere)
+ 			continue;
+ 
++		/* If a plane already has a CRTC selected and it is not our
++		 * output's CRTC, then do not select this plane. We cannot
++		 * switch away a plane from a CTRC when active. */
++		if ((type == WDRM_PLANE_TYPE_PRIMARY) &&
++		    (plane->crtc_id != 0) &&
++		    (plane->crtc_id != output->crtc_id))
++			continue;
++
+ 		plane->possible_crtcs = (1 << output->pipe);
+ 		return plane;
+ 	}
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
deleted file mode 100644
index 9b06b81b..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From db6f5ce008d9b8a4cc7db71659ce1d21d3d7f97f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 26 Mar 2019 13:32:31 -0400
-Subject: [PATCH 3/3] weston: drm: fix dual display issue
-
-This patch fixes the dual display issue by enhancing the primary plane
-search algorithm to keep the plane which is connected to the crtc of
-the output because the direct switching of active planes is not allowed.
-
-Upstream status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- libweston/compositor-drm.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
-index 3891176..fa694c3 100644
---- a/libweston/compositor-drm.c
-+++ b/libweston/compositor-drm.c
-@@ -428,6 +428,7 @@ struct drm_plane {
- 
- 	uint32_t possible_crtcs;
- 	uint32_t plane_id;
-+	uint32_t crtc_id;
- 	uint32_t count_formats;
- 
- 	struct drm_property_info props[WDRM_PLANE__COUNT];
-@@ -4073,6 +4074,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
- 	if (kplane) {
- 		plane->possible_crtcs = kplane->possible_crtcs;
- 		plane->plane_id = kplane->plane_id;
-+		plane->crtc_id = kplane->crtc_id;
- 
- 		props = drmModeObjectGetProperties(b->drm.fd, kplane->plane_id,
- 						   DRM_MODE_OBJECT_PLANE);
-@@ -4097,6 +4099,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane,
- 	else {
- 		plane->possible_crtcs = (1 << output->pipe);
- 		plane->plane_id = 0;
-+		plane->crtc_id = 0;
- 		plane->count_formats = 1;
- 		plane->formats[0].format = format;
- 		plane->type = type;
-@@ -4157,6 +4160,7 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
- 			      enum wdrm_plane_type type)
- {
- 	struct drm_plane *plane;
-+	struct drm_plane *plane2 = NULL; /* secondary plane */
- 
- 	if (!b->universal_planes) {
- 		uint32_t format;
-@@ -4204,11 +4208,22 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
- 		if (found_elsewhere)
- 			continue;
- 
-+		/* The output should keep the primary plane connected to its
-+		 * crtc since the direct switching of active plane is not
-+		 * allowed. */
-+		if ((type == WDRM_PLANE_TYPE_PRIMARY) &&
-+		    (plane->crtc_id != output->crtc_id)) {
-+			if (plane->crtc_id == 0) {
-+				plane->possible_crtcs = (1 << output->pipe);
-+				plane2 = plane;
-+			}
-+			continue;
-+		}
- 		plane->possible_crtcs = (1 << output->pipe);
- 		return plane;
- 	}
- 
--	return NULL;
-+	return plane2;
- }
- 
- /**
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
index 92e5570a..7a937f08 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
@@ -7,10 +7,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 RDEPENDS_${PN} += "weston-conf"
 
 #        file://0002-weston-Allow-visual_id-to-be-0.patch
-#        file://0005-weston-drm-fix-dual-display-issue.patch
 SRC_URI += " \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
+        file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
 "
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.17.1


