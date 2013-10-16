Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A6BCF5297F
	for <meta-arago@arago-project.org>;
	Wed, 16 Oct 2013 15:20:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9GFKScU026745
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 10:20:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9GFKSMk020736
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 10:20:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 16 Oct 2013 10:20:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] matrix-gui-crypto-demos: Add am437x support
Thread-Index: AQHOyoMptao3N8mupE6gvJyAkZ9tO5n3cWuA
Date: Wed, 16 Oct 2013 15:20:25 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C578899@DFLE08.ent.ti.com>
References: <1381939776-29042-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381939776-29042-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] matrix-gui-crypto-demos: Add am437x support
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
X-List-Received-Date: Wed, 16 Oct 2013 15:20:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Wednesday, October 16, 2013 11:10 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] matrix-gui-crypto-demos: Add am437x support
>=20
> * Add support for the AM437x to use the C based crypto demos
>   which provide the wrapper scripts so don't install the
>   wrapper scripts with this recipe.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb
> index 328d503..7cd9f2f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
> @@ -4,12 +4,13 @@ LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> -PR =3D "${INC_PR}.5"
> +PR =3D "${INC_PR}.6"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  S =3D "${WORKDIR}/git/cryptos_apps_scripts"
>  S_ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
> +S_ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
>=20
>  FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
>=20
> @@ -17,3 +18,4 @@ FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
>  RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-cryptos
> openssl"
>=20
>  RDEPENDS_${PN}_append_ti33x =3D " ti-crypto-examples"
> +RDEPENDS_${PN}_append_ti43x =3D " ti-crypto-examples"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

