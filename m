Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 61254529CF
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSXlI007762
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:33 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSXjN026272
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:33 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:33 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/8] wl18xx-firmware: update recipe to
	ol_r8.a8.08 version.
Thread-Index: AQHO8+5cdluyJiPf0kWpLrSVlMcSwpqEcSnA
Date: Tue, 14 Jan 2014 13:28:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604D8C@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-5-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-5-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] wl18xx-firmware: update recipe to	ol_r8.a8.08 version.
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 5/8] wl18xx-firmware: update recipe to
> ol_r8.a8.08 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  ...are_r8.a6.01.bb =3D> wl18xx-firmware_r8.a8.08.bb} |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)  rename meta-arago-
> extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb =3D> wl18=
xx-
> firmware_r8.a8.08.bb} (76%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a8.08.bb
> similarity index 76%
> rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.08.bb
> index 4b3f22a..759bf47 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a
> +++ 8.08.bb
> @@ -1,18 +1,18 @@
>  DESCRIPTION =3D "Firmware files for use with TI wl18xx"
>  LICENSE =3D "TI-TSPA"
> -LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
> +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32a9e"
>=20
>  PACKAGE_ARCH =3D "all"
>=20
> -PR =3D "r2+gitr${SRCPV}"
> +PR =3D "r0+gitr${SRCPV}"
>=20
>  PROVIDES +=3D "wl12xx-firmware"
>  RPROVIDES_${PN} +=3D "wl12xx-firmware"
>  RREPLACES_${PN} +=3D "wl12xx-firmware"
>  RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>=20
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
> +# Tag: ol_r8.a8.08
> +SRCREV =3D "8e7f455e726f2bf92c568286a5cca510d7718dc1"
>  SRC_URI =3D "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=3Dgit \
>             file://Makefile \
>            "
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

