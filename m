Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7A19C520E3
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 23:49:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ANm7DC042103
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 18:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568159287;
	bh=0UfFXYnbXNJIOXdoxhL9LAwypGE70/fg0oxkmzFv92g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QC1X86tBsGcX+3UCtSn5HPviMcOjNyGDgc08GyowDBFZ48otCxCoPiEEhG2Y6XAtf
	fkSNFxvSo3wwFsyokPt2DUmkEm7fIGz7fk3lJ7M6WuTeNOZIurQGbpW6kJW+YbPuT2
	EEvCeMRbDS7kjfDbm6kXbNoFPHq/NQJZ3XXkxi/w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ANm7QC113910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 18:48:07 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 18:48:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 18:48:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ANm6L5100659;
	Tue, 10 Sep 2019 18:48:06 -0500
Date: Tue, 10 Sep 2019 19:48:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Angela Stegmaier <angelabaker@ti.com>
Message-ID: <20190910234806.GM19813@beryl>
References: <1568150450-10459-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568150450-10459-1-git-send-email-angelabaker@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud][PATCH] gstreamer1.0*-bad: waylandsink updates for k3 for drm buffers
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
X-List-Received-Date: Tue, 10 Sep 2019 23:49:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 10, 2019 at 04:20:50PM -0500, Angela Stegmaier wrote:
> Few changes were needed to support HW decoder (v4l2videodec)
> plugin striding and creation for drm buffers.

Both patches are missing Upstream-Status:


> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>  ...-re-order-buffer-creation-for-drm-buffers.patch | 47 ++++++++++++++++++++++
>  ...ink-Update-wldrm-NV12-offsets-and-strides.patch | 42 +++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.14.4.bbappend       |  2 +
>  3 files changed, 91 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
> new file mode 100644
> index 0000000..d242e72
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
> @@ -0,0 +1,47 @@
> +From aeff52394cddb80acc91ff882e90f4e170646f88 Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Wed, 7 Aug 2019 09:32:16 -0500
> +Subject: [PATCH 1/2] waylandsink: re-order buffer creation for drm buffers
> +
> +We should first try to create the wl_buffer using drm api, and
> +then only if it fails, try dmabuf and shm apis. This patch fixes
> +the ordering so that the redundant creation does not happen.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +---
> + ext/wayland/gstwaylandsink.c | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
> +index 19ecf4d..470e9d2 100644
> +--- a/ext/wayland/gstwaylandsink.c
> ++++ b/ext/wayland/gstwaylandsink.c
> +@@ -772,7 +772,13 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
> +       "display, creating it", buffer);
> + 
> +   format = GST_VIDEO_INFO_FORMAT (&sink->video_info);
> +-  if (gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
> ++
> ++  if (gst_is_drm_memory (mem)) {
> ++     wbuf = gst_wl_drm_memory_construct_wl_buffer (mem, sink->display,
> ++         &sink->video_info);
> ++  }
> ++
> ++  if (!wbuf && gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
> +     guint i, nb_dmabuf = 0;
> + 
> +     for (i = 0; i < gst_buffer_n_memory (buffer); i++)
> +@@ -783,10 +789,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
> +       wbuf = gst_wl_linux_dmabuf_construct_wl_buffer (buffer, sink->display,
> +           &sink->video_info);
> +   }
> +-  if (gst_is_drm_memory (mem)) {
> +-     wbuf = gst_wl_drm_memory_construct_wl_buffer (mem, sink->display,
> +-         &sink->video_info);
> +-  }
> + 
> +   if (!wbuf && gst_wl_display_check_format_for_shm (sink->display, format)) {
> +     if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
> new file mode 100644
> index 0000000..38a2829
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
> @@ -0,0 +1,42 @@
> +From 76f08c4cd3f1bd35b83b8989bba6a8be31eea89c Mon Sep 17 00:00:00 2001
> +From: Angela Stegmaier <angelabaker@ti.com>
> +Date: Wed, 7 Aug 2019 09:42:09 -0500
> +Subject: [PATCH 2/2] waylandsink: Update wldrm NV12 offsets and strides
> +
> +Stride may not be the same as width, as the wldrm was assuming.
> +Update the NV12 offset and stride calculation to use the actual
> +values from the video metadata.
> +
> +Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> +---
> + ext/wayland/wldrm.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c
> +index 9aca9d5..0b72896 100644
> +--- a/ext/wayland/wldrm.c
> ++++ b/ext/wayland/wldrm.c
> +@@ -38,7 +38,10 @@ gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
> +   {
> +     /* NV12 */
> +     fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
> +-    strides[1] = GST_ROUND_UP_4 (video_width);
> ++    strides[0] = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
> ++    strides[1] = GST_VIDEO_INFO_PLANE_STRIDE (info, 1);
> ++    offsets[0] = GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
> ++    offsets[1] = GST_VIDEO_INFO_PLANE_OFFSET (info, 1);
> +   }
> +   else if(format == GST_VIDEO_FORMAT_I420)
> +   {
> +@@ -92,7 +95,7 @@ gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
> +     return NULL;
> +   }
> + 
> +-  req2.handle = req1.handle,
> ++  req2.handle = req1.handle;
> + 
> +   ret = drmIoctl(display->fd, DRM_IOCTL_GEM_FLINK, &req2);
> +   if (ret) {
> +-- 
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
> index 70f5f9b..38f7e63 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
> @@ -51,6 +51,8 @@ SRC_URI_append_k3 = " \
>      file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
>      file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
>      file://0005-waylandsink-Add-input-device-support.patch \
> +    file://0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch \
> +    file://0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch \
>  "
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

