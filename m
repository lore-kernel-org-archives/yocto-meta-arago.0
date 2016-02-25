Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8036D529CF
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 19:34:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PJYkGp016108
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:34:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PJYjYs020539
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:34:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 13:34:45 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1PJYjD9019259	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 13:34:45 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 Feb 2016 14:34:42 -0500
Message-ID: <1456428882-25947-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Weston 1.9: Add Virtual keyboard patch
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
X-List-Received-Date: Thu, 25 Feb 2016 19:34:46 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-Fix-virtual-keyboard-display-issue-for-Q.patch | 40 ++++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
new file mode 100644
index 0000000..576b37e
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
@@ -0,0 +1,40 @@
+From 7d2f4a97306707fb29e743bf66a827e661aa5615 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 23 Feb 2016 18:26:57 -0500
+Subject: [PATCH 3/3] Weston1.9.0: Fix virtual keyboard display issue for QT5
+ application
+
+The virtual keyboard does pop up as expected, however, it will never hide
+even when the application is terminated. This problem is due to the order
+of the text APIs( text_input_activate and test_input_show_input_panel) are
+invoked in QT5 and a potential bug of the API implementation. The virtual
+keyboard works as expected if the test_input_show_input_panel() is invoked
+prior to the test_input_activate() as most of the weston sample applications
+do. However, the problem will show up if that order is reversed and the reason
+why is that the current_panel is not set in this case and hence this panel
+cannot be hidden.
+
+It is required to set the current_panel to the text_input when the input_panel
+becomes visible at the first time.
+
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/text-backend.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/text-backend.c b/src/text-backend.c
+index cd6c4d99..ba60949 100644
+--- a/src/text-backend.c
++++ b/src/text-backend.c
+@@ -338,6 +338,7 @@ text_input_show_input_panel(struct wl_client *client,
+ 			       text_input->surface);
+ 		wl_signal_emit(&ec->update_input_panel_signal,
+ 			       &text_input->cursor_rectangle);
++		text_input->manager->current_panel = text_input;
+ 	}
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index a51f134..99b6d07 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -11,5 +11,6 @@ RDEPENDS_${PN} += "weston-conf"
 SRC_URI += " \
 	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
 	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
+	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 "
-- 
1.9.1


