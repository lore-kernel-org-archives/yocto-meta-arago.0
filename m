Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8F8EB5203A
	for <meta-arago@arago-project.org>;
	Mon, 26 Mar 2018 13:49:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2QDnsOr002349
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 08:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522072194;
	bh=2L2MizIFxpBA1pGwNLi9UP1D/ga0WdGVcpLiw1omymA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cb9s73z8H8EpaBq1wBm9WNDopvUHLRAHHfxtuhnIpUV0fWaEUw0ySvO3YTRXqRVbm
	RaRpOFSSdnsweI6WeEO1r2hSo0UtCws4MyIE9WD5Y9e0F6XOGmYNaHsMAwFJhrCfTj
	8wWqQ9A8dHLCGj+VEXRmSNRlzvtn54j874b+4G+I=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2QDnsQJ000490
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 08:49:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 26 Mar 2018 08:49:54 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1261.035; Mon, 26 Mar 2018 08:49:54 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmssink with
	gst 1.12
Thread-Index: AQHTwZM4mUTsGTOLpEu7UHCT1H6Fc6PiD1QAgAB/0nA=
Date: Mon, 26 Mar 2018 13:49:54 +0000
Message-ID: <10d158d6998f4875897287a39c19776d@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
	<1521691605-49259-6-git-send-email-x0038811@ti.com>
	<20180326011112.GC20556@edge>
In-Reply-To: <20180326011112.GC20556@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.223]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko 5/9] gstreamer1.0*-bad: Enable kmssink with gst 1.12
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
X-List-Received-Date: Mon, 26 Mar 2018 13:49:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI Denys,
> +PACKAGECONFIG =3D "kms"
This was required to make sure kms get compiled.
Is it required to make this platform dependent PACKAGECONFIG?

Ramprasad

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, March 26, 2018 6:41 AM
To: Prasad, Ram
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmssink wit=
h gst 1.12

