Return-Path: <x0038811@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id DFE245203A
	for <meta-arago@arago-project.org>;
	Mon, 26 Mar 2018 16:42:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2QGgEu3009169
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 11:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522082534;
	bh=l765mRd5DjfC2pZZQ5MZ64Nrl/KPhbT0wRWd3J4KmZE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Xt96pPQ3OJ7h2uHyyzDGgzVIBEPh+BpFmsMYtfCUufvDAlM4/JSnv8O9+d0eCH8v+
	tcEVse8Zxo1YdbOhH3U3eAKeL2qoZkEMFXRYAsJsujmgiBZLTCY3siFJT7Fc8VJz4o
	2/sGwycj5UcGuQ1ri5lsfKAlFH1aPF0Dcp0PYQlA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2QGgEke001910
	for <meta-arago@arago-project.org>; Mon, 26 Mar 2018 11:42:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 26 Mar 2018 11:42:14 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1261.035; Mon, 26 Mar 2018 11:42:14 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmssink with
	gst 1.12
Thread-Index: AQHTwZM4mUTsGTOLpEu7UHCT1H6Fc6PiD1QAgAB/0nCAAFTkAIAALcaA//+t06k=
Date: Mon, 26 Mar 2018 16:42:14 +0000
Message-ID: <soyjc3qkgfgdwwnl67982tkk.1522082528280@email.android.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
	<1521691605-49259-6-git-send-email-x0038811@ti.com>
	<20180326011112.GC20556@edge> <10d158d6998f4875897287a39c19776d@ti.com>
	<20180326135232.GE20556@edge>,<20180326163621.GK20556@edge>
In-Reply-To: <20180326163621.GK20556@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Mon, 26 Mar 2018 16:42:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_soyjc3qkgfgdwwnl67982tkk1522082528280emailandroidcom_"

--_000_soyjc3qkgfgdwwnl67982tkk1522082528280emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
Yes, I want enable kmssink and only PACKAGECONFIG statement is enabling kms=
. If I don't add this it won't compile kmssink.

Ram

-------- Original Message --------
From: "Dmytriyenko, Denys" <denys@ti.com>
Date: Mon 26 Mar, 2018, 10:06 PM
To: "Prasad, Ram" <x0038811@ti.com>
CC: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmssink wit=
h gst 1.12

On Mon, Mar 26, 2018 at 09:52:32AM -0400, Denys Dmytriyenko wrote:
> >    >  PACKAGECONFIG =3D "faad"
> >    > +PACKAGECONFIG =3D "kms"
> >
> >    ^^^ This doesn't look right...
>
> Just see it in the context.

Ramprasad,

PACKAGECONFIG is a list of enabled options. Your change replaces existing
"faad" option with "kms" - maybe you meant to add it instead?

Please let me know ASAP, as I want to merge the set for testing today. Than=
ks.

--
Denys


