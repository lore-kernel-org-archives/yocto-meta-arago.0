Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3FAC752099
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 22:40:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UMeMe9005679
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:40:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMeMgF015424
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:40:22 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 30 Sep 2013 17:40:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: Remove U-Boot preferred version
Thread-Index: AQHOviDzLNiHOOJqPUiE69Yn3ECrlpne36XQ
Date: Mon, 30 Sep 2013 22:40:21 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C56575F@DFLE08.ent.ti.com>
References: <1380577872-18754-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1380577872-18754-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-prefs: Remove U-Boot preferred version
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
X-List-Received-Date: Mon, 30 Sep 2013 22:40:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, September 30, 2013 4:51 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago-prefs: Remove U-Boot preferred versio=
n
>=20
> * The default preferred provider for u-boot is the u-boot-ti-staging
>   so we can remove the need to pin the version since this would
>   then need to be updated for each revision.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 70f02b9..1f3d9ed 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -32,7 +32,6 @@ PREFERRED_VERSION_linux-libc-headers_am437x-evm =3D
> "3.8"
>  PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader_am437x-evm =3D "u-boot-ti-staging"
>  PREFERRED_PROVIDER_u-boot_am437x-evm =3D "u-boot-ti-staging"
> -PREFERRED_VERSION_u-boot-ti-staging_am437x-evm =3D "2013.07+2013.10-
> rc1"
>=20
>  PREFERRED_VERSION_linux-libc-headers_am180x-evm =3D "2.6.37.2"
>  PREFERRED_PROVIDER_virtual/kernel_am180x-evm =3D "linux-omapl138-psp"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

