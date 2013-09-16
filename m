Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ACBCE52990
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 19:39:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GJdX3i028315;
	Mon, 16 Sep 2013 14:39:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GJdXYd001249;
	Mon, 16 Sep 2013 14:39:33 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 16 Sep 2013 14:39:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass
	package modules automatically
Thread-Index: AQHOr169NmbGmsERu0m5zT+kvP0/yZnIxkeQ
Date: Mon, 16 Sep 2013 19:39:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5525D9@DFLE08.ent.ti.com>
References: <1378952413-6388-1-git-send-email-denis@denix.org>
In-Reply-To: <1378952413-6388-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass package modules automatically
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
X-List-Received-Date: Mon, 16 Sep 2013 19:39:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Base on this patch and a similar patch for ocf-crypto-module are their patc=
hes that need to be added in meta-arago to make sure the kernel modules are=
 included in the file system? =20

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, September 11, 2013 9:20 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass pack=
age
> modules automatically
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> The new method is to automatically package modules into kernel-module-
> <modname> and make the custom name depend on the standard unified one.
> Messing with FILES_${PN} usually causes problems, so avoid it and let
> module.bbclass do it's magic.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-
> bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> index c7fdfd1..1a418d7 100644
> --- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> +++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE =3D "omapl138"
>=20
>  INHIBIT_PACKAGE_STRIP =3D "1"
>=20
> -MACHINE_KERNEL_PR_append =3D "a+svnr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+svnr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  SRC_URI =3D
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dhttps;user=3Da=
nonym
> ous;pswd=3D''"
> @@ -28,5 +28,3 @@ do_install () {
>          install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
>          install -m 0755 ${S}/edmautils.ko
> ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
>  }
> -
> -FILES_${PN} =3D
> "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

