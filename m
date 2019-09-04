Return-Path: <angelabaker@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 48E8D52970
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2019 20:56:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84KtsIB076517
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 15:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567630554;
	bh=6H3Qb2mDpL4JDYhwOwVyIHHoFVS8WANU5VZxk2Oqtjk=;
	h=From:To:CC:Subject:Date;
	b=V+E1B+bf7lnCVHGyI/rHvoMLFYt2winf4Vc3wvEX5o0iR7TZlAwM3jv+ejN5/gUBL
	FbXaw0hLKYsTJVb84qwF57CpNKCM4wJ4S99TFcdQzSectGQPrk6Nsb1jDg0kMZBwa6
	vSe4UN3KLOWvZeelCPehb1N1MnhM5ohSQU49K1Ow=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84KtskV130570
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2019 15:55:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 4 Sep 2019 15:55:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 4 Sep 2019 15:55:54 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84KtdA4041411;
	Wed, 4 Sep 2019 15:55:39 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x84KtcZ29618; Wed, 4 Sep 2019 15:55:38 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Sep 2019 15:55:29 -0500
Message-ID: <1567630529-7507-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v2] gstreamer1.0*-good: Add YUV422M support for v4l2 plugin
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
X-List-Received-Date: Wed, 04 Sep 2019 20:56:59 -0000
Content-Type: text/plain

The v4l2 decoder can return YUV422M decoded output. This
support was missing in the v4l2plugin, however. This patch
adds the missing support.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---

Changes in v2: Added "Upstream-Status" to patch

 ...Update-formats-table-to-include-YUV422-mu.patch | 63 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.14.4.bbappend      |  3 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
new file mode 100644
index 0000000..c7e77be
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch
@@ -0,0 +1,63 @@
+From 46c54daed15b94861569b401c9612a25f615c0f1 Mon Sep 17 00:00:00 2001
+From: Angela Stegmaier <angelabaker@ti.com>
+Date: Tue, 20 Aug 2019 15:59:02 -0500
+Subject: [PATCH] v4l2object: Update formats table to include YUV422
+ multiplanar
+
+YUV422 multiplanar is missing from the table. Add the support
+for this format.
+
+Upstream-Status: Pending
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


