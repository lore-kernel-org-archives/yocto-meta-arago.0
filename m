Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id B2F1852A99
	for <meta-arago@arago-project.org>;
	Mon, 21 Mar 2016 14:01:03 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4E00EB76WZNU00@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 21 Mar 2016 09:00:41 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=8YnOVwpM6UxGpxCkZ9sA:9
Received: by 100.15.86.14 with SMTP id 2c0fded1; Mon, 21 Mar 2016 14:00:41 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6AA5E161F39;	Mon,
	21 Mar 2016 10:00:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 21 Mar 2016 10:00:35 -0400
Message-id: <1458568835-22956-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: revive 1.6.0 while HDMI frame tearing/duplication is resolved
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
X-List-Received-Date: Mon, 21 Mar 2016 14:01:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

[LCPD-6378]

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  9 +-------
 .../conf/distro/include/arago-prefs.inc            |  4 ++++
 ...abling-DRM-backend-with-multiple-displays.patch |  0
 .../wayland/weston-1.6.0/wayland_env.sh            | 13 ++++++++++++
 .../wayland/weston-1.6.0/weston.ini                | 10 +++++++++
 .../recipes-graphics/wayland/weston_1.6.0.bbappend | 24 ++++++++++++++++++++++
 6 files changed, 52 insertions(+), 8 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston => weston-1.6.0}/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch (100%)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 526e1a9..88aa6df 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -41,14 +41,7 @@ GST_PROVIDER ?= "1.0"
 QT_PROVIDER ?= "qt5"
 
 # Distro-specific package configuration
-PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
-PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
-PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
-PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
-PACKAGECONFIG_append_pn-weston_ti33x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti33x    = "fbdev"
-
+PACKAGECONFIG_pn-weston = "egl kms launch libinput"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8acd156..b09bbba 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -102,6 +102,10 @@ PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_VERSION_elfutils = "0.148"
 PREFERRED_VERSION_m4 = "1.4.9"
 
+PREFERRED_PROVIDER_weston-conf = "weston"
+PREFERRED_VERSION_wayland = "1.6.0"
+PREFERRED_VERSION_weston = "1.6.0"
+
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
rename to meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-weston-Enabling-DRM-backend-with-multiple-displays.patch
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
new file mode 100644
index 0000000..b885337
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/wayland_env.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+### Wayland Environment Variables ###
+
+export XDG_CONFIG_HOME=/etc/
+export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
+export WAYLAND_DISPLAY=wayland-0
+export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
+
+if ! test -d "${XDG_RUNTIME_DIR}"; then
+       mkdir -p "${XDG_RUNTIME_DIR}"
+       chmod 0700 "${XDG_RUNTIME_DIR}"
+fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
new file mode 100644
index 0000000..615a604
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/weston.ini
@@ -0,0 +1,10 @@
+[shell]
+locking=false
+animation=zoom
+panel-location=top
+startup-animation=fade
+
+[screensaver]
+# Uncomment path to disable screensaver
+#path=@libexecdir@/weston-screensaver
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
new file mode 100644
index 0000000..45e7024
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -0,0 +1,24 @@
+# When configured for fbdev compositor, make it the default
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
+
+PR_append = "-arago7"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:${THISDIR}/${PN}:"
+
+SRC_URI += "file://wayland_env.sh \
+            file://weston.ini \
+            file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
+"
+
+# Add custom Arago Wayland Environment script file
+do_install_append () {
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+}
+
+PACKAGES += "${PN}-conf"
+
+FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
+RDEPENDS_${PN} += "${PN}-conf"
-- 
2.2.0


