Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8216652988
	for <meta-arago@arago-project.org>;
	Sun, 12 Apr 2020 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BAA4940C11;
	Sun, 12 Apr 2020 20:49:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TneNqLA-mkvm; Sun, 12 Apr 2020 20:49:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D8B1409E7;
	Sun, 12 Apr 2020 20:49:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F41541724AB;
	Sun, 12 Apr 2020 16:49:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 12 Apr 2020 16:49:28 -0400
Message-Id: <1586724568-8292-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gstreamer-plugins: disable all graphics PACKAGECONFIGs for gpu-less platforms
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
X-List-Received-Date: Sun, 12 Apr 2020 20:51:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Do it in distro bbappends, while making packages machine-specific.
In the future look into a separate gpu-less package feed with proper tunes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              |  9 ---------
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend          |  6 ++++++
 .../gstreamer1.0-plugins-base_1.16.%.bbappend         |  6 ++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend         |  6 ++++++
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend          | 19 +------------------
 .../gstreamer1.0-plugins-good_1.16.%.bbappend         |  6 ++++--
 6 files changed, 23 insertions(+), 29 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c4873e0..deaa42b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -126,15 +126,6 @@ PACKAGECONFIG_append_pn-qtwayland = " examples"
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
 PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
 
-# No GFX on Keystone or OMAPL1
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-base_keystone = "wayland egl gles2"
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-good_keystone = "wayland egl gles2"
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-bad_keystone = "wayland egl gles2"
-
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-base_omapl1 = "wayland egl gles2"
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-good_omapl1 = "wayland egl gles2"
-PACKAGECONFIG_remove_pn-gstreamer1.0-plugins-bad_omapl1 = "wayland egl gles2"
-
 PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 
 # Enable U-boot OPTEE config for K3
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
new file mode 100644
index 0000000..5f6374a
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -0,0 +1,6 @@
+# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
+PACKAGECONFIG_remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR_append = ".0"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
new file mode 100644
index 0000000..5f6374a
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
@@ -0,0 +1,6 @@
+# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
+PACKAGECONFIG_remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR_append = ".0"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
new file mode 100644
index 0000000..5f6374a
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -0,0 +1,6 @@
+# Remove all GFX PACKAGECONFIGs for platforms w/o GPU
+PACKAGECONFIG_remove = "${@bb.utils.contains('MACHINE_FEATURES','gpu','','x11 wayland gl egl gles2 qt5',d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR_append = ".0"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 6c2509f..6722fca 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -1,23 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG_append = " faad kms"
-PACKAGECONFIG_remove_keystone = "wayland"
-
-DEPENDS_append_omap-a15 = " \
-    libdrm \
-"
-
-DEPENDS_append_ti43x = " \
-    libdrm \
-"
-
-DEPENDS_append_ti33x = " \
-    libdrm \
-"
-
-DEPENDS_append_k3 = " \
-    libdrm \
-"
 
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
@@ -52,4 +35,4 @@ SRC_URI_append_k3 = " \
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = ".arago2"
+PR_append = ".arago3"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
index c5a41ba..004a996 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -1,10 +1,12 @@
-PR_append = ".arago1"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+PACKAGECONFIG_append = " qt5"
+
 SRC_URI += " \
     file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
     file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
     file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
 "
+
+PR_append = ".arago2"
-- 
2.7.4


