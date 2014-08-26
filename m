Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C3C4E52A69
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 15:16:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QFGoFs002380;
	Tue, 26 Aug 2014 10:16:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QFGoaU008266;
	Tue, 26 Aug 2014 10:16:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 26 Aug 2014 10:16:50 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
	packages	globally
Thread-Index: AQHPwUBBZ7wl+af9aEuO9uNQY2gvc5vi/qrA
Date: Tue, 26 Aug 2014 15:16:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C705A61@DFLE08.ent.ti.com>
References: <1409065964-13484-1-git-send-email-denis@denix.org>
In-Reply-To: <1409065964-13484-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-*-graphics: add weston packages	globally
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
X-List-Received-Date: Tue, 26 Aug 2014 15:16:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

FYI I made a similar change locally and Mesa (mesa-gl I think) was getting =
pulled in when building am57x-evm for some reason.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, August 26, 2014 10:13 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
> packages globally
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> As long as Weston compositor runs on top of either DRM or fbdev, should
> not depend on SGX libs
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-graphics.bb        | 11 +++++=
+--
> ---
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-graphics.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index 1439638..d730799 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-graphics.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install graphics binaries"
>  LICENSE =3D "MIT"
> -PR =3D "r5"
> +PR =3D "r6"
>=20
>  inherit packagegroup
>=20
> @@ -16,15 +16,16 @@ GRAPHICS_SDK =3D "\
>      omap3-sgx-modules \
>  "
>=20
> -GRAPHICS_RDEPENDS =3D ""
> -
> -GRAPHICS_RDEPENDS_ti33x =3D "\
> -    ${GRAPHICS_SDK} \
> +GRAPHICS_RDEPENDS =3D "\
>      weston \
>      weston-init \
>      weston-examples \
>  "
>=20
> +GRAPHICS_RDEPENDS_ti33x =3D "\
> +    ${GRAPHICS_SDK} \
> +"
> +
>  GRAPHICS_RDEPENDS_ti43x =3D "\
>      ${GRAPHICS_SDK} \
>  "
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

