Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A93CC36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 18:33:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.29937.1743964425083758174
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 06 Apr 2025 11:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ItCVsUQS;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 536IXhHt736633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Apr 2025 13:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743964423;
	bh=bcy4cO6kqaaDcL8Tsj9UuQIz+95RuonXmw6Kn7cvYI4=;
	h=From:To:Subject:Date;
	b=ItCVsUQSoJCbNbCyiGsXvQvfkfYoHWc36cTGSGcm5Geb8thLG/6DQk02ZMohnEO6r
	 mbJ6rUWjvV4U6sNjTUxly159mNq3xyeekv2h/hOQv3QMxwQaitjxIw8TIqFfD+kH8T
	 oPBgZyIst5EXTO8A/ibIpwB5FiXd+gnBmcvmdzic=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 536IXh9c017279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 6 Apr 2025 13:33:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 6
 Apr 2025 13:33:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 6 Apr 2025 13:33:43 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 536IXh2n047689;
	Sun, 6 Apr 2025 13:33:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1u1UoR-0005A1-2K; Sun, 06 Apr 2025 13:33:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: upgrade 1.24.x -> 1.26.x
Date: Sun, 6 Apr 2025 13:33:43 -0500
Message-ID: <20250406183343.19797-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 06 Apr 2025 18:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16159

oe-core upgraded the version [1], so we need to match it.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3bed80c1266ddca5d83357a18164598082e3a4fa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-for-bayer-formats-with-IR-component.patch | 32 +++++++++----------
 .../gstreamer1.0-plugins-good_1.24.%.bbappend |  4 ---
 ... gstreamer1.0-plugins-good_1.26-arago.inc} |  0
 .../gstreamer1.0-plugins-good_1.26.%.bbappend |  4 +++
 4 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24-arago.inc => gstreamer1.0-plugins-good_1.26-arago.inc} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
index fc828d4d..933de895 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-Adding-support-for-bayer-formats-with-IR-component.patch
@@ -39,24 +39,24 @@ diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
 index 472a24ef55..9fe5dcc528 100644
 --- a/sys/v4l2/gstv4l2object.c
 +++ b/sys/v4l2/gstv4l2object.c
-@@ -195,6 +195,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
-   {MAP_FMT (SGRBG16, ENCODED),  GST_V4L2_BAYER},
-   {MAP_FMT (SRGGB16, ENCODED),  GST_V4L2_BAYER},
+@@ -215,6 +215,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
+   {MAP_ENC_FMT (SGRBG16, ENCODED),  GST_V4L2_BAYER},
+   {MAP_ENC_FMT (SRGGB16, ENCODED),  GST_V4L2_BAYER},
  
 +  /* Bayer formats - with IR component */
-+  {MAP_FMT (SRGGI10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SGRIG10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SBGGI10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SGBIG10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SGIRG10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SIGGR10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SGIBG10, ENCODED),  GST_V4L2_BAYER},
-+  {MAP_FMT (SIGGB10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SRGGI10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SGRIG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SBGGI10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SGBIG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SGIRG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SIGGR10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SGIBG10, ENCODED),  GST_V4L2_BAYER},
++  {MAP_ENC_FMT (SIGGB10, ENCODED),  GST_V4L2_BAYER},
 +
    /* compressed formats */
-   {MAP_FMT (MJPEG, ENCODED),        GST_V4L2_CODEC},
-   {MAP_FMT (JPEG, ENCODED),         GST_V4L2_CODEC},
-@@ -1194,6 +1204,14 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
+   {MAP_ENC_FMT (MJPEG, ENCODED),        GST_V4L2_CODEC},
+   {MAP_ENC_FMT (JPEG, ENCODED),         GST_V4L2_CODEC},
+@@ -1215,6 +1225,14 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
      case V4L2_PIX_FMT_SGBRG16:
      case V4L2_PIX_FMT_SGRBG16:
      case V4L2_PIX_FMT_SRGGB16:
@@ -71,7 +71,7 @@ index 472a24ef55..9fe5dcc528 100644
        rank = BAYER_BASE_RANK;
        break;
  
-@@ -1574,6 +1592,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
+@@ -1642,6 +1660,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
      case V4L2_PIX_FMT_SRGGB16:
        bayer_format = "rggb16le";
        break;
@@ -96,7 +96,7 @@ index 472a24ef55..9fe5dcc528 100644
      case V4L2_PIX_FMT_SN9C10X:
        structure = gst_structure_new_empty ("video/x-sonix");
        break;
-@@ -1952,6 +1988,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
+@@ -2063,6 +2099,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
          fourcc = V4L2_PIX_FMT_SGRBG16;
        else if (!g_ascii_strcasecmp (format, "rggb16le"))
          fourcc = V4L2_PIX_FMT_SRGGB16;
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
deleted file mode 100644
index e2e8b043..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO = ""
-GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO:arago = "gstreamer1.0-plugins-good_1.24-arago.inc"
-
-require ${GSTREAMER1p0_PLUGINS_GOOD_1p24_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24-arago.inc
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
new file mode 100644
index 00000000..0ceb558c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO = ""
+GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago = "gstreamer1.0-plugins-good_1.26-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
-- 
2.17.1


