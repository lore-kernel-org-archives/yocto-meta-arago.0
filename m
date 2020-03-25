Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B663552A15
	for <meta-arago@arago-project.org>;
	Wed, 25 Mar 2020 06:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF21240BFB;
	Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VkNdhB9IHDGa; Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A50A540AB5;
	Wed, 25 Mar 2020 06:03:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4DDCF1712AC;
	Wed, 25 Mar 2020 02:03:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 25 Mar 2020 02:03:12 -0400
Message-Id: <1585116194-34727-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] gstreamer-plugins-bad: add support for meson build of drmallocator and kms/waylandsink
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

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...rm-kms-add-support-for-meson-build-system.patch | 140 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend       |  15 +--
 2 files changed, 146 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-add-support-for-meson-build-system.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-add-support-for-meson-build-system.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-add-support-for-meson-build-system.patch
new file mode 100644
index 0000000..ccb0797
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-add-support-for-meson-build-system.patch
@@ -0,0 +1,140 @@
+From dc24c3386701639d8ba04451bb40317f36cbce0a Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 24 Mar 2020 21:26:07 -0400
+Subject: [PATCH] wayland,drm,kms: add support for meson build system
+
+Upstream-Status: Inappropriate [depends on drmallocator and kms/waylandsink patches in meta-arago]
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ ext/wayland/meson.build                   |  4 +++-
+ gst-libs/gst/drm/meson.build              | 25 +++++++++++++++++++++++++
+ gst-libs/gst/meson.build                  |  1 +
+ pkgconfig/gstreamer-drm-uninstalled.pc.in |  4 ++--
+ pkgconfig/meson.build                     |  2 ++
+ sys/kms/meson.build                       |  2 +-
+ 6 files changed, 34 insertions(+), 4 deletions(-)
+ create mode 100644 gst-libs/gst/drm/meson.build
+
+diff --git a/ext/wayland/meson.build b/ext/wayland/meson.build
+index 3c377ee..294bf51 100644
+--- a/ext/wayland/meson.build
++++ b/ext/wayland/meson.build
+@@ -2,6 +2,7 @@ wl_sources = [
+     'gstwaylandsink.c',
+     'wlshmallocator.c',
+     'wlbuffer.c',
++    'wldrm.c',
+     'wldisplay.c',
+     'wlwindow.c',
+     'wlvideoformat.c',
+@@ -20,6 +21,7 @@ if use_wayland
+         ['/unstable/fullscreen-shell/fullscreen-shell-unstable-v1.xml',
+          'fullscreen-shell-unstable-v1-protocol.c', 'fullscreen-shell-unstable-v1-client-protocol.h'],
+         ['/stable/xdg-shell/xdg-shell.xml', 'xdg-shell-protocol.c', 'xdg-shell-client-protocol.h'],
++        ['/stable/wayland-drm/wayland-drm.xml', 'wayland-drm-protocol.c', 'wayland-drm-client-protocol.h'],
+     ]
+     protocols_files = []
+ 
+@@ -42,7 +44,7 @@ if use_wayland
+         c_args : gst_plugins_bad_args + ['-DGST_USE_UNSTABLE_API'],
+         include_directories : [configinc],
+         dependencies : [gst_dep, gstvideo_dep, gstwayland_dep, gstallocators_dep,
+-                        wl_client_dep, wl_protocol_dep, libdrm_dep],
++                        gstdrm_dep, wl_client_dep, wl_protocol_dep, libdrm_dep],
+         install : true,
+         install_dir : plugins_install_dir,
+     )
+diff --git a/gst-libs/gst/drm/meson.build b/gst-libs/gst/drm/meson.build
+new file mode 100644
+index 0000000..3310cc6
+--- /dev/null
++++ b/gst-libs/gst/drm/meson.build
+@@ -0,0 +1,25 @@
++gstdrm_sources = [
++  'gstdrmallocator.c',
++]
++gstdrm_headers = [
++  'gstdrmallocator.h',
++]
++install_headers(gstdrm_headers, subdir : 'gstreamer-1.0/gst/drm')
++
++libdrm_dep = dependency('libdrm', version: '>= 2.4.55', required: get_option('wayland'))
++if libdrm_dep.found()
++  gstdrm = library('gstdrm-' + api_version,
++    gstdrm_sources,
++    c_args : gst_plugins_bad_args + ['-DGST_USE_UNSTABLE_API'],
++    include_directories : [configinc, libsinc],
++    version : libversion,
++    soversion : soversion,
++    darwin_versions : osxversion,
++    install : true,
++    dependencies : [gstbase_dep, gstallocators_dep, libdrm_dep],
++  )
++
++  gstdrm_dep = declare_dependency(link_with : gstdrm,
++    include_directories : [libsinc],
++    dependencies : [gstbase_dep, gstallocators_dep, libdrm_dep])
++endif
+diff --git a/gst-libs/gst/meson.build b/gst-libs/gst/meson.build
+index 5d90a91..e069327 100644
+--- a/gst-libs/gst/meson.build
++++ b/gst-libs/gst/meson.build
+@@ -4,6 +4,7 @@ subdir('adaptivedemux')
+ subdir('audio')
+ subdir('basecamerabinsrc')
+ subdir('codecparsers')
++subdir('drm')
+ subdir('insertbin')
+ subdir('interfaces')
+ subdir('isoff')
+diff --git a/pkgconfig/gstreamer-drm-uninstalled.pc.in b/pkgconfig/gstreamer-drm-uninstalled.pc.in
+index 9dcf978..ec705e4 100644
+--- a/pkgconfig/gstreamer-drm-uninstalled.pc.in
++++ b/pkgconfig/gstreamer-drm-uninstalled.pc.in
+@@ -1,7 +1,7 @@
+ prefix=
+ exec_prefix=
+-libdir=${pcfiledir}/../gst-libs/gst/drm
+-includedir=${pcfiledir}/../gst-libs
++libdir=@drmlibdir@
++includedir=@abs_top_builddir@/gst-libs
+ 
+ Name: GStreamer DRM Allocator, Uninstalled
+ Description: DRM Allocator for GStreamer elements, uninstalled
+diff --git a/pkgconfig/meson.build b/pkgconfig/meson.build
+index 7ddfafb..35cd7bf 100644
+--- a/pkgconfig/meson.build
++++ b/pkgconfig/meson.build
+@@ -12,6 +12,7 @@ pkgconf.set('abs_top_builddir', join_paths(meson.current_build_dir(), '..'))
+ pkgconf.set('abs_top_srcdir', join_paths(meson.current_source_dir(), '..'))
+ pkgconf.set('audiolibdir', join_paths(meson.build_root(), gstbadaudio.outdir()))
+ pkgconf.set('codecparserslibdir', join_paths(meson.build_root(), gstcodecparsers.outdir()))
++pkgconf.set('drmlibdir', join_paths(meson.build_root(), gstdrm.outdir()))
+ pkgconf.set('insertbinlibdir', join_paths(meson.build_root(), gstinsertbin.outdir()))
+ pkgconf.set('mpegtslibdir', join_paths(meson.build_root(), gstmpegts.outdir()))
+ pkgconf.set('playerlibdir', join_paths(meson.build_root(), gstplayer.outdir()))
+@@ -24,6 +25,7 @@ pkg_install_dir = '@0@/pkgconfig'.format(get_option('libdir'))
+ pkg_libs = [
+   'bad-audio',
+   'codecparsers',
++  'drm',
+   'insertbin',
+   'mpegts',
+   'player',
+diff --git a/sys/kms/meson.build b/sys/kms/meson.build
+index fbc1861..0a000fd 100644
+--- a/sys/kms/meson.build
++++ b/sys/kms/meson.build
+@@ -11,7 +11,7 @@ if libdrm_dep.found()
+     kmssink_sources,
+     c_args : gst_plugins_bad_args,
+     include_directories : [configinc],
+-    dependencies : [gstbase_dep, gstvideo_dep, gstallocators_dep, libdrm_dep],
++    dependencies : [gstbase_dep, gstvideo_dep, gstallocators_dep, gstdrm_dep, libdrm_dep],
+     install : true,
+     install_dir : plugins_install_dir,
+   )
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index b7b9efe..6c2509f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -1,13 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG = "faad"
-PACKAGECONFIG += "kms"
-
-# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
-PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_k3 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+PACKAGECONFIG_append = " faad kms"
+PACKAGECONFIG_remove_keystone = "wayland"
 
 DEPENDS_append_omap-a15 = " \
     libdrm \
@@ -31,6 +25,7 @@ SRC_URI_append_ti43x = " \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
+    file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -43,6 +38,7 @@ SRC_URI_append_omap-a15 = " \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
+    file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
 "
 
 SRC_URI_append_k3 = " \
@@ -51,8 +47,9 @@ SRC_URI_append_k3 = " \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
+    file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = ".arago1"
+PR_append = ".arago2"
-- 
2.7.4


