Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199601062870
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:56:53 +0000 (UTC)
Subject: Re: [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiation in Non-contiguous Formats
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 04:56:44 -0700
References: <20260311012906.3348907-1-b-brnich@ti.com>
In-Reply-To: <20260311012906.3348907-1-b-brnich@ti.com>
Message-ID: <360188.1773230204899273140@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 11:56:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17306

On Wed, Mar 11, 2026 at 06:59 AM, Brandon Brnich wrote:

>
> Upstream gstreamer has introduced a new method for mapping V4L2 buffer
> formats to their respective GST format. Previously it was a big switch
> statement manually assigning all contiguous and non-contiguous variants t=
o
> fourcc and fourcc_nc respectively. Formats that didn't have both options
> would only populate the fourcc. The new mapping properly sets the
> corresponding fourcc/fourcc_nc. This means for pixel formats that have no
> contiguous option, the non-contiguous option should be checked prior to
> pipeline negotiation failures.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Tested-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  ...pt-non-contiguous-if-contiguous-form.patch | 36 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.26-arago.inc  |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644
> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
>=20
> diff --git
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> new file mode 100644
> index 00000000..db7e6f0c
> --- /dev/null
> +++
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> @@ -0,0 +1,36 @@
> +From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
> +From: Brandon Brnich <b-brnich@ti.com>
> +Date: Tue, 10 Mar 2026 19:47:35 -0500
> +Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format
> isn't
> + present
> +
> +Gstreamer previously had logic that would set fourcc even if the format
> +being negotiated didn't have a contiguous option - YUYV for example. A f=
ix
> +was sent to properly set either forcc/forcc_nc properly. For formats tha=
t
> +don't have contiguous formats, that would mean attempting non-contiguous
> +options wouldn't happen. Attempt non-contiguous formats before erroring
> +out if applicable.
> +
> +Upstream-Status: Inappropriate [TI-custom]
> +
> +Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index dbfe4992be..b4a7c32f31 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object *
> v4l2object, GstCaps * caps,
> +
> +   if (fourcc)
> +     fmt =3D gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc)=
;
> +-  else if (fourcc =3D=3D 0)
> ++  else if (fourcc_nc =3D=3D 0)
> +     goto unhandled_format;
> +
> +   if (fmt =3D=3D NULL) {
> +--
> +2.43.0
> +
> diff --git
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26-arago.inc
> index f64790bc..9e418b86 100644
> ---
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26-arago.inc
> +++
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26-arago.inc
> @@ -7,6 +7,7 @@ SRC_URI:append =3D " \
>      file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.pat=
ch \
>      file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.pat=
ch \
>      file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.pat=
ch \
> +    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.pat=
ch \
>  "
> =20
>  PR:append =3D ".arago0"
> --=20
> 2.34.1
>=20
>

