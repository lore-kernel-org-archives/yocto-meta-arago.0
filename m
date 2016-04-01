Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id C98E252A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:07 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X0083ARLQ9Q60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Hhnvr_mBrtSQBJpyRTwA:9
	a=bPdDZHsl8-vmVcV6:21 a=CRBI1WgDAkXwiEA5:21
Received: by 100.15.86.14 with SMTP id 38836506; Fri, 01 Apr 2016 03:41:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B3671161F5A;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:22 -0400
Message-id: <1459482106-27723-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/26] gstreamer: remove outdated 0.10.x version, no longer in oe-core
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bbappend          |  5 ---
 .../gst-plugins-bad-mm-accel_0.10.23.bbappend      |  9 ----
 ...k-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch | 29 ------------
 ...ink-fixing-calculation-of-bytes-per-pixel.patch | 52 ----------------------
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     | 15 -------
 .../gst-plugins-good-mm-accel_0.10.31.bbappend     |  6 ---
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |  6 ---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  | 47 -------------------
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb | 45 -------------------
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb | 47 -------------------
 .../gstreamer/gst-plugins-package-mm-accel.inc     | 17 -------
 .../gstreamer/gstreamer-mm-accel.inc               |  9 ----
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb        | 41 -----------------
 13 files changed, 328 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
