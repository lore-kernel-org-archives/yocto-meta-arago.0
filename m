Return-Path: <angelabaker@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A092452976
	for <meta-arago@arago-project.org>;
	Tue, 30 Jul 2019 21:39:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ULcpul028767
	for <meta-arago@arago-project.org>; Tue, 30 Jul 2019 16:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564522731;
	bh=9k+/KEdy2Zt83Qn81Kttasn9XINQVaYm9mhOUiHlfbQ=;
	h=From:To:CC:Subject:Date;
	b=VqkITkzR9wTxcfFwFszuzUDlWMmRtlURpu9qwUEcB9OIY6Ar7flDMwdLklgqK4hCE
	rhLkjFGwQWD51832ZJu+EWx8yWPBCbr0FWcgJeqnwRpXJrT0xXi2j9uxjQDGz0TT6I
	4GIIL1ddT9xGbmaPjqqslRlDpBoncYN9RlC5ZUbQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ULcplu108410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Jul 2019 16:38:51 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Jul 2019 16:38:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Jul 2019 16:38:50 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ULcota028290;
	Tue, 30 Jul 2019 16:38:50 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x6ULcoZ07525; Tue, 30 Jul 2019 16:38:50 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Jul 2019 16:38:41 -0500
Message-ID: <1564522721-32374-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] gstreamer1.0*-bad: Update Parsers Patch for k3
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
X-List-Received-Date: Tue, 30 Jul 2019 21:39:45 -0000
Content-Type: text/plain

Remove the part of the parsers patch that changes the
width and height during create for h264 streams. This
change was needed only for gst-ducati plugin and gst-ducati
plugin is not used for k3. Additionally the change was
causing artifacts for some videos when used with v4l2h264dec
plugin.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 ...rsers-Pick-bug-fixes-on-different-parsers.patch | 102 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.14.4.bbappend       |   2 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch
new file mode 100644
index 0000000..3a2a96e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch
@@ -0,0 +1,102 @@
+From 39425cc2d98801d2f0f2fed2ba01781e20d978a2 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 18 Jan 2018 17:01:37 +0530
+Subject: [PATCH 2/5] parsers: Pick bug fixes on different parsers
+
+The following bug fixes which were previously identified are picked :
+1. Increase rank for vc1parse and jpegparse
+2. Modify h264 and mpeg4 parsers to interpolate pts
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+---
+ gst/jpegformat/gstjpegformat.c        | 2 +-
+ gst/jpegformat/gstjpegparse.c         | 2 +-
+ gst/videoparsers/gsth264parse.c       | 2 +-
+ gst/videoparsers/gstmpeg4videoparse.c | 2 +-
+ gst/videoparsers/gstmpegvideoparse.c  | 2 +-
+ gst/videoparsers/plugin.c             | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
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
+index 0bfdc80..b7d19b6 100644
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
+index 7751ea2..5ce9030 100644
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
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
index f5580fe..70f5f9b 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
@@ -47,7 +47,7 @@ SRC_URI_append_omap-a15 = " \
 
 SRC_URI_append_k3 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
-    file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0002-parsers-Pick-bug-fixes-on-different-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
-- 
1.9.1


