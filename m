Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F5AD73616
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 22:52:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.142833.1733007166046360122
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 30 Nov 2024 14:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BQHVsh6d;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AUMqjG21497161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Nov 2024 16:52:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733007165;
	bh=9MZlUmOU24+BYiBcQfIl5ubzr0QW9R6NjPTCQxysu7w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BQHVsh6du1FqR9ACrh+Ud6weXxyRb/pdohtq0wa4Bkzst5afC6xKwo+IZ9GHGoJpe
	 B1Qq7rAbZdQCXmw6eLV+4H52RyS2M9wjrV3NhY+kuLMk+Pl2SkgZjpyuP79VAXKmqZ
	 u3N50wm8Is/+h8HiRJ0ANWRTeEI10iOAKlYJYW4o=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AUMqiEO064481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 30
 Nov 2024 16:52:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 30 Nov 2024 16:52:44 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AUMqi1x119127;
	Sat, 30 Nov 2024 16:52:44 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tHWKS-0003mP-FC; Sat, 30 Nov 2024 16:52:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/4] gstreamer1.0-plugins-good: Update to v1.24
Date: Sat, 30 Nov 2024 16:52:44 -0600
Message-ID: <20241130225244.12367-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241130225244.12367-1-reatmon@ti.com>
References: <20241130225244.12367-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 30 Nov 2024 22:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15632

