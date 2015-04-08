Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2069052A0D
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:38:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38JcTMv001921
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:38:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JcSs3026206
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:38:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 14:38:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
	optional.
Thread-Index: AQHQcjKu0Z1lCrCnHU+X09MALButb51DgUyA
Date: Wed, 8 Apr 2015 19:38:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C869430@DFLE08.ent.ti.com>
References: <1428521510-1792-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1428521510-1792-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk-readme: Specify that uEnv.txt is	optional.
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
X-List-Received-Date: Wed, 08 Apr 2015 19:38:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I still don't understand the need to include this especially since it was n=
ever included before and all this information is documented.

But anyway the wording needs to be updated. Remove all the parts that says =
"usually called" since that's what it is called. ZImage should be used and =
not uImage.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, April 08, 2015 2:32 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
> optional.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |    2 +-
>  .../recipes-tisdk/tisdk-readme/tisdk-readme/README |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> index 6fdcaff..4ee3ec4 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> @@ -6,7 +6,7 @@ SRC_URI =3D "\
>      file://README \
>  "
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>  PV =3D "1.0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> readme/README
> index 873d1e8..b9aeefe 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> readme/README
> @@ -11,7 +11,7 @@ By default these locations are:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  |    MLO           | boot partition
>  |    u-boot.img    | boot partition
> -|    uEnv.txt      | boot partition
> +|    uEnv.txt      | boot partition (optional)
>  |    uImage        | /boot directory of the rootfs partition
>  |    *.dtb         | /boot directory of the rootfs partition
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

