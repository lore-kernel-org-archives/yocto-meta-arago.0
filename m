Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F48FC2BA1A
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 12:18:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.84645.1718713087726715889
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 05:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WK/AAU7g;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ICI6V0065556;
	Tue, 18 Jun 2024 07:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718713086;
	bh=DziCbVP40F9TPUARlR7xp+7rbrhPGuJrJpUepwIMceY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WK/AAU7gcPYCPrmcJqgtxpthKDA34Z19EUY9wUjIUUs4IHpZ/YmY//4KDPGXsRwUs
	 j+zm9CE/BlW0XrDHqxlPBalpCvgl7Iq6YVePmCbqgJd9tw9cLc63oDlcqwyB2eI42J
	 273RGH9A3kKPGLzcwWTQCpdU88TAPj9E9gGw0a2Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ICI6Gh003048
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 07:18:06 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 07:18:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 07:18:06 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ICI5Ik121038;
	Tue, 18 Jun 2024 07:18:06 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [master/scarthgap][PATCH 2/2] v4l-utils: Add RGB-IR format support
Date: Tue, 18 Jun 2024 17:47:34 +0530
Message-ID: <20240618121743.2698489-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618121743.2698489-1-j-luthra@ti.com>
References: <20240618121743.2698489-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Jun 2024 12:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15398

Add support for 4x4 RGB-IR bayer formats used by OV2312 and OX05B1S
camera sensors in TI's 6.6 linux kernel.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 ...-add-support-for-RGBIr-bayer-formats.patch | 62 +++++++++++++++++++
 .../v4l2apps/v4l-utils_%.bbappend             |  8 +++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
new file mode 100644
index 00000000..31e3d91b
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
@@ -0,0 +1,62 @@
+From 26e2a60d29456a9cc6acb16ea19039414808bc5e Mon Sep 17 00:00:00 2001
+From: Jai Luthra <j-luthra@ti.com>
+Date: Tue, 5 Jul 2022 16:23:39 +0530
+Subject: [PATCH] media-ctl: add support for RGBIr bayer formats
+
+Upstream-Status: Pending
+Signed-off-by: Jai Luthra <j-luthra@ti.com>
+---
+ include/linux/media-bus-format.h | 10 +++++++++-
+ include/linux/videodev2.h        |  9 +++++++++
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
+index ca9a24c8..cbdf3798 100644
+--- a/include/linux/media-bus-format.h
++++ b/include/linux/media-bus-format.h
+@@ -117,7 +117,7 @@
+ #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
+ #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
+
+-/* Bayer - next is	0x3021 */
++/* Bayer - next is	0x3029 */
+ #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
+ #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
+ #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
+@@ -150,6 +150,14 @@
+ #define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
+ #define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
+ #define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
++#define MEDIA_BUS_FMT_SRGGI10_1X10		0x3021
++#define MEDIA_BUS_FMT_SGRIG10_1X10		0x3022
++#define MEDIA_BUS_FMT_SBGGI10_1X10		0x3023
++#define MEDIA_BUS_FMT_SGBIG10_1X10		0x3024
++#define MEDIA_BUS_FMT_SGIRG10_1X10		0x3025
++#define MEDIA_BUS_FMT_SIGGR10_1X10		0x3026
++#define MEDIA_BUS_FMT_SGIBG10_1X10		0x3027
++#define MEDIA_BUS_FMT_SIGGB10_1X10		0x3028
+
+ /* JPEG compressed formats - next is	0x4002 */
+ #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
+diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
+index 5eb96692..093104ab 100644
+--- a/include/linux/videodev2.h
++++ b/include/linux/videodev2.h
+@@ -682,6 +682,15 @@ struct v4l2_pix_format {
+ #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
+ #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
+ #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
++	/* 10bit raw bayer with IR (4x4) */
++#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RGBG.. GIrGIr.. */
++#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GRGB.. IrGIrG.. */
++#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BGRG.. GIrGIr.. */
++#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GBGR.. IrGIrG.. */
++#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GIrGIr.. RGBG.. */
++#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGIrG.. GRGB.. */
++#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrGIr.. BGRG.. */
++#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGIrG.. GBGR.. */
+
+ /* HSV formats */
+ #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
+--
+2.40.0
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
new file mode 100644
index 00000000..f535025d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI:append = " \
+    file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
+"
+
+PR:append = ".arago0"
+
-- 
2.43.0


