Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8BD8F529AA
	for <meta-arago@arago-project.org>;
	Fri, 21 Feb 2014 17:25:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1LHPnPo003620;
	Fri, 21 Feb 2014 11:25:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1LHPnAT023582;
	Fri, 21 Feb 2014 11:25:49 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 21 Feb 2014 11:25:49 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-source-ipk: append kernel and
	u-boot short hash to source directory
Thread-Index: AQHPLyj4VO6ncfZs+kOh2rWaFHDFZJq/9ExQ
Date: Fri, 21 Feb 2014 17:25:48 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C65174D@DFLE08.ent.ti.com>
References: <1393003092-29016-1-git-send-email-denis@denix.org>
In-Reply-To: <1393003092-29016-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-source-ipk: append kernel and u-boot short hash to source directory
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
X-List-Received-Date: Fri, 21 Feb 2014 17:25:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we tweak this to use a generic variable

SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV}${<gen=
eric variable name>}"

And then in the kernel recipe

<generic variable name> =3D "${KERNEL_LOCALVERSION}"

I want to be able to override <generic variable name>  without touching the=
 .conf file.

Similar comment for u-boot.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, February 21, 2014 11:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago-source-ipk: append kernel and u-boot
> short hash to source directory
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago-source-ipk.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-
> distro/conf/distro/arago-source-ipk.conf
> index 231e13d..d2a9600 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -116,7 +116,7 @@ SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =3D
> "board-support/${P}"
>  SRCIPK_PACKAGE_ARCH_pn-x-load =3D "${MACHINE_ARCH}"
>=20
>  CREATE_SRCIPK_pn-u-boot-ti-staging =3D "1"
> -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-${PV}"
> +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging =3D "board-support/u-boot-
> ${PV}${UBOOT_LOCALVERSION}"
>  SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging =3D "${MACHINE_ARCH}"
>  SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging =3D "true"
>=20
> @@ -146,7 +146,7 @@ SRCIPK_INSTALL_DIR_pn-u-boot-am3517 =3D "board-
> support/u-boot-${UVER}-psp${PSPREL}
>  SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 =3D "${MACHINE_ARCH}"
>=20
>  CREATE_SRCIPK_pn-linux-ti-staging =3D "1"
> -SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-${PV}"
> +SRCIPK_INSTALL_DIR_pn-linux-ti-staging =3D "board-support/linux-
> ${PV}${KERNEL_LOCALVERSION}"
>  SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging =3D "${MACHINE_ARCH}"
>  SRCIPK_PRESERVE_GIT_pn-linux-ti-staging =3D "true"
>=20
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

