Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024F8EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:18:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17742.1687961932370033786
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 07:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ii8I6OYj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SEIp3Y072230
	for <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 09:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687961931;
	bh=WnN8kl1A+GqsKd4hpEY5D5GZXttXCW1dF9Beyuptfvw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ii8I6OYjyl4EzcACkaxpNNMfURQieJQZkEf/l+TDlv1GDHE4EoTqMa6Jsg3C+Vn/m
	 oAmBn+2sGO9uVrbMOWogZp6Vl+7QKJ8fUBhN5uabvkCPwTZdhno63EfPcb90mvgsGm
	 wRCoGXzLiBBMsgLqx+fsW3TBn37D0eC/hC7VQewk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SEIp0O129443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 09:18:51 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 09:18:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 09:18:51 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SEIpSw105402;
	Wed, 28 Jun 2023 09:18:51 -0500
Message-ID: <32256ad1-2fa9-9d0c-492a-d85c5043d8e2@ti.com>
Date: Wed, 28 Jun 2023 09:18:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2]
 gstreamer1.0-plugins-good: Add patches for raw10/12/16 and IR formats
To: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <devarsht@ti.com>, <j-luthra@ti.com>, <a-limaye@ti.com>, <denys@ti.com>
References: <20230627074420.3228-1-r-ravikumar@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230627074420.3228-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 14:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14720


This patch does not build cleanly.  There is an error:

