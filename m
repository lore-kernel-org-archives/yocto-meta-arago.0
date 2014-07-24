Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9DE5C52A72
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:37:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIbFCU021069;
	Thu, 24 Jul 2014 13:37:15 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIbF9i014521;
	Thu, 24 Jul 2014 13:37:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:37:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/11] packagegroup-*-graphics: add Weston
	to corresponding packagegroup
Thread-Index: AQHPorl2USlN90Kyb0ikc2NayUiX5puvlxZA
Date: Thu, 24 Jul 2014 18:37:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C39@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-8-git-send-email-denis@denix.org>
In-Reply-To: <1405709522-404-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 08/11] packagegroup-*-graphics: add Weston to corresponding packagegroup
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
X-List-Received-Date: Thu, 24 Jul 2014 18:37:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 2:52 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 08/11] packagegroup-*-graphics: add Weston t=
o
> corresponding packagegroup
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb   | =
4
> +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-graphics.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index f1dce66..fd64022 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-graphics.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install graphics binaries"
>  LICENSE =3D "MIT"
> -PR =3D "r3"
> +PR =3D "r4"
>=20
>  inherit packagegroup
>=20
> @@ -20,6 +20,8 @@ GRAPHICS_RDEPENDS =3D ""
>=20
>  GRAPHICS_RDEPENDS_ti33x =3D "\
>      ${GRAPHICS_SDK} \
> +    weston \
> +    weston-init \
>  "
>=20
>  GRAPHICS_RDEPENDS_ti43x =3D "\
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

