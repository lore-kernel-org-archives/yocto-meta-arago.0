Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BCD88529CB
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 19:41:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38JfYoU009955
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:41:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38JfXIQ028601
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 14:41:33 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 14:41:32 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
	optional.
Thread-Index: AQHQcjOW+t7M9i2xyEiNrEPj/h4D7Z1Dg0Ig
Date: Wed, 8 Apr 2015 19:41:32 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411DA2A@DFLE09.ent.ti.com>
References: <1428521510-1792-1-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C869430@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C869430@DFLE08.ent.ti.com>
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
X-List-Received-Date: Wed, 08 Apr 2015 19:41:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is included now because for ti33xx and ti43xx, tisdk-readme is include=
d if the brand is not amsdk.

Should this package be removed completely for all brands?


-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, April 08, 2015 3:38 PM
To: Stiffler, Jacob; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is op=
tional.

I still don't understand the need to include this especially since it was n=
ever included before and all this information is documented.

But anyway the wording needs to be updated. Remove all the parts that says =
"usually called" since that's what it is called. ZImage should be used and =
not uImage.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, April 08, 2015 2:32 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is=20
> optional.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |    2 +-
>  .../recipes-tisdk/tisdk-readme/tisdk-readme/README |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git=20
> a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
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