ERROR: Applying patch 
'0001-Adding-support-for-bayer-formats-with-IR-component.patch' on 
target directory 
'/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-glibc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/gst-plugins-good-1.20.6'
CmdError('quilt --quiltrc 
/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-glibc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/recipe-sysroot-native/etc/quiltrc 
push', 0, 'stdout: Applying patch 
0001-Adding-support-for-bayer-formats-with-IR-component.patch
patching file sys/v4l2/ext/videodev2.h
Hunk #1 succeeded at 673 (offset 35 lines).
patching file sys/v4l2/gstv4l2object.c
Hunk #1 succeeded at 167 with fuzz 2 (offset -8 lines).
Hunk #2 FAILED at 1139.
Hunk #3 succeeded at 1566 with fuzz 2 (offset -21 lines).
Hunk #4 FAILED at 1949.
2 out of 4 hunks FAILED -- rejects in file sys/v4l2/gstv4l2object.c
Patch 0001-Adding-support-for-bayer-formats-with-IR-component.patch does 
not apply (enforce with -f)


Was this patch tested?



On 6/27/2023 2:44 AM, Rahul T R wrote:
> Add patches to support 10/12/16 bayer formats and bayer formats with
> IR components. This are required to support capture from imx390 and
> ov2312 cameras using gstreamer v4l2src
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
> 
> Notes:
>      v2:
>          Dropped first 2 parts in the title
>          Wrapped the commit message to 70 chars
> 
>   ...-for-bayer-formats-with-IR-component.patch | 122 +++++++++++++++++
>   ...-raw10-raw12-and-raw16-bayer-formats.patch | 123 ++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.20.%.bbappend |   5 +
>   3 files changed, 250 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch
> new file mode 100644
> index 00000000..f19068f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch
> @@ -0,0 +1,122 @@
> +From b495c8a8a2b4c5676d27a0a898d58ca83ba36a87 Mon Sep 17 00:00:00 2001
> +From: Rahul T R <r-ravikumar@ti.com>
> +Date: Mon, 4 Jul 2022 15:17:21 +0530
> +Subject: [PATCH] Adding support for bayer formats with IR component
> +
> +Add support for bayer formats with IR component.
> +this is required for cameras like ov2312 which
> +captures both RGB and IR
> +
> +Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> +---
> + sys/v4l2/ext/videodev2.h |  9 +++++++
> + sys/v4l2/gstv4l2object.c | 52 ++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 61 insertions(+)
> +
> +diff --git a/sys/v4l2/ext/videodev2.h b/sys/v4l2/ext/videodev2.h
> +index dc829f08d..5838bf906 100644
> +--- a/sys/v4l2/ext/videodev2.h
> ++++ b/sys/v4l2/ext/videodev2.h
> +@@ -638,6 +638,15 @@ struct v4l2_pix_format {
> + #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
> + #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
> + #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> ++	/* Bayer formats - with IR component */
> ++#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RGBG.. GIrGIr.. */
> ++#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GRGB.. IrGIrG.. */
> ++#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BGRG.. GIrGIr.. */
> ++#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GBGR.. IrGIrG.. */
> ++#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GIrGIr.. RGBG.. */
> ++#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGIrG.. GRGB.. */
> ++#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrGIr.. BGRG.. */
> ++#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGIrG.. GBGR.. */
> +
> + /* HSV formats */
> + #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 97d09774b..74a6c5bf6 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -175,6 +175,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
> +   {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},
> +
> ++  /* Bayer formats - with IR component */
> ++  {V4L2_PIX_FMT_SRGGI10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGRIG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SBGGI10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGBIG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGIRG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SIGGR10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGIBG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SIGGB10, TRUE, GST_V4L2_RAW},
> ++
> +   /* compressed formats */
> +   {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},
> +   {V4L2_PIX_FMT_JPEG, FALSE, GST_V4L2_CODEC},
> +@@ -1129,6 +1139,14 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
> +     case V4L2_PIX_FMT_SGBRG16:
> +     case V4L2_PIX_FMT_SGRBG16:
> +     case V4L2_PIX_FMT_SRGGB16:
> ++    case V4L2_PIX_FMT_SRGGI10:
> ++    case V4L2_PIX_FMT_SGRIG10:
> ++    case V4L2_PIX_FMT_SBGGI10:
> ++    case V4L2_PIX_FMT_SGBIG10:
> ++    case V4L2_PIX_FMT_SGIRG10:
> ++    case V4L2_PIX_FMT_SIGGR10:
> ++    case V4L2_PIX_FMT_SGIBG10:
> ++    case V4L2_PIX_FMT_SIGGB10:
> +       rank = BAYER_BASE_RANK;
> +       break;
> +
> +@@ -1577,6 +1595,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
> +           fourcc == V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
> +           fourcc == V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NULL);
> +       break;
> ++    case V4L2_PIX_FMT_SRGGI10:
> ++    case V4L2_PIX_FMT_SGRIG10:
> ++    case V4L2_PIX_FMT_SBGGI10:
> ++    case V4L2_PIX_FMT_SGBIG10:
> ++    case V4L2_PIX_FMT_SGIRG10:
> ++    case V4L2_PIX_FMT_SIGGR10:
> ++    case V4L2_PIX_FMT_SGIBG10:
> ++    case V4L2_PIX_FMT_SIGGB10:
> ++      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
> ++          fourcc == V4L2_PIX_FMT_SGRIG10 ? "grig10" :
> ++          fourcc == V4L2_PIX_FMT_SBGGI10 ? "bggi10" :
> ++          fourcc == V4L2_PIX_FMT_SGBIG10 ? "gbig10" :
> ++          fourcc == V4L2_PIX_FMT_SGIRG10 ? "girg10" :
> ++          fourcc == V4L2_PIX_FMT_SIGGR10 ? "iggr10" :
> ++          fourcc == V4L2_PIX_FMT_SGIBG10 ? "gibg10" :
> ++          fourcc == V4L2_PIX_FMT_SIGGB10 ? "iggb10" :
> ++          fourcc == V4L2_PIX_FMT_SRGGI10 ? "rggi10" : "bggi10", NULL);
> ++      break;
> +     case V4L2_PIX_FMT_SN9C10X:
> +       structure = gst_structure_new_empty ("video/x-sonix");
> +       break;
> +@@ -1921,6 +1957,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> +           fourcc = V4L2_PIX_FMT_SGRBG16;
> +         else if (!g_ascii_strcasecmp (format, "rggb16"))
> +           fourcc = V4L2_PIX_FMT_SRGGB16;
> ++        else if (!g_ascii_strcasecmp (format, "rggi10"))
> ++          fourcc = V4L2_PIX_FMT_SRGGI10;
> ++        else if (!g_ascii_strcasecmp (format, "grig10"))
> ++          fourcc = V4L2_PIX_FMT_SGRIG10;
> ++        else if (!g_ascii_strcasecmp (format, "bggi10"))
> ++          fourcc = V4L2_PIX_FMT_SBGGI10;
> ++        else if (!g_ascii_strcasecmp (format, "gbig10"))
> ++          fourcc = V4L2_PIX_FMT_SGBIG10;
> ++        else if (!g_ascii_strcasecmp (format, "girg10"))
> ++          fourcc = V4L2_PIX_FMT_SGIRG10;
> ++        else if (!g_ascii_strcasecmp (format, "iggr10"))
> ++          fourcc = V4L2_PIX_FMT_SIGGR10;
> ++        else if (!g_ascii_strcasecmp (format, "gibg10"))
> ++          fourcc = V4L2_PIX_FMT_SGIBG10;
> ++        else if (!g_ascii_strcasecmp (format, "iggb10"))
> ++          fourcc = V4L2_PIX_FMT_SIGGB10;
> +       }
> +     } else if (g_str_equal (mimetype, "video/x-sonix")) {
> +       fourcc = V4L2_PIX_FMT_SN9C10X;
> +--
> +2.37.0
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
> new file mode 100644
> index 00000000..a742ed5b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
> @@ -0,0 +1,123 @@
> +From: Emmanuel Madrigal <emmanuel.madrigal@ridgerun.com>
> +Date: Tue Feb 22 03:50:52 IST 2022
> +Subject: Adding support for raw10, raw12 and raw16 bayer formats
> +
> +Gstreamer 1.16 only supports raw8 bayer by default. This patch enables
> +sensors that support raw10, raw12 or raw16 to be used with v4l2src.
> +Will need to be carried in meta-psdkla as long as we are using Gstreamer 1.16
> +
> +Upstream-Status: Pending
> +Signed-off-by: Limaye, Aniket <a-limaye@ti.com>
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 2c78e2227..a5d2e2de1 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -162,6 +162,18 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] = {
> +   {V4L2_PIX_FMT_SGBRG8, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_SGRBG8, TRUE, GST_V4L2_RAW},
> +   {V4L2_PIX_FMT_SRGGB8, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SBGGR10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGBRG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGRBG10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SRGGB10, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SBGGR12, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGBRG12, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGRBG12, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SRGGB12, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SBGGR16, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGBRG16, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},
> ++  {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},
> +
> +   /* compressed formats */
> +   {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},
> +@@ -1105,6 +1117,18 @@ gst_v4l2_object_format_get_rank (const struct v4l2_fmtdesc *fmt)
> +     case V4L2_PIX_FMT_SGBRG8:
> +     case V4L2_PIX_FMT_SGRBG8:
> +     case V4L2_PIX_FMT_SRGGB8:
> ++    case V4L2_PIX_FMT_SBGGR10:
> ++    case V4L2_PIX_FMT_SGBRG10:
> ++    case V4L2_PIX_FMT_SGRBG10:
> ++    case V4L2_PIX_FMT_SRGGB10:
> ++    case V4L2_PIX_FMT_SBGGR12:
> ++    case V4L2_PIX_FMT_SGBRG12:
> ++    case V4L2_PIX_FMT_SGRBG12:
> ++    case V4L2_PIX_FMT_SRGGB12:
> ++    case V4L2_PIX_FMT_SBGGR16:
> ++    case V4L2_PIX_FMT_SGBRG16:
> ++    case V4L2_PIX_FMT_SGRBG16:
> ++    case V4L2_PIX_FMT_SRGGB16:
> +       rank = BAYER_BASE_RANK;
> +       break;
> +
> +@@ -1521,7 +1545,37 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint32 fourcc)
> +           fourcc == V4L2_PIX_FMT_SBGGR8 ? "bggr" :
> +           fourcc == V4L2_PIX_FMT_SGBRG8 ? "gbrg" :
> +           fourcc == V4L2_PIX_FMT_SGRBG8 ? "grbg" :
> +-          /* fourcc == V4L2_PIX_FMT_SRGGB8 ? */ "rggb", NULL);
> ++          fourcc == V4L2_PIX_FMT_SRGGB8 ? "rggb" : "rggb", NULL);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR10:
> ++    case V4L2_PIX_FMT_SGBRG10:
> ++    case V4L2_PIX_FMT_SGRBG10:
> ++    case V4L2_PIX_FMT_SRGGB10:
> ++      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
> ++          fourcc == V4L2_PIX_FMT_SBGGR10 ? "bggr10" :
> ++          fourcc == V4L2_PIX_FMT_SGBRG10 ? "gbrg10" :
> ++          fourcc == V4L2_PIX_FMT_SGRBG10 ? "grbg10" :
> ++          fourcc == V4L2_PIX_FMT_SRGGB10 ? "rggb10" : "rggb10", NULL);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR12:
> ++    case V4L2_PIX_FMT_SGBRG12:
> ++    case V4L2_PIX_FMT_SGRBG12:
> ++    case V4L2_PIX_FMT_SRGGB12:
> ++      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
> ++          fourcc == V4L2_PIX_FMT_SBGGR12 ? "bggr12" :
> ++          fourcc == V4L2_PIX_FMT_SGBRG12 ? "gbrg12" :
> ++          fourcc == V4L2_PIX_FMT_SGRBG12 ? "grbg12" :
> ++          fourcc == V4L2_PIX_FMT_SRGGB12 ? "rggb12" : "rggb12", NULL);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR16:
> ++    case V4L2_PIX_FMT_SGBRG16:
> ++    case V4L2_PIX_FMT_SGRBG16:
> ++    case V4L2_PIX_FMT_SRGGB16:
> ++      structure = gst_structure_new ("video/x-bayer", "format", G_TYPE_STRING,
> ++          fourcc == V4L2_PIX_FMT_SBGGR16 ? "bggr16" :
> ++          fourcc == V4L2_PIX_FMT_SGBRG16 ? "gbrg16" :
> ++          fourcc == V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
> ++          fourcc == V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NULL);
> +       break;
> +     case V4L2_PIX_FMT_SN9C10X:
> +       structure = gst_structure_new_empty ("video/x-sonix");
> +@@ -1847,6 +1901,30 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> +           fourcc = V4L2_PIX_FMT_SGRBG8;
> +         else if (!g_ascii_strcasecmp (format, "rggb"))
> +           fourcc = V4L2_PIX_FMT_SRGGB8;
> ++        else if (!g_ascii_strcasecmp (format, "bggr10"))
> ++          fourcc = V4L2_PIX_FMT_SBGGR10;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg10"))
> ++          fourcc = V4L2_PIX_FMT_SGBRG10;
> ++        else if (!g_ascii_strcasecmp (format, "grbg10"))
> ++          fourcc = V4L2_PIX_FMT_SGRBG10;
> ++        else if (!g_ascii_strcasecmp (format, "rggb10"))
> ++          fourcc = V4L2_PIX_FMT_SRGGB10;
> ++        else if (!g_ascii_strcasecmp (format, "bggr12"))
> ++          fourcc = V4L2_PIX_FMT_SBGGR12;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg12"))
> ++          fourcc = V4L2_PIX_FMT_SGBRG12;
> ++        else if (!g_ascii_strcasecmp (format, "grbg12"))
> ++          fourcc = V4L2_PIX_FMT_SGRBG12;
> ++        else if (!g_ascii_strcasecmp (format, "rggb12"))
> ++          fourcc = V4L2_PIX_FMT_SRGGB12;
> ++        else if (!g_ascii_strcasecmp (format, "bggr16"))
> ++          fourcc = V4L2_PIX_FMT_SBGGR16;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg16"))
> ++          fourcc = V4L2_PIX_FMT_SGBRG16;
> ++        else if (!g_ascii_strcasecmp (format, "grbg16"))
> ++          fourcc = V4L2_PIX_FMT_SGRBG16;
> ++        else if (!g_ascii_strcasecmp (format, "rggb16"))
> ++          fourcc = V4L2_PIX_FMT_SRGGB16;
> +       }
> +     } else if (g_str_equal (mimetype, "video/x-sonix")) {
> +       fourcc = V4L2_PIX_FMT_SN9C10X;
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> index 1c4c8515..eb0cafe6 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> @@ -1,5 +1,10 @@
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> +SRC_URI:append = " \
> +    file://0001-Adding-support-for-bayer-formats-with-IR-component.patch \
> +    file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
> +"
> +
>   SRC_URI:append:j721s2 = " \
>       file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>       file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

