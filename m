Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EDA1F52AA7
	for <meta-arago@arago-project.org>;
	Thu,  2 Mar 2017 19:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 32A2120B64;
	Thu,  2 Mar 2017 19:17:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vsTUgOiUmpJ8; Thu,  2 Mar 2017 19:17:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13B762088F;
	Thu,  2 Mar 2017 19:17:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5FF531623A0;
	Thu,  2 Mar 2017 14:17:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 14:17:00 -0500
Message-Id: <1488482220-77911-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] weston: update customizations to 2.0.0
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
X-List-Received-Date: Thu, 02 Mar 2017 19:17:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-conf_1.11.1.bb  | 21 ---------------------
 .../recipes-graphics/wayland/weston-conf_2.0.0.bb   | 21 +++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.11.1.bbappend | 20 --------------------
 .../recipes-graphics/wayland/weston_2.0.0.bbappend  | 20 ++++++++++++++++++++
 4 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-conf_2.0.0.bb
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb
deleted file mode 100644
index 16cac2b..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Weston configuration files"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r2"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "file://wayland_env.sh \
-           file://weston.ini \
-"
-
-# Add custom Arago Wayland Environment script file
-do_install () {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
-}
-
-FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_2.0.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_2.0.0.bb
new file mode 100644
index 0000000..16cac2b
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf_2.0.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Weston configuration files"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r2"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "file://wayland_env.sh \
+           file://weston.ini \
+"
+
+# Add custom Arago Wayland Environment script file
+do_install () {
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+}
+
+FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend
deleted file mode 100644
index d0691ad..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.1.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# When configured for fbdev compositor, make it the default
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
-
-PR_append = ".arago16"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-RDEPENDS_${PN} += "weston-conf"
-
-#SRC_URI += " \
-#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
-#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
-#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
-#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
-#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-#	file://0001-Add-soc-performance-monitor-utilites.patch \
-#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
-#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
-#"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
new file mode 100644
index 0000000..d0691ad
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
@@ -0,0 +1,20 @@
+# When configured for fbdev compositor, make it the default
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
+
+PR_append = ".arago16"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+RDEPENDS_${PN} += "weston-conf"
+
+#SRC_URI += " \
+#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
+#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
+#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
+#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
+#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+#	file://0001-Add-soc-performance-monitor-utilites.patch \
+#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
+#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
+#"
-- 
2.7.4


