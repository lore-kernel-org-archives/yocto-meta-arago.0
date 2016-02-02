Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7A0E552A97
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 14:37:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12EbWVC021404
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 08:37:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12EbWZW005083
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 08:37:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 08:37:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12EbW7I024683;
	Tue, 2 Feb 2016 08:37:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQc5D-0007QY-Qq; Tue, 02 Feb 2016 09:37:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 09:37:29 -0500
Message-ID: <1454423850-28516-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] weston-conf: Add recipe for weston configuration files
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
X-List-Received-Date: Tue, 02 Feb 2016 14:37:34 -0000
Content-Type: text/plain

* This is required when configuration files differ between machines to
  keep the weston package from becoming machine-specific.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../wayland/{weston => weston-conf}/wayland_env.sh |  0
 .../wayland/{weston => weston-conf}/weston.ini     |  0
 ...{weston_1.9.0.bbappend => weston-conf_1.9.0.bb} | 22 ++++++++--------------
 .../recipes-graphics/wayland/weston_1.9.0.bbappend | 18 ++----------------
 4 files changed, 10 insertions(+), 30 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston => weston-conf}/wayland_env.sh (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston => weston-conf}/weston.ini (100%)
 copy meta-arago-distro/recipes-graphics/wayland/{weston_1.9.0.bbappend => weston-conf_1.9.0.bb} (29%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
similarity index 29%
copy from meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
copy to meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
index 4aff58d..7c22282 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
@@ -1,23 +1,17 @@
-# When configured for fbdev compositor, make it the default
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
+SUMMARY = "Weston configuration files"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR_append = "-arago0"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://wayland_env.sh \
-            file://weston.ini \
+SRC_URI = "file://wayland_env.sh \
+           file://weston.ini \
 "
 
 # Add custom Arago Wayland Environment script file
-do_install_append () {
+do_install () {
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
 }
 
-PACKAGES += "${PN}-conf"
-
-FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
-RDEPENDS_${PN} += "${PN}-conf"
+FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 4aff58d..92c143d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,22 +2,8 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://wayland_env.sh \
-            file://weston.ini \
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
+RDEPENDS_${PN} += "weston-conf"
-- 
1.9.1


