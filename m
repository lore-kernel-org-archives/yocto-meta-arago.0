Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id ACEF2529AF
	for <meta-arago@arago-project.org>;
	Wed, 31 May 2017 19:01:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4VJ1Ol0001484
	for <meta-arago@arago-project.org>; Wed, 31 May 2017 14:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496257284;
	bh=oh3oMQHrOi9wTYMH9x339qKdaBdL2SXYK8NE2figOvQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=u3JR7SLRzbx2n1suWm5lqG35jKBqsVIsrGsV18aORzRjDzrPnFdyZVCKldvz6B/L0
	xX9jbLlw6WUZ/7szZ580k9+0vHGz6hvEXTjNUNZg1qiQHwFAtU1ciWNWGjU/Spjsh7
	oUT7Zc8CUmAxNG8ipMb5y5Hafkj4EIpMKLxxbE7I=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VJ1OIn031354
	for <meta-arago@arago-project.org>; Wed, 31 May 2017 14:01:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Wed, 31 May 2017 14:01:24 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH] gstreamer1.0-plugins-bad:
	Apply gstwaylandsink scale-up issue fix to AM3/4
Thread-Index: AQHS2jTpX6BnSqoEKEWk7Gqk+7MB0KIOy5EQ
Date: Wed, 31 May 2017 19:01:23 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25384778@DFLE09.ent.ti.com>
References: <1495754790-61777-1-git-send-email-e-ruei1@ti.com>
	<20170531173936.GO28136@edge>
In-Reply-To: <20170531173936.GO28136@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 31 May 2017 19:01:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

It is my bad. Please drop this patch. I need to submit another one for AM4 =
where AM4/5 should stay the same.=20
I shall look into AM3 to see whether I can revise the patch for AM3.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, May 31, 2017 1:40 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/master][PATCH] gstreamer1.0-plugins-bad: A=
pply gstwaylandsink scale-up issue fix to AM3/4

Eric,

This breaks builds for am3x:

| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c: In function 'gst_w=
l_window_resize_video_surface':
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:255:22: error: 'Gst=
WlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|    if (window->display->crop) {
|                       ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:256:72: error: 'Gst=
WlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->area_viewport, window->display-=
>crop->width,  window->display->crop->height);
|                                                                        =20
| ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:256:103: error: 'Gs=
tWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->area_viewport, window->display-=
>crop->width,  window->display->crop->height);
|                                                                          =
                             =20
| ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:257:73: error: 'Gst=
WlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->video_viewport, window->display=
->crop->width,  window->display->crop->height);
|                                                                         =
=20
| ^~
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wlwindow.c:257:104: error: 'Gs=
tWlDisplay {aka struct _GstWlDisplay}' has no member named 'crop'
|      wl_viewport_set_destination (window->video_viewport, window->display=
->crop->width,  window->display->crop->height);
|                                                                          =
                              =20
| ^~
| Makefile:935: recipe for target 'libgstwaylandsink_la-wlwindow.lo'=20
| failed
| make[3]: *** [libgstwaylandsink_la-wlwindow.lo] Error 1
| make[3]: *** Waiting for unfinished jobs....
| ../../../gst-plugins-bad-1.8.3/ext/wayland/wldisplay.c:299:6: warning:=20
| no previous prototype for 'pointer_axis_stop' [-Wmissing-prototypes]  voi=
d pointer_axis_stop(void *data, struct wl_pointer *wl_pointer, uint32_t tim=
e, uint32_t axis)
|       ^~~~~~~~~~~~~~~~~
| make[3]: Leaving directory '/OE/arago-morty-next-build/build-CORTEX_1/ara=
go-tmp-external-linaro-toolchain/work/am335x_evm-linux-gnueabi/gstreamer1.0=
-plugins-bad/1.8.3-r5/build/ext/wayland'
| Makefile:1331: recipe for target 'wayland' failed
| make[2]: *** [wayland] Error 2

Full logs:
http://lcpd.gt.design.ti.com/builds/arago-morty-next/systest/am335x-evm/176=
45/logs/am335x-evm-error-logs/gstreamer1.0-plugins-bad_1.8.3-r5_do_compile.=
log


On Thu, May 25, 2017 at 07:26:30PM -0400, Eric Ruei wrote:
> Pick the patch:
> 1. 0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
>=20
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend                   =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.8.3.bbappend=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.8.3.bbappend
> index ff61132..3e6c8a5 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.8.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-bad_1.8.3.bbappend
> @@ -28,11 +28,13 @@ SRC_URI_append_ti43x =3D " \
>      file://0003-kmssink-add-YUYV-support.patch \
>      file://0001-gstwaylandsink-add-input-format-I420-support.patch \
>     =20
> file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch=20
> \
> +    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
>  "
> =20
>  SRC_URI_append_ti33x =3D " \
>      file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
>     =20
> file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch=20
> \
> +    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
>  "
> =20
>  SRC_URI_append_omap-a15 =3D " \
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