On Thu, Mar 22, 2018 at 09:36:41AM +0530, Ramprasad N wrote:
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>  ...Add-omapdrm-in-the-list-of-driver-modules.patch | 165 +++++++++++++++=
++++++
>  .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
>  2 files changed, 169 insertions(+), 1 deletion(-)  create mode 100644=20
> meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba
> d/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
> new file mode 100644
> index 0000000..2e4965c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.pat
> +++ ch
> @@ -0,0 +1,165 @@
> +From 4ef13bc433d218f2ebcbe2e9b7853d10d7b9acbc Mon Sep 17 00:00:00=20
> +2001
> +From: Ramprasad N <x0038811@ti.com>
> +Date: Tue, 6 Mar 2018 19:02:20 +0530
> +Subject: [PATCH 3/5] kmssink: Add omapdrm in the list of driver=20
> +modules
> +
> +In gstreamer-bad v1.12.2 kmssink plugin is available but omapdrm=20
> +driver is not added in the list of driver module.
> +
> +DRM and DMABUF are treated differently by gstreamer eventhough they=20
> +are based on fd allocator.
> +GST1.12 has many changes to dmabuf allocator and hence DRM and DMABUF=20
> +will be treated differently.
> +
> +Added support for DRM buffer importing. Without this addition, there=20
> +will be frame-copy happens and slows down the playback.
> +
> +Signed-off-by: Ramprasad N <x0038811@ti.com>
> +---
> + sys/kms/Makefile.am  |   1 +
> + sys/kms/gstkmssink.c | 101=20
> +++++++++++++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 101 insertions(+), 1 deletion(-)
> +
> +diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am index=20
> +a97cad1..063f5ef 100644
> +--- a/sys/kms/Makefile.am
> ++++ b/sys/kms/Makefile.am
> +@@ -23,6 +23,7 @@ libgstkms_la_LIBADD =3D 			\
> + 	$(GST_ALLOCATORS_LIBS)			\
> + 	$(GST_LIBS) 				\
> + 	$(KMS_DRM_LIBS) 			\
> ++	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la \
> + 	$(NULL)
> +=20
> + libgstkms_la_LDFLAGS =3D 			\
> +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c index=20
> +d19e19e..028bec6 100644
> +--- a/sys/kms/gstkmssink.c
> ++++ b/sys/kms/gstkmssink.c
> +@@ -85,7 +85,8 @@ static int
> + kms_open (gchar ** driver)
> + {
> +   static const char *drivers[] =3D { "i915", "radeon", "nouveau", "vmwg=
fx",
> +-    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm"
> ++    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
> ++    "omapdrm"
> +   };
> +   int i, fd =3D -1;
> +=20
> +@@ -1041,6 +1042,100 @@ set_cached_kmsmem (GstMemory * mem, GstMemory=20
> +* kmsmem)  }
> +=20
> + static gboolean
> ++gst_kms_sink_import_drmbuf (GstKMSSink * self, GstBuffer * inbuf,
> ++    GstBuffer ** outbuf)
> ++{
> ++  gint prime_fds[GST_VIDEO_MAX_PLANES] =3D { 0, };
> ++  GstVideoMeta *meta;
> ++  guint i, n_mem, n_planes;
> ++  GstKMSMemory *kmsmem;
> ++  guint mems_idx[GST_VIDEO_MAX_PLANES];
> ++  gsize mems_skip[GST_VIDEO_MAX_PLANES];
> ++  GstMemory *mems[GST_VIDEO_MAX_PLANES];
> ++
> ++  if (!self->has_prime_import)
> ++    return FALSE;
> ++
> ++  /* This will eliminate most non-dmabuf out there */  if=20
> ++ (!gst_is_drm_memory (gst_buffer_peek_memory (inbuf, 0)))
> ++    return FALSE;
> ++
> ++  n_planes =3D GST_VIDEO_INFO_N_PLANES (&self->vinfo);  n_mem =3D=20
> ++ gst_buffer_n_memory (inbuf);  meta =3D gst_buffer_get_video_meta=20
> ++ (inbuf);
> ++
> ++  GST_TRACE_OBJECT (self, "Found a drmbuf with %u planes and %u memorie=
s",
> ++      n_planes, n_mem);
> ++
> ++  /* We cannot have multiple dmabuf per plane */  if (n_mem >=20
> ++ n_planes)
> ++    return FALSE;
> ++  g_assert (n_planes !=3D 0);
> ++
> ++  /* Update video info based on video meta */  if (meta) {
> ++    GST_VIDEO_INFO_WIDTH (&self->vinfo) =3D meta->width;
> ++    GST_VIDEO_INFO_HEIGHT (&self->vinfo) =3D meta->height;
> ++
> ++    for (i =3D 0; i < meta->n_planes; i++) {
> ++      GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i) =3D meta->offset[i]=
;
> ++      GST_VIDEO_INFO_PLANE_STRIDE (&self->vinfo, i) =3D meta->stride[i]=
;
> ++    }
> ++  }
> ++
> ++  /* Find and validate all memories */  for (i =3D 0; i < n_planes;=20
> ++ i++) {
> ++    guint length;
> ++
> ++    if (!gst_buffer_find_memory (inbuf,
> ++            GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i), 1,
> ++            &mems_idx[i], &length, &mems_skip[i]))
> ++      return FALSE;
> ++
> ++    mems[i] =3D gst_buffer_peek_memory (inbuf, mems_idx[i]);
> ++
> ++    /* adjust for memory offset, in case data does not
> ++     * start from byte 0 in the dmabuf fd */
> ++    mems_skip[i] +=3D mems[i]->offset;
> ++
> ++    /* And all memory found must be dmabuf */
> ++    if (!gst_is_drm_memory (mems[i]))
> ++      return FALSE;
> ++  }
> ++
> ++  kmsmem =3D (GstKMSMemory *) get_cached_kmsmem (mems[0]);  if=20
> ++ (kmsmem) {
> ++    GST_LOG_OBJECT (self, "found KMS mem %p in DMABuf mem %p with fb id=
 =3D %d",
> ++        kmsmem, mems[0], kmsmem->fb_id);
> ++    goto wrap_mem;
> ++  }
> ++
> ++  for (i =3D 0; i < n_planes; i++)
> ++    prime_fds[i] =3D gst_fd_memory_get_fd (mems[i]);
> ++
> ++  GST_LOG_OBJECT (self, "found these prime ids: %d, %d, %d, %d", prime_=
fds[0],
> ++      prime_fds[1], prime_fds[2], prime_fds[3]);
> ++
> ++  kmsmem =3D gst_kms_allocator_dmabuf_import (self->allocator, prime_fd=
s,
> ++      n_planes, mems_skip, &self->vinfo);  if (!kmsmem)
> ++    return FALSE;
> ++
> ++  GST_LOG_OBJECT (self, "setting KMS mem %p to DMABuf mem %p with fb id=
 =3D %d",
> ++      kmsmem, mems[0], kmsmem->fb_id);  set_cached_kmsmem (mems[0],=20
> ++ GST_MEMORY_CAST (kmsmem));
> ++
> ++wrap_mem:
> ++  *outbuf =3D gst_buffer_new ();
> ++  if (!*outbuf)
> ++    return FALSE;
> ++  gst_buffer_append_memory (*outbuf, gst_memory_ref (GST_MEMORY_CAST=20
> ++(kmsmem)));
> ++  gst_buffer_add_parent_buffer_meta (*outbuf, inbuf);
> ++  gst_buffer_copy_into (*outbuf, inbuf, GST_BUFFER_COPY_METADATA, 0,=20
> ++-1);
> ++
> ++  return TRUE;
> ++}
> ++static gboolean
> + gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf,
> +     GstBuffer ** outbuf)
> + {
> +@@ -1151,6 +1246,10 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self,=
 GstBuffer * inbuf)
> +     return gst_buffer_ref (inbuf);
> +=20
> +   buf =3D NULL;
> ++  if (gst_kms_sink_import_drmbuf (self, inbuf, &buf))
> ++    return buf;
> ++
> ++  buf =3D NULL;
> +   if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
> +     return buf;
> +=20
> +--
> +1.9.1
> +
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.12.2.bbappend=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.12.2.bbappend
> index 437689f..f99b81d 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.12.2.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-bad_1.12.2.bbappend
> @@ -1,6 +1,7 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  PACKAGECONFIG =3D "faad"
> +PACKAGECONFIG =3D "kms"

^^^ This doesn't look right...


>  # gstreamer is now also included on Keystone, be mindful of any=20
> Graphics dependencies
>  PACKAGECONFIG_append_omap-a15 =3D " ${@bb.utils.contains('DISTRO_FEATURE=
S','wayland','wayland','',d)}"
> @@ -22,6 +23,7 @@ DEPENDS_append_ti33x =3D " \  SRC_URI_append_ti43x =3D =
"=20
> \
>      file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
>      file://0002-parsers-bug-fixes-on-parsers.patch \
> +   =20
> + file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch=20
> + \
>  "
> =20
>  SRC_URI_append_ti33x =3D " \
> @@ -30,8 +32,9 @@ SRC_URI_append_ti33x =3D " \
>  SRC_URI_append_omap-a15 =3D " \
>      file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
>      file://0002-parsers-bug-fixes-on-parsers.patch \
> +   =20
> + file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch=20
> + \
>  "
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