> On Mon, Mar 26, 2018 at 09:49:54AM -0400, Prasad, Ram wrote:
> >    HI Denys,
> >    > +PACKAGECONFIG =3D "kms"
> >    This was required to make sure kms get compiled.
> >    Is it required to make this platform dependent PACKAGECONFIG?
> >
> >    Ramprasad
> >
> >    -----Original Message-----
> >    From: Dmytriyenko, Denys
> >    Sent: Monday, March 26, 2018 6:41 AM
> >    To: Prasad, Ram
> >    Cc: meta-arago@arago-project.org
> >    Subject: Re: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmss=
ink
> >    with gst 1.12
> >
> >    On Thu, Mar 22, 2018 at 09:36:41AM +0530, Ramprasad N wrote:
> >    > Signed-off-by: Ramprasad N <x0038811@ti.com>
> >    > ---
> >    >  ...Add-omapdrm-in-the-list-of-driver-modules.patch | 165
> >    +++++++++++++++++++++
> >    >  .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
> >    >  2 files changed, 169 insertions(+), 1 deletion(-)  create mode 10=
0644
> >    > meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-ba
> >    > d/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
> >    >
> >    > diff --git
> >    > a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-
> >    > bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
> >    > b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-
> >    > bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
> >    > new file mode 100644
> >    > index 0000000..2e4965c
> >    > --- /dev/null
> >    > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plug
> >    > +++ ins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules=
.pat
> >    > +++ ch
> >    > @@ -0,0 +1,165 @@
> >    > +From 4ef13bc433d218f2ebcbe2e9b7853d10d7b9acbc Mon Sep 17 00:00:00
> >    > +2001
> >    > +From: Ramprasad N <x0038811@ti.com>
> >    > +Date: Tue, 6 Mar 2018 19:02:20 +0530
> >    > +Subject: [PATCH 3/5] kmssink: Add omapdrm in the list of driver
> >    > +modules
> >    > +
> >    > +In gstreamer-bad v1.12.2 kmssink plugin is available but omapdrm
> >    > +driver is not added in the list of driver module.
> >    > +
> >    > +DRM and DMABUF are treated differently by gstreamer eventhough th=
ey
> >    > +are based on fd allocator.
> >    > +GST1.12 has many changes to dmabuf allocator and hence DRM and DM=
ABUF
> >    > +will be treated differently.
> >    > +
> >    > +Added support for DRM buffer importing. Without this addition, th=
ere
> >    > +will be frame-copy happens and slows down the playback.
> >    > +
> >    > +Signed-off-by: Ramprasad N <x0038811@ti.com>
> >    > +---
> >    > + sys/kms/Makefile.am  |   1 +
> >    > + sys/kms/gstkmssink.c | 101
> >    > +++++++++++++++++++++++++++++++++++++++++++++++++++-
> >    > + 2 files changed, 101 insertions(+), 1 deletion(-)
> >    > +
> >    > +diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am index
> >    > +a97cad1..063f5ef 100644
> >    > +--- a/sys/kms/Makefile.am
> >    > ++++ b/sys/kms/Makefile.am
> >    > +@@ -23,6 +23,7 @@ libgstkms_la_LIBADD =3D                       \
> >    > +      $(GST_ALLOCATORS_LIBS)                  \
> >    > +      $(GST_LIBS)                              \
> >    > +      $(KMS_DRM_LIBS)                  \
> >    > ++    $(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION=
).la \
> >    > +      $(NULL)
> >    > +
> >    > + libgstkms_la_LDFLAGS =3D                       \
> >    > +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c index
> >    > +d19e19e..028bec6 100644
> >    > +--- a/sys/kms/gstkmssink.c
> >    > ++++ b/sys/kms/gstkmssink.c
> >    > +@@ -85,7 +85,8 @@ static int
> >    > + kms_open (gchar ** driver)
> >    > + {
> >    > +   static const char *drivers[] =3D { "i915", "radeon", "nouveau"=
,
> >    "vmwgfx",
> >    > +-    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "m=
sm"
> >    > ++    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "m=
sm",
> >    > ++    "omapdrm"
> >    > +   };
> >    > +   int i, fd =3D -1;
> >    > +
> >    > +@@ -1041,6 +1042,100 @@ set_cached_kmsmem (GstMemory * mem, GstMe=
mory
> >    > +* kmsmem)  }
> >    > +
> >    > + static gboolean
> >    > ++gst_kms_sink_import_drmbuf (GstKMSSink * self, GstBuffer * inbuf=
,
> >    > ++    GstBuffer ** outbuf)
> >    > ++{
> >    > ++  gint prime_fds[GST_VIDEO_MAX_PLANES] =3D { 0, };
> >    > ++  GstVideoMeta *meta;
> >    > ++  guint i, n_mem, n_planes;
> >    > ++  GstKMSMemory *kmsmem;
> >    > ++  guint mems_idx[GST_VIDEO_MAX_PLANES];
> >    > ++  gsize mems_skip[GST_VIDEO_MAX_PLANES];
> >    > ++  GstMemory *mems[GST_VIDEO_MAX_PLANES];
> >    > ++
> >    > ++  if (!self->has_prime_import)
> >    > ++    return FALSE;
> >    > ++
> >    > ++  /* This will eliminate most non-dmabuf out there */  if
> >    > ++ (!gst_is_drm_memory (gst_buffer_peek_memory (inbuf, 0)))
> >    > ++    return FALSE;
> >    > ++
> >    > ++  n_planes =3D GST_VIDEO_INFO_N_PLANES (&self->vinfo);  n_mem =
=3D
> >    > ++ gst_buffer_n_memory (inbuf);  meta =3D gst_buffer_get_video_met=
a
> >    > ++ (inbuf);
> >    > ++
> >    > ++  GST_TRACE_OBJECT (self, "Found a drmbuf with %u planes and %u
> >    memories",
> >    > ++      n_planes, n_mem);
> >    > ++
> >    > ++  /* We cannot have multiple dmabuf per plane */  if (n_mem >
> >    > ++ n_planes)
> >    > ++    return FALSE;
> >    > ++  g_assert (n_planes !=3D 0);
> >    > ++
> >    > ++  /* Update video info based on video meta */  if (meta) {
> >    > ++    GST_VIDEO_INFO_WIDTH (&self->vinfo) =3D meta->width;
> >    > ++    GST_VIDEO_INFO_HEIGHT (&self->vinfo) =3D meta->height;
> >    > ++
> >    > ++    for (i =3D 0; i < meta->n_planes; i++) {
> >    > ++      GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i) =3D meta->of=
fset[i];
> >    > ++      GST_VIDEO_INFO_PLANE_STRIDE (&self->vinfo, i) =3D meta->st=
ride[i];
> >    > ++    }
> >    > ++  }
> >    > ++
> >    > ++  /* Find and validate all memories */  for (i =3D 0; i < n_plan=
es;
> >    > ++ i++) {
> >    > ++    guint length;
> >    > ++
> >    > ++    if (!gst_buffer_find_memory (inbuf,
> >    > ++            GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i), 1,
> >    > ++            &mems_idx[i], &length, &mems_skip[i]))
> >    > ++      return FALSE;
> >    > ++
> >    > ++    mems[i] =3D gst_buffer_peek_memory (inbuf, mems_idx[i]);
> >    > ++
> >    > ++    /* adjust for memory offset, in case data does not
> >    > ++     * start from byte 0 in the dmabuf fd */
> >    > ++    mems_skip[i] +=3D mems[i]->offset;
> >    > ++
> >    > ++    /* And all memory found must be dmabuf */
> >    > ++    if (!gst_is_drm_memory (mems[i]))
> >    > ++      return FALSE;
> >    > ++  }
> >    > ++
> >    > ++  kmsmem =3D (GstKMSMemory *) get_cached_kmsmem (mems[0]);  if
> >    > ++ (kmsmem) {
> >    > ++    GST_LOG_OBJECT (self, "found KMS mem %p in DMABuf mem %p wit=
h fb
> >    id =3D %d",
> >    > ++        kmsmem, mems[0], kmsmem->fb_id);
> >    > ++    goto wrap_mem;
> >    > ++  }
> >    > ++
> >    > ++  for (i =3D 0; i < n_planes; i++)
> >    > ++    prime_fds[i] =3D gst_fd_memory_get_fd (mems[i]);
> >    > ++
> >    > ++  GST_LOG_OBJECT (self, "found these prime ids: %d, %d, %d, %d",
> >    prime_fds[0],
> >    > ++      prime_fds[1], prime_fds[2], prime_fds[3]);
> >    > ++
> >    > ++  kmsmem =3D gst_kms_allocator_dmabuf_import (self->allocator,
> >    prime_fds,
> >    > ++      n_planes, mems_skip, &self->vinfo);  if (!kmsmem)
> >    > ++    return FALSE;
> >    > ++
> >    > ++  GST_LOG_OBJECT (self, "setting KMS mem %p to DMABuf mem %p wit=
h fb
> >    id =3D %d",
> >    > ++      kmsmem, mems[0], kmsmem->fb_id);  set_cached_kmsmem (mems[=
0],
> >    > ++ GST_MEMORY_CAST (kmsmem));
> >    > ++
> >    > ++wrap_mem:
> >    > ++  *outbuf =3D gst_buffer_new ();
> >    > ++  if (!*outbuf)
> >    > ++    return FALSE;
> >    > ++  gst_buffer_append_memory (*outbuf, gst_memory_ref (GST_MEMORY_=
CAST
> >    > ++(kmsmem)));
> >    > ++  gst_buffer_add_parent_buffer_meta (*outbuf, inbuf);
> >    > ++  gst_buffer_copy_into (*outbuf, inbuf, GST_BUFFER_COPY_METADATA=
, 0,
> >    > ++-1);
> >    > ++
> >    > ++  return TRUE;
> >    > ++}
> >    > ++static gboolean
> >    > + gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf=
,
> >    > +     GstBuffer ** outbuf)
> >    > + {
> >    > +@@ -1151,6 +1246,10 @@ gst_kms_sink_get_input_buffer (GstKMSSink =
*
> >    self, GstBuffer * inbuf)
> >    > +     return gst_buffer_ref (inbuf);
> >    > +
> >    > +   buf =3D NULL;
> >    > ++  if (gst_kms_sink_import_drmbuf (self, inbuf, &buf))
> >    > ++    return buf;
> >    > ++
> >    > ++  buf =3D NULL;
> >    > +   if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
> >    > +     return buf;
> >    > +
> >    > +--
> >    > +1.9.1
> >    > +
> >    > diff --git
> >    > a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-
> >    > bad_1.12.2.bbappend
> >    > b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-
> >    > bad_1.12.2.bbappend
> >    > index 437689f..f99b81d 100644
> >    > ---
> >    > a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-
> >    > bad_1.12.2.bbappend
> >    > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plug
> >    > +++ ins-bad_1.12.2.bbappend
> >    > @@ -1,6 +1,7 @@
> >    >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >    >
> >    >  PACKAGECONFIG =3D "faad"
> >    > +PACKAGECONFIG =3D "kms"
> >
> >    ^^^ This doesn't look right...
> >
> >    >  # gstreamer is now also included on Keystone, be mindful of any
> >    > Graphics dependencies
> >    >  PACKAGECONFIG_append_omap-a15 =3D "
> >    ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> >    > @@ -22,6 +23,7 @@ DEPENDS_append_ti33x =3D " \  SRC_URI_append_ti4=
3x =3D "
> >    > \
> >    >      file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
> >    >      file://0002-parsers-bug-fixes-on-parsers.patch \
> >    > +
> >    > + file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.pa=
tch
> >    > + \
> >    >  "
> >    >
> >    >  SRC_URI_append_ti33x =3D " \
> >    > @@ -30,8 +32,9 @@ SRC_URI_append_ti33x =3D " \
> >    >  SRC_URI_append_omap-a15 =3D " \
> >    >      file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
> >    >      file://0002-parsers-bug-fixes-on-parsers.patch \
> >    > +
> >    > + file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.pa=
tch
> >    > + \
> >    >  "
> >    >
> >    >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >    >
> >    > -PR =3D "r2"
> >    > +PR =3D "r3"
> >    > --
> >    > 1.9.1
> >    >
> >    > _______________________________________________
> >    > meta-arago mailing list
> >    > meta-arago@arago-project.org
> >    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_soyjc3qkgfgdwwnl67982tkk1522082528280emailandroidcom_
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
<div>Hi Denys,<br>
Yes, I want enable kmssink and only PACKAGECONFIG statement is enabling kms=
. If I don't add this it won't compile kmssink.<br>
<br>
Ram<br>
<br>
-------- Original Message --------<br>
From: &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.com&gt;<br>
Date: Mon 26 Mar, 2018, 10:06 PM<br>
To: &quot;Prasad, Ram&quot; &lt;x0038811@ti.com&gt;<br>
CC: meta-arago@arago-project.org<br>
Subject: Re: [meta-arago] [rocko 5/9] gstreamer1.0*-bad: Enable kmssink wit=
h gst 1.12<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Mon, Mar 26, 2018 at 09:52:32AM -0400, Denys Dm=
ytriyenko wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; PACKAGECONFIG =3D &quot;faad&quot;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;PACKAGECONFIG =3D &quot;kms&quot;<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ^^^ This doesn't look right...<br>
&gt; <br>
&gt; Just see it in the context.<br>
<br>
Ramprasad,<br>
<br>
PACKAGECONFIG is a list of enabled options. Your change replaces existing <=
br>
&quot;faad&quot; option with &quot;kms&quot; - maybe you meant to add it in=
stead?<br>
<br>
Please let me know ASAP, as I want to merge the set for testing today. Than=
ks.<br>
<br>
-- <br>
Denys<br>
<br>
<br>
&gt; On Mon, Mar 26, 2018 at 09:49:54AM -0400, Prasad, Ram wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; HI Denys,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;PACKAGECONFIG =3D &quot;kms&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; This was required to make sure kms get compiled=
.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Is it required to make this platform dependent =
PACKAGECONFIG?<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Ramprasad<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; -----Original Message-----<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; From: Dmytriyenko, Denys<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Sent: Monday, March 26, 2018 6:41 AM<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; To: Prasad, Ram<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Cc: meta-arago@arago-project.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Subject: Re: [meta-arago] [rocko 5/9] gstreamer=
1.0*-bad: Enable kmssink<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; with gst 1.12<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; On Thu, Mar 22, 2018 at 09:36:41AM &#43;0530, R=
amprasad N wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; Signed-off-by: Ramprasad N &lt;x0038811@ti=
.com&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ...Add-omapdrm-in-the-list-of-driver=
-modules.patch | 165<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gstreamer1.0-plugins-bad_1.12.2.=
bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 &#43;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; 2 files changed, 169 insertions(&#43=
;), 1 deletion(-)&nbsp; create mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; meta-arago-extras/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-ba<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; d/0003-kmssink-Add-omapdrm-in-the-list-of-=
driver-modules.patch<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; diff --git<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; a/meta-arago-extras/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; bad/0003-kmssink-Add-omapdrm-in-the-list-o=
f-driver-modules.patch<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; b/meta-arago-extras/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; bad/0003-kmssink-Add-omapdrm-in-the-list-o=
f-driver-modules.patch<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; new file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; index 0000000..2e4965c<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; --- /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipe=
s-multimedia/gstreamer/gstreamer1.0-plug<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43; ins-bad/0003-kmssink-Add-o=
mapdrm-in-the-list-of-driver-modules.pat<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43; ch<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; @@ -0,0 &#43;1,165 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;From 4ef13bc433d218f2ebcbe2e9b7853d10=
d7b9acbc Mon Sep 17 00:00:00<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;2001<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;From: Ramprasad N &lt;x0038811@ti.com=
&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;Date: Tue, 6 Mar 2018 19:02:20 &#43;0=
530<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;Subject: [PATCH 3/5] kmssink: Add oma=
pdrm in the list of driver<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;modules<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;In gstreamer-bad v1.12.2 kmssink plug=
in is available but omapdrm<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;driver is not added in the list of dr=
iver module.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;DRM and DMABUF are treated differentl=
y by gstreamer eventhough they<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;are based on fd allocator.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;GST1.12 has many changes to dmabuf al=
locator and hence DRM and DMABUF<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;will be treated differently.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;Added support for DRM buffer importin=
g. Without this addition, there<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;will be frame-copy happens and slows =
down the playback.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;Signed-off-by: Ramprasad N &lt;x00388=
11@ti.com&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; sys/kms/Makefile.am&nbsp; |&nbsp;&nb=
sp; 1 &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; sys/kms/gstkmssink.c | 101<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; 2 files changed, 101 insertions(&#43=
;), 1 deletion(-)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;diff --git a/sys/kms/Makefile.am b/sy=
s/kms/Makefile.am index<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;a97cad1..063f5ef 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;--- a/sys/kms/Makefile.am<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43;&#43; b/sys/kms/Makefile.am=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;@@ -23,6 &#43;23,7 @@ libgstkms_la_LI=
BADD =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(GST_=
ALLOCATORS_LIBS)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(GST_=
LIBS)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(KMS_=
DRM_LIBS)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; $(top_builddi=
r)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(NULL=
)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; libgstkms_la_LDFLAGS =3D&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;diff --git a/sys/kms/gstkmssink.c b/s=
ys/kms/gstkmssink.c index<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;d19e19e..028bec6 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;--- a/sys/kms/gstkmssink.c<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43;&#43; b/sys/kms/gstkmssink.=
c<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;@@ -85,7 &#43;85,8 @@ static int<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; kms_open (gchar ** driver)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; static const char *drive=
rs[] =3D { &quot;i915&quot;, &quot;radeon&quot;, &quot;nouveau&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;vmwgfx&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;-&nbsp;&nbsp;&nbsp; &quot;exynos&quot=
;, &quot;amdgpu&quot;, &quot;imx-drm&quot;, &quot;rockchip&quot;, &quot;atm=
el-hlcdc&quot;, &quot;msm&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; &quot;exynos&=
quot;, &quot;amdgpu&quot;, &quot;imx-drm&quot;, &quot;rockchip&quot;, &quot=
;atmel-hlcdc&quot;, &quot;msm&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; &quot;omapdrm=
&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; };<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; int i, fd =3D -1;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;@@ -1041,6 &#43;1042,100 @@ set_cache=
d_kmsmem (GstMemory * mem, GstMemory<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;* kmsmem)&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; static gboolean<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;gst_kms_sink_import_drmbuf (GstK=
MSSink * self, GstBuffer * inbuf,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; GstBuffer ** =
outbuf)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;{<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; gint prime_fds[GST_VIDEO_=
MAX_PLANES] =3D { 0, };<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GstVideoMeta *meta;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; guint i, n_mem, n_planes;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GstKMSMemory *kmsmem;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; guint mems_idx[GST_VIDEO_=
MAX_PLANES];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; gsize mems_skip[GST_VIDEO=
_MAX_PLANES];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GstMemory *mems[GST_VIDEO=
_MAX_PLANES];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; if (!self-&gt;has_prime_i=
mport)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; /* This will eliminate mo=
st non-dmabuf out there */&nbsp; if<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; (!gst_is_drm_memory (gst_buffer=
_peek_memory (inbuf, 0)))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; n_planes =3D GST_VIDEO_IN=
FO_N_PLANES (&amp;self-&gt;vinfo);&nbsp; n_mem =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; gst_buffer_n_memory (inbuf);&nb=
sp; meta =3D gst_buffer_get_video_meta<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; (inbuf);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GST_TRACE_OBJECT (self, &=
quot;Found a drmbuf with %u planes and %u<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; memories&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n=
_planes, n_mem);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; /* We cannot have multipl=
e dmabuf per plane */&nbsp; if (n_mem &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; n_planes)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; g_assert (n_planes !=3D 0=
);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; /* Update video info base=
d on video meta */&nbsp; if (meta) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; GST_VIDEO_INF=
O_WIDTH (&amp;self-&gt;vinfo) =3D meta-&gt;width;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; GST_VIDEO_INF=
O_HEIGHT (&amp;self-&gt;vinfo) =3D meta-&gt;height;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; for (i =3D 0;=
 i &lt; meta-&gt;n_planes; i&#43;&#43;) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
ST_VIDEO_INFO_PLANE_OFFSET (&amp;self-&gt;vinfo, i) =3D meta-&gt;offset[i];=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
ST_VIDEO_INFO_PLANE_STRIDE (&amp;self-&gt;vinfo, i) =3D meta-&gt;stride[i];=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; /* Find and validate all =
memories */&nbsp; for (i =3D 0; i &lt; n_planes;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; i&#43;&#43;) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; guint length;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; if (!gst_buff=
er_find_memory (inbuf,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GST_VIDEO_INFO_PLANE_OFFSET (&amp;self-&=
gt;vinfo, i), 1,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mems_idx[i], &amp;length, &amp;mems=
_skip[i]))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn FALSE;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; mems[i] =3D g=
st_buffer_peek_memory (inbuf, mems_idx[i]);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; /* adjust for=
 memory offset, in case data does not<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp; * start=
 from byte 0 in the dmabuf fd */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; mems_skip[i] =
&#43;=3D mems[i]-&gt;offset;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; /* And all me=
mory found must be dmabuf */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; if (!gst_is_d=
rm_memory (mems[i]))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn FALSE;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; kmsmem =3D (GstKMSMemory =
*) get_cached_kmsmem (mems[0]);&nbsp; if<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; (kmsmem) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; GST_LOG_OBJEC=
T (self, &quot;found KMS mem %p in DMABuf mem %p with fb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; id =3D %d&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; kmsmem, mems[0], kmsmem-&gt;fb_id);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; goto wrap_mem=
;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; for (i =3D 0; i &lt; n_pl=
anes; i&#43;&#43;)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; prime_fds[i] =
=3D gst_fd_memory_get_fd (mems[i]);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GST_LOG_OBJECT (self, &qu=
ot;found these prime ids: %d, %d, %d, %d&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; prime_fds[0],<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
rime_fds[1], prime_fds[2], prime_fds[3]);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; kmsmem =3D gst_kms_alloca=
tor_dmabuf_import (self-&gt;allocator,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; prime_fds,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n=
_planes, mems_skip, &amp;self-&gt;vinfo);&nbsp; if (!kmsmem)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; GST_LOG_OBJECT (self, &qu=
ot;setting KMS mem %p to DMABuf mem %p with fb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; id =3D %d&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; k=
msmem, mems[0], kmsmem-&gt;fb_id);&nbsp; set_cached_kmsmem (mems[0],<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43; GST_MEMORY_CAST (kmsmem));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;wrap_mem:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; *outbuf =3D gst_buffer_ne=
w ();<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; if (!*outbuf)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; gst_buffer_append_memory =
(*outbuf, gst_memory_ref (GST_MEMORY_CAST<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;(kmsmem)));<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; gst_buffer_add_parent_buf=
fer_meta (*outbuf, inbuf);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; gst_buffer_copy_into (*ou=
tbuf, inbuf, GST_BUFFER_COPY_METADATA, 0,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;-1);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; return TRUE;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;static gboolean<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; gst_kms_sink_import_dmabuf (GstKMSSi=
nk * self, GstBuffer * inbuf,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; GstBuffer **=
 outbuf)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;@@ -1151,6 &#43;1246,10 @@ gst_kms_si=
nk_get_input_buffer (GstKMSSink *<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; self, GstBuffer * inbuf)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return gst_b=
uffer_ref (inbuf);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; buf =3D NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; if (gst_kms_sink_import_d=
rmbuf (self, inbuf, &amp;buf))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp; return buf;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&nbsp; buf =3D NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; if (gst_kms_sink_import_=
dmabuf (self, inbuf, &amp;buf))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return buf;<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;--<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;1.9.1<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; diff --git<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; a/meta-arago-extras/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; bad_1.12.2.bbappend<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; b/meta-arago-extras/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; bad_1.12.2.bbappend<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; index 437689f..f99b81d 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; a/meta-arago-extras/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; bad_1.12.2.bbappend<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipe=
s-multimedia/gstreamer/gstreamer1.0-plug<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&#43;&#43; ins-bad_1.12.2.bbappend<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; @@ -1,6 &#43;1,7 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; FILESEXTRAPATHS_prepend :=3D &quot;$=
{THISDIR}/${PN}:&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; PACKAGECONFIG =3D &quot;faad&quot;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;PACKAGECONFIG =3D &quot;kms&quot;<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ^^^ This doesn't look right...<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; # gstreamer is now also included on =
Keystone, be mindful of any<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; Graphics dependencies<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; PACKAGECONFIG_append_omap-a15 =3D &q=
uot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('DISTRO_FEATURES','wayland=
','wayland','',d)}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; @@ -22,6 &#43;23,7 @@ DEPENDS_append_ti33x=
 =3D &quot; \&nbsp; SRC_URI_append_ti43x =3D &quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"f=
ile://0001-gstdrmallocator-Add-DRM-allocator-support.patch">
file://0001-gstdrmallocator-Add-DRM-allocator-support.patch</a> \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"f=
ile://0002-parsers-bug-fixes-on-parsers.patch">file://0002-parsers-bug-fixe=
s-on-parsers.patch</a> \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; <a href=3D"file://0003-kmssink-Add-o=
mapdrm-in-the-list-of-driver-modules.patch">
file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch</a><br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; &quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; SRC_URI_append_ti33x =3D &quot; \<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; @@ -30,8 &#43;32,9 @@ SRC_URI_append_ti33x=
 =3D &quot; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; SRC_URI_append_omap-a15 =3D &quot; \=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"f=
ile://0001-gstdrmallocator-Add-DRM-allocator-support.patch">
file://0001-gstdrmallocator-Add-DRM-allocator-support.patch</a> \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"f=
ile://0002-parsers-bug-fixes-on-parsers.patch">file://0002-parsers-bug-fixe=
s-on-parsers.patch</a> \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; <a href=3D"file://0003-kmssink-Add-o=
mapdrm-in-the-list-of-driver-modules.patch">
file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch</a><br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; &quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARC=
H}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; -PR =3D &quot;r2&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &#43;PR =3D &quot;r3&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; --<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; 1.9.1<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; __________________________________________=
_____<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; meta-arago mailing list<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; meta-arago@arago-project.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; <a href=3D"http://arago-project.org/cgi-bi=
n/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/lis=
tinfo/meta-arago</a><br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_soyjc3qkgfgdwwnl67982tkk1522082528280emailandroidcom_--