oe-core move to gstream 1.24.x, and with the removal of
BB_DANGLINGAPPENDS_WARNONLY the dangling bbappend we need to move the
files bbappend and patches to also support 1.24.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-raw10-raw12-and-raw16-bayer-formats.patch | 123 ------------------
 ...-for-bayer-formats-with-IR-component.patch |  92 ++++++-------
 ...l2-Changes-for-DMA-Buf-import-j721s2.patch |  13 +-
 ...ence-to-contiguous-format-if-support.patch |   4 +-
 ...gstreamer1.0-plugins-good_1.24.%.bbappend} |   1 -
 5 files changed, 55 insertions(+), 178 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.%.bbappend => gstreamer1.0-plugins-good_1.24.%.bbappend} (83%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
deleted file mode 100644
index 751f5ba5..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From: Emmanuel Madrigal <emmanuel.madrigal@ridgerun.com>
-Date: Tue Feb 22 03:50:52 IST 2022
-Subject: Adding support for raw10, raw12 and raw16 bayer formats
-
-Gstreamer 1.16 only supports raw8 bayer by default. This patch enables
-sensors that support raw10, raw12 or raw16 to be used with v4l2src.
-Will need to be carried in meta-psdkla as long as we are using Gstreamer 1.16
-
-Upstream-Status: Pending
-Signed-off-by: Limaye, Aniket <a-limaye@ti.com>
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 2c78e2227..a5d2e2de1 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -162,6 +162,18 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
-   {V4L2_PIX_FMT_SGBRG8, TRUE, GST_V4L2_RAW},
-   {V4L2_PIX_FMT_SGRBG8, TRUE, GST_V4L2_RAW},
-   {V4L2_PIX_FMT_SRGGB8, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SBGGR10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGBRG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGRBG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SRGGB10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SBGGR12, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGBRG12, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGRBG12, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SRGGB12, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SBGGR16, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGBRG16, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},
-
-   /* compressed formats */
-   {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},
-@@ -1105,6 +1117,18 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
-     case V4L2_PIX_FMT_SGBRG8:
-     case V4L2_PIX_FMT_SGRBG8:
-     case V4L2_PIX_FMT_SRGGB8:
-+    case V4L2_PIX_FMT_SBGGR10:
-+    case V4L2_PIX_FMT_SGBRG10:
-+    case V4L2_PIX_FMT_SGRBG10:
-+    case V4L2_PIX_FMT_SRGGB10:
-+    case V4L2_PIX_FMT_SBGGR12:
-+    case V4L2_PIX_FMT_SGBRG12:
-+    case V4L2_PIX_FMT_SGRBG12:
-+    case V4L2_PIX_FMT_SRGGB12:
-+    case V4L2_PIX_FMT_SBGGR16:
-+    case V4L2_PIX_FMT_SGBRG16:
-+    case V4L2_PIX_FMT_SGRBG16:
-+    case V4L2_PIX_FMT_SRGGB16:
-       rank = BAYER_BASE_RANK;
-       break;
-
-@@ -1521,7 +1545,37 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
-           fourcc == V4L2_PIX_FMT_SBGGR8 ? "bggr" :
-           fourcc == V4L2_PIX_FMT_SGBRG8 ? "gbrg" :
-           fourcc == V4L2_PIX_FMT_SGRBG8 ? "grbg" :
--          /* fourcc == V4L2_PIX_FMT_SRGGB8 ? */ "rggb", NULL);
-+          fourcc == V4L2_PIX_FMT_SRGGB8 ? "rggb" : "rggb", NULL);
-+      break;
-+    case V4L2_PIX_FMT_SBGGR10:
-+    case V4L2_PIX_FMT_SGBRG10:
-+    case V4L2_PIX_FMT_SGRBG10:
-+    case V4L2_PIX_FMT_SRGGB10:
-+      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
-+          fourcc == V4L2_PIX_FMT_SBGGR10 ? "bggr10" :
-+          fourcc == V4L2_PIX_FMT_SGBRG10 ? "gbrg10" :
-+          fourcc == V4L2_PIX_FMT_SGRBG10 ? "grbg10" :
-+          fourcc == V4L2_PIX_FMT_SRGGB10 ? "rggb10" : "rggb10", NULL);
-+      break;
-+    case V4L2_PIX_FMT_SBGGR12:
-+    case V4L2_PIX_FMT_SGBRG12:
-+    case V4L2_PIX_FMT_SGRBG12:
-+    case V4L2_PIX_FMT_SRGGB12:
-+      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
-+          fourcc == V4L2_PIX_FMT_SBGGR12 ? "bggr12" :
-+          fourcc == V4L2_PIX_FMT_SGBRG12 ? "gbrg12" :
-+          fourcc == V4L2_PIX_FMT_SGRBG12 ? "grbg12" :
-+          fourcc == V4L2_PIX_FMT_SRGGB12 ? "rggb12" : "rggb12", NULL);
-+      break;
-+    case V4L2_PIX_FMT_SBGGR16:
-+    case V4L2_PIX_FMT_SGBRG16:
-+    case V4L2_PIX_FMT_SGRBG16:
-+    case V4L2_PIX_FMT_SRGGB16:
-+      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
-+          fourcc == V4L2_PIX_FMT_SBGGR16 ? "bggr16" :
-+          fourcc == V4L2_PIX_FMT_SGBRG16 ? "gbrg16" :
-+          fourcc == V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
-+          fourcc == V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NULL);
-       break;
-     case V4L2_PIX_FMT_SN9C10X:
-       structure = gst_structure_new_empty ("video/x-sonix");
-@@ -1847,6 +1901,30 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
-           fourcc = V4L2_PIX_FMT_SGRBG8;
-         else if (!g_ascii_strcasecmp (format, "rggb"))
-           fourcc = V4L2_PIX_FMT_SRGGB8;
-+        else if (!g_ascii_strcasecmp (format, "bggr10"))
-+          fourcc = V4L2_PIX_FMT_SBGGR10;
-+        else if (!g_ascii_strcasecmp (format, "gbrg10"))
-+          fourcc = V4L2_PIX_FMT_SGBRG10;
-+        else if (!g_ascii_strcasecmp (format, "grbg10"))
-+          fourcc = V4L2_PIX_FMT_SGRBG10;
-+        else if (!g_ascii_strcasecmp (format, "rggb10"))
-+          fourcc = V4L2_PIX_FMT_SRGGB10;
-+        else if (!g_ascii_strcasecmp (format, "bggr12"))
-+          fourcc = V4L2_PIX_FMT_SBGGR12;
-+        else if (!g_ascii_strcasecmp (format, "gbrg12"))
-+          fourcc = V4L2_PIX_FMT_SGBRG12;
-+        else if (!g_ascii_strcasecmp (format, "grbg12"))
-+          fourcc = V4L2_PIX_FMT_SGRBG12;
-+        else if (!g_ascii_strcasecmp (format, "rggb12"))
-+          fourcc = V4L2_PIX_FMT_SRGGB12;
-+        else if (!g_ascii_strcasecmp (format, "bggr16"))
-+          fourcc = V4L2_PIX_FMT_SBGGR16;
-+        else if (!g_ascii_strcasecmp (format, "gbrg16"))
-+          fourcc = V4L2_PIX_FMT_SGBRG16;
-+        else if (!g_ascii_strcasecmp (format, "grbg16"))
-+          fourcc = V4L2_PIX_FMT_SGRBG16;
-+        else if (!g_ascii_strcasecmp (format, "rggb16"))
-+          fourcc = V4L2_PIX_FMT_SRGGB16;
-       }
-     } else if (g_str_equal (mimetype, "video/x-sonix")) {
-       fourcc = V4L2_PIX_FMT_SN9C10X;
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
index 719b54bd..fc828d4d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
@@ -16,10 +16,10 @@ Signed-off-by: Rahul T R <r-ravikumar@ti.com>
  2 files changed, 61 insertions(+)
 
 diff --git a/sys/v4l2/ext/videodev2.h b/sys/v4l2/ext/videodev2.h
-index dc829f08d..5838bf906 100644
+index 2ceb1ca32d..e59363a29d 100644
 --- a/sys/v4l2/ext/videodev2.h
 +++ b/sys/v4l2/ext/videodev2.h
-@@ -638,6 +638,15 @@ struct v4l2_pix_format {
+@@ -702,6 +702,15 @@ struct v4l2_pix_format {
  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
@@ -32,31 +32,31 @@ index dc829f08d..5838bf906 100644
 +#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGIrG.. GRGB.. */
 +#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrGIr.. BGRG.. */
 +#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGIrG.. GBGR.. */
-
+ 
  /* HSV formats */
  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
 diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 97d09774b..74a6c5bf6 100644
+index 472a24ef55..9fe5dcc528 100644
 --- a/sys/v4l2/gstv4l2object.c
 +++ b/sys/v4l2/gstv4l2object.c
-@@ -175,6 +175,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
-   {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},
-   {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},
-
+@@ -195,6 +195,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
+   {MAP_FMT (SGRBG16, ENCODED),  GST_V4L2_BAYER},
+   {MAP_FMT (SRGGB16, ENCODED),  GST_V4L2_BAYER},
+ 
 +  /* Bayer formats - with IR component */
-+  {V4L2_PIX_FMT_SRGGI10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGRIG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SBGGI10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGBIG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGIRG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SIGGR10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SGIBG10, TRUE, GST_V4L2_RAW},
-+  {V4L2_PIX_FMT_SIGGB10, TRUE, GST_V4L2_RAW},
++  {MAP_FMT (SRGGI10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SGRIG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SBGGI10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SGBIG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SGIRG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SIGGR10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SGIBG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_FMT (SIGGB10, ENCODED),  GST_V4L2_BAYER},
 +
    /* compressed formats */
-   {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},
-   {V4L2_PIX_FMT_JPEG, FALSE, GST_V4L2_CODEC},
-@@ -1129,6 +1139,14 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
+   {MAP_FMT (MJPEG, ENCODED),        GST_V4L2_CODEC},
+   {MAP_FMT (JPEG, ENCODED),         GST_V4L2_CODEC},
+@@ -1194,6 +1204,14 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
      case V4L2_PIX_FMT_SGBRG16:
      case V4L2_PIX_FMT_SGRBG16:
      case V4L2_PIX_FMT_SRGGB16:
@@ -70,10 +70,10 @@ index 97d09774b..74a6c5bf6 100644
 +    case V4L2_PIX_FMT_SIGGB10:
        rank = BAYER_BASE_RANK;
        break;
-
-@@ -1577,6 +1595,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
-           fourcc == V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
-           fourcc == V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NULL);
+ 
+@@ -1574,6 +1592,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
+     case V4L2_PIX_FMT_SRGGB16:
+       bayer_format = "rggb16le";
        break;
 +    case V4L2_PIX_FMT_SRGGI10:
 +    case V4L2_PIX_FMT_SGRIG10:
@@ -96,28 +96,28 @@ index 97d09774b..74a6c5bf6 100644
      case V4L2_PIX_FMT_SN9C10X:
        structure = gst_structure_new_empty ("video/x-sonix");
        break;
-@@ -1921,6 +1957,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
-           fourcc = V4L2_PIX_FMT_SGRBG16;
-         else if (!g_ascii_strcasecmp (format, "rggb16"))
-           fourcc = V4L2_PIX_FMT_SRGGB16;
-+        else if (!g_ascii_strcasecmp (format, "rggi10"))
-+          fourcc = V4L2_PIX_FMT_SRGGI10;
-+        else if (!g_ascii_strcasecmp (format, "grig10"))
-+          fourcc = V4L2_PIX_FMT_SGRIG10;
-+        else if (!g_ascii_strcasecmp (format, "bggi10"))
-+          fourcc = V4L2_PIX_FMT_SBGGI10;
-+        else if (!g_ascii_strcasecmp (format, "gbig10"))
-+          fourcc = V4L2_PIX_FMT_SGBIG10;
-+        else if (!g_ascii_strcasecmp (format, "girg10"))
-+          fourcc = V4L2_PIX_FMT_SGIRG10;
-+        else if (!g_ascii_strcasecmp (format, "iggr10"))
-+          fourcc = V4L2_PIX_FMT_SIGGR10;
-+        else if (!g_ascii_strcasecmp (format, "gibg10"))
-+          fourcc = V4L2_PIX_FMT_SGIBG10;
-+        else if (!g_ascii_strcasecmp (format, "iggb10"))
-+          fourcc = V4L2_PIX_FMT_SIGGB10;
-       }
-     } else if (g_str_equal (mimetype, "video/x-sonix")) {
-       fourcc = V4L2_PIX_FMT_SN9C10X;
+@@ -1952,6 +1988,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
+         fourcc = V4L2_PIX_FMT_SGRBG16;
+       else if (!g_ascii_strcasecmp (format, "rggb16le"))
+         fourcc = V4L2_PIX_FMT_SRGGB16;
++      else if (!g_ascii_strcasecmp (format, "rggi10"))
++        fourcc = V4L2_PIX_FMT_SRGGI10;
++      else if (!g_ascii_strcasecmp (format, "grig10"))
++        fourcc = V4L2_PIX_FMT_SGRIG10;
++      else if (!g_ascii_strcasecmp (format, "bggi10"))
++        fourcc = V4L2_PIX_FMT_SBGGI10;
++      else if (!g_ascii_strcasecmp (format, "gbig10"))
++        fourcc = V4L2_PIX_FMT_SGBIG10;
++      else if (!g_ascii_strcasecmp (format, "girg10"))
++        fourcc = V4L2_PIX_FMT_SGIRG10;
++      else if (!g_ascii_strcasecmp (format, "iggr10"))
++        fourcc = V4L2_PIX_FMT_SIGGR10;
++      else if (!g_ascii_strcasecmp (format, "gibg10"))
++        fourcc = V4L2_PIX_FMT_SGIBG10;
++      else if (!g_ascii_strcasecmp (format, "iggb10"))
++        fourcc = V4L2_PIX_FMT_SIGGB10;
+     }
+   } else if (g_str_equal (mimetype, "video/x-sonix")) {
+     fourcc = V4L2_PIX_FMT_SN9C10X;
 --
 2.37.0
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index 91d05958..b4622fd6 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -30,10 +30,10 @@ index d85f036..e6a60dc 100644
 
 -static gboolean
 +gboolean
- gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group)
+ gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
+     gboolean check_writable)
  {
-   GstMemory *mem = gst_buffer_peek_memory (buffer, 0);
-@@ -1638,11 +1638,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+@@ -1584,11 +1584,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
              gst_v4l2_allocator_reset_group (pool->vallocator, group);
              /* queue back in the device */
              if (pool->other_pool)
@@ -62,11 +62,12 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.h b/sys/v4l2/gstv4l2bufferpool.h
 index 60340c2..cec4207 100644
 --- a/sys/v4l2/gstv4l2bufferpool.h
 +++ b/sys/v4l2/gstv4l2bufferpool.h
-@@ -124,6 +124,8 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
+@@ -124,6 +124,9 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
 
  void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2BufferPool *self);
 
