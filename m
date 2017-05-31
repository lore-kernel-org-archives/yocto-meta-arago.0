Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7735F520E5
	for <meta-arago@arago-project.org>;
	Wed, 31 May 2017 17:40:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4VHdw6j010597
	for <meta-arago@arago-project.org>; Wed, 31 May 2017 12:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496252398;
	bh=UiO08N5K99pavDaKD4ZdXXZXdt2t3e2zZ2AbJbITM88=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vfv5m8VPlzL/nDhQ6uVgcJxuOBeFMi9H+mjumpG4oXhd8ClK4WibSzoI1L9THwax9
	u3xoy1r+p5Q72jh3xSy1RJe0+s3eoc5vlah8eIATmXYti5K3Vk2UDQXp8S2DGKehTN
	JIk2mIOo/cRnJCKICZ5l3hpghkZGXTyYKAHcd7sQ=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VHdrfX029781
	for <meta-arago@arago-project.org>; Wed, 31 May 2017 12:39:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 12:39:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VHdqhe016082;
	Wed, 31 May 2017 12:39:52 -0500
Date: Wed, 31 May 2017 13:39:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170531173936.GO28136@edge>
References: <1495754790-61777-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1495754790-61777-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH] gstreamer1.0-plugins-bad: Apply gstwaylandsink scale-up issue fix to AM3/4
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
X-List-Received-Date: Wed, 31 May 2017 17:40:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

This breaks builds for am3x:

| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c: In function 'gst_wl_window_resize_video_surface':
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:255:22: error: 'GstWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|    if (window->display->crop) {
|                       ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:256:72: error: 'GstWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->area_viewport, window->display->crop->width,  window->display->crop->height);
|                                                                         ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:256:103: error: 'GstWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->area_viewport, window->display->crop->width,  window->display->crop->height);
|                                                                                                        ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:257:73: error: 'GstWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->video_viewport, window->display->crop->width,  window->display->crop->height);
|                                                                          ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:257:104: error: 'GstWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->video_viewport, window->display->crop->width,  window->display->crop->height);
|                                                                                                         ^~
| Makefile:935: recipe for target 'libgstwaylandsink_la-wlwindow.lo' failed
| make[3]: *** [libgstwaylandsink_la-wlwindow.lo] Error 1
| make[3]: *** Waiting for unfinished jobs....
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wldisplay.c:299:6: warning: no previous prototype for 'pointer_axis_stop' [-Wmissing-prototypes]
|  void pointer_axis_stop(void *data, struct wl_pointer *wl_pointer, uint32_t time, uint32_t axis)
|       ^~~~~~~~~~~~~~~~~
| make[3]: Leaving directory '/OE/arago-morty-next-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am335x_evm-linux-gnueabi/gstreamer1.0-plugins-bad/1.8.3-r5/build/ext/wayland'
| Makefile:1331: recipe for target 'wayland' failed
| make[2]: *** [wayland] Error 2

Full logs:
http://lcpd.gt.design.ti.com/builds/arago-morty-next/systest/am335x-evm/17645/logs/am335x-evm-error-logs/gstreamer1.0-plugins-bad_1.8.3-r5_do_compile.log


On Thu, May 25, 2017 at 07:26:30PM -0400, Eric Ruei wrote:
> Pick the patch:
> 1. 0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
> 
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend                   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
> index ff61132..3e6c8a5 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
> @@ -28,11 +28,13 @@ SRC_URI_append_ti43x = " \
>      file://0003-kmssink-add-YUYV-support.patch \
>      file://0001-gstwaylandsink-add-input-format-I420-support.patch \
>      file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
> +    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
>  "
>  
>  SRC_URI_append_ti33x = " \
>      file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
>      file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
> +    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
>  "
>  
>  SRC_URI_append_omap-a15 = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

