Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2C7C4529BC
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 16:07:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61G7mZ6025831
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:07:48 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61G7mxq002051
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:07:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 11:07:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/5] packagegroup-arago-tisdk-multimedia:
	don't	inlcude ipumm fw without mmip
Thread-Index: AQHPlUDP7jsnPvr0MUesK+5OXIDC7ZuLYqrw
Date: Tue, 1 Jul 2014 16:07:48 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D80EC@DFLE08.ent.ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
	<1404228360-7510-5-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404228360-7510-5-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] packagegroup-arago-tisdk-multimedia: don't	inlcude ipumm fw without mmip
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
X-List-Received-Date: Tue, 01 Jul 2014 16:07:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 10:26 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 5/5] packagegroup-arago-tisdk-multimedia:
> don't inlcude ipumm fw without mmip
>=20
> * Including the ipumm-fw package without mmip accelerators doesn't
>   make sense.  So don't package this when MACHINE_FEATURES doesn't
>   include mmip.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-multimedia.bb         |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index b044f58..417b0a8 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> @@ -40,15 +40,15 @@ MULTIMEDIA_append_am3517-evm =3D " \
>=20
>  ACCEL_FW =3D ""
>  ACCEL_FW_append_am57xx-evm =3D " \
> -    ipumm-fw \
> +    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
>      "
>=20
>  ACCEL_FW_append_omap5-evm =3D " \
> -    ipumm-fw \
> +    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
>      "
>=20
>  ACCEL_FW_append_dra7xx-evm =3D " \
> -    ipumm-fw \
> +    ${@base_contains('MACHINE_FEATURE', 'mmip', 'ipumm-fw', '', d)} \
>      dspdce-fw \
>      vis \
>      "
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

