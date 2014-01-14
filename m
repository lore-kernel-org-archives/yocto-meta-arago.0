Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3F0DA529CF
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSRaf013892
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSRwV026196
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:27 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:25 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/8] ti-wifi-utils-wl18xx: Update recipe
	to	ol_r8.a8.08 version.
Thread-Index: AQHO8+5cB3S3bDCMcEWSX1qK2j1bEZqEcSMQ
Date: Tue, 14 Jan 2014 13:28:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604D7E@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-4-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-4-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] ti-wifi-utils-wl18xx: Update recipe to	ol_r8.a8.08 version.
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/8] ti-wifi-utils-wl18xx: Update recipe to
> ol_r8.a8.08 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Updated firmware name.
> - Added required makefile parameter to support libnl3 compilation.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  ...8.a6.01.bb =3D> ti-wifi-utils-wl18xx_r8.a8.08.bb} |   13 ++++++++----=
-
>  1 files changed, 8 insertions(+), 5 deletions(-)  rename meta-arago-
> extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a6.01.bb =
=3D> ti-wifi-
> utils-wl18xx_r8.a8.08.bb} (68%)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-uti=
ls-
> wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-=
wifi-
> utils-wl18xx_r8.a8.08.bb
> similarity index 68%
> rename from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-util=
s-
> wl18xx_r8.a6.01.bb
> rename to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-
> wl18xx_r8.a8.08.bb
> index eab94fa..601b203 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-
> wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl1
> +++ 8xx_r8.a8.08.bb
> @@ -3,12 +3,12 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
>=20
>  DEPENDS =3D "libnl"
> -RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> +RDEPENDS_${PN} =3D "wl18xx-firmware"
>=20
> -PR =3D"r3+gitr${SRCPV}"
> +PR =3D"r0+gitr${SRCPV}"
>=20
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> +#Tag: ol_r8.a8.08
> +SRCREV =3D "9627cb09b9de32b8ffcc32d3ce3e275b7c56d8e4"
>  SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \  "
>=20
> @@ -20,7 +20,10 @@ RCONFLICTS_${PN} +=3D  "ti-wifi-utils"
>  S =3D "${WORKDIR}/git"
>=20
>  export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> -CFLAGS +=3D " -DCONFIG_LIBNL20"
> +
> +EXTRA_OEMAKE =3D 'CFLAGS=3D"${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -
> DCONFIG_LIBNL32 " \
> +		LDFLAGS=3D"${LDFLAGS} -L${STAGING_LIBDIR}" \
> +		NLVER=3D3'
>=20
>  do_install() {
>      install -d ${D}${bindir}
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

