Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.7396.1645685896015340154
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 22:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=p6HmT81k;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.216.52, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pj1-f52.google.com with SMTP id iq13-20020a17090afb4d00b001bc4437df2cso1257135pjb.2
        for <meta-arago@lists.yoctoproject.org>; Wed, 23 Feb 2022 22:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=3UolesvNO6gd1q1ylXEyUVtf7MkYbs4vB0hs7eZA+tY=;
        b=p6HmT81kQ58Tuhr3b52T5UsQ6SAT55o6QBHgM8za4TJOE9mrhl0lu9O/DGnCcvTuP0
         Lt8/dT6ZeO3DJTqCE8/4kvkHX9WHymvY6O0YtuZLN/31uvjjxrHeC4QrQLxnMGxcIewy
         UesN4B6gagN2tOYSaEesZYiEr+TqEvg2U9+zJN1o0PmmX/pIiTHagB6TXNQEsy4m0ejA
         QyvzwT4I74FyzLy0fQ89QMRpXTVB8PUxzpzXUlXcGuMHW6rbPTJEpOVxaWstmvwkHKfw
         uqw1Hq0N/ih/ikceWIxbWpJmasj+1QSAhPsIKgEGQawrrV/1oK6FO9nqrAyvl1XlHNKv
         t4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=3UolesvNO6gd1q1ylXEyUVtf7MkYbs4vB0hs7eZA+tY=;
        b=58BPx9bA6NMd9TO5uiSSo6HLRr0KfH1jXTCSPUP07NufLIY5HljKL2pNpLHgnoj42b
         eGZGQaai/twn3zsMS9SpVfQegnk8EztIILhoTYMEn3EZnmOwiWIzkndhfuo5apOpqmQI
         wU/wHKOqQxyhTv+JE+vczag/7h6Vc7joAo2EQBy8RB3KHtMKSGTqNUqfnQd00iw0yFkN
         UlBmzGwvcT0YsyYtF/xslByZgtjN8MOgc5ySMMuIVngCcf9nQhgnzp3ifIjLEesEvcHy
         5ZUUINp4CvtgmryF8YtoyqFjBrtz42N2prxhDUK48FlMah0U5bI+Y+cqyKj+hy0EO/3k
         xfYQ==
X-Gm-Message-State: AOAM5323sQN1Sy/Yu9ihtj5N3O6nJGiTsG8LD+8diWNQKbDTWLqmN0jy
	39Hr5xVXX3Iw/M/zT5UCmU1ET0wDs8S2ZC8tfVBy48aVMieFqQ4DaUhwRDFE6n30qTaOrnRe3vK
	kovNamLn8+TsEs9ejwZKZZ0qS
X-Google-Smtp-Source: ABdhPJx0L4kHK8mqlI7XrvUC6MyH1WCXFA335J9yT3i6pNCIYHC3eYb4b5CvXRFBdoyEDcvN1olk8w==
X-Received: by 2002:a17:902:7c06:b0:14e:f6c2:62a5 with SMTP id x6-20020a1709027c0600b0014ef6c262a5mr1608156pll.22.1645685895254;
        Wed, 23 Feb 2022 22:58:15 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from sidraya-laptopU ([49.207.201.23])
        by smtp.gmail.com with ESMTPSA id nk10sm1566643pjb.37.2022.02.23.22.58.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Feb 2022 22:58:15 -0800 (PST)
Date: Thu, 24 Feb 2022 12:28:08 +0530
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, d-huang@ti.com,
	detheridge@ti.com
Subject: Re: [meta-arago] [dunfell PATCH v2] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Message-ID: <20220224065807.poih6m5dveuau4ic@sidraya-laptopU>
References: <20220222064145.8043-1-sidraya.bj@pathpartnertech.com>
 <20220222224031.GT26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220222224031.GT26229@denix.org>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 05:40:31PM -0500, Denys Dmytriyenko wrote:
> Thanks. From OE/meta-arago perspective this patch now looks good. But fro=
m=20
> gstreamer perspective I cannot judge the change as I don't have enough=20
> expertise there. Can you please follow up on your submission to upstream=
=20
> gstreamer, as the maintainer there has some questions? Thanks!
>=20
> --=20
> Denys
>=20
Sure, I will respond to open source community questions.
>=20
> On Tue, Feb 22, 2022 at 12:11:45PM +0530, Sidraya Jayagond via lists.yoct=
oproject.org wrote:
> > From: Sidraya <sidraya.bj@pathpartnertech.com>
> >=20
> > When importing dmabufs, the video meta is set on the dest
> > buffer, but not on the src buffer. In this case, the src
> > buffer is not made aware of the stride of the video buffer,
> > which is needed to properly display the buffer.
> >=20
> > This is a result of the v4l2 plugin creating it's own
> > empty dmabuf pool of GstBuffers, and then assigning the
> > memory from the downstream GstBuffer. We then update the
> > video meta of the buffer in our pool, but not the downstream
> > pool.
> >=20
> > The downstream pool buffer should be updated as well.
> >=20
> > Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> > ---
> >  ...l-Set-Video-Meta-to-Imported-Buffers.patch | 58 +++++++++++++++++++
> >  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstr=
eamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffer=
s.patch
> >=20
> > diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch=
 b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> > new file mode 100644
