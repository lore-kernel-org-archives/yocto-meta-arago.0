Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFA0C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 12:33:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.84965.1718714005033088182
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 05:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=YDly6HHM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ICXNno009978;
	Tue, 18 Jun 2024 07:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718714003;
	bh=Fc3ExMFmjnpPnQ2IOlVEwrgCJKgJLJpKXO2Vr7+2jZA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YDly6HHM6YZ2FuAmJxOqGnIfvXYPacwxwEslJW4irRyQbxsifKmtI/7Fuq91xN7GN
	 m8rTJHJQN6Frw8RbhVn2dcBeZaXWfkQ4w6UiHMRBCGtM5/vgpG7p9Y5Aud17QrorpG
	 OKMROZqdn4NEK5tGGJw0CDkNHp/6He4xdcPfmyRA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ICXN3h011199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 07:33:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 07:33:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 07:33:23 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ICXKQX013425;
	Tue, 18 Jun 2024 07:33:21 -0500
Message-ID: <f252a303-07aa-4f42-9714-008877d4f45b@ti.com>
Date: Tue, 18 Jun 2024 18:03:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH 1/2] v4l-utils: Drop old recipe for
 v1.24.1
To: Jai Luthra <j-luthra@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Aradhya Bhatia
	<a-bhatia1@ti.com>
References: <20240618121743.2698489-1-j-luthra@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240618121743.2698489-1-j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 45ICXNno009978
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Jun 2024 12:33:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15400

On 18/06/24 17:47, Jai Luthra wrote:
> In scarthgap/master meta-oe recipe for v4l-utils has moved to v1.26
> which has support for latest routing and media graph APIs.
>
> So we can now drop support for v1.24.1 and custom routing patches from
> the meta-arago layer.
>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   ...-Don-t-install-libmediactl-and-libv4.patch |   43 -
>   ...-add-support-for-RGBIr-bayer-formats.patch |   61 -
>   ...-ctl-Add-routing-and-streams-support.patch |  618 ----------
>   ...l-add-support-for-routes-and-streams.patch | 1021 ----------------=
-
>   ...02-original-patch-mediactl-pkgconfig.patch |   21 -
>   ...iginal-patch-export-mediactl-headers.patch |   24 -
>   ...nce-add-routing-and-streams-multiple.patch |  459 --------
>   .../v4l-utils/0004-Do-not-use-getsubopt.patch |   59 -
>   .../v4l-utils/v4l-utils_1.24.1.bb             |   84 --
>   9 files changed, 2390 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0001-v4l2-ctl-Add-routing-and-streams-support.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0002-media-ctl-add-support-for-routes-and-streams.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0002-original-patch-mediactl-pkgconfig.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0003-original-patch-export-mediactl-headers.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0003-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils/0004-Do-not-use-getsubopt.patch
>   delete mode 100644 meta-arago-extras/recipes-multimedia/v4l-utils/v4l=
-utils_1.24.1.bb
>
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-ara=
go-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Revert-media-ctl-Do=
n-t-install-libmediactl-and-libv4.patch
> deleted file mode 100644
> index 7305e471..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-Rev=
ert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 27 Feb 2015 21:55:36 +0000
> -Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
> -
> - libv4l2subdev"
> -
> -This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Conflicts:
> -	utils/media-ctl/Makefile.am
> -
> ----
> - utils/media-ctl/Makefile.am | 10 +++-------
> - 1 file changed, 3 insertions(+), 7 deletions(-)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index c48c8d6..e255e16 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -1,8 +1,7 @@
> --noinst_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> --
> -+lib_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> - libmediactl_la_SOURCES =3D libmediactl.c mediactl-priv.h
> --libmediactl_la_CFLAGS =3D -static $(LIBUDEV_CFLAGS)
> --libmediactl_la_LDFLAGS =3D -static $(LIBUDEV_LIBS)
> -+libmediactl_la_CFLAGS =3D $(LIBUDEV_CFLAGS)
> -+libmediactl_la_LDFLAGS =3D $(LIBUDEV_LIBS)
> -
> - media-bus-format-names.h: ../../include/linux/media-bus-format.h
> -	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ =
d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> -@@ -18,9 +17,6 @@ CLEANFILES =3D $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> - libv4l2subdev_la_LIBADD =3D libmediactl.la
> --libv4l2subdev_la_CFLAGS =3D -static
> --libv4l2subdev_la_LDFLAGS =3D -static
> --
> - mediactl_includedir=3D$(includedir)/mediactl
> - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
001-media-ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extr=
as/recipes-multimedia/v4l-utils/v4l-utils/0001-media-ctl-add-support-for-=
RGBIr-bayer-formats.patch
> deleted file mode 100644
> index 1dff0637..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-med=
ia-ctl-add-support-for-RGBIr-bayer-formats.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 26e2a60d29456a9cc6acb16ea19039414808bc5e Mon Sep 17 00:00:00 2001
> -From: Jai Luthra <j-luthra@ti.com>
> -Date: Tue, 5 Jul 2022 16:23:39 +0530
> -Subject: [PATCH] media-ctl: add support for RGBIr bayer formats
> -
> -Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ----
> - include/linux/media-bus-format.h | 10 +++++++++-
> - include/linux/videodev2.h        |  9 +++++++++
> - 2 files changed, 18 insertions(+), 1 deletion(-)
> -
> -diff --git a/include/linux/media-bus-format.h b/include/linux/media-bu=
s-format.h
> -index ca9a24c8..cbdf3798 100644
> ---- a/include/linux/media-bus-format.h
> -+++ b/include/linux/media-bus-format.h
> -@@ -117,7 +117,7 @@
> - #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
> - #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
> -
> --/* Bayer - next is	0x3021 */
> -+/* Bayer - next is	0x3029 */
> - #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
> - #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
> - #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> -@@ -150,6 +150,14 @@
> - #define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
> - #define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
> - #define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
> -+#define MEDIA_BUS_FMT_SRGGI10_1X10		0x3021
> -+#define MEDIA_BUS_FMT_SGRIG10_1X10		0x3022
> -+#define MEDIA_BUS_FMT_SBGGI10_1X10		0x3023
> -+#define MEDIA_BUS_FMT_SGBIG10_1X10		0x3024
> -+#define MEDIA_BUS_FMT_SGIRG10_1X10		0x3025
> -+#define MEDIA_BUS_FMT_SIGGR10_1X10		0x3026
> -+#define MEDIA_BUS_FMT_SGIBG10_1X10		0x3027
> -+#define MEDIA_BUS_FMT_SIGGB10_1X10		0x3028
> -
> - /* JPEG compressed formats - next is	0x4002 */
> - #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
> -diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> -index 5eb96692..093104ab 100644
> ---- a/include/linux/videodev2.h
> -+++ b/include/linux/videodev2.h
> -@@ -682,6 +682,15 @@ struct v4l2_pix_format {
> - #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  G=
BGB.. RGRG.. */
> - #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  G=
RGR.. BGBG.. */
> - #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  R=
GRG.. GBGB.. */
> -+	/* 10bit raw bayer with IR (4x4) */
> -+#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RG=
BG.. GIrGIr.. */
> -+#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GR=
GB.. IrGIrG.. */
> -+#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BG=
RG.. GIrGIr.. */
> -+#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GB=
GR.. IrGIrG.. */
> -+#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GI=
rGIr.. RGBG.. */
> -+#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 Ir=
GIrG.. GRGB.. */
> -+#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GI=
rGIr.. BGRG.. */
> -+#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 Ir=
GIrG.. GBGR.. */
> -
> - /* HSV formats */
> - #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> ---
> -2.40.0
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
001-v4l2-ctl-Add-routing-and-streams-support.patch b/meta-arago-extras/re=
cipes-multimedia/v4l-utils/v4l-utils/0001-v4l2-ctl-Add-routing-and-stream=
s-support.patch
> deleted file mode 100644
> index 9fd19edc..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0001-v4l=
2-ctl-Add-routing-and-streams-support.patch
> +++ /dev/null
> @@ -1,618 +0,0 @@
> -From 3b57a10f899403acd877683ca0247f2a9eba8850 Mon Sep 17 00:00:00 2001
> -From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> -Date: Fri, 10 Feb 2023 13:55:44 +0200
> -Subject: [PATCH 1/3] v4l2-ctl: Add routing and streams support
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Add support to get and set subdev routes and to get and set
> -configurations per stream.
> -
> -Based on work from Jacopo Mondi <jacopo@jmondi.org> and
> -Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>.
> -
> -Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ----
> - utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 288 +++++++++++++++++++++++++---=
-
> - utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
> - utils/v4l2-ctl/v4l2-ctl.h          |   2 +
> - 3 files changed, 259 insertions(+), 33 deletions(-)
> -
> -diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-=
ctl-subdev.cpp
> -index 33cc1342..81236451 100644
> ---- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> -+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> -@@ -1,5 +1,13 @@
> - #include "v4l2-ctl.h"
> -
> -+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> -+
> -+/*
> -+ * The max value comes from a check in the kernel source code
> -+ * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
> -+ */
> -+#define NUM_ROUTES_MAX 256
> -+
> - struct mbus_name {
> -	const char *name;
> -	__u32 code;
> -@@ -19,45 +27,57 @@ static const struct mbus_name mbus_names[] =3D {
> - #define SelectionFlags 		(1L<<4)
> -
> - static __u32 list_mbus_codes_pad;
> -+static __u32 list_mbus_codes_stream =3D 0;
> - static __u32 get_fmt_pad;
> -+static __u32 get_fmt_stream =3D 0;
> - static __u32 get_sel_pad;
> -+static __u32 get_sel_stream =3D 0;
> - static __u32 get_fps_pad;
> -+static __u32 get_fps_stream =3D 0;
> - static int get_sel_target =3D -1;
> - static unsigned int set_selection;
> - static struct v4l2_subdev_selection vsel;
> - static unsigned int set_fmt;
> - static __u32 set_fmt_pad;
> -+static __u32 set_fmt_stream =3D 0;
> - static struct v4l2_mbus_framefmt ffmt;
> - static struct v4l2_subdev_frame_size_enum frmsize;
> - static struct v4l2_subdev_frame_interval_enum frmival;
> - static __u32 set_fps_pad;
> -+static __u32 set_fps_stream =3D 0;
> - static double set_fps;
> -+static struct v4l2_subdev_routing routing;
> -+static struct v4l2_subdev_route routes[NUM_ROUTES_MAX];
> -
> - void subdev_usage()
> - {
> -	printf("\nSub-Device options:\n"
> --	       "  --list-subdev-mbus-codes <pad>\n"
> -+	       "  --list-subdev-mbus-codes pad=3D<pad>,stream=3D<stream>\n"
> -	       "                      display supported mediabus codes for th=
is pad (0 is default)\n"
> -	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
> --	       "  --list-subdev-framesizes pad=3D<pad>,code=3D<code>\n"
> -+	       "  --list-subdev-framesizes pad=3D<pad>,stream=3D<stream>,cod=
e=3D<code>\n"
> -	       "                     list supported framesizes for this pad a=
nd code\n"
> -	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
> -	       "                     <code> is the value of the mediabus code=
\n"
> --	       "  --list-subdev-frameintervals pad=3D<pad>,width=3D<w>,heigh=
t=3D<h>,code=3D<code>\n"
> -+	       "  --list-subdev-frameintervals pad=3D<pad>,stream=3D<stream>=
,width=3D<w>,height=3D<h>,code=3D<code>\n"
> -	       "                     list supported frame intervals for this =
pad and code and\n"
> -	       "                     the given width and height [VIDIOC_SUBDE=
V_ENUM_FRAME_INTERVAL]\n"
> -	       "                     <code> is the value of the mediabus code=
\n"
> --	       "  --get-subdev-fmt [<pad>]\n"
> --	       "     		     query the frame format for the given pad [VIDIOC=
_SUBDEV_G_FMT]\n"
> --	       "  --get-subdev-selection pad=3D<pad>,target=3D<target>\n"
> -+	       "  --get-subdev-fmt pad=3D<pad>,stream=3D<stream>\n"
> -+	       "     		     query the frame format for the given pad and opt=
ional stream [VIDIOC_SUBDEV_G_FMT]\n"
> -+	       "		     <pad> the pad to get the format from\n"
> -+	       "		     <stream> the stream to get the format from (0 if not =
specified)\n"
> -+	       "  --get-subdev-selection pad=3D<pad>,stream=3D<stream>,targe=
t=3D<target>\n"
> -	       "                     query the frame selection rectangle [VID=
IOC_SUBDEV_G_SELECTION]\n"
> -	       "                     See --set-subdev-selection command for t=
he valid <target> values.\n"
> --	       "  --get-subdev-fps [<pad>]\n"
> -+	       "  --get-subdev-fps pad=3D<pad>,stream=3D<stream>\n"
> -	       "                     query the frame rate [VIDIOC_SUBDEV_G_FR=
AME_INTERVAL]\n"
> -	       "  --set-subdev-fmt   (for testing only, otherwise use media-c=
tl)\n"
> --	       "  --try-subdev-fmt pad=3D<pad>,width=3D<w>,height=3D<h>,code=
=3D<code>,field=3D<f>,colorspace=3D<c>,\n"
> -+	       "  --try-subdev-fmt pad=3D<pad>,stream=3D<stream>,width=3D<w>=
,height=3D<h>,code=3D<code>,field=3D<f>,colorspace=3D<c>,\n"
> -	       "                   xfer=3D<xf>,ycbcr=3D<y>,hsv=3D<hsv>,quanti=
zation=3D<q>\n"
> --	       "                     set the frame format [VIDIOC_SUBDEV_S_F=
MT]\n"
> -+	       "                     set the frame format for the given pad =
and optional stream [VIDIOC_SUBDEV_S_FMT]\n"
> -+	       "                     <pad> the pad to get the format from\n"
> -+	       "                     <stream> the stream to get the format f=
rom (0 if not specified)\n"
> -	       "                     <code> is the value of the mediabus code=
\n"
> -	       "                     <f> can be one of the following field la=
youts:\n"
> -	       "                       any, none, top, bottom, interlaced, se=
q_tb, seq_bt,\n"
> -@@ -74,14 +94,30 @@ void subdev_usage()
> -	       "                     <q> can be one of the following quantiza=
tion methods:\n"
> -	       "                       default, full-range, lim-range\n"
> -	       "  --set-subdev-selection (for testing only, otherwise use med=
ia-ctl)\n"
> --	       "  --try-subdev-selection pad=3D<pad>,target=3D<target>,flags=
=3D<flags>,\n"
> -+	       "  --try-subdev-selection pad=3D<pad>,stream=3D<stream>,targe=
t=3D<target>,flags=3D<flags>,\n"
> -	       "                         top=3D<x>,left=3D<y>,width=3D<w>,hei=
ght=3D<h>\n"
> -	       "                     set the video capture selection rectangl=
e [VIDIOC_SUBDEV_S_SELECTION]\n"
> -	       "                     target=3Dcrop|crop_bounds|crop_default|c=
ompose|compose_bounds|\n"
> -	       "                            compose_default|compose_padded|na=
tive_size\n"
> -	       "                     flags=3Dle|ge|keep-config\n"
> --	       "  --set-subdev-fps pad=3D<pad>,fps=3D<fps> (for testing only=
, otherwise use media-ctl)\n"
> -+	       "  --set-subdev-fps pad=3D<pad>,stream=3D<stream>,fps=3D<fps>=
 (for testing only, otherwise use media-ctl)\n"
