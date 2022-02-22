Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7014.1645490375527764996
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 16:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 880B040C2E;
	Tue, 22 Feb 2022 00:39:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-yaudCu6ctn; Tue, 22 Feb 2022 00:39:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AB7A40951;
	Tue, 22 Feb 2022 00:39:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B24D174767; Mon, 21 Feb 2022 19:39:29 -0500 (EST)
Date: Mon, 21 Feb 2022 19:39:29 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: sidraya.bj@pathpartnertech.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, d-huang@ti.com,
	detheridge@ti.com
Subject: Re: [meta-arago] [dunfell PATCH] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Message-ID: <20220222003929.GI26229@denix.org>
References: <20220221091327.15343-1-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
In-Reply-To: <20220221091327.15343-1-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 02:43:27PM +0530, Sidraya Jayagond via lists.yoctoproject.org wrote:
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
>  ...l-Set-Video-Meta-to-Imported-Buffers.patch | 57 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> new file mode 100644
> index 00000000..420044b1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
> @@ -0,0 +1,57 @@
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

Overall look good, but can you please provide a link where it was submitted 
to? E.g. Upstream-Status: Submitted [link]
Thanks!


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
> 
> 
> -- 
> 
> 
> 
> 
> 
> 
> This
> message contains confidential information and is intended only 
> for the
> individual(s) named. If you are not the intended
> recipient, you are 
> notified that disclosing, copying, distributing or taking any
> action in 
> reliance on the contents of this mail and attached file/s is strictly
> prohibited. Please notify the
> sender immediately and delete this e-mail 
> from your system. E-mail transmission
> cannot be guaranteed to be secured or 
> error-free as information could be
> intercepted, corrupted, lost, destroyed, 
> arrive late or incomplete, or contain
> viruses. The sender therefore does 
> not accept liability for any errors or
> omissions in the contents of this 
> message, which arise as a result of e-mail
> transmission.
