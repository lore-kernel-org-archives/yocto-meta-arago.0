Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0D2F0529A4
	for <meta-arago@arago-project.org>;
	Sat,  9 Mar 2019 00:30:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x290UHP2037536
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 18:30:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552091417;
	bh=d8CDqhWkCP1qtbivazTYBawSXdWs0k2KuZ7nS7VHsAI=;
	h=From:To:Subject:Date;
	b=PzfRlah1zeks598p9CciXebvI7UdD8F8UoSUCWntlnIsc5qL88gJfehNGXf6sm+G7
	uxwY6NusRQRDVY0C5WRQ9OOcbkd69X2cOWklKVsJOVxqfrF6eKCxCdBwlWrtUO9UPQ
	4ZgoPg5FTRaR03NDfUR8iiXekIoBLwUgncwU0HYs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x290UHEd016861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 18:30:17 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 18:30:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 18:30:17 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x290UHXQ006153
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 18:30:17 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Mar 2019 19:30:14 -0500
Message-ID: <1552091414-22536-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] weston: rebase and remove patches
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
X-List-Received-Date: Sat, 09 Mar 2019 00:30:26 -0000
Content-Type: text/plain

- rebase patches to weston 5.0.0
- remove patches which were backported before

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...001-ivi-shell-add_screen_remove_layer-API.patch | 87 ----------------------
 ...virtual-keyboard-display-issue-for-QT5-ap.patch | 15 ++--
 .../recipes-graphics/wayland/weston_5.0.0.bbappend |  6 +-
 3 files changed, 9 insertions(+), 99 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch
deleted file mode 100644
index 3e9e54f..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-ivi-shell-add_screen_remove_layer-API.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From deee858b0b199d8cfa8033a46d7078f30b23725e Mon Sep 17 00:00:00 2001
-From: "Ucan, Emre (ADITG/SW1)" <eucan@de.adit-jv.com>
-Date: Thu, 2 Mar 2017 08:47:33 +0000
-Subject: [PATCH] ivi-shell: add_screen_remove_layer API
-
-It is analagous to layer_remove_surface API.
-The API removes a layer from the render order
-of the screen.
-
-v3:
-add the new vfunc at the end of
-the ivi_layout_interface struct.
-
-Upstream-Status: Backport
-
-Signed-off-by: Emre Ucan <eucan@de.adit-jv.com>
-Reviewed-by: Eugen Friedrich <friedrix@gmail.com>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
----
- ivi-shell/ivi-layout-export.h | 10 ++++++++++
- ivi-shell/ivi-layout.c        | 22 ++++++++++++++++++++++
- 2 files changed, 32 insertions(+)
-
-diff --git a/ivi-shell/ivi-layout-export.h b/ivi-shell/ivi-layout-export.h
-index 2317d6e..39ffde1 100644
---- a/ivi-shell/ivi-layout-export.h
-+++ b/ivi-shell/ivi-layout-export.h
-@@ -578,6 +578,16 @@ struct ivi_layout_interface {
- 	 */
- 	struct ivi_layout_surface *
- 		(*get_surface)(struct weston_surface *surface);
-+
-+	/**
-+	 * \brief Remove a ivi_layer to a weston_output which is currently managed
-+	 * by the service
-+	 *
-+	 * \return IVI_SUCCEEDED if the method call was successful
-+	 * \return IVI_FAILED if the method call was failed
-+	 */
-+	int32_t (*screen_remove_layer)(struct weston_output *output,
-+				       struct ivi_layout_layer *removelayer);
- };
- 
- #ifdef __cplusplus
-diff --git a/ivi-shell/ivi-layout.c b/ivi-shell/ivi-layout.c
-index 298e18e..8e4280b 100644
---- a/ivi-shell/ivi-layout.c
-+++ b/ivi-shell/ivi-layout.c
-@@ -1664,6 +1664,27 @@ ivi_layout_screen_add_layer(struct weston_output *output,
- }
- 
- static int32_t
-+ivi_layout_screen_remove_layer(struct weston_output *output,
-+			    struct ivi_layout_layer *removelayer)
-+{
-+	struct ivi_layout_screen *iviscrn;
-+
-+	if (output == NULL || removelayer == NULL) {
-+		weston_log("ivi_layout_screen_remove_layer: invalid argument\n");
-+		return IVI_FAILED;
-+	}
-+
-+	iviscrn = get_screen_from_output(output);
-+
-+	wl_list_remove(&removelayer->pending.link);
-+	wl_list_init(&removelayer->pending.link);
-+
-+	iviscrn->order.dirty = 1;
-+
-+	return IVI_SUCCEEDED;
-+}
-+
-+static int32_t
- ivi_layout_screen_set_render_order(struct weston_output *output,
- 				   struct ivi_layout_layer **pLayer,
- 				   const int32_t number)
-@@ -2088,6 +2109,7 @@ static struct ivi_layout_interface ivi_layout_interface = {
- 	 */
- 	.get_screens_under_layer	= ivi_layout_get_screens_under_layer,
- 	.screen_add_layer		= ivi_layout_screen_add_layer,
-+	.screen_remove_layer		= ivi_layout_screen_remove_layer,
- 	.screen_set_render_order	= ivi_layout_screen_set_render_order,
- 
- 	/**
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
index 8d285fa..32901db 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
@@ -1,7 +1,7 @@
-From 9c3cf93336b77a1eecc1d72ffec3b113161a822b Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Mon, 12 Mar 2018 10:54:45 +0530
-Subject: [PATCH 3/4] weston: Fix virtual keyboard display issue for QT5
+From 8034bc1862bbebb332e91917c6458ef8efb5b54e Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 8 Mar 2019 18:49:07 -0500
+Subject: [PATCH] weston: Fix virtual keyboard display issue for QT5 
  application
 
 The virtual keyboard does pop up as expected, however, it will never hide
@@ -20,20 +20,19 @@ becomes visible at the first time.
 Upstream status: Pending
 
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
 ---
  compositor/text-backend.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/compositor/text-backend.c b/compositor/text-backend.c
-index bf5c45c..d8b0bb1 100644
+index 664c36f..b610dfb 100644
 --- a/compositor/text-backend.c
 +++ b/compositor/text-backend.c
-@@ -340,6 +340,7 @@ text_input_show_input_panel(struct wl_client *client,
+@@ -349,6 +349,7 @@ text_input_show_input_panel(struct wl_client *client,
  			       text_input->surface);
  		wl_signal_emit(&ec->update_input_panel_signal,
  			       &text_input->cursor_rectangle);
-+		text_input->manager->current_panel = text_input;
++		text_input->manager->current_text_input = text_input;
  	}
  }
  
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index 82db6d1..68e53cc 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -2,18 +2,16 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago29"
+PR_append = ".arago30"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-#        file://0001-ivi-shell-add_screen_remove_layer-API.patch
-#        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
-
 SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
+	file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
 "
 
-- 
1.9.1