> -	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAM=
E_INTERVAL]\n"
> -+	       "  --get-routing      Print the route topology\n"
> -+	       "  --set-routing <routes>\n"
> -+	       "                     Comma-separated list of route descripto=
rs to setup\n"
> -+	       "\n"
> -+	       "Routes are defined as\n"
> -+	       "	routes		=3D route { ',' route } ;\n"
> -+	       "	route		=3D sink '->' source '[' flags ']' ;\n"
> -+	       "	sink		=3D sink-pad '/' sink-stream ;\n"
> -+	       "	source		=3D source-pad '/' source-stream ;\n"
> -+	       "\n"
> -+	       "where\n"
> -+	       "	sink-pad	=3D Pad numeric identifier for sink\n"
> -+	       "	sink-stream	=3D Stream numeric identifier for sink\n"
> -+	       "	source-pad	=3D Pad numeric identifier for source\n"
> -+	       "	source-stream	=3D Stream numeric identifier for source\n"
> -+	       "	flags		=3D Route flags (0: inactive, 1: active)\n"
> -	       );
> - }
> -
> -@@ -91,14 +127,33 @@ void subdev_cmd(int ch, char *optarg)
> -
> -	switch (ch) {
> -	case OptListSubDevMBusCodes:
> --		if (optarg)
> --			list_mbus_codes_pad =3D strtoul(optarg, nullptr, 0);
> -+		subs =3D optarg;
> -+		while (subs && *subs !=3D '\0') {
> -+			static constexpr const char *subopts[] =3D {
> -+				"pad",
> -+				"stream",
> -+				nullptr
> -+			};
> -+
> -+			switch (parse_subopt(&subs, subopts, &value)) {
> -+			case 0:
> -+				list_mbus_codes_pad =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 1:
> -+				list_mbus_codes_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			default:
> -+				subdev_usage();
> -+				std::exit(EXIT_FAILURE);
> -+			}
> -+		}
> -		break;
> -	case OptListSubDevFrameSizes:
> -		subs =3D optarg;
> -		while (*subs !=3D '\0') {
> -			static constexpr const char *subopts[] =3D {
> -				"pad",
> -+				"stream",
> -				"code",
> -				nullptr
> -			};
> -@@ -108,6 +163,9 @@ void subdev_cmd(int ch, char *optarg)
> -				frmsize.pad =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 1:
> -+				frmsize.stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 2:
> -				frmsize.code =3D strtoul(value, nullptr, 0);
> -				break;
> -			default:
> -@@ -121,6 +179,7 @@ void subdev_cmd(int ch, char *optarg)
> -		while (*subs !=3D '\0') {
> -			static constexpr const char *subopts[] =3D {
> -				"pad",
> -+				"stream",
> -				"code",
> -				"width",
> -				"height",
> -@@ -132,12 +191,15 @@ void subdev_cmd(int ch, char *optarg)
> -				frmival.pad =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 1:
> --				frmival.code =3D strtoul(value, nullptr, 0);
> -+				frmival.stream =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 2:
> --				frmival.width =3D strtoul(value, nullptr, 0);
> -+				frmival.code =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 3:
> -+				frmival.width =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 4:
> -				frmival.height =3D strtoul(value, nullptr, 0);
> -				break;
> -			default:
> -@@ -147,14 +209,33 @@ void subdev_cmd(int ch, char *optarg)
> -		}
> -		break;
> -	case OptGetSubDevFormat:
> --		if (optarg)
> --			get_fmt_pad =3D strtoul(optarg, nullptr, 0);
> -+		subs =3D optarg;
> -+		while (subs && *subs !=3D '\0') {
> -+			static constexpr const char *subopts[] =3D {
> -+				"pad",
> -+				"stream",
> -+				nullptr
> -+			};
> -+
> -+			switch (parse_subopt(&subs, subopts, &value)) {
> -+			case 0:
> -+				get_fmt_pad =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 1:
> -+				get_fmt_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			default:
> -+				subdev_usage();
> -+				std::exit(EXIT_FAILURE);
> -+			}
> -+		}
> -		break;
> -	case OptGetSubDevSelection:
> -		subs =3D optarg;
> -		while (*subs !=3D '\0') {
> -			static constexpr const char *subopts[] =3D {
> -				"pad",
> -+				"stream",
> -				"target",
> -				nullptr
> -			};
> -@@ -165,6 +246,9 @@ void subdev_cmd(int ch, char *optarg)
> -				get_sel_pad =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 1:
> -+				get_sel_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 2:
> -				if (parse_selection_target(value, target)) {
> -					fprintf(stderr, "Unknown selection target\n");
> -					subdev_usage();
> -@@ -179,8 +263,26 @@ void subdev_cmd(int ch, char *optarg)
> -		}
> -		break;
> -	case OptGetSubDevFPS:
> --		if (optarg)
> --			get_fps_pad =3D strtoul(optarg, nullptr, 0);
> -+		subs =3D optarg;
> -+		while (subs && *subs !=3D '\0') {
> -+			static constexpr const char *subopts[] =3D {
> -+				"pad",
> -+				"stream",
> -+				nullptr
> -+			};
> -+
> -+			switch (parse_subopt(&subs, subopts, &value)) {
> -+			case 0:
> -+				get_fps_pad =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 1:
> -+				get_fps_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			default:
> -+				subdev_usage();
> -+				std::exit(EXIT_FAILURE);
> -+			}
> -+		}
> -		break;
> -	case OptSetSubDevFormat:
> -	case OptTrySubDevFormat:
> -@@ -198,6 +300,7 @@ void subdev_cmd(int ch, char *optarg)
> -				"quantization",
> -				"xfer",
> -				"pad",
> -+				"stream",
> -				nullptr
> -			};
> -
> -@@ -244,6 +347,9 @@ void subdev_cmd(int ch, char *optarg)
> -			case 9:
> -				set_fmt_pad =3D strtoul(value, nullptr, 0);
> -				break;
> -+			case 10:
> -+				set_fmt_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -			default:
> -				fprintf(stderr, "Unknown option\n");
> -				subdev_usage();
> -@@ -264,6 +370,7 @@ void subdev_cmd(int ch, char *optarg)
> -				"width",
> -				"height",
> -				"pad",
> -+				"stream",
> -				nullptr
> -			};
> -
> -@@ -298,6 +405,9 @@ void subdev_cmd(int ch, char *optarg)
> -			case 6:
> -				vsel.pad =3D strtoul(value, nullptr, 0);
> -				break;
> -+			case 7:
> -+				vsel.stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -			default:
> -				fprintf(stderr, "Unknown option\n");
> -				subdev_usage();
> -@@ -311,6 +421,7 @@ void subdev_cmd(int ch, char *optarg)
> -		while (*subs !=3D '\0') {
> -			static constexpr const char *subopts[] =3D {
> -				"pad",
> -+				"stream",
> -				"fps",
> -				nullptr
> -			};
> -@@ -320,6 +431,9 @@ void subdev_cmd(int ch, char *optarg)
> -				set_fps_pad =3D strtoul(value, nullptr, 0);
> -				break;
> -			case 1:
> -+				set_fps_stream =3D strtoul(value, nullptr, 0);
> -+				break;
> -+			case 2:
> -				set_fps =3D strtod(value, nullptr);
> -				break;
> -			default:
> -@@ -329,6 +443,47 @@ void subdev_cmd(int ch, char *optarg)
> -			}
> -		}
> -		break;
> -+	case OptSetRouting: {
> -+		struct v4l2_subdev_route *r;
> -+		char *end, *ref, *tok;
> -+		unsigned int flags;
> -+
> -+		memset(&routing, 0, sizeof(routing));
> -+		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
> -+		routing.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -+		routing.num_routes =3D 0;
> -+		routing.routes =3D (__u64)routes;
> -+
> -+		if (!optarg)
> -+			break;
> -+
> -+		r =3D (v4l2_subdev_route *)routing.routes;
> -+		ref =3D end =3D strdup(optarg);
> -+		while ((tok =3D strsep(&end, ",")) !=3D NULL) {
> -+			if (sscanf(tok, "%u/%u -> %u/%u [%u]",
> -+				   &r->sink_pad, &r->sink_stream,
> -+				   &r->source_pad, &r->source_stream,
> -+				   &flags) !=3D 5) {
> -+				free(ref);
> -+				fprintf(stderr, "Invalid route information specified\n");
> -+				subdev_usage();
> -+				std::exit(EXIT_FAILURE);
> -+			}
> -+
> -+			if (flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
> -+				fprintf(stderr, "Invalid route flags specified: %#x\n", flags);
> -+				subdev_usage();
> -+				std::exit(EXIT_FAILURE);
> -+			}
> -+
> -+			r->flags =3D flags;
> -+
> -+			r++;
> -+			routing.num_routes++;
> -+		}
> -+		free(ref);
> -+		break;
> -+	}
> -	default:
> -		break;
> -	}
> -@@ -394,6 +549,7 @@ void subdev_set(cv4l_fd &_fd)
> -
> -		memset(&fmt, 0, sizeof(fmt));
> -		fmt.pad =3D set_fmt_pad;
> -+		fmt.stream =3D set_fmt_stream;
> -		fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -
> -		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) =3D=3D 0) {
> -@@ -430,7 +586,7 @@ void subdev_set(cv4l_fd &_fd)
> -			else
> -				fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
> -
> --			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=3D%u)\n", fmt.pad);
> -+			printf("ioctl: VIDIOC_SUBDEV_S_FMT (pad=3D%u,stream=3D%u)\n", fmt.=
pad, fmt.stream);
> -			ret =3D doioctl(fd, VIDIOC_SUBDEV_S_FMT, &fmt);
> -			if (ret =3D=3D 0 && (verbose || !options[OptSetSubDevFormat]))
> -				print_framefmt(fmt.format);
> -@@ -441,6 +597,7 @@ void subdev_set(cv4l_fd &_fd)
> -
> -		memset(&sel, 0, sizeof(sel));
> -		sel.pad =3D vsel.pad;
> -+		sel.stream =3D vsel.stream;
> -		sel.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -		sel.target =3D vsel.target;
> -
> -@@ -461,7 +618,7 @@ void subdev_set(cv4l_fd &_fd)
> -			else
> -				sel.which =3D V4L2_SUBDEV_FORMAT_TRY;
> -
> --			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=3D%u)\n", sel.pad);
> -+			printf("ioctl: VIDIOC_SUBDEV_S_SELECTION (pad=3D%u,stream=3D%u)\n"=
, sel.pad, sel.stream);
> -			int ret =3D doioctl(fd, VIDIOC_SUBDEV_S_SELECTION, &sel);
> -			if (ret =3D=3D 0 && (verbose || !options[OptSetSubDevSelection]))
> -				print_subdev_selection(sel);
> -@@ -472,6 +629,7 @@ void subdev_set(cv4l_fd &_fd)
> -
> -		memset(&fival, 0, sizeof(fival));
> -		fival.pad =3D set_fps_pad;
> -+		fival.stream =3D set_fps_stream;
> -
> -		if (set_fps <=3D 0) {
> -			fprintf(stderr, "invalid fps %f\n", set_fps);
> -@@ -482,7 +640,7 @@ void subdev_set(cv4l_fd &_fd)
> -		fival.interval.denominator =3D static_cast<uint32_t>(set_fps * fival=
.interval.numerator);
> -		printf("Note: --set-subdev-fps is only for testing.\n"
> -		       "Normally media-ctl is used to configure the video pipeline.\=
n");
> --		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=3D%u)\n", fival.=
pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=3D%u,stream=3D%u=
)\n", fival.pad, fival.stream);
> -		if (doioctl(fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival) =3D=3D 0) {
> -			if (!fival.interval.denominator || !fival.interval.numerator)
> -				printf("\tFrames per second: invalid (%d/%d)\n",
> -@@ -493,6 +651,55 @@ void subdev_set(cv4l_fd &_fd)
> -					fival.interval.denominator, fival.interval.numerator);
> -		}
> -	}
> -+	if (options[OptSetRouting]) {
> -+		if (doioctl(fd, VIDIOC_SUBDEV_S_ROUTING, &routing) =3D=3D 0)
> -+			printf("Routing set\n");
> -+	}
> -+}
> -+
> -+struct flag_name {
> -+	__u32 flag;
> -+	const char *name;
> -+};
> -+
> -+static void print_flags(const struct flag_name *flag_names, unsigned =
int num_entries, __u32 flags)
> -+{
> -+	bool first =3D true;
> -+	unsigned int i;
> -+
> -+	for (i =3D 0; i < num_entries; i++) {
> -+		if (!(flags & flag_names[i].flag))
> -+			continue;
> -+		if (!first)
> -+			printf(",");
> -+		printf("%s", flag_names[i].name);
> -+		flags &=3D ~flag_names[i].flag;
> -+		first =3D false;
> -+	}
> -+
> -+	if (flags) {
> -+		if (!first)
> -+			printf(",");
> -+		printf("0x%x", flags);
> -+	}
> -+}
> -+
> -+static void print_routes(const struct v4l2_subdev_routing *r)
> -+{
> -+	unsigned int i;
> -+	struct v4l2_subdev_route *routes =3D (struct v4l2_subdev_route *)r->=
routes;
> -+
> -+	static const struct flag_name route_flags[] =3D {
> -+		{ V4L2_SUBDEV_ROUTE_FL_ACTIVE, "ACTIVE" },
> -+	};
> -+
> -+	for (i =3D 0; i < r->num_routes; i++) {
> -+		printf("%d/%d -> %d/%d [",
> -+		       routes[i].sink_pad, routes[i].sink_stream,
> -+		       routes[i].source_pad, routes[i].source_stream);
> -+		print_flags(route_flags, ARRAY_SIZE(route_flags), routes[i].flags);
> -+		printf("]\n");
> -+	}
> - }
> -
> - void subdev_get(cv4l_fd &_fd)
> -@@ -505,8 +712,9 @@ void subdev_get(cv4l_fd &_fd)
> -		memset(&fmt, 0, sizeof(fmt));
> -		fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -		fmt.pad =3D get_fmt_pad;
> -+		fmt.stream =3D get_fmt_stream;
> -
> --		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=3D%u)\n", fmt.pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_G_FMT (pad=3D%u, stream=3D%u)\n", fmt.=
pad, fmt.stream);
> -		if (doioctl(fd, VIDIOC_SUBDEV_G_FMT, &fmt) =3D=3D 0)
> -			print_framefmt(fmt.format);
> -	}
> -@@ -518,8 +726,9 @@ void subdev_get(cv4l_fd &_fd)
> -		memset(&sel, 0, sizeof(sel));
> -		sel.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -		sel.pad =3D get_sel_pad;
> -+		sel.stream =3D get_sel_stream;
> -
> --		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=3D%u)\n", sel.pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=3D%u,stream=3D%u)\n",=
 sel.pad, sel.stream);
