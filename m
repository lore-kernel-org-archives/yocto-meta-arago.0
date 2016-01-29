Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 87B5E52007
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 18:12:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TICp3q006073
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 12:12:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TICpfW008248
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 12:12:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 12:12:51 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TICpep001958;
	Fri, 29 Jan 2016 12:12:51 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPDXO-0007zh-OL; Fri, 29 Jan 2016 13:12:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 13:12:49 -0500
Message-ID: <1454091169-30695-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kmscube: ti43x: workaround HDMI disaply underrun issue
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
X-List-Received-Date: Fri, 29 Jan 2016 18:12:52 -0000
Content-Type: text/plain

* select the current CRTC display mode if it is valid

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...nit_drm-select-the-current-CRTC-display-m.patch | 76 ++++++++++++++++++++++
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  7 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch
new file mode 100644
index 0000000..e6db0a3
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch
@@ -0,0 +1,76 @@
+From c2fd69466fcf1de1d20ee437470b40584964b32d Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 10 Dec 2015 12:41:15 -0500
+Subject: [PATCH] kmscube.c: init_drm(): select the current CRTC display mode
+ is valid
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ kmscube.c | 35 ++++++++++++++++++++++++++++++++---
+ 1 file changed, 32 insertions(+), 3 deletions(-)
+
+diff --git a/kmscube.c b/kmscube.c
+index 5a18c32..51a2c28 100644
+--- a/kmscube.c
++++ b/kmscube.c
+@@ -89,6 +89,8 @@ static int init_drm(void)
+ 	drmModeRes *resources;
+ 	drmModeConnector *connector = NULL;
+ 	drmModeEncoder *encoder = NULL;
++	drmModeCrtc *crtc = NULL;
++
+ 	int i, j;
+ 	uint32_t maxRes, curRes;
+ 
+@@ -119,10 +121,8 @@ static int init_drm(void)
+ 	for (i = 0; i < resources->count_connectors; i++) {
+ 		connector = drmModeGetConnector(drm.fd, resources->connectors[i]);
+ 		if (connector->connection == DRM_MODE_CONNECTED) {
+-			/* choose the first supported mode */
+-			drm.mode[drm.ndisp] = &connector->modes[0];
+-			drm.connector_id[drm.ndisp] = connector->connector_id;
+ 
++			/* find the matched encoders */
+ 			for (j=0; j<resources->count_encoders; j++) {
+ 				encoder = drmModeGetEncoder(drm.fd, resources->encoders[j]);
+ 				if (encoder->encoder_id == connector->encoder_id)
+@@ -137,6 +137,35 @@ static int init_drm(void)
+ 				return -1;
+ 			}
+ 
++			/* choose the current or first supported mode */
++			crtc = drmModeGetCrtc(drm.fd, encoder->crtc_id);
++			for (j = 0; j < connector->count_modes; j++)
++			{
++				if (crtc->mode_valid)
++				{
++					if ((connector->modes[j].hdisplay == crtc->width) &&
++					(connector->modes[j].vdisplay == crtc->height))
++					{
++						drm.mode[drm.ndisp] = &connector->modes[j];
++						break;
++					}
++				}
++				else
++				{
++					if ((connector->modes[j].hdisplay == crtc->x) &&
++					   (connector->modes[j].vdisplay == crtc->y))
++					{
++						drm.mode[drm.ndisp] = &connector->modes[j];
++						break;
++					}
++				}
++			}
++
++			if(j >= connector->count_modes)
++				drm.mode[drm.ndisp] = &connector->modes[0];
++
++			drm.connector_id[drm.ndisp] = connector->connector_id;
++
+ 			drm.encoder[drm.ndisp]  = (uint32_t) encoder;
+ 			drm.crtc_id[drm.ndisp] = encoder->crtc_id;
+ 			drm.connectors[drm.ndisp] = connector;
+-- 
+1.9.1
+
+
diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 3e088d8..484a46b 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -6,14 +6,19 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8
 DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
 
 COMPATIBLE_MACHINE = "ti43x|omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r3"
+PR = "r4"
 SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
+SRC_URI_append_ti43x = " \
+    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
+"
+
 S = "${WORKDIR}/git"
 
 INSANE_SKIP_kmscube += "dev-deps"
-- 
1.9.1


