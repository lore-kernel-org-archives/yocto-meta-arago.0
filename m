Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 558445299F
	for <meta-arago@arago-project.org>;
	Fri,  5 Dec 2014 11:29:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB5BTmZh021225
	for <meta-arago@arago-project.org>; Fri, 5 Dec 2014 05:29:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB5BTmtl032218
	for <meta-arago@arago-project.org>; Fri, 5 Dec 2014 05:29:48 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 5 Dec 2014 05:29:48 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] gst-plugins: Use 'gitsm' fetcher for
	submodule support.
Thread-Index: AQHQDvnlRfgPOug830Wq0sUWjdue5pyAbaQAgABxE2A=
Date: Fri, 5 Dec 2014 11:29:47 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140CC84D@DFLE09.ent.ti.com>
References: <1417611953-20698-1-git-send-email-j-stiffler@ti.com>
	<20141204224155.GF5113@edge>
In-Reply-To: <20141204224155.GF5113@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gst-plugins: Use 'gitsm' fetcher for submodule support.
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
X-List-Received-Date: Fri, 05 Dec 2014 11:29:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Yes,  I have been patching my builds with this for a month or so now, and I=
 have not seen any issues.

Thanks,
Jake

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, December 04, 2014 5:42 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] gst-plugins: Use 'gitsm' fetcher for subm=
odule support.

Jake,

Thanks!
Can I assume this was thoroughly tested with and w/o mirror setup? :)


On Wed, Dec 03, 2014 at 08:05:53AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |    3 +--
>  .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |    3 +--
>  .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |    3 +--
>  .../gstreamer/gstreamer-mm-accel_0.10.36.bb        |    3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-ac
> cel_0.10.23.bb=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-ac
> cel_0.10.23.bb
> index 6eb7bc1..e00e919 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-ac
> cel_0.10.23.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-m
> +++ m-accel_0.10.23.bb
> @@ -26,14 +26,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  DEPENDS +=3D "omap5-sgx-ddk-um-linux libdce libdrm wayland"
> =20
>  SRCREV =3D "a9510bef52331fee9a23a5c955dbf76ac210056a"
> -SRC_URI =3D "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=3Dg=
it"
> +SRC_URI =3D "gitsm://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=
=3Dgit"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OECONF +=3D " --disable-pvr"
> =20
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
> =20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-a
> ccel_0.10.36.bb=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-a
> ccel_0.10.36.bb
> index 1de5e6c..33f82b0 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-a
> ccel_0.10.36.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-
> +++ mm-accel_0.10.36.bb
> @@ -23,13 +23,12 @@ RCONFLICTS_${PN}-meta +=3D "gst-plugins-base-meta"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -SRC_URI =3D "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=3D=
git"
> +SRC_URI =3D "gitsm://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=
=3Dgit"
>  SRCREV =3D "3427e885daa749275e07339d3633b83c717aa419"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
> =20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-a
> ccel_0.10.31.bb=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-a
> ccel_0.10.31.bb
> index 31456af..ad071ec 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-a
> ccel_0.10.31.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-
> +++ mm-accel_0.10.31.bb
> @@ -23,7 +23,7 @@ RCONFLICTS_${PN}-meta +=3D "gst-plugins-good-meta"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -SRC_URI =3D "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=3D=
git"
> +SRC_URI =3D "gitsm://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=
=3Dgit"
>  SRCREV =3D "a44097d542f2bf219ac9dc3ef2372e58d769a8f9"
> =20
>  # Fix compile errors with recent kernels @@ -33,7 +33,6 @@=20
> SRC_URI_append =3D "=20
> file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffe
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
> =20
> diff --git=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.
> 10.36.bb=20
> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.
> 10.36.bb
> index d3db41e..8cfbd05 100644
> ---=20
> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.
> 10.36.bb
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-acce
> +++ l_0.10.36.bb
> @@ -21,13 +21,12 @@ RCONFLICTS_${PN}-dbg +=3D "gstreamer-dbg"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -SRC_URI =3D "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=3Dgit"
> +SRC_URI =3D "gitsm://git.ti.com/glsdk/gstreamer0-10.git;protocol=3Dgit"
>  SRCREV =3D "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure_prepend() {
> -	git submodule init && git submodule update
>  	autopoint -f
>  }
> =20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

