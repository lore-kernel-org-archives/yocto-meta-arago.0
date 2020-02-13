Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EF2FD52995
	for <meta-arago@arago-project.org>;
	Thu, 13 Feb 2020 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F2E640C1C;
	Thu, 13 Feb 2020 22:14:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wcDSIUpuutse; Thu, 13 Feb 2020 22:14:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D5E6409E7;
	Thu, 13 Feb 2020 22:14:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 57A7B1743FC;
	Thu, 13 Feb 2020 17:14:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 13 Feb 2020 17:13:21 -0500
Message-Id: <1581632002-56495-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581632002-56495-1-git-send-email-denis@denix.org>
References: <1581632002-56495-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/3] gstreamer1.0-plugins-bad: update to 1.16
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
X-List-Received-Date: Thu, 13 Feb 2020 22:16:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Update applicable patches, especially gst DRM allocator, needed for ti-plugins.
* Disable all waylandsink patches for now - need to be reworked later.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...gstdrmallocator-Add-DRM-allocator-support.patch | 30 ++++++++++------------
 .../0002-parsers-bug-fixes-on-parsers.patch        | 20 +++++++--------
 ...-omapdrm-and-tidss-in-the-list-of-drivers.patch | 14 +++++-----
 ...nd => gstreamer1.0-plugins-bad_1.16.%.bbappend} | 24 ++++++++---------
 4 files changed, 41 insertions(+), 47 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.4.bbappend => gstreamer1.0-plugins-bad_1.16.%.bbappend} (69%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
index af56ee6..7313123 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
@@ -1,4 +1,4 @@
-From c76b68075cbee0989ca168a08574f04d71ba61e0 Mon Sep 17 00:00:00 2001
+From 45f709bcaa243a6b503a11eb2e917f9719ea1cce Mon Sep 17 00:00:00 2001
 From: Ramprasad N <x0038811@ti.com>
 Date: Tue, 4 Dec 2018 18:56:52 +0530
 Subject: [PATCH 1/5] gstdrmallocator: Add DRM allocator support
@@ -12,6 +12,7 @@ The following changes are included :
 3. Allocate GstMemory objects with mem_type as 'dmabuf'
 
 Signed-off-by: Ramprasad N <x0038811@ti.com>
+
 ---
  configure.ac                              |   5 +
  gst-libs/gst/Makefile.am                  |   4 +-
@@ -29,27 +30,27 @@ Signed-off-by: Ramprasad N <x0038811@ti.com>
  create mode 100644 pkgconfig/gstreamer-drm.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 943412c..cb17bf3 100644
+index d29cac1..114cd89 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -208,6 +208,8 @@ AG_GST_PKG_CHECK_MODULES(GST_PBUTILS, gstreamer-pbutils-[$GST_API_VERSION], [$GS
- AG_GST_PKG_CHECK_MODULES(GST_GL, gstreamer-gl-[$GST_API_VERSION], [$GST_REQ], no)
- AG_GST_PKG_CHECK_MODULES(GST_SDP, gstreamer-sdp-[$GST_API_VERSION], [$GST_REQ], yes)
+ AG_GST_PKG_CHECK_MODULES(GST_GL, gstreamer-gl-[$GST_API_VERSION], [$GSTPB_REQ], no)
+ AG_GST_PKG_CHECK_MODULES(GST_SDP, gstreamer-sdp-[$GST_API_VERSION], [$GSTPB_REQ], yes)
  
 +PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
 +
  if test "x$HAVE_GST_GL" = "xyes"; then
  
    AC_MSG_CHECKING([GStreamer OpenGL window systems ...])
-@@ -2566,6 +2568,7 @@ gst-libs/gst/isoff/Makefile
- gst-libs/gst/codecparsers/Makefile
+@@ -2587,6 +2589,7 @@ gst-libs/gst/codecparsers/Makefile
  gst-libs/gst/mpegts/Makefile
+ gst-libs/gst/sctp/Makefile
  gst-libs/gst/uridownloader/Makefile
 +gst-libs/gst/drm/Makefile
  gst-libs/gst/wayland/Makefile
  gst-libs/gst/webrtc/Makefile
  gst-libs/gst/player/Makefile
-@@ -2696,6 +2699,8 @@ pkgconfig/gstreamer-plugins-bad.pc
+@@ -2712,6 +2715,8 @@ pkgconfig/gstreamer-plugins-bad.pc
  pkgconfig/gstreamer-plugins-bad-uninstalled.pc
  pkgconfig/gstreamer-codecparsers.pc
  pkgconfig/gstreamer-codecparsers-uninstalled.pc
@@ -59,21 +60,21 @@ index 943412c..cb17bf3 100644
  pkgconfig/gstreamer-insertbin-uninstalled.pc
  pkgconfig/gstreamer-mpegts.pc
 diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am
-index db67fc8..f1fed2b 100644
+index a53f26e..7fe6ae7 100644
 --- a/gst-libs/gst/Makefile.am
 +++ b/gst-libs/gst/Makefile.am
 @@ -7,12 +7,12 @@ OPENCV_DIR=opencv
  endif
  
  SUBDIRS = uridownloader adaptivedemux interfaces basecamerabinsrc codecparsers \
--	 insertbin mpegts video audio player isoff webrtc $(WAYLAND_DIR) \
-+	 insertbin mpegts video audio player isoff webrtc drm $(WAYLAND_DIR) \
+-	 insertbin mpegts audio sctp player isoff webrtc $(WAYLAND_DIR) \
++	 insertbin mpegts audio sctp player isoff webrtc drm $(WAYLAND_DIR) \
  	 $(OPENCV_DIR)
  
  noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h
  DIST_SUBDIRS = uridownloader adaptivedemux interfaces basecamerabinsrc \
--	codecparsers insertbin mpegts wayland opencv video audio player isoff webrtc
-+	codecparsers insertbin mpegts drm wayland opencv video audio player isoff webrtc
+-	codecparsers insertbin mpegts wayland opencv audio player isoff sctp webrtc
++	codecparsers insertbin mpegts drm wayland opencv audio player isoff sctp webrtc
  
  adaptivedemux: uridownloader
  
@@ -412,7 +413,7 @@ index 0000000..3199b92
 +
 +#endif /* __GSTDRMALLOCATOR_H__ */
 diff --git a/pkgconfig/Makefile.am b/pkgconfig/Makefile.am
-index 0e69cd1..f511b4c 100644
+index 8e74a8e..86ee8d6 100644
 --- a/pkgconfig/Makefile.am
 +++ b/pkgconfig/Makefile.am
 @@ -2,6 +2,7 @@
@@ -466,6 +467,3 @@ index 0000000..d155e80
 +Libs: -L${libdir} -lgstdrm-@GST_MAJORMINOR@
 +Cflags: -I${includedir}
 +
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
index 34ec6b4..b0b637d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
@@ -1,4 +1,4 @@
-From e44c23a75544aa4eea9a151b8d7a5168de86c0da Mon Sep 17 00:00:00 2001
+From 39013d1e9c42018d1848a9c34538db46230120e2 Mon Sep 17 00:00:00 2001
 From: Ramprasad N <x0038811@ti.com>
 Date: Thu, 18 Jan 2018 17:01:37 +0530
 Subject: [PATCH 2/5] parsers: Pick bug fixes on different parsers
@@ -10,6 +10,7 @@ The following bug fixes which were previously identified are picked :
 
 Signed-off-by: Pooja Prajod <a0132412@ti.com>
 Signed-off-by: Ramprasad N <x0038811@ti.com>
+
 ---
  gst/jpegformat/gstjpegformat.c        |  2 +-
  gst/jpegformat/gstjpegparse.c         |  2 +-
@@ -33,10 +34,10 @@ index b410466..ecb9311 100644
      return FALSE;
    if (!gst_element_register (plugin, "jifmux", GST_RANK_SECONDARY,
 diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
-index dd684d7..2682afb 100644
+index 17cbec9..a10e9e0 100644
 --- a/gst/jpegformat/gstjpegparse.c
 +++ b/gst/jpegformat/gstjpegparse.c
-@@ -151,7 +151,7 @@ gst_jpeg_parse_class_init (GstJpegParseClass * klass)
+@@ -113,7 +113,7 @@ gst_jpeg_parse_class_init (GstJpegParseClass * klass)
  
    gst_element_class_set_static_metadata (gstelement_class,
        "JPEG stream parser",
@@ -46,7 +47,7 @@ index dd684d7..2682afb 100644
        "Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>");
  
 diff --git a/gst/videoparsers/gsth264parse.c b/gst/videoparsers/gsth264parse.c
-index 10543ea..ebea0f9 100644
+index f4d82e5..6228b98 100644
 --- a/gst/videoparsers/gsth264parse.c
 +++ b/gst/videoparsers/gsth264parse.c
 @@ -161,7 +161,7 @@ static void
@@ -58,7 +59,7 @@ index 10543ea..ebea0f9 100644
    GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (h264parse));
    GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (h264parse));
  
-@@ -1778,13 +1778,8 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+@@ -1901,13 +1901,8 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
      gint fps_num, fps_den;
      gint par_n, par_d;
  
@@ -74,7 +75,7 @@ index 10543ea..ebea0f9 100644
  
      if (G_UNLIKELY (h264parse->width != crop_width ||
              h264parse->height != crop_height)) {
-@@ -1819,7 +1814,7 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+@@ -1942,7 +1937,7 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
  
      if (G_UNLIKELY (modified || h264parse->update_caps)) {
        GstVideoInterlaceMode imode = GST_VIDEO_INTERLACE_MODE_PROGRESSIVE;
@@ -83,7 +84,7 @@ index 10543ea..ebea0f9 100644
        GstClockTime latency;
  
        const gchar *caps_mview_mode = NULL;
-@@ -1831,16 +1826,13 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+@@ -1956,16 +1951,13 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
  
        caps = gst_caps_copy (sink_caps);
  
@@ -117,7 +118,7 @@ index 38e1f45..49434c7 100644
    GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (parse));
  }
 diff --git a/gst/videoparsers/gstmpegvideoparse.c b/gst/videoparsers/gstmpegvideoparse.c
-index 6896339..cd87838 100644
+index eef79bc..e9ddda1 100644
 --- a/gst/videoparsers/gstmpegvideoparse.c
 +++ b/gst/videoparsers/gstmpegvideoparse.c
 @@ -173,7 +173,7 @@ gst_mpegv_parse_init (GstMpegvParse * parse)
@@ -142,6 +143,3 @@ index 2deddf4..c622b50 100644
  
    return ret;
  }
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
index 1a770ca..66bce91 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
@@ -1,4 +1,4 @@
-From 2b80419b8c90523cf4cbe273f71bfc37d5fc2754 Mon Sep 17 00:00:00 2001
+From 4e36ace0ac217a3c7b0ae5548ad6fa3e31028edb Mon Sep 17 00:00:00 2001
 From: Ramprasad N <x0038811@ti.com>
 Date: Mon, 28 Jan 2019 13:45:08 +0530
 Subject: [PATCH 3/5] kmssink: Add omapdrm and tidss in the list of drivers
@@ -17,6 +17,7 @@ this addition, there will be frame-copy happens and
 slows down the playback.
 
 Signed-off-by: Ramprasad N <x0038811@ti.com>
+
 ---
  sys/kms/Makefile.am  |  1 +
  sys/kms/gstkmssink.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++-
@@ -35,10 +36,10 @@ index f13ccc5..b4eab3a 100644
  
  libgstkms_la_LDFLAGS = 			\
 diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
-index 1331883..f8f5b8a 100644
+index cdecbf6..f59eb3c 100644
 --- a/sys/kms/gstkmssink.c
 +++ b/sys/kms/gstkmssink.c
-@@ -169,7 +169,7 @@ kms_open (gchar ** driver)
+@@ -178,7 +178,7 @@ kms_open (gchar ** driver)
    static const char *drivers[] = { "i915", "radeon", "nouveau", "vmwgfx",
      "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
      "xlnx", "vc4", "meson", "sun4i-drm", "mxsfb-drm",
@@ -47,7 +48,7 @@ index 1331883..f8f5b8a 100644
    };
    int i, fd = -1;
  
-@@ -1201,7 +1201,99 @@ event_failed:
+@@ -1342,7 +1342,99 @@ event_failed:
      return FALSE;
    }
  }
@@ -147,7 +148,7 @@ index 1331883..f8f5b8a 100644
  static gboolean
  gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf,
      GstBuffer ** outbuf)
-@@ -1375,6 +1467,9 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self, GstBuffer * inbuf)
+@@ -1516,6 +1608,9 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self, GstBuffer * inbuf)
    if (gst_is_kms_memory (mem))
      return gst_buffer_ref (inbuf);
  
@@ -157,6 +158,3 @@ index 1331883..f8f5b8a 100644
    if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
      goto done;
  
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
similarity index 69%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 38f7e63..4138c31 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -25,36 +25,36 @@ DEPENDS_append_k3 = " \
     libdrm \
 "
 
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch \
 "
 
-SRC_URI_append_ti33x = " \
-    file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
-"
+#SRC_URI_append_ti33x = " \
+#    file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
+#"
 
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch \
 "
 
+#    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
+#    file://0005-waylandsink-Add-input-device-support.patch
+#    file://0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
+#    file://0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
 SRC_URI_append_k3 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-Pick-bug-fixes-on-different-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch \
-    file://0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch \
-    file://0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r11"
+PR_append = ".arago0"
-- 
2.7.4