-+gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group);
++gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
++                                              gboolean check_writable);
 +
  G_END_DECLS
 
@@ -122,7 +123,7 @@ index 3042995..0e4ac09 100644
 
      if (ret != GST_FLOW_OK)
        goto beach;
-+    buffer_valid = gst_v4l2_is_buffer_valid (buffer, &group);
++    buffer_valid = gst_v4l2_is_buffer_valid (buffer, &group, FALSE);
 
      GST_LOG_OBJECT (decoder, "Process output buffer");
      {
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
index f6307411..ff617655 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
@@ -24,10 +24,9 @@ diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
 index e9026da..ad9f630 100644
 --- a/sys/v4l2/gstv4l2object.c
 +++ b/sys/v4l2/gstv4l2object.c
-@@ -1930,17 +1930,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
+@@ -2013,17 +2013,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
    }
 
-
 -  /* Prefer the non-contiguous if supported */
 -  v4l2object->prefered_non_contiguous = TRUE;
 +  /* Prefer the contiguous if supported */
@@ -48,5 +47,6 @@ index e9026da..ad9f630 100644
    }
 
    if (fmt == NULL)
+     goto unsupported_format;
 --
 2.39.0
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
similarity index 83%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
index 6eddc74f..30dd5c85 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
@@ -1,7 +1,6 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append = " \
-    file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
-- 
2.17.1


