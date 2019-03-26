Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E2298529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 14:08:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QE8IeU017644
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 09:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553609298;
	bh=4Mpc0izVfIlllWwYLhgOhb6AuuQjTbiMTI7QTS/ihAE=;
	h=From:To:Subject:Date;
	b=zJsYiF4riVafepopBkCFuNXMFJvLYLESrcEGoxXvx46gp11SrFf5vJmuKQwxY/NK+
	44z0tdLTEeFP25PO64jLS1fbsy33FA2GAkDaRU1lgPDPZq5GqDeVWO7I+nbQva58Yi
	Ji5U781DcuvQSgLWtO07/r114PkDeDzzjmLtSI0M=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QE8IC9019860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 09:08:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 09:08:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 09:08:17 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QE8HxK009838
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 09:08:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 10:08:14 -0400
Message-ID: <1553609294-62666-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] weston: fix dual display issue
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
X-List-Received-Date: Tue, 26 Mar 2019 14:08:34 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0005-weston-drm-fix-dual-display-issue.patch   | 62 ++++++++++++++++++++++
 .../recipes-graphics/wayland/weston_5.0.0.bbappend |  3 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
new file mode 100644
index 0000000..b462fdb
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix-dual-display-issue.patch
@@ -0,0 +1,62 @@
+From 538f82f4f0fb8f57979f46a84620bb8dc5a46ed6 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 26 Mar 2019 09:31:14 -0400
+Subject: [PATCH 2/2] weston: drm: fix dual display issue
+
+This patch fixes the dual display issue by enhancing the primary plane
+search algorithm to keep the plane which is connected to the crtc of
+the output because the direct switching of active planes is not allowed.
+
+Upstream status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ libweston/compositor-drm.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index 3891176..232cb7f 100644
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
+@@ -4204,6 +4207,14 @@ drm_output_find_special_plane(struct drm_backend *b, struct drm_output *output,
+ 		if (found_elsewhere)
+ 			continue;
+ 
++		/* The output should keep the primary plane connected to its
++		 * crtc since the direct switching of active plane is not
++		 * allowed. */
++		if ((plane->crtc_id != 0) &&
++		    (type == WDRM_PLANE_TYPE_PRIMARY) &&
++		    (plane->crtc_id != output->crtc_id))
++			continue;
++
+ 		plane->possible_crtcs = (1 << output->pipe);
+ 		return plane;
+ 	}
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


