Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58040EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 03:32:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.4692.1688095925631803982
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 20:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CPtT7a/t;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35U3W4Je065693
	for <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 22:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688095924;
	bh=vOrmtcUjSWX3LLRrKrq1yvTTtkKB768KgmlC91y+qWM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=CPtT7a/tTuKxQ9s8MrFJFqXWPwC6mYbhaKc2qDduegRBJQU+IUElAy42wHxQY1t+h
	 cgTxWzAudM/O4jalrcB+Wpb5vBrTqoXHrbnGKWDa35Yfw6phjtPyrcJ/OmeAwsajtZ
	 Wu+E84Ker3OVVUMWvW43REGkKdRSjuQsZR20KReA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35U3W443076361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 22:32:04 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 22:32:04 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.023; Thu, 29 Jun 2023 22:32:04 -0500
From: "Ravikumar, Rahul" <r-ravikumar@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Thakkar, Devarsh" <devarsht@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
        "Limaye, Aniket" <a-limaye@ti.com>,
        "Dmytriyenko, Denys" <denys@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH v2]
 gstreamer1.0-plugins-good: Add patches for raw10/12/16 and IR formats
Thread-Topic: [meta-arago][master/kirkstone][PATCH v2]
 gstreamer1.0-plugins-good: Add patches for raw10/12/16 and IR formats
Thread-Index: AQHZqMsx15xgj5YOAkmuz4SdN2zAka+gmSeAgAIaZck=
Date: Fri, 30 Jun 2023 03:32:04 +0000
Message-ID: <55cc01821b254991a23cc39902b32fba@ti.com>
References: <20230627074420.3228-1-r-ravikumar@ti.com>,<32256ad1-2fa9-9d0c-492a-d85c5043d8e2@ti.com>
In-Reply-To: <32256ad1-2fa9-9d0c-492a-d85c5043d8e2@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.4.42.16]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_55cc01821b254991a23cc39902b32fbaticom_"
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jun 2023 03:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14742

--_000_55cc01821b254991a23cc39902b32fbaticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

Sorry for top posting, I am on ooo currently

Yes these patches are tested, I just added
them in wrong order

Raw 10/12 bit support patch should be added
before IR patch
Can you please fix this locally, since
I will not be able to resend this
anytime soon

Regards
Rahul T R
________________________________
From: Eatmon, Ryan
Sent: Wednesday, June 28, 2023 7:48:51 PM
To: Ravikumar, Rahul; meta-arago@lists.yoctoproject.org
Cc: Thakkar, Devarsh; Luthra, Jai; Limaye, Aniket; Dmytriyenko, Denys
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] gstreamer1.0-plugins-=
good: Add patches for raw10/12/16 and IR formats


This patch does not build cleanly.  There is an error:

