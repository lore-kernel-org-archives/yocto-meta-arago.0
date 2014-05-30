Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A145952A67
	for <meta-arago@arago-project.org>;
	Fri, 30 May 2014 13:06:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4UD6Kdb029639
	for <meta-arago@arago-project.org>; Fri, 30 May 2014 08:06:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4UD6Ks7017904
	for <meta-arago@arago-project.org>; Fri, 30 May 2014 08:06:20 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 30 May 2014 08:06:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 05/19] gst-plugins-base: Add TI version
	with	bbappend
Thread-Index: AQHPc5dssTzjHt/mA0yTaA8aI5DLRptZJogA
Date: Fri, 30 May 2014 13:06:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6BDDA3@DFLE08.ent.ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-6-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1400527207-17021-6-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 05/19] gst-plugins-base: Add TI version with	bbappend
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
X-List-Received-Date: Fri, 30 May 2014 13:06:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, May 19, 2014 2:20 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 05/19] gst-plugins-base: Add TI version with
> bbappend
>=20
> From: Mrinmayee Hingolikar <mrinmayee@ti.com>
>=20
> * Pulled in the bbappend from meta-arago-glsdk and kept
>   authorship for Mrinmayee
> * This bbappend modifies the gst-plugins-base package to pull
>   from git.ti.com/glsdk which has additional patches to support
>   TI devices
> * Modified the following for upstreaming:
>     * Removed setting of LICENSE since this would override the
>       LICENSE value in the base recipe
> * Make machines specific due to changed SRC_URI
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ....bbappend =3D> gst-plugins-base_0.10.36.bbappend} |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)  copy meta-arago-extras/=
recipes-
> multimedia/gstreamer/{gst-plugins-bad_0.10.23.bbappend =3D> gst-plugins-
> base_0.10.36.bbappend} (58%)
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend b/meta-arago-extras/recipes-
> multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
> similarity index 58%
> copy from meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend
> copy to meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> base_0.10.36.bbappend
> index 74cc9ce..6691ee3 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.
> +++ 10.36.bbappend
> @@ -1,22 +1,20 @@
> -DEPENDS_append_omap-a15 =3D " omap5-sgx-ddk-um-linux libdce libdrm
> wayland "
> +PR_append =3D "-arago1"
>=20
>  # Make MACHINE specific since we pull different sources per MACHINE
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -PR_append =3D "-arago1"
> -
> -SRCREV =3D "f2df6f3b684f39500e22115b160191cef6d7dbaf"
[Franklin] I don't see nightly builds failing but I'm curious why the above=
 is ok. Isn't this SRCREV specific to the git.ti.com/glsdk/... repo so for =
devices other then omap-a15 won't the commit id be invalid?
> -SRC_URI_omap-a15 =3D "git://git.ti.com/glsdk/gst-plugins-bad0-
> 10.git;protocol=3Dgit"
> +SRC_URI_omap-a15 =3D "git://git.ti.com/glsdk/gst-plugins-base0-
> 10.git;protocol=3Dgit"
> +SRCREV =3D "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
>=20
>  S_omap-a15 =3D "${WORKDIR}/git"
>=20
> -EXTRA_OECONF +=3D " --disable-pvr"
> -
>  do_configure_prepend_omap-a15() {
>  	git submodule init && git submodule update
>  	autopoint -f
>  }
>=20
> +EXTRA_OECONF +=3D"--disable-ivorbis "
> +
>  FILES_${PN} +=3D "\
>                  ${libdir}/*.so \
>                  ${libdir}/gstreamer-0.10/*"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

