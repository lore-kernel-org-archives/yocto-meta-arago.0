Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 158DD529DD
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 21:40:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88LeCYu017147;
	Mon, 8 Sep 2014 16:40:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LeCl3007352;
	Mon, 8 Sep 2014 16:40:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 16:40:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-tisdk-makefile: add additional DTBs
	for am437 SK, J6Eco and am57x
Thread-Index: AQHPy57Q9OBl5gyXE0yfN6bm+Fh4K5v3w6Ug
Date: Mon, 8 Sep 2014 21:40:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72C4EB@DFLE08.ent.ti.com>
References: <1410206069-12634-1-git-send-email-denis@denix.org>
In-Reply-To: <1410206069-12634-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-tisdk-makefile: add additional DTBs for am437 SK, J6Eco and am57x
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
X-List-Received-Date: Mon, 08 Sep 2014 21:40:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 08, 2014 2:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] ti-tisdk-makefile: add additional DTBs for
> am437 SK, J6Eco and am57x
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 6 =
+++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-ti=
sdk-
> makefile_1.0.bb
> index 336f5cb..0077223 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> +++ e_1.0.bb
> @@ -36,7 +36,7 @@ SRC_URI =3D "\
>      file://Makefile_cryptodev \
>  "
>=20
> -PR =3D "r34"
> +PR =3D "r35"
>=20
>  MAKEFILES_COMMON =3D "linux \
>                      matrix-gui \
> @@ -98,10 +98,10 @@ PLATFORM_ARCH_omapl138 =3D "armv5te"
>  KERNEL_BUILD_CMDS =3D
> "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=3D${UBOO
> T_LOADADDRESS} uImage','zImage',d)}"
>=20
>  KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
> am335x-bone.dtb am335x-boneblack.dtb"
> -KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb"
> +KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb
> am437x-sk-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb"
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb dra72-evm.dtb am57xx-
> beagle-x15.dtb"
>=20
>  # This step will stitch together the final Makefile based on the support=
ed  #
> make targets.
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

