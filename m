Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9ACF1529BD
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 13:17:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KDHfCB018757
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 08:17:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KDHevp016024
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 08:17:40 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 20 Mar 2015 08:17:40 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AQHQYovfAYVpT0KB/kuEWTxVKSDJSp0kuQUAgAB51GCAACdNUA==
Date: Fri, 20 Mar 2015 13:17:40 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
	<20150319223632.GH11557@edge> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink
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
X-List-Received-Date: Fri, 20 Mar 2015 13:17:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried the matrix h264 decode demo on am437x with gstreamer 1.0.=20

To get it to work, I had to modify runH264Dec.sh to use the new pipelines. =
The new command is the following:

    gst-launch-1.0 -v filesrc location=3D$filename ! h264parse ! avdec_h264=
 ! videoconvert ! fbdevsink device=3D/dev/fb0


 Once this was done, I was able to run the demo, but the framerate is extre=
mely slow. Is this the correct command? Or is this behavior expected?

Thanks,
Jake=20


-----Original Message-----
From: Stiffler, Jacob=20
Sent: Friday, March 20, 2015 6:56 AM
To: Dmytriyenko, Denys; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink

It appears I got lucky with a successful am437x-evm build. The package libd=
rm was installed and libdce was not.

However, I got a build failure for am335x-evm due to the missing libdrm dep=
endency:

In file included from gstdrmbufferpool.c:42:0:
gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or director=
y compilation terminated.
make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1
make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/=
arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnu=
eabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-lib=
s/gst/drm'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/=
arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnu=
eabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-lib=
s/gst'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/=
arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnu=
eabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-lib=
s'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/=
arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnu=
eabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'
make: *** [all] Error 2
ERROR: oe_runmake failed

- Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, March 19, 2015 6:37 PM
To: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink

Karthik,

I had a question - I see that KMSsink in plugins-bad checks for drm and dce=
 headers. I was trying to set the dependency accordingly, but it would brea=
k non dce platforms. Can you please elaborate on that a bit? Thanks.

--
Denys


On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 | =
4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.2.3.bbappend=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.2.3.bbappend
> index b1cacac..bd141a8 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug
> +++ ins-bad_1.2.3.bbappend
> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  PACKAGECONFIG =3D "faad wayland"
> =20
> +DEPENDS +=3D "libdrm libdce"
> +
>  SRC_URI_append =3D " \
>          file://0001-Added-GstDRMBufferPool-support.patch \
>          file://0002-Modified-waylandsink-to-accept-NV12-format.patch=20
> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \
>          file://0004-waylandsink-Removed-dependency-on-dri2.patch \
>          file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
> =20
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
> --
> 2.2.0
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

