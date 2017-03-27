Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 76E2A52090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 21:09:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RL9Dfo026780
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490648953;
	bh=QN0+wccolr5x7VwTlvEuLk3sAf3Mx3mPO15LRy5jOfY=;
	h=From:To:Subject:Date;
	b=KgcLqlAujQzUKexvay/t1Un16Gzuc54pbr9WGumXTNSaPFwRjJ16v1hbV2w1dEJw/
	+lI9yzI3ww/bLVvClERYQwlFZkLH3XlNMV7qOvNCj1tR3RdSZDCsYSVgQ8dFwOfOzW
	Z4KPEV1GMImusQc/HqwrzvC5JxESXJnoJsJIFN5w=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RL98xK006146
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 16:09:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 16:09:07 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2RL97CL008226	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 16:09:07 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 17:09:02 -0400
Message-ID: <1490648942-28605-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth][PATCH] kmscube: cleanup and include bug fix for HDMI
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
X-List-Received-Date: Mon, 27 Mar 2017 21:09:23 -0000
Content-Type: text/plain

All local patches merged to git repository

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 --------
 ...nit_drm-select-the-current-CRTC-display-m.patch | 76 ----------------------
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  7 +-
 3 files changed, 1 insertion(+), 110 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
deleted file mode 100644
index 64b7b04..0000000
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 82a3cc3ddec96fba7204f5ecab0890801a0b54b4 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 25 Feb 2016 09:49:24 -0500
-Subject: [PATCH] kmscube.c: init_drm(): enable AM3 support
-
-Enable AM3 support by adding "tilcdc" to the modules list.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- kmscube.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kmscube.c b/kmscube.c
-index 5a18c32..919b3e7 100644
---- a/kmscube.c
-+++ b/kmscube.c
-@@ -84,7 +84,7 @@ struct drm_fb {
- static int init_drm(void)
- {
- 	static const char *modules[] = {
--			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
-+			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
- 	};
- 	drmModeRes *resources;
- 	drmModeConnector *connector = NULL;
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch
deleted file mode 100644
index e6db0a3..0000000
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From c2fd69466fcf1de1d20ee437470b40584964b32d Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 10 Dec 2015 12:41:15 -0500
-Subject: [PATCH] kmscube.c: init_drm(): select the current CRTC display mode
- is valid
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- kmscube.c | 35 ++++++++++++++++++++++++++++++++---
- 1 file changed, 32 insertions(+), 3 deletions(-)
-
-diff --git a/kmscube.c b/kmscube.c
-index 5a18c32..51a2c28 100644
---- a/kmscube.c
-+++ b/kmscube.c
-@@ -89,6 +89,8 @@ static int init_drm(void)
- 	drmModeRes *resources;
- 	drmModeConnector *connector = NULL;
- 	drmModeEncoder *encoder = NULL;
-+	drmModeCrtc *crtc = NULL;
-+
- 	int i, j;
- 	uint32_t maxRes, curRes;
- 
-@@ -119,10 +121,8 @@ static int init_drm(void)
- 	for (i = 0; i < resources->count_connectors; i++) {
- 		connector = drmModeGetConnector(drm.fd, resources->connectors[i]);
- 		if (connector->connection == DRM_MODE_CONNECTED) {
--			/* choose the first supported mode */
--			drm.mode[drm.ndisp] = &connector->modes[0];
--			drm.connector_id[drm.ndisp] = connector->connector_id;
- 
-+			/* find the matched encoders */
- 			for (j=0; j<resources->count_encoders; j++) {
- 				encoder = drmModeGetEncoder(drm.fd, resources->encoders[j]);
- 				if (encoder->encoder_id == connector->encoder_id)
-@@ -137,6 +137,35 @@ static int init_drm(void)
- 				return -1;
- 			}
- 
-+			/* choose the current or first supported mode */
-+			crtc = drmModeGetCrtc(drm.fd, encoder->crtc_id);
-+			for (j = 0; j < connector->count_modes; j++)
-+			{
-+				if (crtc->mode_valid)
-+				{
-+					if ((connector->modes[j].hdisplay == crtc->width) &&
-+					(connector->modes[j].vdisplay == crtc->height))
-+					{
-+						drm.mode[drm.ndisp] = &connector->modes[j];
-+						break;
-+					}
-+				}
-+				else
-+				{
-+					if ((connector->modes[j].hdisplay == crtc->x) &&
-+					   (connector->modes[j].vdisplay == crtc->y))
-+					{
-+						drm.mode[drm.ndisp] = &connector->modes[j];
-+						break;
-+					}
-+				}
-+			}
-+
-+			if(j >= connector->count_modes)
-+				drm.mode[drm.ndisp] = &connector->modes[0];
-+
-+			drm.connector_id[drm.ndisp] = connector->connector_id;
-+
- 			drm.encoder[drm.ndisp]  = (uint32_t) encoder;
- 			drm.crtc_id[drm.ndisp] = encoder->crtc_id;
- 			drm.connectors[drm.ndisp] = connector;
--- 
-1.9.1
-
-
diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 1e9a8bf..ded977d 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -11,15 +11,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit autotools pkgconfig
 
 PR = "r5"
-SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
+SRCREV = "0fa27a594fd3290644f5666eac62dc570f26f866"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-SRC_URI_append = " \
-    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
-    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
-"
-
 S = "${WORKDIR}/git"
 
 INSANE_SKIP_kmscube += "dev-deps"
-- 
1.9.1


