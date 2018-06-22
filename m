Return-Path: <karthik.ramanan@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 70273529F7
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 05:17:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5M5HqAR056622
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 00:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529644672;
	bh=vgZunwlOgq7k+KtTYmnMepTy7nf0oFoyegsOgp8XnTo=;
	h=From:To:CC:Subject:Date;
	b=IUPzTJQz8oXdAIcLBsvSQmEgfCTwVJuz86wTPO5u9F0NSI1aiZ7+kH/yOlQ28pJ53
	Lwv9MG0ncQ2WWCMw+oqVtqsMro4gG9SZggsxSWT1DpnqDtH4RwmaYGo78dQNOUInon
	Lfm1u3U9Zt0udrXTiEvPs6IE7W/oOXASf47Yqa4U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5M5Hqk8006154
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 00:17:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 00:17:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 00:17:51 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5M5HoGR013342;
	Fri, 22 Jun 2018 00:17:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 10:47:46 +0530
Message-ID: <1529644668-63037-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 1/3] weston: Addition of add_screen_remove_layer API
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
X-List-Received-Date: Fri, 22 Jun 2018 05:17:58 -0000
Content-Type: text/plain

This additional patch is a required dependency for adding
support for wayland-ivi-extension >= 2.0.0

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...001-ivi-shell-add_screen_remove_layer-API.patch | 85 ++++++++++++++++++++++
 .../recipes-graphics/wayland/weston_2.0.0.bbappend |  3 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch
new file mode 100644
index 0000000..4eb28e1
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch
@@ -0,0 +1,85 @@
+From deee858b0b199d8cfa8033a46d7078f30b23725e Mon Sep 17 00:00:00 2001
+From: "Ucan, Emre (ADITG/SW1)" <eucan@de.adit-jv.com>
+Date: Thu, 2 Mar 2017 08:47:33 +0000
+Subject: [PATCH] ivi-shell: add_screen_remove_layer API
+
+It is analagous to layer_remove_surface API.
+The API removes a layer from the render order
+of the screen.
+
+v3:
+add the new vfunc at the end of
+the ivi_layout_interface struct.
+
+Signed-off-by: Emre Ucan <eucan@de.adit-jv.com>
+Reviewed-by: Eugen Friedrich <friedrix@gmail.com>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+---
+ ivi-shell/ivi-layout-export.h | 10 ++++++++++
+ ivi-shell/ivi-layout.c        | 22 ++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/ivi-shell/ivi-layout-export.h b/ivi-shell/ivi-layout-export.h
+index 2317d6e..39ffde1 100644
+--- a/ivi-shell/ivi-layout-export.h
++++ b/ivi-shell/ivi-layout-export.h
+@@ -578,6 +578,16 @@ struct ivi_layout_interface {
+ 	 */
+ 	struct ivi_layout_surface *
+ 		(*get_surface)(struct weston_surface *surface);
++
++	/**
++	 * \brief Remove a ivi_layer to a weston_output which is currently managed
++	 * by the service
++	 *
++	 * \return IVI_SUCCEEDED if the method call was successful
++	 * \return IVI_FAILED if the method call was failed
++	 */
++	int32_t (*screen_remove_layer)(struct weston_output *output,
++				       struct ivi_layout_layer *removelayer);
+ };
+ 
+ #ifdef __cplusplus
+diff --git a/ivi-shell/ivi-layout.c b/ivi-shell/ivi-layout.c
+index 298e18e..8e4280b 100644
+--- a/ivi-shell/ivi-layout.c
++++ b/ivi-shell/ivi-layout.c
+@@ -1664,6 +1664,27 @@ ivi_layout_screen_add_layer(struct weston_output *output,
+ }
+ 
+ static int32_t
++ivi_layout_screen_remove_layer(struct weston_output *output,
++			    struct ivi_layout_layer *removelayer)
++{
++	struct ivi_layout_screen *iviscrn;
++
++	if (output == NULL || removelayer == NULL) {
++		weston_log("ivi_layout_screen_remove_layer: invalid argument\n");
++		return IVI_FAILED;
++	}
++
++	iviscrn = get_screen_from_output(output);
++
++	wl_list_remove(&removelayer->pending.link);
++	wl_list_init(&removelayer->pending.link);
++
++	iviscrn->order.dirty = 1;
++
++	return IVI_SUCCEEDED;
++}
++
++static int32_t
+ ivi_layout_screen_set_render_order(struct weston_output *output,
+ 				   struct ivi_layout_layer **pLayer,
+ 				   const int32_t number)
+@@ -2088,6 +2109,7 @@ static struct ivi_layout_interface ivi_layout_interface = {
+ 	 */
+ 	.get_screens_under_layer	= ivi_layout_get_screens_under_layer,
+ 	.screen_add_layer		= ivi_layout_screen_add_layer,
++	.screen_remove_layer		= ivi_layout_screen_remove_layer,
+ 	.screen_set_render_order	= ivi_layout_screen_set_render_order,
+ 
+ 	/**
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
index ce6f56d..ec8e6b0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago28"
+PR_append = ".arago29"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -14,6 +14,7 @@ SRC_URI += " \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
+        file://0001-ivi-shell-add_screen_remove_layer-API.patch \
 "
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


