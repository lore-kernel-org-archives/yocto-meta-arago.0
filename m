Return-Path: <angelabaker@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 40B7A52960
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 18:21:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84IKMvI076795
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 13:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567621222;
	bh=ZC+oC4QIZ6IztI995CIVBpe7yjLX6DdGS0u90ZA8KpY=;
	h=From:To:CC:Subject:Date;
	b=fOMCa37o5KL6+VATT3w2ifsOh+Huw//xD2d181jpdCwcaroDb2bjz+u4aKzVdZKD4
	6z1AeBpdIb4ELO5hhmU0eg6tidO0FBhc+CWac2oNghwbPo/PTB2KqqJmufzq2FgdjW
	wfmlscoe8qpxZY8HnPTMVuujZPCGntL/d1xGTcN4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84IKM4a045000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 13:20:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 4 Sep 2019 13:20:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 4 Sep 2019 13:20:21 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84IKLHJ068697;
	Wed, 4 Sep 2019 13:20:21 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x84IKLZ16237; Wed, 4 Sep 2019 13:20:21 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Sep 2019 13:19:47 -0500
Message-ID: <1567621187-12852-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] gstreamer1.0*-good: Add YUV422M support for v4l2 plugin
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
X-List-Received-Date: Wed, 04 Sep 2019 18:21:26 -0000
Content-Type: text/plain

The v4l2 decoder can return YUV422M decoded output. This
support was missing in the v4l2plugin, however. This patch
adds the missing support.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 ...Update-formats-table-to-include-YUV422-mu.patch | 61 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.14.4.bbappend      |  3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
new file mode 100644
index 0000000..c7f7a6f
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
@@ -0,0 +1,61 @@
+From 57370dbe73c970077ad028fa1008cb6303445c21 Mon Sep 17 00:00:00 2001
+From: Angela Stegmaier <angelabaker@ti.com>
+Date: Tue, 20 Aug 2019 15:59:02 -0500
+Subject: [PATCH] v4l2object: Update formats table to include YUV422
+ multiplanar
+
+YUV422 multiplanar is missing from the table. Add the support
+for this format.
+
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index c32608c..87d262f 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -129,6 +129,7 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
+   {V4L2_PIX_FMT_UYVY, TRUE, GST_V4L2_RAW},
+   {V4L2_PIX_FMT_VYUY, TRUE, GST_V4L2_RAW},
+   {V4L2_PIX_FMT_YUV422P, TRUE, GST_V4L2_RAW},
++  {V4L2_PIX_FMT_YUV422M, TRUE, GST_V4L2_RAW},
+   {V4L2_PIX_FMT_YUV411P, TRUE, GST_V4L2_RAW},
+   {V4L2_PIX_FMT_Y41P, TRUE, GST_V4L2_RAW},
+   {V4L2_PIX_FMT_YUV444, TRUE, GST_V4L2_RAW},
+@@ -1088,6 +1089,7 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
+       rank = YUV_BASE_RANK + 4;
+       break;
+     case V4L2_PIX_FMT_YUV422P: /* Y42B, 16 bits per pixel */
++    case V4L2_PIX_FMT_YUV422M:
+       rank = YUV_BASE_RANK + 8;
+       break;
+ 
+@@ -1343,6 +1345,7 @@ gst_v4l2_object_v4l2fourcc_to_video_format (guint32 fourcc)
+       format = GST_VIDEO_FORMAT_Y41B;
+       break;
+     case V4L2_PIX_FMT_YUV422P:
++    case V4L2_PIX_FMT_YUV422M:
+       format = GST_VIDEO_FORMAT_Y42B;
+       break;
+     case V4L2_PIX_FMT_YVYU:
+@@ -1484,6 +1487,7 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
+     case V4L2_PIX_FMT_YVU420:
+     case V4L2_PIX_FMT_UYVY:
+     case V4L2_PIX_FMT_YUV422P:
++    case V4L2_PIX_FMT_YUV422M:
+     case V4L2_PIX_FMT_YVYU:
+     case V4L2_PIX_FMT_YUV411P:{
+       GstVideoFormat format;
+@@ -1714,6 +1718,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
+         break;
+       case GST_VIDEO_FORMAT_Y42B:
+         fourcc = V4L2_PIX_FMT_YUV422P;
++        fourcc_nc = V4L2_PIX_FMT_YUV422M;
+         break;
+       case GST_VIDEO_FORMAT_NV12:
+         fourcc = V4L2_PIX_FMT_NV12;
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
index e262424..98b0123 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -7,4 +7,5 @@ SRC_URI += " \
       file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
       file://0001-v4l2-Sync-kernel-header-with-linuxtv-tree.patch \
       file://0002-v4l2videodec-Add-HEVC-decoder-support.patch \
+      file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
       "
-- 
1.9.1


