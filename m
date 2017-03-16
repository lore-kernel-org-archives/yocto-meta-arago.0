Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D78A1529D2
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 11:54:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GBrrX3013209
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489665233;
	bh=+ZOeohHAfElm3lkFFR8SI5nyHbGnXVMH39R9uvMI7Ps=;
	h=From:To:CC:Subject:Date;
	b=y0g6VMb2eJiVWHngAsIfV+rchErkjRGKzMSdouDviDcbdUpbMpXwuD3CR6qUYY4zZ
	6YNonqP3dc2koAB6cSgJ1f0EVhN92fNJNsv3+BgQhsCey1zJkvJv5HIB8z2vuOL+Ei
	xfDS4JOn2S/dTCdCymPunEs4vUOphDil6qCnSg0w=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBrmWR031465
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 06:53:48 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBrkh5001278;
	Thu, 16 Mar 2017 06:53:47 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Mar 2017 17:23:42 +0530
Message-ID: <1489665224-95346-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] kmscube: cleanup and include bug fix for HDMI
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
X-List-Received-Date: Thu, 16 Mar 2017 11:54:04 -0000
Content-Type: text/plain

All local patches merged to git repository

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 --------
 ...nit_drm-select-the-current-CRTC-display-m.patch | 76 ----------------------
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  6 +-
 3 files changed, 2 insertions(+), 108 deletions(-)
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
index 1e9a8bf..220cc75 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -10,14 +10,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r5"
-SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
+PR = "r7"
+SRCREV = "0fa27a594fd3290644f5666eac62dc570f26f866"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
 SRC_URI_append = " \
-    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
-    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


