Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.4100.1637253570451895454
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 08:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE1C740C3A;
	Thu, 18 Nov 2021 16:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DG76SjHHOVog; Thu, 18 Nov 2021 16:39:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7428440BA8;
	Thu, 18 Nov 2021 16:39:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 418E11746CE; Thu, 18 Nov 2021 11:39:23 -0500 (EST)
Date: Thu, 18 Nov 2021 11:39:23 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: sidraya.bj@pathpartnertech.com
Cc: meta-arago@lists.yoctoproject.org, yogeshs@ti.com, praneeth@ti.com,
	d-huang@ti.com, prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com
Subject: Re: [PATCH v2] Avoiding Failure to allocate required memory error.
Message-ID: <20211118163923.GC18191@denix.org>
References: <20211118052828.15859-1-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
In-Reply-To: <20211118052828.15859-1-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 18, 2021 at 10:58:28AM +0530, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> max variable is setting 32 constant which
> leads to following error
> "ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
> Failed to allocate required memory."
> 
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> Tested-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
> Added Tested-by line

It is implied that the patch author does the proper testing before submiting.


>  ...-Failure-to-allocate-required-memory.patch | 34 +++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
> new file mode 100644
> index 00000000..f886f06b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
> @@ -0,0 +1,34 @@
> +From 356b8a2bbfef8e05ea3f8757e6bd357c268ad748 Mon Sep 17 00:00:00 2001
> +From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> +Date: Wed, 10 Mar 2021 16:31:38 +0530
> +Subject: [PATCH] [gst-plugins-good 1.16.3] Avoiding Failure to allocate required memory error.
> +
> +max variable is setting 32 which leads to following error
> +"ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
> +Failed to allocate required memory."
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> +---
> + sys/v4l2/gstv4l2videodec.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/sys/v4l2/gstv4l2videodec.c b/sys/v4l2/gstv4l2videodec.c
> +index adb620d79..c1deb8896 100644
> +--- a/sys/v4l2/gstv4l2videodec.c
> ++++ b/sys/v4l2/gstv4l2videodec.c
> +@@ -611,10 +611,9 @@ gst_v4l2_video_dec_handle_frame (GstVideoDecoder * decoder,
> +     if (!gst_buffer_pool_is_active (pool)) {
> +       GstStructure *config = gst_buffer_pool_get_config (pool);
> +       guint min = MAX (self->v4l2output->min_buffers, GST_V4L2_MIN_BUFFERS);
> +-      guint max = VIDEO_MAX_FRAME;
> +
> +       gst_buffer_pool_config_set_params (config, self->input_state->caps,
> +-          self->v4l2output->info.size, min, max);
> ++		      self->v4l2output->info.size, min, 2);
> +
> +       /* There is no reason to refuse this config */
> +       if (!gst_buffer_pool_set_config (pool, config))
> +--
> +2.17.1
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> index 0c6dc81b..11513f2f 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> @@ -9,6 +9,7 @@ SRC_URI += " \
>      file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
>      file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
>      file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch \
> +    file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
>  "
>  
>  PR_append = ".arago3"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
