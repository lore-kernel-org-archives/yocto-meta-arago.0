Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3529A52ABE
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 22:08:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PM8jDo010262
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:08:45 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PM8jqS005374
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 16:08:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 25 Feb 2016 16:08:45 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk Makefile: Replace PVR_NULLDRM with
	TARGET_PRODUCT per graphics DDK change
Thread-Index: AQHRcAYgpf7x3sBQbUqWmdapOBx5F589UeyA
Date: Thu, 25 Feb 2016 22:08:44 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581423B4D5@DFLE09.ent.ti.com>
References: <1456429962-17649-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1456429962-17649-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk Makefile: Replace PVR_NULLDRM with	TARGET_PRODUCT per graphics DDK change
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
X-List-Received-Date: Thu, 25 Feb 2016 22:08:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Thursday, February 25, 2016 2:53 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] tisdk Makefile: Replace PVR_NULLDRM with
> TARGET_PRODUCT per graphics DDK change
>=20
> PVR_NULLDRM is only applicable for DDK 1.9 and is no longer used.
> TARGET_PRODUCT is required for omapdrm-pvr build per DDK 1.14
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       | 7 +=
++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
> tisdk-makefile_1.0.bb
> index bcd78ba..a9ced7e 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb
> @@ -156,10 +156,9 @@ PLATFORM_OMAPDRM_ti33x =3D "omap335x"
>  PLATFORM_OMAPDRM_ti43x =3D "omap437x"
>  PLATFORM_OMAPDRM_omap-a15 =3D "omap5430"

Is PLATFORM_OMAPDRM used anymore?

>=20
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
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