> > index 00000000..59d9080c
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> > @@ -0,0 +1,58 @@
> > +From e677028494081f93558d24b1f72da9e6835ef954 Mon Sep 17 00:00:00 2001
> > +From: Sidraya <sidraya.bj@pathpartnertech.com>
> > +Date: Mon, 18 Oct 2021 13:35:09 +0530
> > +Subject: [PATCH] v4l2bufferpool: Set Video Meta to Imported Buffers
> > +
> > +When importing dmabufs, the video meta is set on the dest
> > +buffer, but not on the src buffer. In this case, the src
> > +buffer is not made aware of the stride of the video buffer,
> > +which is needed to properly display the buffer.
> > +
> > +This is a result of the v4l2 plugin creating it's own
> > +empty dmabuf pool of GstBuffers, and then assigning the
> > +memory from the downstream GstBuffer. We then update the
> > +video meta of the buffer in our pool, but not the downstream
> > +pool.
> > +
> > +The downstream pool buffer should be updated as well.
> > +
> > +Upstream-Status: Submitted
> > +https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/17=
23#note_1266433
> > +
> > +Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> > +---
> > + sys/v4l2/gstv4l2bufferpool.c | 11 +++++++++++
> > + 1 file changed, 11 insertions(+)
> > +
> > +diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool=
.c
> > +index 49f222b6e..f4d964b9e 100644
> > +--- a/sys/v4l2/gstv4l2bufferpool.c
> > ++++ b/sys/v4l2/gstv4l2bufferpool.c
> > +@@ -330,6 +330,10 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2Buffer=
Pool * pool,
> > +   GstMemory *dma_mem[GST_VIDEO_MAX_PLANES] =3D { 0 };
> > +   guint n_mem =3D gst_buffer_n_memory (src);
> > +   gint i;
> > ++  GstV4l2Object *obj;
> > ++  GstVideoInfo *info;
> > ++  obj =3D pool->obj;
> > ++  info =3D &obj->info;
> > +=20
> > +   GST_LOG_OBJECT (pool, "importing dmabuf");
> > +=20
> > +@@ -346,6 +350,13 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2Buffer=
Pool * pool,
> > +           dma_mem))
> > +     goto import_failed;
> > +=20
> > ++  /* add metadata to raw video buffers */
> > ++  if (pool->add_videometa)
> > ++    gst_buffer_add_video_meta_full (src, GST_VIDEO_FRAME_FLAG_NONE,
> > ++        GST_VIDEO_INFO_FORMAT (info), GST_VIDEO_INFO_WIDTH (info),
> > ++        GST_VIDEO_INFO_HEIGHT (info), GST_VIDEO_INFO_N_PLANES (info),
> > ++        info->offset, info->stride);
> > ++
> > +   gst_mini_object_set_qdata (GST_MINI_OBJECT (dest), GST_V4L2_IMPORT_=
QUARK,
> > +       gst_buffer_ref (src), (GDestroyNotify) gst_buffer_unref);
> > +=20
> > +--=20
> > +2.17.1
> > +
> > diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-good_1.16.%.bbappend
> > index 11513f2f..07cd08a7 100644
> > --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.16.%.bbappend
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.16.%.bbappend
> > @@ -10,6 +10,7 @@ SRC_URI +=3D " \
> >      file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.p=
atch \
> >      file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.p=
atch \
> >      file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
> > +    file://0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patc=
h \
> >  "
> > =20
> >  PR_append =3D ".arago3"
> > --=20
> > 2.17.1
>=20
>=20
>=20
>=20
>=20

--=20






This
message contains confidential information and is intended only=20
for the
individual(s) named. If you are not the intended
recipient, you are=20
notified that disclosing, copying, distributing or taking any
action in=20
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail=20
from your system. E-mail transmission
cannot be guaranteed to be secured or=20
error-free as information could be
intercepted, corrupted, lost, destroyed,=20
arrive late or incomplete, or contain
viruses. The sender therefore does=20
not accept liability for any errors or
omissions in the contents of this=20
message, which arise as a result of e-mail
transmission.
