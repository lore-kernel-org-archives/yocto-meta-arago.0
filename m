Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5BDEB5299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 20:51:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EKpFb0025875
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 15:51:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EKpFmn017577
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 15:51:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 15:51:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4] packagegroup crypto: Add AM437x support
Thread-Index: AQHOyRU5U4ff1KKZN0qCiokYUpr5N5n0rATg
Date: Mon, 14 Oct 2013 20:51:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C576203@DFLE08.ent.ti.com>
References: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
	<1381782564-11190-4-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381782564-11190-4-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] packagegroup crypto: Add AM437x support
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
X-List-Received-Date: Mon, 14 Oct 2013 20:51:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks!

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, October 14, 2013 3:29 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 4/4] packagegroup crypto: Add AM437x support
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    3 ++-
>  .../packagegroup-arago-tisdk-crypto.bb             |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> index 90a4dd9..f86accf 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-crypto-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install crypto sources in SDK"
>  LICENSE =3D "MIT"
> -PR =3D "r4"
> +PR =3D "r5"
>=20
>  inherit packagegroup
>=20
> @@ -9,6 +9,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  CRYPTO_RDEPENDS =3D ""
>=20
>  CRYPTO_RDEPENDS_append_ti33x =3D " ti-crypto-examples-src"
> +CRYPTO_RDEPENDS_append_ti43x =3D " ti-crypto-examples-src"
>=20
>  CRYPTO_RDEPENDS_append_am37x-evm =3D "\
>      ti-ocf-crypto-module-src \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> index c1e7054..d781ddd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-crypto.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install crypto packages into target FS"
>  LICENSE =3D "MIT"
> -PR =3D "r4"
> +PR =3D "r5"
>=20
>  inherit packagegroup
>=20
> @@ -15,6 +15,7 @@ CRYPTO_SUPPORT =3D "\
>      "
>=20
>  CRYPTO_SUPPORT_append_ti33x =3D " ti-crypto-examples"
> +CRYPTO_SUPPORT_append_ti43x =3D " ti-crypto-examples"
>=20
>  # Add crypto hardware support for am37x-evm  # NOTE: this package depend=
s
> on a kernel patch which also has a TSU
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

