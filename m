Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 75B5652A74
	for <meta-arago@arago-project.org>;
	Sun, 12 May 2013 23:33:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4CNX6LQ028545
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:33:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4CNX68C004858
	for <meta-arago@arago-project.org>; Sun, 12 May 2013 18:33:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sun, 12 May 2013 18:33:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] branding-amsdk: Update to latest Graphics SDK version
Thread-Index: AQHOT2c6DoI0HsMShESF6jaCkFP2sJkCMzqA
Date: Sun, 12 May 2013 23:33:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C45458C@DFLE08.ent.ti.com>
References: <1368400797-32039-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1368400797-32039-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-amsdk: Update to latest Graphics SDK version
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
X-List-Received-Date: Sun, 12 May 2013 23:33:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Sunday, May 12, 2013 6:20 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] branding-amsdk: Update to latest Graphics SDK version
>=20
> ---
>  .../conf/distro/include/branding-amsdk.inc         |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/m=
eta-
> arago-distro/conf/distro/include/branding-amsdk.inc
> index d300263..8fdf93d 100644
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> @@ -8,7 +8,6 @@ PREFERRED_PROVIDER_virtual/bootloader_am335x-evm =3D
> "u-boot-am33x"
>  PREFERRED_PROVIDER_u-boot_am335x-evm =3D "u-boot-am33x"
>  PREFERRED_VERSION_u-boot-am33x =3D "2013.01.01"
>=20
> -# Use v4.08.00.02 of the Graphics SDK
> -PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.02"
> -PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.02"
> -
> +# Use v4.09.00.01 of the Graphics SDK
> +PREFERRED_VERSION_omap3-sgx-modules =3D "4.09.00.01"
> +PREFERRED_VERSION_libgles-omap3 =3D "4.09.00.01"
> --
> 1.7.0.4


