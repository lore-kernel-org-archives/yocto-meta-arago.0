Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B22F65298E
	for <meta-arago@arago-project.org>;
	Thu, 31 Jul 2014 19:00:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6VJ08gu006279;
	Thu, 31 Jul 2014 14:00:08 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6VJ08jF010719;
	Thu, 31 Jul 2014 14:00:08 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 31 Jul 2014 14:00:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] arago-prefs.inc: switch u-boot
	preference to ti-staging variant
Thread-Index: AQHPrO2sQpezScG1m0iZWNBlnX19hZu6iWbA
Date: Thu, 31 Jul 2014 19:00:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6EF79A@DFLE08.ent.ti.com>
References: <1406831474-1160-1-git-send-email-denis@denix.org>
In-Reply-To: <1406831474-1160-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arago-prefs.inc: switch u-boot preference to ti-staging variant
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
X-List-Received-Date: Thu, 31 Jul 2014 19:00:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, July 31, 2014 1:31 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/2] arago-prefs.inc: switch u-boot preferen=
ce
> to ti-staging variant
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 5d4a8fd..eada6a8 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -72,6 +72,12 @@ PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D
> "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-staging"
>  PREFERRED_VERSION_linux-ti-staging =3D "3.14%"
>=20
> +PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-staging"
> +PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
> +PREFERRED_VERSION_u-boot-ti-staging =3D "2014.07%"
> +
>  # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-
> enhanced version  PREFERRED_VERSION_udev =3D "182"
>  PREFERRED_PROVIDER_udev =3D "udev"
> --
> 2.0.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

