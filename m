Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4750252981
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 20:30:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31KULIE003234
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:30:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31KULDA029414
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:30:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 15:30:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/3] arago-prefs: make the ti staging
	kernel	and bootloader default
Thread-Index: AQHOLvWa+X01xoYEDk6NDly1+GnQjpjB0UdQ
Date: Mon, 1 Apr 2013 20:30:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C418FD7@DFLE08.ent.ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
	<1364833527-8440-4-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364833527-8440-4-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] arago-prefs: make the ti staging kernel	and bootloader default
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
X-List-Received-Date: Mon, 01 Apr 2013 20:30:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same issue. My comment from PATCH 2/3 applies here also.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, April 01, 2013 11:25 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/3] arago-prefs: make the ti staging kernel
> and bootloader default
>=20
> * Make the ti-staging kernel and bootloader the defaults for
>   arago based distributions.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 7a0cc24..d858a52 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -15,11 +15,9 @@ ARAGO_QT_PROVIDER =3D
> "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gle
>  PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>=20
>  # Use the SDK supported kernel and kernel version -
> PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-am335x"
> -PREFERRED_VERSION_linux-am335x =3D "3.2.0-psp05.06.00.00"
> -PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-am33x"
> -PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-am33x"
> -PREFERRED_VERSION_u-boot-am33x =3D "2012.10"
> +PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "linux-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-
> staging"
> +PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
>=20
>  PREFERRED_PROVIDER_virtual/kernel_am180x-evm =3D "linux-omapl138-psp"
>  PREFERRED_VERSION_linux-omapl138-psp =3D "2.6.37"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