deleted file mode 100644
index ca5a52a..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# Select the non GPLv3 license option for distribution of this plugin with our
-# SDK
-LICENSE = "GPLv2+ & LGPLv2+ & (GPLv2+ & LGPLv2.1+)"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
deleted file mode 100644
index e6d72ba..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-PR_append = "-arago0"
-
-PACKAGECONFIG = "bzip curl faad"
-
-# Disable features that have potential commercial licensing restrictions
-EXTRA_OECONF += "\
-    --disable-mpeg2enc \
-    --disable-acm \
-"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
deleted file mode 100644
index 5905591..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ec785d544f417aa2d88f8803e4392ff02ab424ae Mon Sep 17 00:00:00 2001
-From: Punya Prakash <pprakash@ti.com>
-Date: Fri, 4 Nov 2011 13:03:57 -0500
-Subject: [PATCH]  gstfbdevsink: Fix depth value for GST_VIDEO_CAPS_RGB_15
-
-RGB color format does not have any alpha components, adding alpha length to depth could yield wrong results.
-
-Upstream-Status: Pending
-
-Signed-off-by: Punya Prakash <pprakash@ti.com>
----
- sys/fbdev/gstfbdevsink.c |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/sys/fbdev/gstfbdevsink.c b/sys/fbdev/gstfbdevsink.c
-index 8925f3d..568f091 100644
---- a/sys/fbdev/gstfbdevsink.c
-+++ b/sys/fbdev/gstfbdevsink.c
-@@ -185,8 +185,7 @@ gst_fbdevsink_getcaps (GstBaseSink * bsink)
-       "bpp", G_TYPE_INT, fbdevsink->varinfo.bits_per_pixel,
-       "depth", G_TYPE_INT, fbdevsink->varinfo.red.length +
-       fbdevsink->varinfo.green.length +
--      fbdevsink->varinfo.blue.length +
--      fbdevsink->varinfo.transp.length,
-+      fbdevsink->varinfo.blue.length,
-       "endianness", G_TYPE_INT, endianness,
-       "red_mask", G_TYPE_INT, rmask,
-       "green_mask", G_TYPE_INT, gmask, "blue_mask", G_TYPE_INT, bmask, NULL);
--- 
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
deleted file mode 100644
index 0b417db..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 76fc77de1d38b6a41585898e16dc259bbfbb50d3 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Wed, 20 Nov 2013 15:23:51 -0600
-Subject: [PATCH] sys/fbdevsink:  fixing calculation of bytes per pixel
-
-Original method will only work where there xres is identical to the
-physically allocated buffer size.  On omapdss this is unlikely to be true
-because of the way buffers are allocated out of a much larger buffer in
-3 dimensions - meaning there often be a stride (or pitch) for each line.
-Changing the method of figuring out the bytes per pixel to a method that
-should work in all circumstances.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- sys/fbdev/gstfbdevsink.c | 21 ++++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/sys/fbdev/gstfbdevsink.c b/sys/fbdev/gstfbdevsink.c
-index 7878fbf..aacef5e 100644
---- a/sys/fbdev/gstfbdevsink.c
-+++ b/sys/fbdev/gstfbdevsink.c
-@@ -213,7 +213,26 @@ gst_fbdevsink_setcaps (GstBaseSink * bsink, GstCaps * vscapslist)
-   gst_structure_get_int (structure, "height", &fbdevsink->height);
- 
-   /* calculate centering and scanlengths for the video */
--  fbdevsink->bytespp = fbdevsink->fixinfo.line_length / fbdevsink->varinfo.xres;
-+  switch(fbdevsink->varinfo.bits_per_pixel) {
-+    case 8:
-+      fbdevsink->bytespp = 1;
-+      break;
-+    case 15:
-+    case 16:
-+      fbdevsink->bytespp = 2;
-+      break;
-+    case 24:
-+      fbdevsink->bytespp = 3;
-+      break;
-+    case 32:
-+      fbdevsink->bytespp = 4;
-+      break;
-+    default:
-+      /* other bit depths are not supported */
-+      g_warning ("unsupported bit depth: %d\n",
-+          fbdevsink->varinfo.bits_per_pixel);
-+      return FALSE;
-+  }
- 
-   fbdevsink->cx = ((int) fbdevsink->varinfo.xres - fbdevsink->width) / 2;
-   if (fbdevsink->cx < 0)
--- 
-1.8.3.2
-
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
deleted file mode 100644
index f40fe85..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-PR_append = "-arago5"
-
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch \
-            file://0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch"
-
-PACKAGECONFIG = "bzip curl faad"
-
-# Disable features that have potential commercial licensing restrictions
-EXTRA_OECONF += "\
-    --disable-mpeg2enc \
-    --disable-acm \
-"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
deleted file mode 100644
index 4cb0608..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append = "-arago0"
-
-DEPENDS := "${@oe_filter_out('gconf','${DEPENDS}', d)}"
-DEPENDS := "${@oe_filter_out('gconf-native','${DEPENDS}', d)}"
-
-EXTRA_OECONF += "--disable-gconftool --disable-gconf"
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
deleted file mode 100644
index c87197d..0000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append = "-arago2"
-
-DEPENDS := "${@oe_filter_out('gconf','${DEPENDS}', d)}"
-DEPENDS := "${@oe_filter_out('gconf-native','${DEPENDS}', d)}"
-
-EXTRA_OECONF += "--disable-gconftool --disable-gconf"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
deleted file mode 100644
index e8fa1be..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-# Include the base gst-plugins-bad recipe since this recipe is heavily
-# derived from that one.
-require recipes-multimedia/gstreamer/gst-plugins-bad_${PV}.bb
-
-require gstreamer-mm-accel.inc
-#require gst-plugins-package-mm-accel.inc
-
-DESCRIPTION = "GStreamer bad plugins that use multimedia accelerators found on \
-               TI devices"
-
-PN = "gst-plugins-bad"
-B = "${S}"
-
-# Set PROVIDES and RPROVIDES values so that the base recipe names can still
-# be used and PREFERRED_PROVIDER can be used to pick between them.
-PROVIDES += "gst-plugins-bad"
-RPROVIDES_${PN} += "gst-plugins-bad"
-RPROVIDES_${PN}-dev += "gst-plugins-bad-dev"
-RPROVIDES_${PN}-meta += "gst-plugins-bad-meta"
-RREPLACES_${PN} += "gst-plugins-bad"
-RREPLACES_${PN}-dev += "gst-plugins-bad-dev"
-RREPLACES_${PN}-meta += "gst-plugins-bad-meta"
-RCONFLICTS_${PN} += "gst-plugins-bad"
-RCONFLICTS_${PN}-dev += "gst-plugins-bad-dev"
-RCONFLICTS_${PN}-meta += "gst-plugins-bad-meta"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS += "virtual/libgles2 virtual/egl libdce libdrm wayland"
-
-SRCREV = "a9510bef52331fee9a23a5c955dbf76ac210056a"
-SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += " --disable-pvr"
-
-do_configure_prepend() {
-	cd ${S}
-	autopoint -f
-}
-
-do_install_prepend() {
-	cd ${S}
-}
-
-FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-bad-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
deleted file mode 100644
index 0748a58..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# Include the base gst-plugins-base recipe since this recipe is heavily
-# derived from that one.
-require recipes-multimedia/gstreamer/gst-plugins-base_${PV}.bb
-
-require gstreamer-mm-accel.inc
-#require gst-plugins-package-mm-accel.inc
-
-DESCRIPTION = "GStreamer base plugins that use multimedia accelerators found \
-               on TI devices"
-
-PN = "gst-plugins-base"
-B = "${S}"
-
-# Set PROVIDES and RPROVIDES values so that the base recipe names can still
-# be used and PREFERRED_PROVIDER can be used to pick between them.
-PROVIDES += "gst-plugins-base"
-RPROVIDES_${PN} += "gst-plugins-base"
-RPROVIDES_${PN}-dev += "gst-plugins-base-dev"
-RPROVIDES_${PN}-meta += "gst-plugins-base-meta"
-RREPLACES_${PN} += "gst-plugins-base"
-RREPLACES_${PN}-dev += "gst-plugins-base-dev"
-RREPLACES_${PN}-meta += "gst-plugins-base-meta"
-RCONFLICTS_${PN} += "gst-plugins-base"
-RCONFLICTS_${PN}-dev += "gst-plugins-base-dev"
-RCONFLICTS_${PN}-meta += "gst-plugins-base-meta"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
-SRCREV = "3427e885daa749275e07339d3633b83c717aa419"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	cd ${S}
-	autopoint -f
-}
-
-do_install_prepend() {
-	cd ${S}
-}
-
-EXTRA_OECONF +="--disable-ivorbis "
-
-FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
deleted file mode 100644
index dcce5fd..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-# Include the base gst-plugins-bad recipe since this recipe is heavily
-# derived from that one.
-require recipes-multimedia/gstreamer/gst-plugins-good_${PV}.bb
-
-require gstreamer-mm-accel.inc
-#require gst-plugins-package-mm-accel.inc
-
-DESCRIPTION = "GStreamer good plugins that use multimedia accelerators found \
-               on TI devices"
-
-PN = "gst-plugins-good"
-B = "${S}"
-
-# Set PROVIDES and RPROVIDES values so that the base recipe names can still
-# be used and PREFERRED_PROVIDER can be used to pick between them.
-PROVIDES += "gst-plugins-good"
-RPROVIDES_${PN} += "gst-plugins-good"
-RPROVIDES_${PN}-dev += "gst-plugins-good-dev"
-RPROVIDES_${PN}-meta += "gst-plugins-good-meta"
-RREPLACES_${PN} += "gst-plugins-good"
-RREPLACES_${PN}-dev += "gst-plugins-good-dev"
-RREPLACES_${PN}-meta += "gst-plugins-good-meta"
-RCONFLICTS_${PN} += "gst-plugins-good"
-RCONFLICTS_${PN}-dev += "gst-plugins-good-dev"
-RCONFLICTS_${PN}-meta += "gst-plugins-good-meta"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
-SRCREV = "a44097d542f2bf219ac9dc3ef2372e58d769a8f9"
-
-# Fix compile errors with recent kernels
-SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
-                   file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	cd ${S}
-	autopoint -f
-}
-
-do_install_prepend() {
-	cd ${S}
-}
-
-FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-good-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
deleted file mode 100644
index b7b5a50..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-python split_gstreamer10_packages () {
-    def gst_lib_hook(file, pkg, pattern, format, basename):
-        pkglist = " lib" + basename + " lib" + basename + "-0"
-        d.setVar("DEBIAN_NOAUTONAME_" + pkg, "1")
-        d.appendVar("RPROVIDES_" + pkg, pkglist)
-        d.appendVar("RREPLACES_" + pkg, pkglist)
-        d.appendVar("RCONFLICTS_" + pkg, pkglist)
-
-    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
-    postinst = d.getVar('plugin_postinst', True)
-    glibdir = d.getVar('libdir', True)
-
-    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True, hook=gst_lib_hook)
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
-}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
deleted file mode 100644
index d9874b4..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-# This recipe is not valid when not using accelerated multimedia IP
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    pkgn = bb.data.getVar("PN", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('%s needs dependencies derived from "mmip" flag in MACHINE_FEATURES' % pkgn)
-}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
deleted file mode 100644
index f50d0a3..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require gstreamer-mm-accel.inc
-
-# Include the base gst-plugins-bad recipe since this recipe is heavily
-# derived from that one.
-require recipes-multimedia/gstreamer/gstreamer_${PV}.bb
-
-DESCRIPTION = "GStreamer that use multimedia accelerators found on TI devices"
-
-PN = "gstreamer"
-B = "${S}"
-
-# Set PROVIDES and RPROVIDES values so that the base recipe names can still
-# be used and PREFERRED_PROVIDER can be used to pick between them.
-PROVIDES += "gstreamer"
-RPROVIDES_${PN} += "gstreamer"
-RPROVIDES_${PN}-dev += "gstreamer-dev"
-RPROVIDES_${PN}-dbg += "gstreamer-dbg"
-RREPLACES_${PN} += "gstreamer"
-RREPLACES_${PN}-dev += "gstreamer-dev"
-RREPLACES_${PN}-dbg += "gstreamer-dbg"
-RCONFLICTS_${PN} += "gstreamer"
-RCONFLICTS_${PN}-dev += "gstreamer-dev"
-RCONFLICTS_${PN}-dbg += "gstreamer-dbg"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "gitsm://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
-SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-	cd ${S}
-	autopoint -f
-}
-
-do_install_prepend() {
-	cd ${S}
-}
-
-FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gstreamer-${PV}"
-- 
2.2.0


