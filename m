Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 15C0152CF1
	for <meta-arago@arago-project.org>;
	Wed,  5 May 2021 14:32:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 145EWxPw095855;
	Wed, 5 May 2021 09:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620225179;
	bh=08DR/3tWwfAlro35brsQ1h1FM+kUtUBtpuidlCEDJ5c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WhOxDaPqDua7tFtTx/9dMYFcCssFGZCdV72xqtuZmIUejcNhPaoS1908GZNnljPIU
	y39OmvHajIqlYXPfkPhC5tbtvYP2I5MZUYft6CmXJxyRZLKj8ai1Aw6hhO3IhOsOtq
	u4Ij3YN8/N5jCmyCFY8dgJrtQb9AU+4EeS8VJy6Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 145EWxrS033475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 09:32:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 09:32:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 09:32:59 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 145EWxVC082553;
	Wed, 5 May 2021 09:32:59 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	145EWwEv009501; Wed, 5 May 2021 09:32:59 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 09:32:56 -0500
Message-ID: <20210505143256.11372-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505143256.11372-1-g-tammana@ti.com>
References: <20210505143256.11372-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH 2/2] gstreamer1.0-plugins-bad: Purge unused patch
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
X-List-Received-Date: Wed, 05 May 2021 14:32:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

0002-parsers-Pick-bug-fixes-on-different-parsers.patch is replaced by a
newer version 0002-parsers-bug-fixes-on-parsers.patch. It is left
unused, so purge it.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...-Pick-bug-fixes-on-different-parsers.patch | 102 ------------------
 1 file changed, 102 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch
deleted file mode 100644
index 3a2a96e5..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-Pick-bug-fixes-on-different-parsers.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 39425cc2d98801d2f0f2fed2ba01781e20d978a2 Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Thu, 18 Jan 2018 17:01:37 +0530
-Subject: [PATCH 2/5] parsers: Pick bug fixes on different parsers
-
-The following bug fixes which were previously identified are picked :
-1. Increase rank for vc1parse and jpegparse
-2. Modify h264 and mpeg4 parsers to interpolate pts
-
-Signed-off-by: Pooja Prajod <a0132412@ti.com>
-Signed-off-by: Ramprasad N <x0038811@ti.com>
-Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
----
- gst/jpegformat/gstjpegformat.c        | 2 +-
- gst/jpegformat/gstjpegparse.c         | 2 +-
- gst/videoparsers/gsth264parse.c       | 2 +-
- gst/videoparsers/gstmpeg4videoparse.c | 2 +-
- gst/videoparsers/gstmpegvideoparse.c  | 2 +-
- gst/videoparsers/plugin.c             | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gst/jpegformat/gstjpegformat.c b/gst/jpegformat/gstjpegformat.c
-index b410466..ecb9311 100644
---- a/gst/jpegformat/gstjpegformat.c
-+++ b/gst/jpegformat/gstjpegformat.c
-@@ -30,7 +30,7 @@
- static gboolean
- plugin_init (GstPlugin * plugin)
- {
--  if (!gst_element_register (plugin, "jpegparse", GST_RANK_NONE,
-+  if (!gst_element_register (plugin, "jpegparse", GST_RANK_PRIMARY + 2,
-           GST_TYPE_JPEG_PARSE))
-     return FALSE;
-   if (!gst_element_register (plugin, "jifmux", GST_RANK_SECONDARY,
-diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
-index 0bfdc80..b7d19b6 100644
---- a/gst/jpegformat/gstjpegparse.c
-+++ b/gst/jpegformat/gstjpegparse.c
-@@ -151,7 +151,7 @@ gst_jpeg_parse_class_init (GstJpegParseClass * klass)
- 
-   gst_element_class_set_static_metadata (gstelement_class,
-       "JPEG stream parser",
--      "Video/Parser",
-+      "Codec/Parser/Video",
-       "Parse JPEG images into single-frame buffers",
-       "Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>");
- 
-diff --git a/gst/videoparsers/gsth264parse.c b/gst/videoparsers/gsth264parse.c
-index 7751ea2..5ce9030 100644
---- a/gst/videoparsers/gsth264parse.c
-+++ b/gst/videoparsers/gsth264parse.c
-@@ -161,7 +161,7 @@ static void
- gst_h264_parse_init (GstH264Parse * h264parse)
- {
-   h264parse->frame_out = gst_adapter_new ();
--  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (h264parse), FALSE);
-+  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (h264parse), TRUE);
-   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (h264parse));
-   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (h264parse));
- 
-diff --git a/gst/videoparsers/gstmpeg4videoparse.c b/gst/videoparsers/gstmpeg4videoparse.c
-index 38e1f45..49434c7 100644
---- a/gst/videoparsers/gstmpeg4videoparse.c
-+++ b/gst/videoparsers/gstmpeg4videoparse.c
-@@ -183,7 +183,7 @@ gst_mpeg4vparse_init (GstMpeg4VParse * parse)
-   parse->interval = DEFAULT_CONFIG_INTERVAL;
-   parse->last_report = GST_CLOCK_TIME_NONE;
- 
--  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), FALSE);
-+  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), TRUE);
-   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (parse));
-   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (parse));
- }
-diff --git a/gst/videoparsers/gstmpegvideoparse.c b/gst/videoparsers/gstmpegvideoparse.c
-index 6896339..cd87838 100644
---- a/gst/videoparsers/gstmpegvideoparse.c
-+++ b/gst/videoparsers/gstmpegvideoparse.c
-@@ -173,7 +173,7 @@ gst_mpegv_parse_init (GstMpegvParse * parse)
- {
-   parse->config_flags = FLAG_NONE;
- 
--  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), FALSE);
-+  gst_base_parse_set_pts_interpolation (GST_BASE_PARSE (parse), TRUE);
-   GST_PAD_SET_ACCEPT_INTERSECT (GST_BASE_PARSE_SINK_PAD (parse));
-   GST_PAD_SET_ACCEPT_TEMPLATE (GST_BASE_PARSE_SINK_PAD (parse));
- }
-diff --git a/gst/videoparsers/plugin.c b/gst/videoparsers/plugin.c
-index 2deddf4..c622b50 100644
---- a/gst/videoparsers/plugin.c
-+++ b/gst/videoparsers/plugin.c
-@@ -54,7 +54,7 @@ plugin_init (GstPlugin * plugin)
-   ret |= gst_element_register (plugin, "h265parse",
-       GST_RANK_SECONDARY, GST_TYPE_H265_PARSE);
-   ret |= gst_element_register (plugin, "vc1parse",
--      GST_RANK_NONE, GST_TYPE_VC1_PARSE);
-+      GST_RANK_PRIMARY + 2, GST_TYPE_VC1_PARSE);
- 
-   return ret;
- }
--- 
-1.9.1
-
-- 
2.31.1


