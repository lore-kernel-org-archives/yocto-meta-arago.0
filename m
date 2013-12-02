Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E48645299E
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 15:02:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2F2KMS011722
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:02:20 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2F2KNU029825
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:02:20 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 09:02:20 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 09/14 v2] wl18xx-firmware: update recipe
	to	ol_r8.a8.08 version.
Thread-Index: AQHO72hIswakrsXUzECDjc9xpfJtVJpA/93A
Date: Mon, 2 Dec 2013 15:02:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C9EF4@DFLE08.ent.ti.com>
References: <1385993312-3132-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385993312-3132-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 09/14 v2] wl18xx-firmware: update recipe to	ol_r8.a8.08 version.
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
X-List-Received-Date: Mon, 02 Dec 2013 15:02:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Although like my other comment please mention what the differences are betw=
een versions of a patch.

In this patch it looks like your simply changing the commit id for version =
ol_r8.a8.08


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Monday, December 02, 2013 8:09 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 09/14 v2] wl18xx-firmware: update recipe to
> ol_r8.a8.08 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  ...are_r8.a6.01.bb =3D> wl18xx-firmware_r8.a8.08.bb} |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)  copy meta-arago-extras=
/recipes-
> bsp/wl18xx-firmware/{wl18xx-firmware_r8.a6.01.bb =3D> wl18xx-
> firmware_r8.a8.08.bb} (86%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a8.08.bb
> similarity index 86%
> copy from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> copy to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.08.bb
> index 4b3f22a..6f9c8cb 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a
> +++ 8.08.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
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

