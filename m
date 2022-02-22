Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.9735.1645512093013160950
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 22:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=RhLZrf75;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.216.43, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pj1-f43.google.com with SMTP id ck4-20020a17090afe0400b001bc64ee7d3cso1573543pjb.4
        for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 22:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=c3PSrFO5NyDTX0w1PmhZ0ZLkwdsuJYiOk+NekHUaWsE=;
        b=RhLZrf75jQtG9U2htrRGFIYCAsY4kJX6QazGuB0HUu3XZJJXn6VGsTULuu2RG2Mxao
         aueJGJ3RCxbTlRlLPjwCXtJEbCWDV3ZKOt7UkUH0RQHzbJZXN8qLb8CO9a9Oyg5mW1EL
         jYxzjbTiUxxtfH6SelQtc+Q7o3Fejkq6lzkSJphOcc3+taLZG9HD1GdJwgjPHwiUH1RG
         d/6K7DSIUpB8DJeEkAZT0KSYC5CSpv0776kjleQc/ugZYzzdXFJW62qIY63EY766uGhm
         cqPpFyLnCoNKNL9HGilImhfwdmImMWaEJ+2BJuA2HkVoVTFSQt39shgztrwv/Hb2tATB
         XpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=c3PSrFO5NyDTX0w1PmhZ0ZLkwdsuJYiOk+NekHUaWsE=;
        b=vMGweH0Ts9QWnqFrL+J65WfhbAVKMxKoG7/9xNr4kcXrpIsBq7lH1cF6wJG1yDZ1qL
         hx9voBG3UilfKURLtAj9RDdZbP1PyXUT69ThRfventOtTwk1X+9E0xZM1IA4hJsW/IWo
         adtPV0t3hE/jpQvuHhH2hQUwTXXtF0JztQtzM+X51Gq0cjnCgrOCSMACbUsFa/Z/weRe
         Fj2ND0tPEOX0PrfBsuTV3xxbhLp0VpYzfcqZXDbq/rROW6RIUfZACUVR0BibB0vJKKOf
         JtCBbPOzwUqt41y/d8Ow9A2U/66ZGOAOW/dBDh30p7cQ/jJQpS8Ue83HOXyeJoabnYAW
         sE4Q==
X-Gm-Message-State: AOAM533iPe8oxFviuzQSbyLkhWJXZJFeadxxA89jXeSwjA83F29x5KUp
	mIoYBm5b/zqMvf4GFL9/MiKb57zruD25wAElxR/TAMFEkpt7soeeCm1xMG0LQfjsWgJuUfueZuj
	NdYuuPAdM0TScvBl9QBhnIDWlgv7QNWDvikc=
X-Google-Smtp-Source: ABdhPJyPNcRSzPJ8ONiHXKNe3qYN88Gld2czfOFBksHM0r16R4ekYWwpMdhwrgyahvf8ACufIWYp/Q==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id bi4-20020a170902bf0400b00149c5a55323mr22292981plb.97.1645512092038;
        Mon, 21 Feb 2022 22:41:32 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from sidraya-laptopU ([103.117.236.138])
        by smtp.gmail.com with ESMTPSA id h6sm1298782pjs.30.2022.02.21.22.41.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 22:41:31 -0800 (PST)
Date: Tue, 22 Feb 2022 12:11:26 +0530
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-arago@lists.yoctoproject.org
Cc: praneeth@ti.com, d-huang@ti.com, detheridge@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Message-ID: <20220222064125.aoxq5ln577lqy6fx@sidraya-laptopU>
References: <20220222063139.7503-1-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
In-Reply-To: <20220222063139.7503-1-sidraya.bj@pathpartnertech.com>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 12:01:39PM +0530, sidraya.bj@pathpartnertech.com wr=
ote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
>=20
> When importing dmabufs, the video meta is set on the dest
> buffer, but not on the src buffer. In this case, the src
> buffer is not made aware of the stride of the video buffer,
> which is needed to properly display the buffer.
>=20
> This is a result of the v4l2 plugin creating it's own
> empty dmabuf pool of GstBuffers, and then assigning the
> memory from the downstream GstBuffer. We then update the
> video meta of the buffer in our pool, but not the downstream
> pool.
>=20
> The downstream pool buffer should be updated as well.
>=20
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
> changes in v2: Add upstreme link
>=20
>  ...l-Set-Video-Meta-to-Imported-Buffers.patch | 58 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.=
patch
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch b=
/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0=
001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> new file mode 100644
> index 00000000..59d9080c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> @@ -0,0 +1,58 @@
> +From e677028494081f93558d24b1f72da9e6835ef954 Mon Sep 17 00:00:00 2001
> +From: Sidraya <sidraya.bj@pathpartnertech.com>
> +Date: Mon, 18 Oct 2021 13:35:09 +0530
> +Subject: [PATCH] v4l2bufferpool: Set Video Meta to Imported Buffers
> +
> +When importing dmabufs, the video meta is set on the dest
> +buffer, but not on the src buffer. In this case, the src
> +buffer is not made aware of the stride of the video buffer,
> +which is needed to properly display the buffer.
> +
> +This is a result of the v4l2 plugin creating it's own
> +empty dmabuf pool of GstBuffers, and then assigning the
> +memory from the downstream GstBuffer. We then update the
> +video meta of the buffer in our pool, but not the downstream
> +pool.
> +
> +The downstream pool buffer should be updated as well.
> +
> +Upstream-Status: Submitted
> +https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1723=
#note_1266433
> +
> +Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> +---
> + sys/v4l2/gstv4l2bufferpool.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
> +index 49f222b6e..f4d964b9e 100644
> +--- a/sys/v4l2/gstv4l2bufferpool.c
> ++++ b/sys/v4l2/gstv4l2bufferpool.c
> +@@ -330,6 +330,10 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPo=
ol * pool,
> +   GstMemory *dma_mem[GST_VIDEO_MAX_PLANES] =3D { 0 };
> +   guint n_mem =3D gst_buffer_n_memory (src);
> +   gint i;
> ++  GstV4l2Object *obj;
> ++  GstVideoInfo *info;
> ++  obj =3D pool->obj;
> ++  info =3D &obj->info;
> +=20
> +   GST_LOG_OBJECT (pool, "importing dmabuf");
> +=20
> +@@ -346,6 +350,13 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPo=
ol * pool,
> +           dma_mem))
> +     goto import_failed;
> +=20
> ++  /* add metadata to raw video buffers */
> ++  if (pool->add_videometa)
> ++    gst_buffer_add_video_meta_full (src, GST_VIDEO_FRAME_FLAG_NONE,
> ++        GST_VIDEO_INFO_FORMAT (info), GST_VIDEO_INFO_WIDTH (info),
> ++        GST_VIDEO_INFO_HEIGHT (info), GST_VIDEO_INFO_N_PLANES (info),
> ++        info->offset, info->stride);
> ++
> +   gst_mini_object_set_qdata (GST_MINI_OBJECT (dest), GST_V4L2_IMPORT_QU=
ARK,
> +       gst_buffer_ref (src), (GDestroyNotify) gst_buffer_unref);
> +=20
> +--=20
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.16.%.bbappend
> index 11513f2f..07cd08a7 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.16.%.bbappend
> @@ -10,6 +10,7 @@ SRC_URI +=3D " \
>      file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.pat=
ch \
>      file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.pat=
ch \
>      file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
> +    file://0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch =
\
>  "
> =20
>  PR_append =3D ".arago3"
> --=20
> 2.17.1
>=20
Please ignore this patch, I will be sending a v2 of this patch.

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