ERROR: Applying patch
'0001-Adding-support-for-bayer-formats-with-IR-component.patch' on
target directory
'/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-=
glibc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/gst-=
plugins-good-1.20.6'
CmdError('quilt --quiltrc
/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-g=
libc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/recip=
e-sysroot-native/etc/quiltrc
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
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-componen=
t.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-fo=
rmats.patch
>
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch =
b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0001-Adding-support-for-bayer-formats-with-IR-component.patch
> new file mode 100644
> index 00000000..f19068f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-Adding-support-for-bayer-formats-with-IR-component.patch
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
> + #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBG=
B.. RGRG.. */
> + #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRG=
R.. BGBG.. */
> + #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGR=
G.. GBGB.. */
> ++    /* Bayer formats - with IR component */
> ++#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RGBG=
.. GIrGIr.. */
> ++#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GRGB=
.. IrGIrG.. */
> ++#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BGRG=
.. GIrGIr.. */
> ++#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GBGR=
.. IrGIrG.. */
> ++#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GIrG=
Ir.. RGBG.. */
> ++#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGI=
rG.. GRGB.. */
> ++#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrG=
Ir.. BGRG.. */
> ++#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGI=
rG.. GBGR.. */
> +
> + /* HSV formats */
> + #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 97d09774b..74a6c5bf6 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -175,6 +175,16 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] =
=3D {
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
> +@@ -1129,6 +1139,14 @@ gst_v4l2_object_format_get_rank (const struct v4l=
2_fmtdesc *fmt)
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
> +       rank =3D BAYER_BASE_RANK;
> +       break;
> +
> +@@ -1577,6 +1595,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint3=
2 fourcc)
> +           fourcc =3D=3D V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
> +           fourcc =3D=3D V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NUL=
L);
> +       break;
> ++    case V4L2_PIX_FMT_SRGGI10:
> ++    case V4L2_PIX_FMT_SGRIG10:
> ++    case V4L2_PIX_FMT_SBGGI10:
> ++    case V4L2_PIX_FMT_SGBIG10:
> ++    case V4L2_PIX_FMT_SGIRG10:
> ++    case V4L2_PIX_FMT_SIGGR10:
> ++    case V4L2_PIX_FMT_SGIBG10:
> ++    case V4L2_PIX_FMT_SIGGB10:
> ++      structure =3D gst_structure_new ("video/x-bayer", "format", G_TYP=
E_STRING,
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGRIG10 ? "grig10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SBGGI10 ? "bggi10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGBIG10 ? "gbig10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGIRG10 ? "girg10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SIGGR10 ? "iggr10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGIBG10 ? "gibg10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SIGGB10 ? "iggb10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SRGGI10 ? "rggi10" : "bggi10", NUL=
L);
> ++      break;
> +     case V4L2_PIX_FMT_SN9C10X:
> +       structure =3D gst_structure_new_empty ("video/x-sonix");
> +       break;
> +@@ -1921,6 +1957,22 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4=
l2object, GstCaps * caps,
> +           fourcc =3D V4L2_PIX_FMT_SGRBG16;
> +         else if (!g_ascii_strcasecmp (format, "rggb16"))
> +           fourcc =3D V4L2_PIX_FMT_SRGGB16;
> ++        else if (!g_ascii_strcasecmp (format, "rggi10"))
> ++          fourcc =3D V4L2_PIX_FMT_SRGGI10;
> ++        else if (!g_ascii_strcasecmp (format, "grig10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGRIG10;
> ++        else if (!g_ascii_strcasecmp (format, "bggi10"))
> ++          fourcc =3D V4L2_PIX_FMT_SBGGI10;
> ++        else if (!g_ascii_strcasecmp (format, "gbig10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGBIG10;
> ++        else if (!g_ascii_strcasecmp (format, "girg10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGIRG10;
> ++        else if (!g_ascii_strcasecmp (format, "iggr10"))
> ++          fourcc =3D V4L2_PIX_FMT_SIGGR10;
> ++        else if (!g_ascii_strcasecmp (format, "gibg10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGIBG10;
> ++        else if (!g_ascii_strcasecmp (format, "iggb10"))
> ++          fourcc =3D V4L2_PIX_FMT_SIGGB10;
> +       }
> +     } else if (g_str_equal (mimetype, "video/x-sonix")) {
> +       fourcc =3D V4L2_PIX_FMT_SN9C10X;
> +--
> +2.37.0
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.pa=
tch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
> new file mode 100644
> index 00000000..a742ed5b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch
> @@ -0,0 +1,123 @@
> +From: Emmanuel Madrigal <emmanuel.madrigal@ridgerun.com>
> +Date: Tue Feb 22 03:50:52 IST 2022
> +Subject: Adding support for raw10, raw12 and raw16 bayer formats
> +
> +Gstreamer 1.16 only supports raw8 bayer by default. This patch enables
> +sensors that support raw10, raw12 or raw16 to be used with v4l2src.
> +Will need to be carried in meta-psdkla as long as we are using Gstreamer=
 1.16
> +
> +Upstream-Status: Pending
> +Signed-off-by: Limaye, Aniket <a-limaye@ti.com>
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 2c78e2227..a5d2e2de1 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -162,6 +162,18 @@ static const GstV4L2FormatDesc gst_v4l2_formats[] =
=3D {
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
> +@@ -1105,6 +1117,18 @@ gst_v4l2_object_format_get_rank (const struct v4l=
2_fmtdesc *fmt)
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
> +       rank =3D BAYER_BASE_RANK;
> +       break;
> +
> +@@ -1521,7 +1545,37 @@ gst_v4l2_object_v4l2fourcc_to_bare_struct (guint3=
2 fourcc)
> +           fourcc =3D=3D V4L2_PIX_FMT_SBGGR8 ? "bggr" :
> +           fourcc =3D=3D V4L2_PIX_FMT_SGBRG8 ? "gbrg" :
> +           fourcc =3D=3D V4L2_PIX_FMT_SGRBG8 ? "grbg" :
> +-          /* fourcc =3D=3D V4L2_PIX_FMT_SRGGB8 ? */ "rggb", NULL);
> ++          fourcc =3D=3D V4L2_PIX_FMT_SRGGB8 ? "rggb" : "rggb", NULL);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR10:
> ++    case V4L2_PIX_FMT_SGBRG10:
> ++    case V4L2_PIX_FMT_SGRBG10:
> ++    case V4L2_PIX_FMT_SRGGB10:
> ++      structure =3D gst_structure_new ("video/x-bayer", "format", G_TYP=
E_STRING,
> ++          fourcc =3D=3D V4L2_PIX_FMT_SBGGR10 ? "bggr10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGBRG10 ? "gbrg10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGRBG10 ? "grbg10" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SRGGB10 ? "rggb10" : "rggb10", NUL=
L);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR12:
> ++    case V4L2_PIX_FMT_SGBRG12:
> ++    case V4L2_PIX_FMT_SGRBG12:
> ++    case V4L2_PIX_FMT_SRGGB12:
> ++      structure =3D gst_structure_new ("video/x-bayer", "format", G_TYP=
E_STRING,
> ++          fourcc =3D=3D V4L2_PIX_FMT_SBGGR12 ? "bggr12" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGBRG12 ? "gbrg12" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGRBG12 ? "grbg12" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SRGGB12 ? "rggb12" : "rggb12", NUL=
L);
> ++      break;
> ++    case V4L2_PIX_FMT_SBGGR16:
> ++    case V4L2_PIX_FMT_SGBRG16:
> ++    case V4L2_PIX_FMT_SGRBG16:
> ++    case V4L2_PIX_FMT_SRGGB16:
> ++      structure =3D gst_structure_new ("video/x-bayer", "format", G_TYP=
E_STRING,
> ++          fourcc =3D=3D V4L2_PIX_FMT_SBGGR16 ? "bggr16" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGBRG16 ? "gbrg16" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SGRBG16 ? "grbg16" :
> ++          fourcc =3D=3D V4L2_PIX_FMT_SRGGB16 ? "rggb16" : "rggb16", NUL=
L);
> +       break;
> +     case V4L2_PIX_FMT_SN9C10X:
> +       structure =3D gst_structure_new_empty ("video/x-sonix");
> +@@ -1847,6 +1901,30 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4=
l2object, GstCaps * caps,
> +           fourcc =3D V4L2_PIX_FMT_SGRBG8;
> +         else if (!g_ascii_strcasecmp (format, "rggb"))
> +           fourcc =3D V4L2_PIX_FMT_SRGGB8;
> ++        else if (!g_ascii_strcasecmp (format, "bggr10"))
> ++          fourcc =3D V4L2_PIX_FMT_SBGGR10;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGBRG10;
> ++        else if (!g_ascii_strcasecmp (format, "grbg10"))
> ++          fourcc =3D V4L2_PIX_FMT_SGRBG10;
> ++        else if (!g_ascii_strcasecmp (format, "rggb10"))
> ++          fourcc =3D V4L2_PIX_FMT_SRGGB10;
> ++        else if (!g_ascii_strcasecmp (format, "bggr12"))
> ++          fourcc =3D V4L2_PIX_FMT_SBGGR12;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg12"))
> ++          fourcc =3D V4L2_PIX_FMT_SGBRG12;
> ++        else if (!g_ascii_strcasecmp (format, "grbg12"))
> ++          fourcc =3D V4L2_PIX_FMT_SGRBG12;
> ++        else if (!g_ascii_strcasecmp (format, "rggb12"))
> ++          fourcc =3D V4L2_PIX_FMT_SRGGB12;
> ++        else if (!g_ascii_strcasecmp (format, "bggr16"))
> ++          fourcc =3D V4L2_PIX_FMT_SBGGR16;
> ++        else if (!g_ascii_strcasecmp (format, "gbrg16"))
> ++          fourcc =3D V4L2_PIX_FMT_SGBRG16;
> ++        else if (!g_ascii_strcasecmp (format, "grbg16"))
> ++          fourcc =3D V4L2_PIX_FMT_SGRBG16;
> ++        else if (!g_ascii_strcasecmp (format, "rggb16"))
> ++          fourcc =3D V4L2_PIX_FMT_SRGGB16;
> +       }
> +     } else if (g_str_equal (mimetype, "video/x-sonix")) {
> +       fourcc =3D V4L2_PIX_FMT_SN9C10X;
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.20.%.bbappend
> index 1c4c8515..eb0cafe6 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.20.%.bbappend
> @@ -1,5 +1,10 @@
>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>
> +SRC_URI:append =3D " \
> +    file://0001-Adding-support-for-bayer-formats-with-IR-component.patch=
 \
> +    file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.p=
atch \
> +"
> +
>   SRC_URI:append:j721s2 =3D " \
>       file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>       file://0002-v4l2-Give-preference-to-contiguous-format-if-support.pa=
tch \

--
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

--_000_55cc01821b254991a23cc39902b32fbaticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>Hi Ryan,<br>
<br>
Sorry for top posting, I am on ooo currently<br>
<br>
Yes these patches are tested, I just added<br>
them in wrong order<br>
<br>
Raw 10/12 bit support patch should be added <br>
before IR patch<br>
Can you please fix this locally, since<br>
I will not be able to resend this<br>
anytime soon<br>
<br>
Regards<br>
Rahul T R
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Eatmon, Ryan<br>
<b>Sent:</b> Wednesday, June 28, 2023 7:48:51 PM<br>
<b>To:</b> Ravikumar, Rahul; meta-arago@lists.yoctoproject.org<br>
<b>Cc:</b> Thakkar, Devarsh; Luthra, Jai; Limaye, Aniket; Dmytriyenko, Deny=
s<br>
<b>Subject:</b> Re: [meta-arago][master/kirkstone][PATCH v2] gstreamer1.0-p=
lugins-good: Add patches for raw10/12/16 and IR formats</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
This patch does not build cleanly.&nbsp; There is an error:<br>
<br>
ERROR: Applying patch <br>
'0001-Adding-support-for-bayer-formats-with-IR-component.patch' on <br>
target directory <br>
'/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-=
glibc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/gst-=
plugins-good-1.20.6'<br>
CmdError('quilt --quiltrc <br>
/scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-g=
libc/work/aarch64-oe-linux/gstreamer1.0-plugins-good/1.20.6-r0.arago0/recip=
e-sysroot-native/etc/quiltrc
<br>
push', 0, 'stdout: Applying patch <br>
0001-Adding-support-for-bayer-formats-with-IR-component.patch<br>
patching file sys/v4l2/ext/videodev2.h<br>
Hunk #1 succeeded at 673 (offset 35 lines).<br>
patching file sys/v4l2/gstv4l2object.c<br>
Hunk #1 succeeded at 167 with fuzz 2 (offset -8 lines).<br>
Hunk #2 FAILED at 1139.<br>
Hunk #3 succeeded at 1566 with fuzz 2 (offset -21 lines).<br>
Hunk #4 FAILED at 1949.<br>
2 out of 4 hunks FAILED -- rejects in file sys/v4l2/gstv4l2object.c<br>
Patch 0001-Adding-support-for-bayer-formats-with-IR-component.patch does <b=
r>
not apply (enforce with -f)<br>
<br>
<br>
Was this patch tested?<br>
<br>
<br>
<br>
On 6/27/2023 2:44 AM, Rahul T R wrote:<br>
&gt; Add patches to support 10/12/16 bayer formats and bayer formats with<b=
r>
&gt; IR components. This are required to support capture from imx390 and<br=
>
&gt; ov2312 cameras using gstreamer v4l2src<br>
&gt; <br>
&gt; Signed-off-by: Rahul T R &lt;r-ravikumar@ti.com&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Notes:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v2:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dropped first 2 =
parts in the title<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wrapped the comm=
it message to 70 chars<br>
&gt; <br>
&gt;&nbsp;&nbsp; ...-for-bayer-formats-with-IR-component.patch | 122 &#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;<br>
&gt;&nbsp;&nbsp; ...-raw10-raw12-and-raw16-bayer-formats.patch | 123 &#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;<br>
&gt;&nbsp;&nbsp; .../gstreamer1.0-plugins-good_1.20.%.bbappend |&nbsp;&nbsp=
; 5 &#43;<br>
&gt;&nbsp;&nbsp; 3 files changed, 250 insertions(&#43;)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-good/0001-Adding-support-for-bayer-formats-wit=
h-IR-component.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-r=
aw16-bayer-formats.patch<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-component.pat=
ch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0001-Adding-support-for-bayer-formats-with-IR-component.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000..f19068f9<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/0001-Adding-support-for-bayer-formats-with-IR-componen=
t.patch<br>
&gt; @@ -0,0 &#43;1,122 @@<br>
&gt; &#43;From b495c8a8a2b4c5676d27a0a898d58ca83ba36a87 Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Rahul T R &lt;r-ravikumar@ti.com&gt;<br>
&gt; &#43;Date: Mon, 4 Jul 2022 15:17:21 &#43;0530<br>
&gt; &#43;Subject: [PATCH] Adding support for bayer formats with IR compone=
nt<br>
&gt; &#43;<br>
&gt; &#43;Add support for bayer formats with IR component.<br>
&gt; &#43;this is required for cameras like ov2312 which<br>
&gt; &#43;captures both RGB and IR<br>
&gt; &#43;<br>
&gt; &#43;Signed-off-by: Rahul T R &lt;r-ravikumar@ti.com&gt;<br>
&gt; &#43;---<br>
&gt; &#43; sys/v4l2/ext/videodev2.h |&nbsp; 9 &#43;&#43;&#43;&#43;&#43;&#43=
;&#43;<br>
&gt; &#43; sys/v4l2/gstv4l2object.c | 52 &#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;<br>
&gt; &#43; 2 files changed, 61 insertions(&#43;)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/sys/v4l2/ext/videodev2.h b/sys/v4l2/ext/videodev2.h<=
br>
&gt; &#43;index dc829f08d..5838bf906 100644<br>
&gt; &#43;--- a/sys/v4l2/ext/videodev2.h<br>
&gt; &#43;&#43;&#43;&#43; b/sys/v4l2/ext/videodev2.h<br>
&gt; &#43;@@ -638,6 &#43;638,15 @@ struct v4l2_pix_format {<br>
&gt; &#43; #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* =
16&nbsp; GBGB.. RGRG.. */<br>
&gt; &#43; #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* =
16&nbsp; GRGR.. BGBG.. */<br>
&gt; &#43; #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* =
16&nbsp; RGRG.. GBGB.. */<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; /* Bayer formats - with IR component */<b=
r>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0')=
 /* 10 RGBG.. GIrGIr.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0')=
 /* 10 GRGB.. IrGIrG.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0')=
 /* 10 BGRG.. GIrGIr.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0')=
 /* 10 GBGR.. IrGIrG.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0')=
 /* 10 GIrGIr.. RGBG.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0')=
 /* 10 IrGIrG.. GRGB.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0')=
 /* 10 GIrGIr.. BGRG.. */<br>
&gt; &#43;&#43;#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0')=
 /* 10 IrGIrG.. GBGR.. */<br>
&gt; &#43;<br>
&gt; &#43; /* HSV formats */<br>
&gt; &#43; #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')<br>
&gt; &#43;diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c<=
br>
&gt; &#43;index 97d09774b..74a6c5bf6 100644<br>
&gt; &#43;--- a/sys/v4l2/gstv4l2object.c<br>
&gt; &#43;&#43;&#43;&#43; b/sys/v4l2/gstv4l2object.c<br>
&gt; &#43;@@ -175,6 &#43;175,16 @@ static const GstV4L2FormatDesc gst_v4l2_=
formats[] =3D {<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;<br>
&gt; &#43;&#43;&nbsp; /* Bayer formats - with IR component */<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SRGGI10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGRIG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SBGGI10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGBIG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGIRG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SIGGR10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGIBG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SIGGB10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;<br>
&gt; &#43;&nbsp;&nbsp; /* compressed formats */<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_JPEG, FALSE, GST_V4L2_CODEC},<br>
&gt; &#43;@@ -1129,6 &#43;1139,14 @@ gst_v4l2_object_format_get_rank (const=
 struct v4l2_fmtdesc *fmt)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG16:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG16:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGI10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRIG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGI10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBIG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGIRG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SIGGR10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGIBG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SIGGB10:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rank =3D BAYER_BASE_RANK;<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;@@ -1577,6 &#43;1595,24 @@ gst_v4l2_object_v4l2fourcc_to_bare_str=
uct (guint32 fourcc)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D=3D V4L2_PIX_FMT_SGRBG16 ? &quot;grbg16&quot; :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D=3D V4L2_PIX_FMT_SRGGB16 ? &quot;rggb16&quot; : &quot;rggb16&quot;, N=
ULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGI10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRIG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGI10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBIG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGIRG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SIGGR10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGIBG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SIGGB10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_n=
ew (&quot;video/x-bayer&quot;, &quot;format&quot;, G_TYPE_STRING,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGRIG10 ? &quot;grig10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SBGGI10 ? &quot;bggi10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGBIG10 ? &quot;gbig10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGIRG10 ? &quot;girg10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SIGGR10 ? &quot;iggr10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGIBG10 ? &quot;gibg10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SIGGB10 ? &quot;iggb10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SRGGI10 ? &quot;rggi10&quot; : &quot;bggi10&quot;, NU=
LL);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SN9C10X:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_=
new_empty (&quot;video/x-sonix&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;@@ -1921,6 &#43;1957,22 @@ gst_v4l2_object_get_caps_info (GstV4l2=
Object * v4l2object, GstCaps * caps,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D V4L2_PIX_FMT_SGRBG16;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_asci=
i_strcasecmp (format, &quot;rggb16&quot;))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D V4L2_PIX_FMT_SRGGB16;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;rggi10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SRGGI10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;grig10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGRIG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;bggi10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SBGGI10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;gbig10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGBIG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;girg10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGIRG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;iggr10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SIGGR10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;gibg10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGIBG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;iggb10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SIGGB10;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else if (g_str_equal (mimetype, &quot;=
video/x-sonix&quot;)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourcc =3D V4L2_PIX_FMT_SN9C=
10X;<br>
&gt; &#43;--<br>
&gt; &#43;2.37.0<br>
&gt; &#43;<br>
&gt; diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats=
.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 00000000..a742ed5b<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/0001-Adding-support-for-raw10-raw12-and-raw16-bayer-fo=
rmats.patch<br>
&gt; @@ -0,0 &#43;1,123 @@<br>
&gt; &#43;From: Emmanuel Madrigal &lt;emmanuel.madrigal@ridgerun.com&gt;<br=
>
&gt; &#43;Date: Tue Feb 22 03:50:52 IST 2022<br>
&gt; &#43;Subject: Adding support for raw10, raw12 and raw16 bayer formats<=
br>
&gt; &#43;<br>
&gt; &#43;Gstreamer 1.16 only supports raw8 bayer by default. This patch en=
ables<br>
&gt; &#43;sensors that support raw10, raw12 or raw16 to be used with v4l2sr=
c.<br>
&gt; &#43;Will need to be carried in meta-psdkla as long as we are using Gs=
treamer 1.16<br>
&gt; &#43;<br>
&gt; &#43;Upstream-Status: Pending<br>
&gt; &#43;Signed-off-by: Limaye, Aniket &lt;a-limaye@ti.com&gt;<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c<=
br>
&gt; &#43;index 2c78e2227..a5d2e2de1 100644<br>
&gt; &#43;--- a/sys/v4l2/gstv4l2object.c<br>
&gt; &#43;&#43;&#43;&#43; b/sys/v4l2/gstv4l2object.c<br>
&gt; &#43;@@ -162,6 &#43;162,18 @@ static const GstV4L2FormatDesc gst_v4l2_=
formats[] =3D {<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_SGBRG8, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_SGRBG8, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_SRGGB8, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SBGGR10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGBRG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGRBG10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SRGGB10, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SBGGR12, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGBRG12, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGRBG12, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SRGGB12, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SBGGR16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGBRG16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SGRBG16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;&#43;&nbsp; {V4L2_PIX_FMT_SRGGB16, TRUE, GST_V4L2_RAW},<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp; /* compressed formats */<br>
&gt; &#43;&nbsp;&nbsp; {V4L2_PIX_FMT_MJPEG, FALSE, GST_V4L2_CODEC},<br>
&gt; &#43;@@ -1105,6 &#43;1117,18 @@ gst_v4l2_object_format_get_rank (const=
 struct v4l2_fmtdesc *fmt)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG8:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG8:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB8:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB16:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rank =3D BAYER_BASE_RANK;<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;@@ -1521,7 &#43;1545,37 @@ gst_v4l2_object_v4l2fourcc_to_bare_str=
uct (guint32 fourcc)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D=3D V4L2_PIX_FMT_SBGGR8 ? &quot;bggr&quot; :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D=3D V4L2_PIX_FMT_SGBRG8 ? &quot;gbrg&quot; :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D=3D V4L2_PIX_FMT_SGRBG8 ? &quot;grbg&quot; :<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fourcc=
 =3D=3D V4L2_PIX_FMT_SRGGB8 ? */ &quot;rggb&quot;, NULL);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SRGGB8 ? &quot;rggb&quot; : &quot;rggb&quot;, NULL);<=
br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB10:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_n=
ew (&quot;video/x-bayer&quot;, &quot;format&quot;, G_TYPE_STRING,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SBGGR10 ? &quot;bggr10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGBRG10 ? &quot;gbrg10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGRBG10 ? &quot;grbg10&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SRGGB10 ? &quot;rggb10&quot; : &quot;rggb10&quot;, NU=
LL);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB12:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_n=
ew (&quot;video/x-bayer&quot;, &quot;format&quot;, G_TYPE_STRING,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SBGGR12 ? &quot;bggr12&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGBRG12 ? &quot;gbrg12&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGRBG12 ? &quot;grbg12&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SRGGB12 ? &quot;rggb12&quot; : &quot;rggb12&quot;, NU=
LL);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SBGGR16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGBRG16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SGRBG16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SRGGB16:<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_n=
ew (&quot;video/x-bayer&quot;, &quot;format&quot;, G_TYPE_STRING,<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SBGGR16 ? &quot;bggr16&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGBRG16 ? &quot;gbrg16&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SGRBG16 ? &quot;grbg16&quot; :<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D=3D V4L2_PIX_FMT_SRGGB16 ? &quot;rggb16&quot; : &quot;rggb16&quot;, NU=
LL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case V4L2_PIX_FMT_SN9C10X:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; structure =3D gst_structure_=
new_empty (&quot;video/x-sonix&quot;);<br>
&gt; &#43;@@ -1847,6 &#43;1901,30 @@ gst_v4l2_object_get_caps_info (GstV4l2=
Object * v4l2object, GstCaps * caps,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D V4L2_PIX_FMT_SGRBG8;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_asci=
i_strcasecmp (format, &quot;rggb&quot;))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; four=
cc =3D V4L2_PIX_FMT_SRGGB8;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;bggr10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SBGGR10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;gbrg10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGBRG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;grbg10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGRBG10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;rggb10&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SRGGB10;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;bggr12&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SBGGR12;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;gbrg12&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGBRG12;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;grbg12&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGRBG12;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;rggb12&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SRGGB12;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;bggr16&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SBGGR16;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;gbrg16&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGBRG16;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;grbg16&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SGRBG16;<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!g_ascii=
_strcasecmp (format, &quot;rggb16&quot;))<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourc=
c =3D V4L2_PIX_FMT_SRGGB16;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; } else if (g_str_equal (mimetype, &quot;=
video/x-sonix&quot;)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fourcc =3D V4L2_PIX_FMT_SN9C=
10X;<br>
&gt; diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1=
.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstr=
eamer/gstreamer1.0-plugins-good_1.20.%.bbappend<br>
&gt; index 1c4c8515..eb0cafe6 100644<br>
&gt; --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-good_1.20.%.bbappend<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good_1.20.%.bbappend<br>
&gt; @@ -1,5 &#43;1,10 @@<br>
&gt;&nbsp;&nbsp; FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;=
<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;SRC_URI:append =3D &quot; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-Adding-support-for-baye=
r-formats-with-IR-component.patch">
file://0001-Adding-support-for-bayer-formats-with-IR-component.patch</a> \<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-Adding-support-for-raw1=
0-raw12-and-raw16-bayer-formats.patch">
file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch</a=
> \<br>
&gt; &#43;&quot;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; SRC_URI:append:j721s2 =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-v4l2-Change=
s-for-DMA-Buf-import-j721s2.patch">file://0001-v4l2-Changes-for-DMA-Buf-imp=
ort-j721s2.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0002-v4l2-Give-p=
reference-to-contiguous-format-if-support.patch">
file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch</a> =
\<br>
<br>
-- <br>
Ryan Eatmon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; reatmon@ti.com<br>
-----------------------------------------<br>
Texas Instruments, Inc.&nbsp; -&nbsp; LCPD&nbsp; -&nbsp; MGTS<br>
</div>
</span></font>
</body>
</html>

--_000_55cc01821b254991a23cc39902b32fbaticom_--