> -		if (options[OptAll] || get_sel_target =3D=3D -1) {
> -			while (valid_seltarget_at_idx(idx)) {
> -				sel.target =3D seltarget_at_idx(idx);
> -@@ -538,8 +747,9 @@ void subdev_get(cv4l_fd &_fd)
> -
> -		memset(&fival, 0, sizeof(fival));
> -		fival.pad =3D get_fps_pad;
> -+		fival.stream =3D get_fps_stream;
> -
> --		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=3D%u)\n", fival.=
pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_G_FRAME_INTERVAL (pad=3D%u,stream=3D%u=
)\n", fival.pad, fival.stream);
> -		if (doioctl(fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival) =3D=3D 0) {
> -			if (!fival.interval.denominator || !fival.interval.numerator)
> -				printf("\tFrames per second: invalid (%d/%d)\n",
> -@@ -550,6 +760,17 @@ void subdev_get(cv4l_fd &_fd)
> -					fival.interval.denominator, fival.interval.numerator);
> -		}
> -	}
> -+
> -+	if (options[OptGetRouting]) {
> -+		memset(&routing, 0, sizeof(routing));
> -+		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
> -+		routing.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -+		routing.num_routes =3D NUM_ROUTES_MAX;
> -+		routing.routes =3D (__u64)routes;
> -+
> -+		if (doioctl(fd, VIDIOC_SUBDEV_G_ROUTING, &routing) =3D=3D 0)
> -+			print_routes(&routing);
> -+	}
> - }
> -
> - static void print_mbus_code(__u32 code)
> -@@ -566,11 +787,12 @@ static void print_mbus_code(__u32 code)
> -		printf("\t0x%04x", code);
> - }
> -
> --static void print_mbus_codes(int fd, __u32 pad)
> -+static void print_mbus_codes(int fd, __u32 pad, __u32 stream)
> - {
> -	struct v4l2_subdev_mbus_code_enum mbus_code =3D {};
> -
> -	mbus_code.pad =3D pad;
> -+	mbus_code.stream =3D stream;
> -	mbus_code.which =3D V4L2_SUBDEV_FORMAT_TRY;
> -
> -	for (;;) {
> -@@ -623,13 +845,13 @@ void subdev_list(cv4l_fd &_fd)
> -	int fd =3D _fd.g_fd();
> -
> -	if (options[OptListSubDevMBusCodes]) {
> --		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=3D%u)\n",
> --		       list_mbus_codes_pad);
> --		print_mbus_codes(fd, list_mbus_codes_pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=3D%u,stream=3D%u)\=
n",
> -+		       list_mbus_codes_pad, list_mbus_codes_stream);
> -+		print_mbus_codes(fd, list_mbus_codes_pad, list_mbus_codes_stream);
> -	}
> -	if (options[OptListSubDevFrameSizes]) {
> --		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=3D%u)\n",
> --		       frmsize.pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=3D%u,stream=3D%u)=
\n",
> -+		       frmsize.pad, frmsize.stream);
> -		frmsize.index =3D 0;
> -		frmsize.which =3D V4L2_SUBDEV_FORMAT_TRY;
> -		while (test_ioctl(fd, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &frmsize) >=3D =
0) {
> -@@ -638,8 +860,8 @@ void subdev_list(cv4l_fd &_fd)
> -		}
> -	}
> -	if (options[OptListSubDevFrameIntervals]) {
> --		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=3D%u)\n",
> --		       frmival.pad);
> -+		printf("ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=3D%u,stream=3D=
%u)\n",
> -+		       frmival.pad, frmival.stream);
> -		frmival.index =3D 0;
> -		frmival.which =3D V4L2_SUBDEV_FORMAT_TRY;
> -		while (test_ioctl(fd, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &frmival) >=
=3D 0) {
> -diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> -index 8585278f..1cfb50f7 100644
> ---- a/utils/v4l2-ctl/v4l2-ctl.cpp
> -+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> -@@ -64,6 +64,8 @@ static struct option long_options[] =3D {
> -	{"get-fmt-video-out", no_argument, nullptr, OptGetVideoOutFormat},
> -	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutForma=
t},
> -	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutForma=
t},
> -+	{"set-routing", required_argument, 0, OptSetRouting},
> -+	{"get-routing", no_argument, 0, OptGetRouting},
> -	{"help", no_argument, nullptr, OptHelp},
> -	{"help-tuner", no_argument, nullptr, OptHelpTuner},
> -	{"help-io", no_argument, nullptr, OptHelpIO},
> -diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> -index 70a80ade..51a68b92 100644
> ---- a/utils/v4l2-ctl/v4l2-ctl.h
> -+++ b/utils/v4l2-ctl/v4l2-ctl.h
> -@@ -197,6 +197,8 @@ enum Option {
> -	OptInfoEdid,
> -	OptShowEdid,
> -	OptFixEdidChecksums,
> -+	OptSetRouting,
> -+	OptGetRouting,
> -	OptFreqSeek,
> -	OptEncoderCmd,
> -	OptTryEncoderCmd,
> ---
> -2.40.0
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
002-media-ctl-add-support-for-routes-and-streams.patch b/meta-arago-extra=
s/recipes-multimedia/v4l-utils/v4l-utils/0002-media-ctl-add-support-for-r=
outes-and-streams.patch
> deleted file mode 100644
> index 79864f01..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-med=
ia-ctl-add-support-for-routes-and-streams.patch
> +++ /dev/null
> @@ -1,1021 +0,0 @@
> -From 868c176e0de433777d5eed3e6d6d8dc03b9145a6 Mon Sep 17 00:00:00 2001
> -From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> -Date: Fri, 10 Feb 2023 13:55:45 +0200
> -Subject: [PATCH 2/3] media-ctl: add support for routes and streams
> -
> -Add support to get and set subdev routes and to get and set
> -configurations per stream.
> -
> -Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.
> -
> -Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ----
> - utils/media-ctl/libmediactl.c   |  41 +++++
> - utils/media-ctl/libv4l2subdev.c | 283 ++++++++++++++++++++++++++++---=
-
> - utils/media-ctl/media-ctl.c     | 121 ++++++++++++--
> - utils/media-ctl/mediactl.h      |  16 ++
> - utils/media-ctl/options.c       |  15 +-
> - utils/media-ctl/options.h       |   1 +
> - utils/media-ctl/v4l2subdev.h    |  58 ++++++-
> - 7 files changed, 478 insertions(+), 57 deletions(-)
> -
> -diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediac=
tl.c
> -index 1fd6525b..537365d0 100644
> ---- a/utils/media-ctl/libmediactl.c
> -+++ b/utils/media-ctl/libmediactl.c
> -@@ -876,6 +876,47 @@ struct media_pad *media_parse_pad(struct media_de=
vice *media,
> -	return &entity->pads[pad];
> - }
> -
> -+struct media_pad *media_parse_pad_stream(struct media_device *media,
> -+					 const char *p, unsigned int *stream,
> -+					 char **endp)
> -+{
> -+	struct media_pad *pad;
> -+	const char *orig_p =3D p;
> -+	char *ep;
> -+
> -+	pad =3D media_parse_pad(media, p, &ep);
> -+	if (pad =3D=3D NULL)
> -+		return NULL;
> -+
> -+	p =3D ep;
> -+
> -+	if (*p =3D=3D '/') {
> -+		unsigned int s;
> -+
> -+		p++;
> -+
> -+		s =3D strtoul(p, &ep, 10);
> -+
> -+		if (ep =3D=3D p) {
> -+			printf("Unable to parse stream: '%s'\n", orig_p);
> -+			if (endp)
> -+				*endp =3D (char*)p;
> -+			return NULL;
> -+		}
> -+
> -+		*stream =3D s;
> -+
> -+		p++;
> -+	} else {
> -+		*stream =3D 0;
> -+	}
> -+
> -+	if (endp)
> -+		*endp =3D (char*)p;
> -+
> -+	return pad;
> -+}
> -+
> - struct media_link *media_parse_link(struct media_device *media,
> -				    const char *p, char **endp)
> - {
> -diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2=
subdev.c
> -index 63bb3d75..d203e5b4 100644
> ---- a/utils/media-ctl/libv4l2subdev.c
> -+++ b/utils/media-ctl/libv4l2subdev.c
> -@@ -64,7 +64,7 @@ void v4l2_subdev_close(struct media_entity *entity)
> - }
> -
> - int v4l2_subdev_get_format(struct media_entity *entity,
> --	struct v4l2_mbus_framefmt *format, unsigned int pad,
> -+	struct v4l2_mbus_framefmt *format, unsigned int pad, unsigned int st=
ream,
> -	enum v4l2_subdev_format_whence which)
> - {
> -	struct v4l2_subdev_format fmt;
> -@@ -76,6 +76,7 @@ int v4l2_subdev_get_format(struct media_entity *enti=
ty,
> -
> -	memset(&fmt, 0, sizeof(fmt));
> -	fmt.pad =3D pad;
> -+	fmt.stream =3D stream;
> -	fmt.which =3D which;
> -
> -	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_G_FMT, &fmt);
> -@@ -88,6 +89,7 @@ int v4l2_subdev_get_format(struct media_entity *enti=
ty,
> -
> - int v4l2_subdev_set_format(struct media_entity *entity,
> -	struct v4l2_mbus_framefmt *format, unsigned int pad,
> -+	unsigned int stream,
> -	enum v4l2_subdev_format_whence which)
> - {
> -	struct v4l2_subdev_format fmt;
> -@@ -99,6 +101,7 @@ int v4l2_subdev_set_format(struct media_entity *ent=
ity,
> -
> -	memset(&fmt, 0, sizeof(fmt));
> -	fmt.pad =3D pad;
> -+	fmt.stream =3D stream;
> -	fmt.which =3D which;
> -	fmt.format =3D *format;
> -
> -@@ -111,8 +114,8 @@ int v4l2_subdev_set_format(struct media_entity *en=
tity,
> - }
> -
> - int v4l2_subdev_get_selection(struct media_entity *entity,
> --	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
> --	enum v4l2_subdev_format_whence which)
> -+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
> -+	unsigned int target, enum v4l2_subdev_format_whence which)
> - {
> -	union {
> -		struct v4l2_subdev_selection sel;
> -@@ -150,8 +153,8 @@ int v4l2_subdev_get_selection(struct media_entity =
*entity,
> - }
> -
> - int v4l2_subdev_set_selection(struct media_entity *entity,
> --	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
> --	enum v4l2_subdev_format_whence which)
> -+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
> -+	unsigned int target, enum v4l2_subdev_format_whence which)
> - {
> -	union {
> -		struct v4l2_subdev_selection sel;
> -@@ -165,6 +168,7 @@ int v4l2_subdev_set_selection(struct media_entity =
*entity,
> -
> -	memset(&u.sel, 0, sizeof(u.sel));
> -	u.sel.pad =3D pad;
> -+	u.sel.stream =3D stream;
> -	u.sel.target =3D target;
> -	u.sel.which =3D which;
> -	u.sel.r =3D *rect;
> -@@ -179,6 +183,7 @@ int v4l2_subdev_set_selection(struct media_entity =
*entity,
> -
> -	memset(&u.crop, 0, sizeof(u.crop));
> -	u.crop.pad =3D pad;
> -+	u.crop.stream =3D stream;
> -	u.crop.which =3D which;
> -	u.crop.rect =3D *rect;
> -
> -@@ -190,6 +195,69 @@ int v4l2_subdev_set_selection(struct media_entity=
 *entity,
> -	return 0;
> - }
> -
> -+int v4l2_subdev_set_routing(struct media_entity *entity,
> -+			    struct v4l2_subdev_route *routes,
> -+			    unsigned int num_routes)
> -+{
> -+	struct v4l2_subdev_routing routing =3D {
> -+		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> -+		.routes =3D (uintptr_t)routes,
> -+		.num_routes =3D num_routes,
> -+	};
> -+	int ret;
> -+
> -+	ret =3D v4l2_subdev_open(entity);
> -+	if (ret < 0)
> -+		return ret;
> -+
> -+	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
> -+	if (ret =3D=3D -1)
> -+		return -errno;
> -+
> -+	return 0;
> -+}
> -+
> -+int v4l2_subdev_get_routing(struct media_entity *entity,
> -+			    struct v4l2_subdev_route **routes,
> -+			    unsigned int *num_routes)
> -+{
> -+	struct v4l2_subdev_routing routing =3D { 0 };
> -+	struct v4l2_subdev_route *r;
> -+	int ret;
> -+
> -+	ret =3D v4l2_subdev_open(entity);
> -+	if (ret < 0)
> -+		return ret;
> -+
> -+	routing.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -+
> -+	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
> -+	if (ret =3D=3D -1 && errno !=3D ENOSPC)
> -+		return -errno;
> -+
> -+	if (!routing.num_routes) {
> -+		*routes =3D NULL;
> -+		*num_routes =3D 0;
> -+		return 0;
> -+	}
> -+
> -+	r =3D calloc(routing.num_routes, sizeof(*r));
> -+	if (!r)
> -+		return -ENOMEM;
> -+
> -+	routing.routes =3D (uintptr_t)r;
> -+	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
> -+	if (ret) {
> -+		free(r);
> -+		return ret;
> -+	}
> -+
> -+	*num_routes =3D routing.num_routes;
> -+	*routes =3D r;
> -+
> -+	return 0;
> -+}
> -+
> - int v4l2_subdev_get_dv_timings_caps(struct media_entity *entity,
> -	struct v4l2_dv_timings_cap *caps)
> - {
> -@@ -264,7 +332,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity=
 *entity,
> -
> - int v4l2_subdev_get_frame_interval(struct media_entity *entity,
> -				   struct v4l2_fract *interval,
> --				   unsigned int pad)
> -+				   unsigned int pad, unsigned int stream)
> - {
> -	struct v4l2_subdev_frame_interval ival;
> -	int ret;
> -@@ -275,6 +343,7 @@ int v4l2_subdev_get_frame_interval(struct media_en=
tity *entity,
> -
> -	memset(&ival, 0, sizeof(ival));
> -	ival.pad =3D pad;
> -+	ival.stream =3D stream;
> -
> -	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &ival);
> -	if (ret < 0)
> -@@ -286,7 +355,7 @@ int v4l2_subdev_get_frame_interval(struct media_en=
tity *entity,
> -
> - int v4l2_subdev_set_frame_interval(struct media_entity *entity,
> -				   struct v4l2_fract *interval,
> --				   unsigned int pad)
> -+				   unsigned int pad, unsigned int stream)
> - {
> -	struct v4l2_subdev_frame_interval ival;
> -	int ret;
> -@@ -297,6 +366,7 @@ int v4l2_subdev_set_frame_interval(struct media_en=
tity *entity,
> -
> -	memset(&ival, 0, sizeof(ival));
> -	ival.pad =3D pad;
> -+	ival.stream =3D stream;
> -	ival.interval =3D *interval;
> -
> -	ret =3D ioctl(entity->fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &ival);
> -@@ -307,6 +377,155 @@ int v4l2_subdev_set_frame_interval(struct media_=
entity *entity,
> -	return 0;
> - }
> -
> -+static int v4l2_subdev_parse_setup_route(struct media_device *media,
> -+					 struct v4l2_subdev_route *r,
> -+					 const char *p, char **endp)
> -+{
> -+	char *end;
> -+
> -+	/* sink pad/stream */
> -+
> -+	r->sink_pad =3D strtoul(p, &end, 10);
> -+
> -+	if (*end !=3D '/') {
> -+		media_dbg(media, "Expected '/'\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	p =3D end + 1;
> -+
> -+	r->sink_stream =3D strtoul(p, &end, 10);
> -+
> -+	for (; isspace(*end); ++end);
> -+
> -+	if (end[0] !=3D '-' || end[1] !=3D '>') {
> -+		media_dbg(media, "Expected '->'\n");
> -+		return -EINVAL;
> -+	}
> -+	p =3D end + 2;
> -+
> -+	/* source pad/stream */
> -+
> -+	r->source_pad =3D strtoul(p, &end, 10);
> -+
> -+	if (*end !=3D '/') {
> -+		media_dbg(media, "Expected '/'\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	p =3D end + 1;
> -+
> -+	r->source_stream =3D strtoul(p, &end, 10);
> -+
> -+	/* flags */
> -+
> -+	for (; isspace(*end); ++end);
> -+
> -+	if (*end !=3D '[') {
> -+		media_dbg(media, "Expected '['\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	for (end++; isspace(*end); ++end);
> -+
> -+	p =3D end;
> -+
> -+	r->flags =3D strtoul(p, &end, 0);
> -+
> -+	if (r->flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
> -+		media_dbg(media, "Bad route flags %#x\n", r->flags);
> -+		return -EINVAL;
> -+	}
> -+
> -+	for (; isspace(*end); ++end);
> -+
> -+	if (*end !=3D ']') {
> -+		media_dbg(media, "Expected ']'\n");
> -+		return -EINVAL;
> -+	}
> -+	end++;
> -+
> -+	*endp =3D end;
> -+
> -+	return 0;
> -+}
> -+
> -+int v4l2_subdev_parse_setup_routes(struct media_device *media, const =
char *p)
> -+{
> -+	struct media_entity *entity;
> -+	struct v4l2_subdev_route *routes;
> -+	unsigned int num_routes;
> -+	char *end;
> -+	int ret;
> -+	int i;
> -+
> -+	entity =3D media_parse_entity(media, p, &end);
> -+	if (!entity)
> -+		return -EINVAL;
> -+
> -+	p =3D end;
> -+
> -+	if (*p !=3D '[') {
> -+		media_dbg(media, "Expected '['\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	p++;
> -+
> -+	routes =3D calloc(256, sizeof(routes[0]));
> -+	if (!routes)
> -+		return -ENOMEM;
> -+
> -+	num_routes =3D 0;
> -+
> -+	while (*p !=3D 0) {
> -+		struct v4l2_subdev_route *r =3D &routes[num_routes];
> -+
> -+		ret =3D v4l2_subdev_parse_setup_route(media, r, p, &end);
> -+		if (ret)
> -+			goto out;
> -+
> -+		p =3D end;
> -+
> -+		num_routes++;
> -+
> -+		if (*p =3D=3D ',') {
> -+			p++;
> -+			continue;
> -+		}
> -+
> -+		break;
> -+	}
> -+
> -+	if (*p !=3D ']') {
> -+		media_dbg(media, "Expected ']'\n");
> -+		ret =3D -EINVAL;
> -+		goto out;
> -+	}
> -+
> -+	for (i =3D 0; i < num_routes; ++i) {
> -+		struct v4l2_subdev_route *r =3D &routes[i];
> -+
> -+		media_dbg(entity->media,
> -+			  "Setting up route %s : %u/%u -> %u/%u, flags 0x%8.8x\n",
> -+			  entity->info.name,
> -+			  r->sink_pad, r->sink_stream,
> -+			  r->source_pad, r->source_stream,
> -+			  r->flags);
> -+	}
> -+
> -+	ret =3D v4l2_subdev_set_routing(entity, routes, num_routes);
> -+	if (ret) {
> -+		printf("VIDIOC_SUBDEV_S_ROUTING failed: %d\n", ret);
> -+		goto out;
> -+	}
> -+
> -+out:
> -+	free(routes);
> -+
> -+	return ret;
> -+}
> -+
> - static int v4l2_subdev_parse_format(struct media_device *media,
> -				    struct v4l2_mbus_framefmt *format,
> -				    const char *p, char **endp)
> -@@ -442,7 +661,8 @@ static bool strhazit(const char *str, const char *=
*p)
> - }
> -
> - static struct media_pad *v4l2_subdev_parse_pad_format(
> --	struct media_device *media, struct v4l2_mbus_framefmt *format,
> -+	struct media_device *media, unsigned int *stream,
> -+	struct v4l2_mbus_framefmt *format,
> -	struct v4l2_rect *crop, struct v4l2_rect *compose,
> -	struct v4l2_fract *interval, const char *p, char **endp)
> - {
> -@@ -453,7 +673,7 @@ static struct media_pad *v4l2_subdev_parse_pad_for=
mat(
> -
> -	for (; isspace(*p); ++p);
> -
> --	pad =3D media_parse_pad(media, p, &end);
> -+	pad =3D media_parse_pad_stream(media, p, stream, &end);
> -	if (pad =3D=3D NULL) {
> -		*endp =3D end;
> -		return NULL;
> -@@ -675,6 +895,7 @@ static struct media_pad *v4l2_subdev_parse_pad_for=
mat(
> - }
> -
> - static int set_format(struct media_pad *pad,
> -+		      unsigned int stream,
> -		      struct v4l2_mbus_framefmt *format)
> - {
> -	int ret;
> -@@ -683,12 +904,12 @@ static int set_format(struct media_pad *pad,
> -		return 0;
> -
> -	media_dbg(pad->entity->media,
> --		  "Setting up format %s %ux%u on pad %s/%u\n",
> -+		  "Setting up format %s %ux%u on pad %s/%u/%u\n",
> -		  v4l2_subdev_pixelcode_to_string(format->code),
> -		  format->width, format->height,
> --		  pad->entity->info.name, pad->index);
> -+		  pad->entity->info.name, pad->index, stream);
> -
> --	ret =3D v4l2_subdev_set_format(pad->entity, format, pad->index,
> -+	ret =3D v4l2_subdev_set_format(pad->entity, format, pad->index, stre=
am,
> -				     V4L2_SUBDEV_FORMAT_ACTIVE);
> -	if (ret < 0) {
> -		media_dbg(pad->entity->media,
> -@@ -705,8 +926,8 @@ static int set_format(struct media_pad *pad,
> -	return 0;
> - }
> -
> --static int set_selection(struct media_pad *pad, unsigned int target,
> --			 struct v4l2_rect *rect)
> -+static int set_selection(struct media_pad *pad, unsigned int stream,
> -+			 unsigned int target, struct v4l2_rect *rect)
> - {
> -	int ret;
> -
> -@@ -714,11 +935,11 @@ static int set_selection(struct media_pad *pad, =
unsigned int target,
> -		return 0;
> -
> -	media_dbg(pad->entity->media,
> --		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s=
/%u\n",
> -+		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s=
/%u/%u\n",
> -		  target, rect->left, rect->top, rect->width, rect->height,
> --		  pad->entity->info.name, pad->index);
> -+		  pad->entity->info.name, pad->index, stream);
> -
> --	ret =3D v4l2_subdev_set_selection(pad->entity, rect, pad->index,
> -+	ret =3D v4l2_subdev_set_selection(pad->entity, rect, pad->index, str=
eam,
> -					target, V4L2_SUBDEV_FORMAT_ACTIVE);
> -	if (ret < 0) {
> -		media_dbg(pad->entity->media,
> -@@ -734,7 +955,7 @@ static int set_selection(struct media_pad *pad, un=
signed int target,
> -	return 0;
> - }
> -
> --static int set_frame_interval(struct media_pad *pad,
> -+static int set_frame_interval(struct media_pad *pad, unsigned int str=
eam,
> -			      struct v4l2_fract *interval)
> - {
> -	int ret;
> -@@ -743,11 +964,12 @@ static int set_frame_interval(struct media_pad *=
pad,
> -		return 0;
> -
> -	media_dbg(pad->entity->media,
> --		  "Setting up frame interval %u/%u on pad %s/%u\n",
> -+		  "Setting up frame interval %u/%u on pad %s/%u/%u\n",
> -		  interval->numerator, interval->denominator,
> --		  pad->entity->info.name, pad->index);
> -+		  pad->entity->info.name, pad->index, stream);
> -
> --	ret =3D v4l2_subdev_set_frame_interval(pad->entity, interval, pad->i=
ndex);
> -+	ret =3D v4l2_subdev_set_frame_interval(pad->entity, interval, pad->i=
ndex,
> -+					     stream);
> -	if (ret < 0) {
> -		media_dbg(pad->entity->media,
> -			  "Unable to set frame interval: %s (%d)",
> -@@ -770,11 +992,13 @@ static int v4l2_subdev_parse_setup_format(struct=
 media_device *media,
> -	struct v4l2_rect crop =3D { -1, -1, -1, -1 };
> -	struct v4l2_rect compose =3D crop;
> -	struct v4l2_fract interval =3D { 0, 0 };
> -+	unsigned int stream;
> -	unsigned int i;
> -	char *end;
> -	int ret;
> -
> --	pad =3D v4l2_subdev_parse_pad_format(media, &format, &crop, &compose=
,
> -+	pad =3D v4l2_subdev_parse_pad_format(media, &stream,
> -+					   &format, &crop, &compose,
> -					   &interval, p, &end);
> -	if (pad =3D=3D NULL) {
> -		media_print_streampos(media, p, end);
> -@@ -783,30 +1007,29 @@ static int v4l2_subdev_parse_setup_format(struc=
t media_device *media,
> -	}
> -
> -	if (pad->flags & MEDIA_PAD_FL_SINK) {
> --		ret =3D set_format(pad, &format);
> -+		ret =3D set_format(pad, stream, &format);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> --	ret =3D set_selection(pad, V4L2_SEL_TGT_CROP, &crop);
> -+	ret =3D set_selection(pad, stream, V4L2_SEL_TGT_CROP, &crop);
> -	if (ret < 0)
> -		return ret;
> -
> --	ret =3D set_selection(pad, V4L2_SEL_TGT_COMPOSE, &compose);
> -+	ret =3D set_selection(pad, stream, V4L2_SEL_TGT_COMPOSE, &compose);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (pad->flags & MEDIA_PAD_FL_SOURCE) {
> --		ret =3D set_format(pad, &format);
> -+		ret =3D set_format(pad, stream, &format);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> --	ret =3D set_frame_interval(pad, &interval);
> -+	ret =3D set_frame_interval(pad, stream, &interval);
> -	if (ret < 0)
> -		return ret;
> -
> --
> -	/* If the pad is an output pad, automatically set the same format and
> -	 * frame interval on the remote subdev input pads, if any.
> -	 */
> -@@ -821,9 +1044,9 @@ static int v4l2_subdev_parse_setup_format(struct =
media_device *media,
> -			if (link->source =3D=3D pad &&
> -			    link->sink->entity->info.type =3D=3D MEDIA_ENT_T_V4L2_SUBDEV) {
> -				remote_format =3D format;
> --				set_format(link->sink, &remote_format);
> -+				set_format(link->sink, stream, &remote_format);
> -
> --				ret =3D set_frame_interval(link->sink, &interval);
> -+				ret =3D set_frame_interval(link->sink, stream, &interval);
> -				if (ret < 0 && ret !=3D -EINVAL && ret !=3D -ENOTTY)
> -					return ret;
> -			}
> -diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> -index 84ee7a83..831136a0 100644
> ---- a/utils/media-ctl/media-ctl.c
> -+++ b/utils/media-ctl/media-ctl.c
> -@@ -28,6 +28,7 @@
> - #include <errno.h>
> - #include <fcntl.h>
> - #include <stdbool.h>
> -+#include <stdint.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <string.h>
> -@@ -75,23 +76,43 @@ static void print_flags(const struct flag_name *fl=
ag_names, unsigned int num_ent
> -	}
> - }
> -
> -+static void v4l2_subdev_print_routes(struct media_entity *entity,
> -+				     struct v4l2_subdev_route *routes,
> -+				     unsigned int num_routes)
> -+{
> -+	unsigned int i;
> -+
> -+	for (i =3D 0; i < num_routes; i++) {
> -+		const struct v4l2_subdev_route *r =3D &routes[i];
> -+
> -+		if (i =3D=3D 0)
> -+			printf("\troutes:\n");
> -+
> -+		printf("\t\t%u/%u -> %u/%u [%s]\n",
> -+		       r->sink_pad, r->sink_stream,
> -+		       r->source_pad, r->source_stream,
> -+		       r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE ? "ACTIVE" : "INACTIV=
E");
> -+	}
> -+}
> -+
> - static void v4l2_subdev_print_format(struct media_entity *entity,
> --	unsigned int pad, enum v4l2_subdev_format_whence which)
> -+	unsigned int pad, unsigned int stream,
> -+	enum v4l2_subdev_format_whence which)
> - {
> -	struct v4l2_mbus_framefmt format;
> -	struct v4l2_fract interval =3D { 0, 0 };
> -	struct v4l2_rect rect;
> -	int ret;
> -
> --	ret =3D v4l2_subdev_get_format(entity, &format, pad, which);
> -+	ret =3D v4l2_subdev_get_format(entity, &format, pad, stream, which);
> -	if (ret !=3D 0)
> -		return;
> -
> --	ret =3D v4l2_subdev_get_frame_interval(entity, &interval, pad);
> -+	ret =3D v4l2_subdev_get_frame_interval(entity, &interval, pad, strea=
m);
> -	if (ret !=3D 0 && ret !=3D -ENOTTY && ret !=3D -EINVAL)
> -		return;
> -
> --	printf("\t\t[fmt:%s/%ux%u",
> -+	printf("\t\t[stream:%u fmt:%s/%ux%u", stream,
> -	       v4l2_subdev_pixelcode_to_string(format.code),
> -	       format.width, format.height);
> -
> -@@ -118,28 +139,28 @@ static void v4l2_subdev_print_format(struct medi=
a_entity *entity,
> -			       v4l2_subdev_quantization_to_string(format.quantization));
> -	}
> -
> --	ret =3D v4l2_subdev_get_selection(entity, &rect, pad,
> -+	ret =3D v4l2_subdev_get_selection(entity, &rect, pad, stream,
> -					V4L2_SEL_TGT_CROP_BOUNDS,
> -					which);
> -	if (ret =3D=3D 0)
> -		printf("\n\t\t crop.bounds:(%u,%u)/%ux%u", rect.left, rect.top,
> -		       rect.width, rect.height);
> -
> --	ret =3D v4l2_subdev_get_selection(entity, &rect, pad,
> -+	ret =3D v4l2_subdev_get_selection(entity, &rect, pad, stream,
> -					V4L2_SEL_TGT_CROP,
> -					which);
> -	if (ret =3D=3D 0)
> -		printf("\n\t\t crop:(%u,%u)/%ux%u", rect.left, rect.top,
> -		       rect.width, rect.height);
> -
> --	ret =3D v4l2_subdev_get_selection(entity, &rect, pad,
> -+	ret =3D v4l2_subdev_get_selection(entity, &rect, pad, stream,
> -					V4L2_SEL_TGT_COMPOSE_BOUNDS,
> -					which);
> -	if (ret =3D=3D 0)
> -		printf("\n\t\t compose.bounds:(%u,%u)/%ux%u",
> -		       rect.left, rect.top, rect.width, rect.height);
> -
> --	ret =3D v4l2_subdev_get_selection(entity, &rect, pad,
> -+	ret =3D v4l2_subdev_get_selection(entity, &rect, pad, stream,
> -					V4L2_SEL_TGT_COMPOSE,
> -					which);
> -	if (ret =3D=3D 0)
> -@@ -455,16 +476,58 @@ static void media_print_topology_dot(struct medi=
a_device *media)
> - }
> -
> - static void media_print_pad_text(struct media_entity *entity,
> --				 const struct media_pad *pad)
> -+				 const struct media_pad *pad,
> -+				 struct v4l2_subdev_route *routes,
> -+				 unsigned int num_routes)
> - {
> -+	unsigned int i;
> -+	uint64_t printed_streams_mask;
> -+
> -	if (media_entity_type(entity) !=3D MEDIA_ENT_T_V4L2_SUBDEV)
> -		return;
> -
> --	v4l2_subdev_print_format(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTI=
VE);
> --	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTI=
VE);
> -+	if (!routes) {
> -+		v4l2_subdev_print_format(entity, pad->index, 0, V4L2_SUBDEV_FORMAT_=
ACTIVE);
> -+		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACT=
IVE);
> -+
> -+		if (pad->flags & MEDIA_PAD_FL_SOURCE)
> -+			v4l2_subdev_print_subdev_dv(entity);
> -+
> -+		return;
> -+	}
> -+
> -+	printed_streams_mask =3D 0;
> -+
> -+	for (i =3D 0; i < num_routes; ++i) {
> -+		const struct v4l2_subdev_route *r =3D &routes[i];
> -+		unsigned int stream;
> -
> --	if (pad->flags & MEDIA_PAD_FL_SOURCE)
> --		v4l2_subdev_print_subdev_dv(entity);
> -+		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> -+			continue;
> -+
> -+		if (pad->flags & MEDIA_PAD_FL_SINK) {
> -+			if (r->sink_pad !=3D pad->index)
> -+				continue;
> -+
> -+			stream =3D r->sink_stream;
> -+		} else {
> -+			if (r->source_pad !=3D pad->index)
> -+				continue;
> -+
> -+			stream =3D r->source_stream;
> -+		}
> -+
> -+		if (printed_streams_mask & (1 << stream))
> -+			continue;
> -+
> -+		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FO=
RMAT_ACTIVE);
> -+		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACT=
IVE);
> -+
> -+		if (pad->flags & MEDIA_PAD_FL_SOURCE)
> -+			v4l2_subdev_print_subdev_dv(entity);
> -+
> -+		printed_streams_mask |=3D (1 << stream);
> -+	}
> - }
> -
> - static void media_print_topology_text_entity(struct media_device *med=
ia,
> -@@ -480,11 +543,17 @@ static void media_print_topology_text_entity(str=
uct media_device *media,
> -	unsigned int num_links =3D media_entity_get_links_count(entity);
> -	unsigned int j, k;
> -	unsigned int padding;
> -+	struct v4l2_subdev_route *routes =3D NULL;
> -+	unsigned int num_routes =3D 0;
> -+
> -+	if (media_entity_type(entity) =3D=3D MEDIA_ENT_T_V4L2_SUBDEV)
> -+		v4l2_subdev_get_routing(entity, &routes, &num_routes);
> -
> -	padding =3D printf("- entity %u: ", info->id);
> --	printf("%s (%u pad%s, %u link%s)\n", info->name,
> -+	printf("%s (%u pad%s, %u link%s, %u route%s)\n", info->name,
> -	       info->pads, info->pads > 1 ? "s" : "",
> --	       num_links, num_links > 1 ? "s" : "");
> -+	       num_links, num_links > 1 ? "s" : "",
> -+	       num_routes, num_routes > 1 ? "s" : "");
> -	printf("%*ctype %s subtype %s flags %x\n", padding, ' ',
> -	       media_entity_type_to_string(info->type),
> -	       media_entity_subtype_to_string(info->type),
> -@@ -492,12 +561,15 @@ static void media_print_topology_text_entity(str=
uct media_device *media,
> -	if (devname)
> -		printf("%*cdevice node name %s\n", padding, ' ', devname);
> -
> -+	if (media_entity_type(entity) =3D=3D MEDIA_ENT_T_V4L2_SUBDEV)
> -+		v4l2_subdev_print_routes(entity, routes, num_routes);
> -+
> -	for (j =3D 0; j < info->pads; j++) {
> -		const struct media_pad *pad =3D media_entity_get_pad(entity, j);
> -
> -		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
> -
> --		media_print_pad_text(entity, pad);
> -+		media_print_pad_text(entity, pad, routes, num_routes);
> -
> -		for (k =3D 0; k < num_links; k++) {
> -			const struct media_link *link =3D media_entity_get_link(entity, k);
> -@@ -521,6 +593,8 @@ static void media_print_topology_text_entity(struc=
t media_device *media,
> -		}
> -	}
> -	printf("\n");
> -+
> -+	free(routes);
> - }
> -
> - static void media_print_topology_text(struct media_device *media)
> -@@ -594,14 +668,16 @@ int main(int argc, char **argv)
> -
> -	if (media_opts.fmt_pad) {
> -		struct media_pad *pad;
> -+		unsigned int stream;
> -+		char *p;
> -
> --		pad =3D media_parse_pad(media, media_opts.fmt_pad, NULL);
> -+		pad =3D media_parse_pad_stream(media, media_opts.fmt_pad, &stream, =
&p);
> -		if (pad =3D=3D NULL) {
> -			printf("Pad '%s' not found\n", media_opts.fmt_pad);
> -			goto out;
> -		}
> -
> --		v4l2_subdev_print_format(pad->entity, pad->index,
> -+		v4l2_subdev_print_format(pad->entity, pad->index, stream,
> -					 V4L2_SUBDEV_FORMAT_ACTIVE);
> -	}
> -
> -@@ -685,6 +761,15 @@ int main(int argc, char **argv)
> -		}
> -	}
> -
> -+	if (media_opts.routes) {
> -+		ret =3D v4l2_subdev_parse_setup_routes(media, media_opts.routes);
> -+		if (ret) {
> -+			printf("Unable to setup routes: %s (%d)\n",
> -+			       strerror(-ret), -ret);
> -+			goto out;
> -+		}
> -+	}
> -+
> -	if (media_opts.interactive) {
> -		while (1) {
> -			char buffer[32];
> -diff --git a/utils/media-ctl/mediactl.h b/utils/media-ctl/mediactl.h
> -index af360518..c0fc2962 100644
> ---- a/utils/media-ctl/mediactl.h
> -+++ b/utils/media-ctl/mediactl.h
> -@@ -394,6 +394,22 @@ struct media_entity *media_parse_entity(struct me=
dia_device *media,
> - struct media_pad *media_parse_pad(struct media_device *media,
> -				  const char *p, char **endp);
> -
> -+/**
> -+ * @brief Parse string to a pad and stream on the media device.
> -+ * @param media - media device.
> -+ * @param p - input string
> -+ * @param stream - pointer to uint where the stream number is stored
> -+ * @param endp - pointer to string where parsing ended
> -+ *
> -+ * Parse NULL terminated string describing a pad and stream and retur=
n its struct
> -+ * media_pad instance and the stream number.
> -+ *
> -+ * @return Pointer to struct media_pad on success, NULL on failure.
> -+ */
> -+struct media_pad *media_parse_pad_stream(struct media_device *media,
> -+					 const char *p, unsigned int *stream,
> -+					 char **endp);
> -+
> - /**
> -  * @brief Parse string to a link on the media device.
> -  * @param media - media device.
> -diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
> -index 6d30d3dc..58ddec3c 100644
> ---- a/utils/media-ctl/options.c
> -+++ b/utils/media-ctl/options.c
> -@@ -63,6 +63,7 @@ static void usage(const char *argv0)
> -	printf("    --get-v4l2 pad	Print the active format on a given pad\n")=
;
> -	printf("    --get-dv pad        Print detected and current DV timings=
 on a given pad\n");
> -	printf("    --set-dv pad	Configure DV timings on a given pad\n");
> -+	printf("-R, --set-routes routes Configure routes on a given subdev e=
ntity\n");
> -	printf("-h, --help		Show verbose help and exit\n");
> -	printf("-i, --interactive	Modify links interactively\n");
> -	printf("-l, --links links	Comma-separated list of link descriptors to=
 setup\n");
> -@@ -78,7 +79,7 @@ static void usage(const char *argv0)
> -	printf("Links and formats are defined as\n");
> -	printf("\tlinks           =3D link { ',' link } ;\n");
> -	printf("\tlink            =3D pad '->' pad '[' flags ']' ;\n");
> --	printf("\tpad             =3D entity ':' pad-number ;\n");
> -+	printf("\tpad             =3D entity ':' pad-number { '/' stream-num=
ber } ;\n");
> -	printf("\tentity          =3D entity-number | ( '\"' entity-name '\"'=
 ) ;\n");
> -	printf("\n");
> -	printf("\tv4l2            =3D pad '[' v4l2-properties ']' ;\n");
> -@@ -95,11 +96,16 @@ static void usage(const char *argv0)
> -	printf("\trectangle       =3D '(' left ',' top, ')' '/' size ;\n");
> -	printf("\tsize            =3D width 'x' height ;\n");
> -	printf("\n");
> -+	printf("\troutes          =3D entity '[' route { ',' route } ']' ;\n=
");
> -+	printf("\troute           =3D pad-number '/' stream-number '->' pad-=
number '/' stream-number '[' route-flags ']' ;\n");
> -+	printf("\n");
> -	printf("where the fields are\n");
> -	printf("\tentity-number   Entity numeric identifier\n");
> -	printf("\tentity-name     Entity name (string) \n");
> -	printf("\tpad-number      Pad numeric identifier\n");
> -+	printf("\tstream-number   Stream numeric identifier\n");
> -	printf("\tflags           Link flags (0: inactive, 1: active)\n");
> -+	printf("\troute-flags     Route flags (bitmask of route flags: activ=
e - 0x1, immutable - 0x2, source - 0x4)\n");
> -	printf("\tfcc             Format FourCC\n");
> -	printf("\twidth           Image width in pixels\n");
> -	printf("\theight          Image height in pixels\n");
> -@@ -152,6 +158,7 @@ static struct option opts[] =3D {
> -	{"get-v4l2", 1, 0, OPT_GET_FORMAT},
> -	{"get-dv", 1, 0, OPT_GET_DV},
> -	{"set-dv", 1, 0, OPT_SET_DV},
> -+	{"set-routes", 1, 0, 'R'},
> -	{"help", 0, 0, 'h'},
> -	{"interactive", 0, 0, 'i'},
> -	{"links", 1, 0, 'l'},
> -@@ -237,7 +244,7 @@ int parse_cmdline(int argc, char **argv)
> -	}
> -
> -	/* parse options */
> --	while ((opt =3D getopt_long(argc, argv, "d:e:f:hil:prvV:",
> -+	while ((opt =3D getopt_long(argc, argv, "d:e:f:hil:prvV:R:",
> -				  opts, NULL)) !=3D -1) {
> -		switch (opt) {
> -		case 'd':
> -@@ -283,6 +290,10 @@ int parse_cmdline(int argc, char **argv)
> -			media_opts.verbose =3D 1;
> -			break;
> -
> -+		case 'R':
> -+			media_opts.routes =3D optarg;
> -+			break;
> -+
> -		case OPT_PRINT_DOT:
> -			media_opts.print_dot =3D 1;
> -			break;
> -diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
> -index b1751f56..8796f1b6 100644
> ---- a/utils/media-ctl/options.h
> -+++ b/utils/media-ctl/options.h
> -@@ -38,6 +38,7 @@ struct media_options
> -	const char *fmt_pad;
> -	const char *get_dv_pad;
> -	const char *dv_pad;
> -+	const char *routes;
> - };
> -
> - extern struct media_options media_opts;
> -diff --git a/utils/media-ctl/v4l2subdev.h b/utils/media-ctl/v4l2subdev=
.h
> -index a1813911..a8a6e7ad 100644
> ---- a/utils/media-ctl/v4l2subdev.h
> -+++ b/utils/media-ctl/v4l2subdev.h
> -@@ -64,7 +64,7 @@ void v4l2_subdev_close(struct media_entity *entity);
> -  * @return 0 on success, or a negative error code on failure.
> -  */
> - int v4l2_subdev_get_format(struct media_entity *entity,
> --	struct v4l2_mbus_framefmt *format, unsigned int pad,
> -+	struct v4l2_mbus_framefmt *format, unsigned int pad, unsigned int st=
ream,
> -	enum v4l2_subdev_format_whence which);
> -
> - /**
> -@@ -86,6 +86,7 @@ int v4l2_subdev_get_format(struct media_entity *enti=
ty,
> -  */
> - int v4l2_subdev_set_format(struct media_entity *entity,
> -	struct v4l2_mbus_framefmt *format, unsigned int pad,
> -+	unsigned int stream,
> -	enum v4l2_subdev_format_whence which);
> -
> - /**
> -@@ -107,8 +108,8 @@ int v4l2_subdev_set_format(struct media_entity *en=
tity,
> -  * @return 0 on success, or a negative error code on failure.
> -  */
> - int v4l2_subdev_get_selection(struct media_entity *entity,
> --	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
> --	enum v4l2_subdev_format_whence which);
> -+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
> -+	unsigned int target, enum v4l2_subdev_format_whence which);
> -
> - /**
> -  * @brief Set a selection rectangle on a pad.
> -@@ -129,8 +130,40 @@ int v4l2_subdev_get_selection(struct media_entity=
 *entity,
> -  * @return 0 on success, or a negative error code on failure.
> -  */
> - int v4l2_subdev_set_selection(struct media_entity *entity,
> --	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
> --	enum v4l2_subdev_format_whence which);
> -+	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
> -+	unsigned int target, enum v4l2_subdev_format_whence which);
> -+
> -+/**
> -+ * @brief Get the routing table of a subdev media entity.
> -+ * @param entity - subdev-device media entity.
> -+ * @param routes - routes of the subdev.
> -+ * @param num_routes - number of routes.
> -+ *
> -+ * Get the routes of @a entity and return them in an allocated array =
in @a routes
> -+ * and the number of routes in @a num_routes.
> -+ *
> -+ * The caller is responsible for freeing the routes array after use.
> -+ *
> -+ * @return 0 on success, or a negative error code on failure.
> -+ */
> -+int v4l2_subdev_get_routing(struct media_entity *entity,
> -+			    struct v4l2_subdev_route **routes,
> -+			    unsigned int *num_routes);
> -+
> -+/**
> -+ * @brief Set the routing table of a subdev media entity.
> -+ * @param entity - subdev-device media entity.
> -+ * @param routes - routes of the subdev.
> -+ * @param num_routes - number of routes.
> -+ *
> -+ * Set the routes of @a entity. The routes are given in @a routes wit=
h the
> -+ * length of @a num_routes.
> -+ *
> -+ * @return 0 on success, or a negative error code on failure.
> -+ */
> -+int v4l2_subdev_set_routing(struct media_entity *entity,
> -+			    struct v4l2_subdev_route *route,
> -+			    unsigned int num_routes);
> -
> - /**
> -  * @brief Query the digital video capabilities of a pad.
> -@@ -200,7 +233,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity=
 *entity,
> -  */
> -
> - int v4l2_subdev_get_frame_interval(struct media_entity *entity,
> --	struct v4l2_fract *interval, unsigned int pad);
> -+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
> -
> - /**
> -  * @brief Set the frame interval on a sub-device.
> -@@ -217,7 +250,7 @@ int v4l2_subdev_get_frame_interval(struct media_en=
tity *entity,
> -  * @return 0 on success, or a negative error code on failure.
> -  */
> - int v4l2_subdev_set_frame_interval(struct media_entity *entity,
> --	struct v4l2_fract *interval, unsigned int pad);
> -+	struct v4l2_fract *interval, unsigned int pad, unsigned int stream);
> -
> - /**
> -  * @brief Parse a string and apply format, crop and frame interval se=
ttings.
> -@@ -235,6 +268,17 @@ int v4l2_subdev_set_frame_interval(struct media_e=
ntity *entity,
> -  */
> - int v4l2_subdev_parse_setup_formats(struct media_device *media, const=
 char *p);
> -
> -+/**
> -+ * @brief Parse a string and apply route settings.
> -+ * @param media - media device.
> -+ * @param p - input string
> -+ *
> -+ * Parse string @a p and apply route settings to a subdev.
> -+ *
> -+ * @return 0 on success, or a negative error code on failure.
> -+ */
> -+int v4l2_subdev_parse_setup_routes(struct media_device *media, const =
char *p);
> -+
> - /**
> -  * @brief Convert media bus pixel code to string.
> -  * @param code - input string
> ---
> -2.40.0
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
002-original-patch-mediactl-pkgconfig.patch b/meta-arago-extras/recipes-m=
ultimedia/v4l-utils/v4l-utils/0002-original-patch-mediactl-pkgconfig.patc=
h
> deleted file mode 100644
> index 6ad9f2c1..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0002-ori=
ginal-patch-mediactl-pkgconfig.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 1 Mar 2015 22:25:07 +0000
> -Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
> -
> ----
> - utils/media-ctl/Makefile.am | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index e255e16..ff7b417 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD =3D libmediactl.la
> - mediactl_includedir=3D$(includedir)/mediactl
> - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> -
> -+pkgconfig_DATA =3D libmediactl.pc
> - bin_PROGRAMS =3D media-ctl
> - media_ctl_SOURCES =3D media-ctl.c options.c options.h tools.h
> - media_ctl_LDADD =3D libmediactl.la libv4l2subdev.la
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
003-original-patch-export-mediactl-headers.patch b/meta-arago-extras/reci=
pes-multimedia/v4l-utils/v4l-utils/0003-original-patch-export-mediactl-he=
aders.patch
> deleted file mode 100644
> index 5562d2c1..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-ori=
ginal-patch-export-mediactl-headers.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 1 Mar 2015 22:25:07 +0000
> -Subject: [PATCH] %% original patch: export-mediactl-headers.patch
> -
> ----
> - utils/media-ctl/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index ff7b417..6ce656f 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -17,8 +17,8 @@ CLEANFILES =3D $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> - libv4l2subdev_la_LIBADD =3D libmediactl.la
> --mediactl_includedir=3D$(includedir)/mediactl
> --noinst_HEADERS =3D mediactl.h v4l2subdev.h
> -+otherincludedir =3D $(includedir)/mediactl
> -+otherinclude_HEADERS =3D mediactl.h v4l2subdev.h
> -
> - pkgconfig_DATA =3D libmediactl.pc
> - bin_PROGRAMS =3D media-ctl
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
003-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch b/meta-ara=
go-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l2-ctl-compliance=
-add-routing-and-streams-multiple.patch
> deleted file mode 100644
> index aeb97e09..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0003-v4l=
2-ctl-compliance-add-routing-and-streams-multiple.patch
> +++ /dev/null
> @@ -1,459 +0,0 @@
> -From 2866c81d2597f47ed976928bc9c27942bbf095f0 Mon Sep 17 00:00:00 2001
> -From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> -Date: Fri, 10 Feb 2023 13:55:46 +0200
> -Subject: [PATCH 3/3] v4l2-ctl/compliance: add routing and streams mult=
iplexed
> - streams
> -
> -Add basic support for routing and streams.
> -
> -Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ----
> - utils/v4l2-compliance/v4l2-compliance.cpp   | 120 ++++++++++++++++---=
-
> - utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
> - utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++++++-
> - 3 files changed, 137 insertions(+), 34 deletions(-)
> -
> -diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-co=
mpliance/v4l2-compliance.cpp
> -index 8aebae2e..63b5fbbb 100644
> ---- a/utils/v4l2-compliance/v4l2-compliance.cpp
> -+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> -@@ -1224,6 +1224,10 @@ void testNode(struct node &node, struct node &n=
ode_m2m_cap, struct node &expbuf_
> -	if (node.is_subdev()) {
> -		bool has_source =3D false;
> -		bool has_sink =3D false;
> -+		struct v4l2_subdev_routing sd_routing[2] =3D {};
> -+		struct v4l2_subdev_route sd_routes[2][256] =3D {};
> -+		bool has_routes =3D !!(subdevcap.capabilities & V4L2_SUBDEV_CAP_STR=
EAMS);
> -+		int ret;
> -
> -		node.frame_interval_pad =3D -1;
> -		node.enum_frame_interval_pad =3D -1;
> -@@ -1235,6 +1239,22 @@ void testNode(struct node &node, struct node &n=
ode_m2m_cap, struct node &expbuf_
> -		}
> -		node.is_passthrough_subdev =3D has_source && has_sink;
> -
> -+		if (has_routes) {
> -+			for (unsigned which =3D V4L2_SUBDEV_FORMAT_TRY;
> -+				which <=3D V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> -+
> -+				sd_routing[which].which =3D which;
> -+				sd_routing[which].routes =3D (__u64)sd_routes[which];
> -+				sd_routing[which].num_routes =3D 256;
> -+
> -+				ret =3D doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which=
]);
> -+				if (ret) {
> -+					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
> -+					sd_routing[which].num_routes =3D 0;
> -+				}
> -+			}
> -+		}
> -+
> -		for (unsigned pad =3D 0; pad < node.entity.pads; pad++) {
> -			printf("Sub-Device ioctls (%s Pad %u):\n",
> -			       (node.pads[pad].flags & MEDIA_PAD_FL_SINK) ?
> -@@ -1244,32 +1264,82 @@ void testNode(struct node &node, struct node &=
node_m2m_cap, struct node &expbuf_
> -			node.has_subdev_enum_fival =3D 0;
> -			for (unsigned which =3D V4L2_SUBDEV_FORMAT_TRY;
> -			     which <=3D V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> --				printf("\ttest %s VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_I=
NTERVAL: %s\n",
> --				       which ? "Active" : "Try",
> --				       ok(testSubDevEnum(&node, which, pad)));
> --				printf("\ttest %s VIDIOC_SUBDEV_G/S_FMT: %s\n",
> --				       which ? "Active" : "Try",
> --				       ok(testSubDevFormat(&node, which, pad)));
> --				printf("\ttest %s VIDIOC_SUBDEV_G/S_SELECTION/CROP: %s\n",
> --				       which ? "Active" : "Try",
> --				       ok(testSubDevSelection(&node, which, pad)));
> --				if (which)
> --					printf("\ttest VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: %s\n",
> --					       ok(testSubDevFrameInterval(&node, pad)));
> -+				struct v4l2_subdev_routing dummy_routing;
> -+				struct v4l2_subdev_route dummy_routes[1];
> -+
> -+				const struct v4l2_subdev_routing *routing;
> -+				const struct v4l2_subdev_route *routes;
> -+
> -+				if (has_routes) {
> -+					routing =3D &sd_routing[which];
> -+					routes =3D sd_routes[which];
> -+				} else {
> -+					dummy_routing.num_routes =3D 1;
> -+					dummy_routing.routes =3D (__u64)&dummy_routes;
> -+					dummy_routes[0].source_pad =3D pad;
> -+					dummy_routes[0].source_stream =3D 0;
> -+					dummy_routes[0].sink_pad =3D pad;
> -+					dummy_routes[0].sink_stream =3D 0;
> -+					dummy_routes[0].flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> -+
> -+					routing =3D &dummy_routing;
> -+					routes =3D dummy_routes;
> -+				}
> -+
> -+				for (unsigned i =3D 0; i < routing->num_routes; ++i) {
> -+					const struct v4l2_subdev_route *r =3D &routes[i];
> -+					unsigned stream;
> -+
> -+					if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> -+						continue;
> -+
> -+					if ((node.pads[pad].flags & MEDIA_PAD_FL_SINK) &&
> -+					    (r->sink_pad =3D=3D pad))
> -+						stream =3D r->sink_stream;
> -+					else if ((node.pads[pad].flags & MEDIA_PAD_FL_SOURCE) &&
> -+					    (r->source_pad =3D=3D pad))
> -+						stream =3D r->source_stream;
> -+					else
> -+						continue;
> -+
> -+					printf("\t%s Stream %u\n",which ? "Active" : "Try",
> -+					       stream);
> -+
> -+					printf("\ttest %s VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_=
INTERVAL: %s\n",
> -+					       which ? "Active" : "Try",
> -+					       ok(testSubDevEnum(&node, which, pad, stream)));
> -+					printf("\ttest %s VIDIOC_SUBDEV_G/S_FMT: %s\n",
> -+					       which ? "Active" : "Try",
> -+					       ok(testSubDevFormat(&node, which, pad, stream)));
> -+					printf("\ttest %s VIDIOC_SUBDEV_G/S_SELECTION/CROP: %s\n",
> -+					       which ? "Active" : "Try",
> -+					       ok(testSubDevSelection(&node, which, pad, stream)));
> -+					if (which)
> -+						printf("\ttest VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: %s\n",
> -+						       ok(testSubDevFrameInterval(&node, pad, stream)));
> -+				}
> -+			}
> -+
> -+			/*
> -+			 * These tests do not make sense for subdevs with multiplexed stre=
ams,
> -+			 * as the try & active cases may have different routing and thus d=
ifferent
> -+			 * behavior.
> -+			 */
> -+			if (!has_routes) {
> -+				if (node.has_subdev_enum_code && node.has_subdev_enum_code < 3)
> -+					fail("VIDIOC_SUBDEV_ENUM_MBUS_CODE: try/active mismatch\n");
> -+				if (node.has_subdev_enum_fsize && node.has_subdev_enum_fsize < 3)
> -+					fail("VIDIOC_SUBDEV_ENUM_FRAME_SIZE: try/active mismatch\n");
> -+				if (node.has_subdev_enum_fival && node.has_subdev_enum_fival < 3)
> -+					fail("VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: try/active mismatch\n")=
;
> -+				if (node.has_subdev_fmt && node.has_subdev_fmt < 3)
> -+					fail("VIDIOC_SUBDEV_G/S_FMT: try/active mismatch\n");
> -+				if (node.has_subdev_selection && node.has_subdev_selection < 3)
> -+					fail("VIDIOC_SUBDEV_G/S_SELECTION: try/active mismatch\n");
> -+				if (node.has_subdev_selection &&
> -+				    node.has_subdev_selection !=3D node.has_subdev_fmt)
> -+					fail("VIDIOC_SUBDEV_G/S_SELECTION: fmt/selection mismatch\n");
> -			}
> --			if (node.has_subdev_enum_code && node.has_subdev_enum_code < 3)
> --				fail("VIDIOC_SUBDEV_ENUM_MBUS_CODE: try/active mismatch\n");
> --			if (node.has_subdev_enum_fsize && node.has_subdev_enum_fsize < 3)
> --				fail("VIDIOC_SUBDEV_ENUM_FRAME_SIZE: try/active mismatch\n");
> --			if (node.has_subdev_enum_fival && node.has_subdev_enum_fival < 3)
> --				fail("VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: try/active mismatch\n");
> --			if (node.has_subdev_fmt && node.has_subdev_fmt < 3)
> --				fail("VIDIOC_SUBDEV_G/S_FMT: try/active mismatch\n");
> --			if (node.has_subdev_selection && node.has_subdev_selection < 3)
> --				fail("VIDIOC_SUBDEV_G/S_SELECTION: try/active mismatch\n");
> --			if (node.has_subdev_selection &&
> --			    node.has_subdev_selection !=3D node.has_subdev_fmt)
> --				fail("VIDIOC_SUBDEV_G/S_SELECTION: fmt/selection mismatch\n");
> -			printf("\n");
> -		}
> -	}
> -diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-comp=
liance/v4l2-compliance.h
> -index e574c06c..67b3521e 100644
> ---- a/utils/v4l2-compliance/v4l2-compliance.h
> -+++ b/utils/v4l2-compliance/v4l2-compliance.h
> -@@ -373,10 +373,10 @@ int testDecoder(struct node *node);
> -
> - // SubDev ioctl tests
> - int testSubDevCap(struct node *node);
> --int testSubDevEnum(struct node *node, unsigned which, unsigned pad);
> --int testSubDevFormat(struct node *node, unsigned which, unsigned pad)=
;
> --int testSubDevSelection(struct node *node, unsigned which, unsigned p=
ad);
> --int testSubDevFrameInterval(struct node *node, unsigned pad);
> -+int testSubDevEnum(struct node *node, unsigned which, unsigned pad, u=
nsigned stream);
> -+int testSubDevFormat(struct node *node, unsigned which, unsigned pad,=
 unsigned stream);
> -+int testSubDevSelection(struct node *node, unsigned which, unsigned p=
ad, unsigned stream);
> -+int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned=
 stream);
> -
> - // Buffer ioctl tests
> - int testReqBufs(struct node *node);
> -diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-=
compliance/v4l2-test-subdevs.cpp
> -index f3d85771..07192bda 100644
> ---- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> -+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> -@@ -25,7 +25,7 @@
> -
> - #include "v4l2-compliance.h"
> -
> --#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV)
> -+#define VALID_SUBDEV_CAPS (V4L2_SUBDEV_CAP_RO_SUBDEV | V4L2_SUBDEV_CA=
P_STREAMS)
> -
> - int testSubDevCap(struct node *node)
> - {
> -@@ -54,6 +54,7 @@ static int testSubDevEnumFrameInterval(struct node *=
node, unsigned which,
> -	memset(&fie, 0, sizeof(fie));
> -	fie.which =3D which;
> -	fie.pad =3D pad;
> -+	fie.stream =3D 0;
> -	fie.code =3D code;
> -	fie.width =3D width;
> -	fie.height =3D height;
> -@@ -83,6 +84,7 @@ static int testSubDevEnumFrameInterval(struct node *=
node, unsigned which,
> -	memset(&fie, 0xff, sizeof(fie));
> -	fie.which =3D which;
> -	fie.pad =3D pad;
> -+	fie.stream =3D 0;
> -	fie.code =3D code;
> -	fie.width =3D width;
> -	fie.height =3D height;
> -@@ -128,6 +130,7 @@ static int testSubDevEnumFrameSize(struct node *no=
de, unsigned which,
> -	memset(&fse, 0, sizeof(fse));
> -	fse.which =3D which;
> -	fse.pad =3D pad;
> -+	fse.stream =3D 0;
> -	fse.code =3D code;
> -	ret =3D doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse);
> -	node->has_subdev_enum_fsize |=3D (ret !=3D ENOTTY) << which;
> -@@ -137,6 +140,7 @@ static int testSubDevEnumFrameSize(struct node *no=
de, unsigned which,
> -		memset(&fie, 0, sizeof(fie));
> -		fie.which =3D which;
> -		fie.pad =3D pad;
> -+		fie.stream =3D 0;
> -		fie.code =3D code;
> -		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) =
!=3D ENOTTY);
> -		return ret;
> -@@ -152,6 +156,7 @@ static int testSubDevEnumFrameSize(struct node *no=
de, unsigned which,
> -	memset(&fse, 0xff, sizeof(fse));
> -	fse.which =3D which;
> -	fse.pad =3D pad;
> -+	fse.stream =3D 0;
> -	fse.code =3D code;
> -	fse.index =3D 0;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse));
> -@@ -195,7 +200,7 @@ static int testSubDevEnumFrameSize(struct node *no=
de, unsigned which,
> -	return 0;
> - }
> -
> --int testSubDevEnum(struct node *node, unsigned which, unsigned pad)
> -+int testSubDevEnum(struct node *node, unsigned which, unsigned pad, u=
nsigned stream)
> - {
> -	struct v4l2_subdev_mbus_code_enum mbus_core_enum;
> -	unsigned num_codes;
> -@@ -204,6 +209,7 @@ int testSubDevEnum(struct node *node, unsigned whi=
ch, unsigned pad)
> -	memset(&mbus_core_enum, 0, sizeof(mbus_core_enum));
> -	mbus_core_enum.which =3D which;
> -	mbus_core_enum.pad =3D pad;
> -+	mbus_core_enum.stream =3D stream;
> -	ret =3D doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_enum);
> -	node->has_subdev_enum_code |=3D (ret !=3D ENOTTY) << which;
> -	if (ret =3D=3D ENOTTY) {
> -@@ -214,8 +220,10 @@ int testSubDevEnum(struct node *node, unsigned wh=
ich, unsigned pad)
> -		memset(&fie, 0, sizeof(fie));
> -		fse.which =3D which;
> -		fse.pad =3D pad;
> -+		fse.stream =3D stream;
> -		fie.which =3D which;
> -		fie.pad =3D pad;
> -+		fie.stream =3D stream;
> -		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse) !=3D=
 ENOTTY);
> -		fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) =
!=3D ENOTTY);
> -		return ret;
> -@@ -226,16 +234,19 @@ int testSubDevEnum(struct node *node, unsigned w=
hich, unsigned pad)
> -	mbus_core_enum.index =3D ~0;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_e=
num) !=3D EINVAL);
> -	mbus_core_enum.pad =3D node->entity.pads;
> -+	mbus_core_enum.stream =3D stream;
> -	mbus_core_enum.index =3D 0;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_e=
num) !=3D EINVAL);
> -	memset(&mbus_core_enum, 0xff, sizeof(mbus_core_enum));
> -	mbus_core_enum.which =3D which;
> -	mbus_core_enum.pad =3D pad;
> -+	mbus_core_enum.stream =3D stream;
> -	mbus_core_enum.index =3D 0;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_ENUM_MBUS_CODE, &mbus_core_e=
num));
> -	fail_on_test(check_0(mbus_core_enum.reserved, sizeof(mbus_core_enum.r=
eserved)));
> -	fail_on_test(mbus_core_enum.code =3D=3D ~0U);
> -	fail_on_test(mbus_core_enum.pad !=3D pad);
> -+	fail_on_test(mbus_core_enum.stream !=3D stream);
> -	fail_on_test(mbus_core_enum.index);
> -	fail_on_test(mbus_core_enum.which !=3D which);
> -	do {
> -@@ -252,6 +263,7 @@ int testSubDevEnum(struct node *node, unsigned whi=
ch, unsigned pad)
> -		fail_on_test(!mbus_core_enum.code);
> -		fail_on_test(mbus_core_enum.which !=3D which);
> -		fail_on_test(mbus_core_enum.pad !=3D pad);
> -+		fail_on_test(mbus_core_enum.stream !=3D stream);
> -		fail_on_test(mbus_core_enum.index !=3D i);
> -
> -		ret =3D testSubDevEnumFrameSize(node, which, pad, mbus_core_enum.cod=
e);
> -@@ -260,7 +272,7 @@ int testSubDevEnum(struct node *node, unsigned whi=
ch, unsigned pad)
> -	return 0;
> - }
> -
> --int testSubDevFrameInterval(struct node *node, unsigned pad)
> -+int testSubDevFrameInterval(struct node *node, unsigned pad, unsigned=
 stream)
> - {
> -	struct v4l2_subdev_frame_interval fival;
> -	struct v4l2_fract ival;
> -@@ -268,6 +280,7 @@ int testSubDevFrameInterval(struct node *node, uns=
igned pad)
> -
> -	memset(&fival, 0xff, sizeof(fival));
> -	fival.pad =3D pad;
> -+	fival.stream =3D stream;
> -	ret =3D doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival);
> -	if (ret =3D=3D ENOTTY) {
> -		fail_on_test(node->enum_frame_interval_pad >=3D 0);
> -@@ -279,6 +292,7 @@ int testSubDevFrameInterval(struct node *node, uns=
igned pad)
> -	node->frame_interval_pad =3D pad;
> -	fail_on_test(check_0(fival.reserved, sizeof(fival.reserved)));
> -	fail_on_test(fival.pad !=3D pad);
> -+	fail_on_test(fival.stream !=3D stream);
> -	fail_on_test(!fival.interval.numerator);
> -	fail_on_test(!fival.interval.denominator);
> -	fail_on_test(fival.interval.numerator =3D=3D ~0U || fival.interval.de=
nominator =3D=3D ~0U);
> -@@ -290,20 +304,25 @@ int testSubDevFrameInterval(struct node *node, u=
nsigned pad)
> -	}
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival));
> -	fail_on_test(fival.pad !=3D pad);
> -+	fail_on_test(fival.stream !=3D stream);
> -	fail_on_test(ival.numerator !=3D fival.interval.numerator);
> -	fail_on_test(ival.denominator !=3D fival.interval.denominator);
> -	fail_on_test(check_0(fival.reserved, sizeof(fival.reserved)));
> -	memset(&fival, 0, sizeof(fival));
> -	fival.pad =3D pad;
> -+	fival.stream =3D stream;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival));
> -	fail_on_test(fival.pad !=3D pad);
> -+	fail_on_test(fival.stream !=3D stream);
> -	fail_on_test(ival.numerator !=3D fival.interval.numerator);
> -	fail_on_test(ival.denominator !=3D fival.interval.denominator);
> -
> -	fival.pad =3D node->entity.pads;
> -+	fival.stream =3D stream;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &fival) !=3D=
 EINVAL);
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival) !=3D=
 EINVAL);
> -	fival.pad =3D pad;
> -+	fival.stream =3D stream;
> -	fival.interval =3D ival;
> -	fival.interval.numerator =3D 0;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &fival));
> -@@ -340,7 +359,7 @@ static int checkMBusFrameFmt(struct node *node, st=
ruct v4l2_mbus_framefmt &fmt)
> -	return 0;
> - }
> -
> --int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
> -+int testSubDevFormat(struct node *node, unsigned which, unsigned pad,=
 unsigned stream)
> - {
> -	struct v4l2_subdev_format fmt;
> -	struct v4l2_subdev_format s_fmt;
> -@@ -349,6 +368,7 @@ int testSubDevFormat(struct node *node, unsigned w=
hich, unsigned pad)
> -	memset(&fmt, 0, sizeof(fmt));
> -	fmt.which =3D which;
> -	fmt.pad =3D pad;
> -+	fmt.stream =3D stream;
> -	ret =3D doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt);
> -	node->has_subdev_fmt |=3D (ret !=3D ENOTTY) << which;
> -	if (ret =3D=3D ENOTTY) {
> -@@ -359,14 +379,17 @@ int testSubDevFormat(struct node *node, unsigned=
 which, unsigned pad)
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt) !=3D EINVAL);
> -	fmt.which =3D 0;
> -	fmt.pad =3D node->entity.pads;
> -+	fmt.stream =3D stream;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt) !=3D EINVAL);
> -	memset(&fmt, 0xff, sizeof(fmt));
> -	fmt.which =3D which;
> -	fmt.pad =3D pad;
> -+	fmt.stream =3D stream;
> -	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt));
> -	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
> -	fail_on_test(fmt.which !=3D which);
> -	fail_on_test(fmt.pad !=3D pad);
> -+	fail_on_test(fmt.stream !=3D stream);
> -	fail_on_test(checkMBusFrameFmt(node, fmt.format));
> -	s_fmt =3D fmt;
> -	memset(s_fmt.reserved, 0xff, sizeof(s_fmt.reserved));
> -@@ -379,6 +402,7 @@ int testSubDevFormat(struct node *node, unsigned w=
hich, unsigned pad)
> -	fail_on_test(ret && ret !=3D ENOTTY);
> -	fail_on_test(s_fmt.which !=3D which);
> -	fail_on_test(s_fmt.pad !=3D pad);
> -+	fail_on_test(s_fmt.stream !=3D stream);
> -	if (ret) {
> -		warn("VIDIOC_SUBDEV_G_FMT is supported but not VIDIOC_SUBDEV_S_FMT\n=
");
> -		return 0;
> -@@ -423,7 +447,7 @@ static target_info targets[] =3D {
> -	{ ~0U },
> - };
> -
> --int testSubDevSelection(struct node *node, unsigned which, unsigned p=
ad)
> -+int testSubDevSelection(struct node *node, unsigned which, unsigned p=
ad, unsigned stream)
> - {
> -	struct v4l2_subdev_selection sel;
> -	struct v4l2_subdev_selection s_sel;
> -@@ -435,10 +459,12 @@ int testSubDevSelection(struct node *node, unsig=
ned which, unsigned pad)
> -	targets[V4L2_SEL_TGT_NATIVE_SIZE].readonly =3D is_sink;
> -	memset(&crop, 0, sizeof(crop));
> -	crop.pad =3D pad;
> -+	crop.stream =3D stream;
> -	crop.which =3D which;
> -	memset(&sel, 0, sizeof(sel));
> -	sel.which =3D which;
> -	sel.pad =3D pad;
> -+	sel.stream =3D stream;
> -	sel.target =3D V4L2_SEL_TGT_CROP;
> -	ret =3D doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
> -	node->has_subdev_selection |=3D (ret !=3D ENOTTY) << which;
> -@@ -451,6 +477,7 @@ int testSubDevSelection(struct node *node, unsigne=
d which, unsigned pad)
> -	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
> -	fail_on_test(crop.which !=3D which);
> -	fail_on_test(crop.pad !=3D pad);
> -+	fail_on_test(crop.stream !=3D stream);
> -	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
> -
> -	for (unsigned tgt =3D 0; targets[tgt].target !=3D ~0U; tgt++) {
> -@@ -458,6 +485,7 @@ int testSubDevSelection(struct node *node, unsigne=
d which, unsigned pad)
> -		memset(&sel, 0xff, sizeof(sel));
> -		sel.which =3D which;
> -		sel.pad =3D pad;
> -+		sel.stream =3D stream;
> -		sel.target =3D tgt;
> -		ret =3D doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel);
> -		targets[tgt].found =3D !ret;
> -@@ -469,6 +497,7 @@ int testSubDevSelection(struct node *node, unsigne=
d which, unsigned pad)
> -		fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
> -		fail_on_test(sel.which !=3D which);
> -		fail_on_test(sel.pad !=3D pad);
> -+		fail_on_test(sel.stream !=3D stream);
> -		fail_on_test(sel.target !=3D tgt);
> -		fail_on_test(!sel.r.width);
> -		fail_on_test(sel.r.width =3D=3D ~0U);
> -@@ -480,9 +509,11 @@ int testSubDevSelection(struct node *node, unsign=
ed which, unsigned pad)
> -		fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel) !=3D EIN=
VAL);
> -		sel.which =3D 0;
> -		sel.pad =3D node->entity.pads;
> -+		sel.stream =3D stream;
> -		fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_SELECTION, &sel) !=3D EIN=
VAL);
> -		sel.which =3D which;
> -		sel.pad =3D pad;
> -+		sel.stream =3D stream;
> -		s_sel =3D sel;
> -		memset(s_sel.reserved, 0xff, sizeof(s_sel.reserved));
> -		ret =3D doioctl(node, VIDIOC_SUBDEV_S_SELECTION, &s_sel);
> -@@ -496,6 +527,7 @@ int testSubDevSelection(struct node *node, unsigne=
d which, unsigned pad)
> -				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
> -				fail_on_test(crop.which !=3D which);
> -				fail_on_test(crop.pad !=3D pad);
> -+				fail_on_test(crop.stream !=3D stream);
> -				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
> -			}
> -		}
> -@@ -504,6 +536,7 @@ int testSubDevSelection(struct node *node, unsigne=
d which, unsigned pad)
> -		fail_on_test(!ret && targets[tgt].readonly);
> -		fail_on_test(s_sel.which !=3D which);
> -		fail_on_test(s_sel.pad !=3D pad);
> -+		fail_on_test(s_sel.stream !=3D stream);
> -		if (ret && !targets[tgt].readonly && tgt !=3D V4L2_SEL_TGT_NATIVE_SI=
ZE)
> -			warn("VIDIOC_SUBDEV_G_SELECTION is supported for target %u but not =
VIDIOC_SUBDEV_S_SELECTION\n", tgt);
> -		if (ret)
> ---
> -2.40.0
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0=
004-Do-not-use-getsubopt.patch b/meta-arago-extras/recipes-multimedia/v4l=
-utils/v4l-utils/0004-Do-not-use-getsubopt.patch
> deleted file mode 100644
> index f67d48e9..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils/0004-Do-=
not-use-getsubopt.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Nov 2019 18:50:34 -0800
> -Subject: [PATCH] Do not use getsubopt
> -
> -POSIX says that behavior when subopts list is empty is undefined.
> -musl libs will set value to NULL which leads to crash.
> -
> -Simply avoid getsubopt, since we cannot rely on it.
> -
> -Imported from Alpine Linux
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Adapt patch to 1.23.0.
> -
> -(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
> -
> -%% original patch: 0007-Do-not-use-getsubopt.patch
> -
> -Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ----
> - utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
> - 1 file changed, 10 insertions(+), 8 deletions(-)
> -
> -diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-=
ctl-common.cpp
> -index d77f7104..838c297d 100644
> ---- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> -+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> -@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
> -
> - static bool parse_next_subopt(char **subs, char **value)
> - {
> --	static char *const subopts[] =3D {
> --	    nullptr
> --	};
> --	int opt =3D v4l_getsubopt(subs, subopts, value);
> -+	char *p =3D *subs;
> -+	*value =3D *subs;
> -
> --	if (opt < 0 || *value)
> --		return false;
> --	fprintf(stderr, "Missing suboption value\n");
> --	return true;
> -+	while (*p && *p !=3D ',')
> -+		p++;
> -+
> -+	if (*p)
> -+		*p++ =3D '\0';
> -+
> -+	*subs =3D p;
> -+	return false;
> - }
> -
> - void common_cmd(const std::string &media_bus_info, int ch, char *opta=
rg)
> ---
> -2.35.1
> diff --git a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1=
.24.1.bb b/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.24.=
1.bb
> deleted file mode 100644
> index a2ebb0ea..00000000
> --- a/meta-arago-extras/recipes-multimedia/v4l-utils/v4l-utils_1.24.1.b=
b
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -SUMMARY =3D "v4l2 and IR applications"
> -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056017dc568bbc43=
d8975 \
> -                    file://COPYING.libv4l;md5=3Dd749e86a105281d7a44c23=
28acebc4b0"
> -PROVIDES =3D "libv4l media-ctl"
> -
> -DEPENDS =3D "jpeg \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/lib=
x11', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd=
', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib',=
 '', d)} \
> -           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', =
'qtbase qtbase-native', '', d)}"
> -
> -DEPENDS:append:libc-musl =3D " argp-standalone"
> -DEPENDS:append:class-target =3D " udev"
> -LDFLAGS:append =3D " -pthread"
> -# v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
> -# both 32 and 64 bit file APIs.  But it does not handle the time side?
> -# Needs further investigation
> -GLIBC_64BIT_TIME_FLAGS =3D ""
> -
> -inherit autotools gettext pkgconfig
> -
> -PACKAGECONFIG ??=3D "media-ctl"
> -PACKAGECONFIG[media-ctl] =3D "--enable-v4l-utils,--disable-v4l-utils,,=
"
> -PACKAGECONFIG[qv4l2] =3D ",--disable-qv4l2"
> -PACKAGECONFIG[qvidcap] =3D ",--disable-qvidcap"
> -
> -SRC_URI =3D "\
> -    http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
> -    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.p=
atch \
> -    file://0002-original-patch-mediactl-pkgconfig.patch \
> -    file://0003-original-patch-export-mediactl-headers.patch \
> -    file://0004-Do-not-use-getsubopt.patch \
> -    file://0001-v4l2-ctl-Add-routing-and-streams-support.patch \
> -    file://0002-media-ctl-add-support-for-routes-and-streams.patch \
> -    file://0003-v4l2-ctl-compliance-add-routing-and-streams-multiple.p=
atch \
> -    file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "8ba9c73c4319b6afab5fa4358edc43de"
> -SRC_URI[sha256sum] =3D "cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6=
d007eb53b75d805f5b"
> -
> -EXTRA_OECONF =3D "--enable-shared --with-udevdir=3D${base_libdir}/udev=
 \
> -                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
> -
> -VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
> -
> -PACKAGES =3D+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l=
2 qvidcap"
> -
> -RPROVIDES:${PN}-dbg +=3D "libv4l-dbg"
> -
> -FILES:media-ctl =3D "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
> -FILES:qv4l2 =3D "\
> -    ${bindir}/qv4l2 \
> -    ${datadir}/applications/qv4l2.desktop \
> -    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
> -"
> -FILES:qvidcap =3D "\
> -    ${bindir}/qvidcap \
> -    ${datadir}/applications/qvidcap.desktop \
> -    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
> -"
> -
> -FILES:ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules=
.d/*-infrared.rules"
> -RDEPENDS:ir-keytable +=3D "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
> -RDEPENDS:qv4l2 +=3D "\
> -    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
> -RDEPENDS:qvidcap +=3D "\
> -    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}=
"
> -
> -FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> -
> -FILES:${PN} =3D "${bindir} ${sbindir}"
> -
> -FILES:libv4l +=3D "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${=
libdir}/libv4l/plugins/*.so \
> -                 ${libdir}/libdvbv5*${SOLIBS} \
> -                 ${libdir}/libv4l/*-decomp"
> -
> -FILES:libv4l-dev +=3D "${includedir} ${libdir}/pkgconfig \
> -                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
> -                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la =
${libdir}/libv4l/plugins/*.la"
> -
> -PARALLEL_MAKE:class-native =3D ""
> -BBCLASSEXTEND =3D "native"

