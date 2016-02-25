Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 49EA752AA7
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 23:11:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PNBEIT008167
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 17:11:14 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PNBEBQ003094
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 17:11:14 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 25 Feb 2016 17:11:14 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH V3] tisdk Makefile: Replace PVR_NULLDRM
	and	PLATFORM_OMAPDRM with TARGET_PRODUCT per graphics DDK change
Thread-Index: AQHRcCF+yYv+qmaFG0mfp9jQvVDdcJ89Y10A
Date: Thu, 25 Feb 2016 23:11:14 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581423B572@DFLE09.ent.ti.com>
References: <1456441720-26453-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1456441720-26453-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH V3] tisdk Makefile: Replace PVR_NULLDRM and	PLATFORM_OMAPDRM with TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 23:11:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Thursday, February 25, 2016 6:09 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH V3] tisdk Makefile: Replace PVR_NULLDRM
> and PLATFORM_OMAPDRM with TARGET_PRODUCT per graphics DDK change
>=20
> PVR_NULLDRM and PLATFORM_OMAPDRM are only applicable for DDK 1.9
> and no longer used.
> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 15 ++++-----=
------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> tisdk-makefile_1.0.bb
> index bcd78ba..c49909e 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> +++ e_1.0.bb
> @@ -151,15 +151,9 @@ MAKEFILES_append_k2e-evm =3D " opencl-examples \
> PLATFORM_ARCH =3D "armv7-a"
>  PLATFORM_ARCH_omapl138 =3D "armv5te"
>=20
> -PLATFORM_OMAPDRM =3D ""
> -PLATFORM_OMAPDRM_ti33x =3D "omap335x"
> -PLATFORM_OMAPDRM_ti43x =3D "omap437x"
> -PLATFORM_OMAPDRM_omap-a15 =3D "omap5430"
> -
> -PVR_NULLDRM =3D ""
> -PVR_NULLDRM_ti33x =3D "1"
> -PVR_NULLDRM_ti43x =3D "0"
> -PVR_NULLDRM_omap-a15 =3D "0"
> +TARGET_PRODUCT =3D "jacinto6evm"
> +TARGET_PRODUCT_ti33x =3D "ti335x"
> +TARGET_PRODUCT_ti43x =3D "ti437x"
>=20
>  PLATFORM_DEBUGSS =3D ""
>  PLATFORM_DEBUGSS_dra7xx =3D "DRA7xx_PLATFORM"
> @@ -238,8 +232,7 @@ do_install () {
>      sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/"
> ${D}/Makefile
>      sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
>=20
> -    sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/"
> ${D}/Makefile
> -    sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
> +    sed -i -e "s/__TARGET_PRODUCT__/${TARGET_PRODUCT}/" ${D}/Makefile
>      sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g"
> ${D}/Makefile
>      sed -i -e
> "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g"
> ${D}/Makefile
>      sed -i -e
> "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}
> /g" ${D}/Makefile
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

