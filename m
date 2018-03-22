Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 869A9529DC
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:06:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M46tXY024794
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691615;
	bh=EP5TUEyypnC00OZSD9r8YB5yQeXDPvaFwPl1mVYhAl4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xVe9n8FOjhm+nWEWiMviaa+UFPwr7kf0SRAO4VIONfuZq/VvcuNZ7PboucI7Oy5GP
	cyLyKIBc4lXBGn+bLBYU6+L7L50EQhKD7kXrciWtYJ6gVVtJm4wU7F/7XixsGow05w
	KMo8vCXaSiR47NPpS5AfP5c5gbvqJeqPcQJRup00=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46tEK002699
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:06:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:06:55 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAO028035;
	Wed, 21 Mar 2018 23:06:54 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:40 +0530
Message-ID: <1521691605-49259-5-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 4/9] gstreamer1.0*-bad: Add parser specific fixes
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
X-List-Received-Date: Thu, 22 Mar 2018 04:06:58 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../0002-parsers-bug-fixes-on-parsers.patch        | 147 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   4 +-
 2 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
new file mode 100644
index 0000000..34ec6b4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-on-parsers.patch
@@ -0,0 +1,147 @@
+From e44c23a75544aa4eea9a151b8d7a5168de86c0da Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 18 Jan 2018 17:01:37 +0530
+Subject: [PATCH 2/5] parsers: Pick bug fixes on different parsers
+
+The following bug fixes which were previously identified are picked :
+1. Increase rank for vc1parse and jpegparse
+2. Modify h264 and mpeg4 parsers to interpolate pts
+3. Fix create() width and height calculation on h264parse
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ gst/jpegformat/gstjpegformat.c        |  2 +-
+ gst/jpegformat/gstjpegparse.c         |  2 +-
+ gst/videoparsers/gsth264parse.c       | 22 +++++++---------------
+ gst/videoparsers/gstmpeg4videoparse.c |  2 +-
+ gst/videoparsers/gstmpegvideoparse.c  |  2 +-
+ gst/videoparsers/plugin.c             |  2 +-
+ 6 files changed, 12 insertions(+), 20 deletions(-)
+
+diff --git a/gst/jpegformat/gstjpegformat.c b/gst/jpegformat/gstjpegformat.c
+index b410466..ecb9311 100644
+--- a/gst/jpegformat/gstjpegformat.c
++++ b/gst/jpegformat/gstjpegformat.c
+@@ -30,7 +30,7 @@
+ static gboolean
+ plugin_init (GstPlugin * plugin)
+ {
+-  if (!gst_element_register (plugin, "jpegparse", GST_RANK_NONE,
++  if (!gst_element_register (plugin, "jpegparse", GST_RANK_PRIMARY + 2,
+           GST_TYPE_JPEG_PARSE))
+     return FALSE;
+   if (!gst_element_register (plugin, "jifmux", GST_RANK_SECONDARY,
+diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
+index dd684d7..2682afb 100644
+--- a/gst/jpegformat/gstjpegparse.c
++++ b/gst/jpegformat/gstjpegparse.c
+@@ -151,7 +151,7 @@ gst_jpeg_parse_class_init (GstJpegParseClass * klass)
+ 
+   gst_element_class_set_static_metadata (gstelement_class,
+       "JPEG stream parser",
+-      "Video/Parser",
++      "Codec/Parser/Video",
+       "Parse JPEG images into single-frame buffers",
+       "Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>");
+ 
+diff --git a/gst/videoparsers/gsth264parse.c b/gst/videoparsers/gsth264parse.c
+index 10543ea..ebea0f9 100644
+--- a/gst/videoparsers/gsth264parse.c
++++ b/gst/videoparsers/gsth264parse.c
+@@ -161,7 +161,7 @@ static void
+ gst_h264_parse_init (GstH264Parse * h264parse)
+ {
+   h264parse->frame_out = gst_adapter_new ();
+-  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (h264parse), FALSE);
++  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (h264parse), TRUE);
+   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (h264parse));
+   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (h264parse));
+ 
+@@ -1778,13 +1778,8 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+     gint fps_num, fps_den;
+     gint par_n, par_d;
+ 
+-    if (sps->frame_cropping_flag) {
+-      crop_width = sps->crop_rect_width;
+-      crop_height = sps->crop_rect_height;
+-    } else {
+-      crop_width = sps->width;
+-      crop_height = sps->height;
+-    }
++    crop_width = (sps->crop_rect_width > sps->width)? sps->crop_rect_width: sps->width;
++    crop_height = (sps->crop_rect_height > sps->height)? sps->crop_rect_height: sps->height;
+ 
+     if (G_UNLIKELY (h264parse->width != crop_width ||
+             h264parse->height != crop_height)) {
+@@ -1819,7 +1814,7 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+ 
+     if (G_UNLIKELY (modified || h264parse->update_caps)) {
+       GstVideoInterlaceMode imode = GST_VIDEO_INTERLACE_MODE_PROGRESSIVE;
+-      gint width, height;
++      gint width=0, height=0;
+       GstClockTime latency;
+ 
+       const gchar *caps_mview_mode = NULL;
+@@ -1831,16 +1826,13 @@ gst_h264_parse_update_src_caps (GstH264Parse * h264parse, GstCaps * caps)
+ 
+       caps = gst_caps_copy (sink_caps);
+ 
+-      /* sps should give this but upstream overrides */
+       if (s && gst_structure_has_field (s, "width"))
+         gst_structure_get_int (s, "width", &width);
+-      else
+-        width = h264parse->width;
+-
++      width = (width > h264parse->width)? width: h264parse->width;
++     
+       if (s && gst_structure_has_field (s, "height"))
+         gst_structure_get_int (s, "height", &height);
+-      else
+-        height = h264parse->height;
++      height = (height > h264parse->height)? height: h264parse->height;
+ 
+       if (s == NULL ||
+           !gst_structure_get_fraction (s, "pixel-aspect-ratio", &par_n,
+diff --git a/gst/videoparsers/gstmpeg4videoparse.c b/gst/videoparsers/gstmpeg4videoparse.c
+index 38e1f45..49434c7 100644
+--- a/gst/videoparsers/gstmpeg4videoparse.c
++++ b/gst/videoparsers/gstmpeg4videoparse.c
+@@ -183,7 +183,7 @@ gst_mpeg4vparse_init (GstMpeg4VParse * parse)
+   parse->interval = DEFAULT_CONFIG_INTERVAL;
+   parse->last_report = GST_CLOCK_TIME_NONE;
+ 
+-  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), FALSE);
++  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), TRUE);
+   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (parse));
+   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (parse));
+ }
+diff --git a/gst/videoparsers/gstmpegvideoparse.c b/gst/videoparsers/gstmpegvideoparse.c
+index 6896339..cd87838 100644
+--- a/gst/videoparsers/gstmpegvideoparse.c
++++ b/gst/videoparsers/gstmpegvideoparse.c
+@@ -173,7 +173,7 @@ gst_mpegv_parse_init (GstMpegvParse * parse)
+ {
+   parse->config_flags = FLAG_NONE;
+ 
+-  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), FALSE);
++  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), TRUE);
+   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (parse));
+   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (parse));
+ }
+diff --git a/gst/videoparsers/plugin.c b/gst/videoparsers/plugin.c
+index 2deddf4..c622b50 100644
+--- a/gst/videoparsers/plugin.c
++++ b/gst/videoparsers/plugin.c
+@@ -54,7 +54,7 @@ plugin_init (GstPlugin * plugin)
+   ret |= gst_element_register (plugin, "h265parse",
+       GST_RANK_SECONDARY, GST_TYPE_H265_PARSE);
+   ret |= gst_element_register (plugin, "vc1parse",
+-      GST_RANK_NONE, GST_TYPE_VC1_PARSE);
++      GST_RANK_PRIMARY + 2, GST_TYPE_VC1_PARSE);
+ 
+   return ret;
+ }
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
index 11a3867..437689f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
@@ -21,6 +21,7 @@ DEPENDS_append_ti33x = " \
 
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
+    file://0002-parsers-bug-fixes-on-parsers.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -28,8 +29,9 @@ SRC_URI_append_ti33x = " \
 
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
+    file://0002-parsers-bug-fixes-on-parsers.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r1"
+PR = "r2"
-- 
1.9.1


