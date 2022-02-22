Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.228.1645569636769684132
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 14:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E79840C2E;
	Tue, 22 Feb 2022 22:40:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Krf7r-OhwUP; Tue, 22 Feb 2022 22:40:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D93A240A77;
	Tue, 22 Feb 2022 22:40:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9C9C4174784; Tue, 22 Feb 2022 17:40:31 -0500 (EST)
Date: Tue, 22 Feb 2022 17:40:31 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: sidraya.bj@pathpartnertech.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, d-huang@ti.com,
	detheridge@ti.com
Subject: Re: [meta-arago] [dunfell PATCH v2] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Message-ID: <20220222224031.GT26229@denix.org>
References: <20220222064145.8043-1-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
In-Reply-To: <20220222064145.8043-1-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks. From OE/meta-arago perspective this patch now looks good. But from 
gstreamer perspective I cannot judge the change as I don't have enough 
expertise there. Can you please follow up on your submission to upstream 
gstreamer, as the maintainer there has some questions? Thanks!

-- 
Denys


On Tue, Feb 22, 2022 at 12:11:45PM +0530, Sidraya Jayagond via lists.yoctoproject.org wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> When importing dmabufs, the video meta is set on the dest
> buffer, but not on the src buffer. In this case, the src
> buffer is not made aware of the stride of the video buffer,
> which is needed to properly display the buffer.
> 
> This is a result of the v4l2 plugin creating it's own
> empty dmabuf pool of GstBuffers, and then assigning the
> memory from the downstream GstBuffer. We then update the
> video meta of the buffer in our pool, but not the downstream
> pool.
> 
> The downstream pool buffer should be updated as well.
> 
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  ...l-Set-Video-Meta-to-Imported-Buffers.patch | 58 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> new file mode 100644
> index 00000000..59d9080c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
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
> +https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1723#note_1266433
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
> +@@ -330,6 +330,10 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPool * pool,
> +   GstMemory *dma_mem[GST_VIDEO_MAX_PLANES] = { 0 };
> +   guint n_mem = gst_buffer_n_memory (src);
> +   gint i;
> ++  GstV4l2Object *obj;
> ++  GstVideoInfo *info;
> ++  obj = pool->obj;
> ++  info = &obj->info;
> + 
> +   GST_LOG_OBJECT (pool, "importing dmabuf");
> + 
> +@@ -346,6 +350,13 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPool * pool,
> +           dma_mem))
> +     goto import_failed;
> + 
> ++  /* add metadata to raw video buffers */
> ++  if (pool->add_videometa)
> ++    gst_buffer_add_video_meta_full (src, GST_VIDEO_FRAME_FLAG_NONE,
> ++        GST_VIDEO_INFO_FORMAT (info), GST_VIDEO_INFO_WIDTH (info),
> ++        GST_VIDEO_INFO_HEIGHT (info), GST_VIDEO_INFO_N_PLANES (info),
> ++        info->offset, info->stride);
> ++
> +   gst_mini_object_set_qdata (GST_MINI_OBJECT (dest), GST_V4L2_IMPORT_QUARK,
> +       gst_buffer_ref (src), (GDestroyNotify) gst_buffer_unref);
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> index 11513f2f..07cd08a7 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> @@ -10,6 +10,7 @@ SRC_URI += " \
>      file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
>      file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch \
>      file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
> +    file://0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch \
>  "
>  
>  PR_append = ".arago3"
> -- 
> 2.17.1
