Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 2DC87529EB
	for <meta-arago@arago-project.org>;
	Wed, 23 Mar 2016 19:55:26 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4I002J1CNYJN50@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Mar 2016 14:55:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=J-cvokYdAbQs4B8rR7MA:9
Received: by 100.15.86.14 with SMTP id 1f76c848; Wed, 23 Mar 2016 19:55:10 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C88EF161F53;	Wed,
	23 Mar 2016 15:55:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Mar 2016 15:55:09 -0400
Message-id: <1458762909-27276-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: drop version 1.6 customizations
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
X-List-Received-Date: Wed, 23 Mar 2016 19:55:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |  5 --
 ...v-seat-restrict-udev-enumeration-to-card0.patch | 37 -------------
 ...abling-DRM-backend-with-multiple-displays.patch | 60 ----------------------
 .../wayland/weston-1.6.0/ti43x/weston.ini          | 13 -----
 .../wayland/weston-1.6.0/wayland_env.sh            | 13 -----
 .../wayland/weston-1.6.0/weston.ini                | 10 ----
 .../recipes-graphics/wayland/weston_1.6.0.bbappend | 25 ---------
 7 files changed, 163 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e301bad..8acd156 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -102,11 +102,6 @@ PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_VERSION_elfutils = "0.148"
 PREFERRED_VERSION_m4 = "1.4.9"
 
-PREFERRED_PROVIDER_weston-conf = "weston"
-PREFERRED_VERSION_wayland = "1.6.0"
-PREFERRED_VERSION_weston = "1.6.0"
-PREFERRED_VERSION_libinput = "0.7.0"
-
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
deleted file mode 100644
index 515f06c..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e8e7a9f7dfa164a75fdbdca87622a2e13334478a Mon Sep 17 00:00:00 2001
-From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sat, 23 Jan 2016 22:48:07 +0530
-Subject: [PATCH 1/1] udev-seat: restrict udev enumeration to card0
-
-In case of separate GPU and Display devices as found in embedded systems, we
-could have modeset node and render node controlled by different drivers.
-There is a distinct possibility that udev enumeration returns the DRM device
-corresponding to render node as the primary DRM device.
-
-Obviously, modeset operations cannot be done on the GPU DRM device.
-
-Restrict the udev enumeration to card0 and ensure that DRM device corresponding
-to display is returned as the primary DRM device.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
----
- src/compositor-drm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index 6777bf8..59c2cc5 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -2827,7 +2827,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
-
-	e = udev_enumerate_new(b->udev);
-	udev_enumerate_add_match_subsystem(e, "drm");
--	udev_enumerate_add_match_sysname(e, "card[0-9]*");
-+	udev_enumerate_add_match_sysname(e, "card0");
-
-	udev_enumerate_scan_devices(e);
-	drm_device = NULL;
---
-1.7.9.5
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
deleted file mode 100644
index 2f215c9..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b1829ce962aa4e13d737edb54130bdce05f068f0 Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Wed, 17 Dec 2014 09:21:49 +0530
-Subject: [PATCH] weston: Enabling DRM backend with multiple displays
-
-There are three main issues that this patch tries to address
-
- 1. Black screen when running weston
- 2. Support for multiple displays
- 3. Handling missing VBlanks
-
-There is an issue with missing VBlanks for LCD and
-HDMI connectors which leads to display not getting refreshed.
-This patch can be considered as a workaround.
-
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- src/compositor-drm.c |   10 ++++++++--
- 1 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index e4496e7..3b22aa3 100644
---- a/src/compositor-drm.c
-+++ b/src/compositor-drm.c
-@@ -646,7 +646,7 @@ drm_output_repaint(struct weston_output *output_base,
- 			.request.sequence = 1,
- 		};
- 
--		if ((!s->current && !s->next) ||
-+		if ((!s->current && !s->next) &&
- 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
- 			continue;
- 
-@@ -757,6 +757,7 @@ page_flip_handler(int fd, unsigned int frame,
- {
- 	struct drm_output *output = (struct drm_output *) data;
- 	uint32_t msecs;
-+	uint32_t bail;
- 
- 	/* We don't set page_flip_pending on start_repaint_loop, in that case
- 	 * we just want to page flip to the current buffer to get an accurate
-@@ -769,9 +770,14 @@ page_flip_handler(int fd, unsigned int frame,
- 
- 	output->page_flip_pending = 0;
- 
-+	if(output->vblank_pending) {
-+		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
-+		bail = 1;
-+	}
-+
- 	if (output->destroy_pending)
- 		drm_output_destroy(&output->base);
--	else if (!output->vblank_pending) {
-+	else if (!output->vblank_pending || bail ) {
- 		msecs = sec * 1000 + usec / 1000;
- 		weston_output_finish_frame(&output->base, msecs);
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
deleted file mode 100644
index b2b7927..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
+++ /dev/null
@@ -1,13 +0,0 @@
-[shell]
-locking=false
-animation=zoom
-panel-location=top
-startup-animation=fade
-
-[screensaver]
-# Uncomment path to disable screensaver
-#path=@libexecdir@/weston-screensaver
-
-[output]
-name=HDMI1
-mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
deleted file mode 100644
index b885337..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-### Wayland Environment Variables ###
-
-export XDG_CONFIG_HOME=/etc/
-export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
-export WAYLAND_DISPLAY=wayland-0
-export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
-
-if ! test -d "${XDG_RUNTIME_DIR}"; then
-       mkdir -p "${XDG_RUNTIME_DIR}"
-       chmod 0700 "${XDG_RUNTIME_DIR}"
-fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
deleted file mode 100644
index 615a604..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
+++ /dev/null
@@ -1,10 +0,0 @@
-[shell]
-locking=false
-animation=zoom
-panel-location=top
-startup-animation=fade
-
-[screensaver]
-# Uncomment path to disable screensaver
-#path=@libexecdir@/weston-screensaver
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
deleted file mode 100644
index 916ab88..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ /dev/null
@@ -1,25 +0,0 @@
-# When configured for fbdev compositor, make it the default
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
-
-PR_append = "-arago10"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:${THISDIR}/${PN}:"
-
-SRC_URI += "file://wayland_env.sh \
-            file://weston.ini \
-            file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
-            file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-"
-
-# Add custom Arago Wayland Environment script file
-do_install_append () {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
-}
-
-PACKAGES += "${PN}-conf"
-
-FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
-RDEPENDS_${PN} += "${PN}-conf"
-- 
2.2.0


