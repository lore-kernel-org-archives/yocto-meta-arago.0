Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BAD3552A67
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 20:52:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PKq7JY021658
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:52:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PKq7dG029628
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 15:52:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 15:52:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-core-tisdk-image: Update DTB_FILTER
	to	pickup GP DTB
Thread-Index: AQHO0cEogRUWVccdQkW8DOtFGj13FJoF5JRg
Date: Fri, 25 Oct 2013 20:52:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C587CDB@DFLE08.ent.ti.com>
References: <1382736238-15829-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1382736238-15829-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-core-tisdk-image: Update DTB_FILTER to	pickup GP DTB
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
X-List-Received-Date: Fri, 25 Oct 2013 20:52:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, October 25, 2013 4:24 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago-core-tisdk-image: Update DTB_FILTER t=
o
> pickup GP DTB
>=20
> * The AM437x GP EVM DTB uses am437x so change the filter to use
>   am43 which will match both the GP and EPOS EVMs
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image=
.inc
> b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 368fa47..74c2b87 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -20,7 +20,7 @@ DTB_FILTER =3D "unknown"
>  DTB_FILTER_ti33x =3D "am335x"
>  DTB_FILTER_omap5-evm =3D "omap5"
>  DTB_FILTER_dra7xx-evm =3D "dra7"
> -DTB_FILTER_ti43x =3D "am43x"
> +DTB_FILTER_ti43x =3D "am43"
>=20
>  # List of target side images to build for the SDK  TARGET_IMAGES =3D "ar=
ago-
> base-tisdk-image tisdk-rootfs-image"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

