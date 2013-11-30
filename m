Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0165C5299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:47:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHla3Z009723
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHlaXG008963
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:36 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:47:35 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 09/14] wl18xx-firmware: update recipe to
	ol_r8.a8.08 version.
Thread-Index: AQHO7C6MOuF/521JrkKYmaCyFXbtV5o+EBmQ
Date: Sat, 30 Nov 2013 17:47:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C848A@DFLE08.ent.ti.com>
References: <1385638672-11964-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638672-11964-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 09/14] wl18xx-firmware: update recipe to	ol_r8.a8.08 version.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:47:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:38 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 09/14] wl18xx-firmware: update recipe to
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
> index 4b3f22a..5123c1b 100644
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
> +SRCREV =3D "3e3c6dd48ef34ff0f87e506d8699a37bb3cc8134"
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

