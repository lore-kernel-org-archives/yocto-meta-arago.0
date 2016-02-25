Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 090E8529AD
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 22:57:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PMvt6a029886
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:57:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PMvtnj006636
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:57:55 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 25 Feb 2016 16:57:55 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH V2] tisdk Makefile: Replace PVR_NULLDRM
	with	TARGET_PRODUCT per graphics DDK change
Thread-Index: AQHRcB9fef7Gd10G7U2ae6ISLnyy5589X1Kw
Date: Thu, 25 Feb 2016 22:57:54 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581423B553@DFLE09.ent.ti.com>
References: <1456440810-23861-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1456440810-23861-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH V2] tisdk Makefile: Replace PVR_NULLDRM with	TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 22:57:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Thursday, February 25, 2016 5:54 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH V2] tisdk Makefile: Replace PVR_NULLDRM
> with TARGET_PRODUCT per graphics DDK change
>=20
> PVR_NULLDRM is only applicable for DDK 1.9 and is no longer used.
> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 9 +++=
+-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> tisdk-makefile_1.0.bb
> index bcd78ba..ccfd734 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> @@ -156,10 +156,9 @@ PLATFORM_OMAPDRM_ti33x =3D "omap335x"
>  PLATFORM_OMAPDRM_ti43x =3D "omap437x"
>  PLATFORM_OMAPDRM_omap-a15 =3D "omap5430"
>=20

What about PLATFORM_OMAPDRM? Use for this was also removed with the change =
to the makefile fragment.

From commit (346c53c5e38d02b1901936bfb7388db55e3e30ec):

-       make -C ./eurasia_km/eurasiacon/build/linux2/__PLATFORM_OMAPDRM___l=
inux ARCH=3Darm KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR) PVR_NULLDRM=3D__PVR_=
NULLDRM__
+       make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=3Darm =
TARGET_PRODUCT=3D__TARGET_PRODUCT__ KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR)


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
> @@ -239,7 +238,7 @@ do_install () {
>      sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
>=20
>      sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/"
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

