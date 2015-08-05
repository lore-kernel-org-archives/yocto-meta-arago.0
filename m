Return-Path: <nikhil.nd@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5288C5299C
	for <meta-arago@arago-project.org>;
	Wed,  5 Aug 2015 09:56:03 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t759u1X1008564
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2015 04:56:02 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t759twoP019874
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2015 15:26:00 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0224.002; Wed, 5 Aug 2015 15:25:58 +0530
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-vpe: Add modprobe
	config	for ti-vip and ti-vpe
Thread-Index: AQHQzs8WpCLCEL3/P0miWVDN8TR6zp39KWsQ
Date: Wed, 5 Aug 2015 09:55:57 +0000
Message-ID: <E60A9E1B4132A24DB80BD56ABC926847350B525E@DBDE04.ent.ti.com>
References: <1438704182-21056-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1438704182-21056-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config	for ti-vip and ti-vpe
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
X-List-Received-Date: Wed, 05 Aug 2015 09:56:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Tuesday, August 04, 2015 9:33 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] gstreamer1.0-plugins-vpe: Add modprobe conf=
ig
> for ti-vip and ti-vpe
>=20
> * The module ti-vip and ti-vpe will use the device node /dev/video0
>   and /dev/video1
> * Which module gets which device node depends on the order they are
>   inserted.
> * The vpe gstreamer plugin has the assumption that ti-vpe is connected
>   to /dev/video0
> * This conf file will ensure that ti-vpe is inserted first, and gets
>   node /dev/video0
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf     |  1 +
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 11 +++++=
++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)  create mode 100644 me=
ta-
> arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/t=
i-
> video.conf
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-
> plugins-vpe/ti-video.conf b/meta-arago-extras/recipes-multimedia/gst-plug=
ins-
> ti/gstreamer1.0-plugins-vpe/ti-video.conf
> new file mode 100644
> index 0000000..339a0c1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-p
> +++ lugins-vpe/ti-video.conf
> @@ -0,0 +1 @@
> +install ti-vip /sbin/modprobe ti-vpe; /sbin/modprobe --ignore-install
> +ti-vip

This would work only if the VIP and VPE are compiled as modules
Also, it won't work with if the USB camera registers a video device.
The better way would be for plugin to not hard code the /dev/video0 device
If you want to hard code the device name, it better be /dev/v4l/by-path/<th=
e vpe platform device name>
This won't change irrespective of other modules are there or not, and works=
 even in case VIP,VPE is  compiled as builtin


> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-
> plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-
> ti/gstreamer1.0-plugins-vpe_git.bb
> index e549b3b..73a7723 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-
> plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-p
> +++ lugins-vpe_git.bb
> @@ -5,7 +5,14 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
>=20
>  require gstreamer1.0-plugins-ti.inc
>=20
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
>  SRCREV =3D "876d28b2de5fa02d0f5fa836cba7be9a14b819eb"
>=20
> -SRC_URI =3D "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=3Dgit"
> +SRC_URI =3D "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=3Dgit \
> +           file://ti-video.conf \
> +"
> +
> +do_install_append() {
> +    install -d ${D}/etc/modprobe.d
> +    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d }
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

