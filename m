Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BA58052A54
	for <meta-arago@arago-project.org>;
	Wed, 25 Mar 2020 06:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9B9640A35;
	Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EbSBhDv23vy7; Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9DCF40AEE;
	Wed, 25 Mar 2020 06:03:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 690DE1718EA;
	Wed, 25 Mar 2020 02:03:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 25 Mar 2020 02:03:14 -0400
Message-Id: <1585116194-34727-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585116194-34727-1-git-send-email-denys@ti.com>
References: <1585116194-34727-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/3] wayland/weston: cleanup and simplify
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
X-List-Received-Date: Wed, 25 Mar 2020 06:05:28 -0000

* Merge weston-config into weston-init
* Drop local overrides
* Avoid machine-specific changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf            |  1 -
 .../recipes-graphics/wayland/weston-conf_8.0.0.bb   | 21 ---------------------
 .../recipes-graphics/wayland/weston-init.bbappend   | 13 +++++++++----
 .../{weston-conf => weston-init}/ti43x/weston.ini   |  0
 .../{weston-conf => weston-init}/wayland_env.sh     |  0
 .../wayland/{weston-conf => weston-init}/weston.ini |  0
 .../recipes-graphics/wayland/weston_8.0.0.bbappend  |  8 +-------
 .../wayland/wayland-protocols_%.bbappend            | 11 +++++------
 8 files changed, 15 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf => weston-init}/ti43x/weston.ini (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf => weston-init}/wayland_env.sh (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf => weston-init}/weston.ini (100%)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ac20a83..3215fe7 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -95,7 +95,6 @@ DISTRO_FEATURES_append = "${@[""," systemd"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
 QT_PROVIDER ?= "qt5"
 
 # Distro-specific package configuration
-PACKAGECONFIG_pn-weston = "egl kms launch clients"
 PACKAGECONFIG_append_pn-systemd = " coredump"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb
deleted file mode 100644
index 16cac2b..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf_8.0.0.bb
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index cbe0fe3..55b191e 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,15 +1,20 @@
-PR_append = ".arago9"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+PR_append = ".arago10"
+
 SRC_URI_append = " \
     file://runWeston \
+    file://wayland_env.sh \
+    file://weston.ini \
 "
 
 do_install_append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
-    rm -rf ${D}${systemd_system_unitdir}
+
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
 }
 
-SYSTEMD_SERVICE_${PN} = ""
+FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
rename to meta-arago-distro/recipes-graphics/wayland/weston-init/ti43x/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
rename to meta-arago-distro/recipes-graphics/wayland/weston-init/wayland_env.sh
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
rename to meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
index 7a937f0..006579b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_8.0.0.bbappend
@@ -1,10 +1,6 @@
-PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/libgbm mtdev"
-
-PR_append = ".arago2"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-RDEPENDS_${PN} += "weston-conf"
+PR_append = ".arago3"
 
 #        file://0002-weston-Allow-visual_id-to-be-0.patch
 SRC_URI += " \
@@ -12,5 +8,3 @@ SRC_URI += " \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
         file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
 "
-
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
index 7edd850..c7803c3 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbappend
@@ -1,12 +1,11 @@
-PR_append = ".arago1"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += " \
-      file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
-      "
+PR_append = ".arago2"
 
-SRC_URI_append_j7-evm = "file://0002-wayland-drm-Update-to-version-2.patch"
+SRC_URI += " \
+    file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
+    file://0002-wayland-drm-Update-to-version-2.patch \
+"
 
 do_install_append() {
 	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
-- 
2.7.4


