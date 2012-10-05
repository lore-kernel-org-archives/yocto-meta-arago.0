Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 730EE529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:21:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DLfPV004154;
	Fri, 5 Oct 2012 08:21:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DLffM018134;
	Fri, 5 Oct 2012 08:21:41 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:21:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gst-plugins-bad: Add patch to fix depth
	value	in gstfbdevsink
Thread-Index: AQHNosK5QMv+4jrmd0Oz+MRBUd/AKJeqsv+A
Date: Fri, 5 Oct 2012 13:21:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592481B0@DLEE12.ent.ti.com>
References: <1349420215-22226-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420215-22226-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] gst-plugins-bad: Add patch to fix depth value	in gstfbdevsink
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
X-List-Received-Date: Fri, 05 Oct 2012 13:21:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you split this into two patches:

1. Fix the depth value
2. Add the dependencies for AAC


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:57 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] gst-plugins-bad: Add patch to fix
> depth value in gstfbdevsink
>=20
> * Port patch from Arago.
> * Gstreamer plugin adds the length of alpha data for 16bit RGB
> data format
>   which could yield wrong results.
> * Add faad2 as a dependency and libfaad as a runtime dependency.
> This insures
>   gst-plugins-bad-faad package is created. The gstreamer faad
> element is needed
>   for the AAC related gstreamer demos.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...k-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch |   29
> ++++++++++++++++++++
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   10
> ++++++-
>  2 files changed, 38 insertions(+), 1 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-
> value-for-GST_VIDEO_CAPS_RGB_.patch
>=20
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-
> GST_VIDEO_CAPS_RGB_.patch b/meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-
> value-for-GST_VIDEO_CAPS_RGB_.patch
> new file mode 100644
> index 0000000..5905591
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> bad/0001-gstfbdevsink-Fix-depth-value-for-
> GST_VIDEO_CAPS_RGB_.patch
> @@ -0,0 +1,29 @@
> +From ec785d544f417aa2d88f8803e4392ff02ab424ae Mon Sep 17
> 00:00:00 2001
> +From: Punya Prakash <pprakash@ti.com>
> +Date: Fri, 4 Nov 2011 13:03:57 -0500
> +Subject: [PATCH]  gstfbdevsink: Fix depth value for
> GST_VIDEO_CAPS_RGB_15
> +
> +RGB color format does not have any alpha components, adding
> alpha length to depth could yield wrong results.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Punya Prakash <pprakash@ti.com>
> +---
> + sys/fbdev/gstfbdevsink.c |    3 +--
> + 1 files changed, 1 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/fbdev/gstfbdevsink.c b/sys/fbdev/gstfbdevsink.c
> +index 8925f3d..568f091 100644
> +--- a/sys/fbdev/gstfbdevsink.c
> ++++ b/sys/fbdev/gstfbdevsink.c
> +@@ -185,8 +185,7 @@ gst_fbdevsink_getcaps (GstBaseSink * bsink)
> +       "bpp", G_TYPE_INT, fbdevsink->varinfo.bits_per_pixel,
> +       "depth", G_TYPE_INT, fbdevsink->varinfo.red.length +
> +       fbdevsink->varinfo.green.length +
> +-      fbdevsink->varinfo.blue.length +
> +-      fbdevsink->varinfo.transp.length,
> ++      fbdevsink->varinfo.blue.length,
> +       "endianness", G_TYPE_INT, endianness,
> +       "red_mask", G_TYPE_INT, rmask,
> +       "green_mask", G_TYPE_INT, gmask, "blue_mask", G_TYPE_INT,
> bmask, NULL);
> +--
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> index 52739e4..d6c8ef5 100644
> --- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend
> @@ -1,4 +1,7 @@
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
>  # Disable rsvg which caused gtk+ to be pulled in
>  DEPENDS :=3D "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
> @@ -6,3 +9,8 @@ EXTRA_OECONF +=3D "--disable-rsvg"
>=20
>  # Build all the various plugins
>  EXTRA_OECONF :=3D "${@oe_filter_out('--with-
> plugins=3Dmusicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECO
> NF}', d)}"
> +
> +SRC_URI +=3D "file://0001-gstfbdevsink-Fix-depth-value-for-
> GST_VIDEO_CAPS_RGB_.patch"
> +
> +DEPENDS +=3D "faad2"
> +RDEPENDS +=3D "libfaad"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

