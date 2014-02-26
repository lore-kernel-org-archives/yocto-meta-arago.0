Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 036D352A20
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 23:07:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1QN7WVS031325;
	Wed, 26 Feb 2014 17:07:32 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1QN7WWQ028351;
	Wed, 26 Feb 2014 17:07:32 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 26 Feb 2014 17:07:32 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-source-ipk,
	packagegroup-*-crypto-sdk-host: enable cryptodev sources
Thread-Index: AQHPM0XOz5CB9WLHsU2PdK82wRrrWprIJ0TQ
Date: Wed, 26 Feb 2014 23:07:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6592BA@DFLE08.ent.ti.com>
References: <1393455273-32719-1-git-send-email-denis@denix.org>
In-Reply-To: <1393455273-32719-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-source-ipk, packagegroup-*-crypto-sdk-host: enable cryptodev sources
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
X-List-Received-Date: Wed, 26 Feb 2014 23:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are you planning on submitting patches that also integrate this with the to=
p level Makefile, SDK integrated Makefile and also create the necessary CCS=
 project?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, February 26, 2014 4:55 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] arago-source-ipk, packagegroup-*-crypto-sdk=
-
> host: enable cryptodev sources
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago-source-ipk.conf                 | 4 =
++++
>  .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb       | 6
> +++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-
> distro/conf/distro/arago-source-ipk.conf
> index d2a9600..691ba60 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -187,6 +187,10 @@ CREATE_SRCIPK_pn-linux-omapl1 =3D "1"
>  SRCIPK_INSTALL_DIR_pn-linux-omapl1 =3D "board-support/linux-${KVER}-
> psp${PSPREL}"
>  SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 =3D "${MACHINE_ARCH}"
>=20
> +CREATE_SRCIPK_pn-cryptodev =3D "1"
> +SRCIPK_INSTALL_DIR_pn-cryptodev =3D "board-support/cryptodev-${PV}"
> +SRCIPK_PACKAGE_ARCH_pn-cryptodev =3D "${MACHINE_ARCH}"
> +
>  CREATE_SRCIPK_pn-ti-linux-driver-examples =3D "1"
>  SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples =3D "example-
> applications/linux-driver-examples-${PV}"
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> index f86accf..0026ea3 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install crypto sources in SDK"
>  LICENSE =3D "MIT"
> -PR =3D "r5"
> +PR =3D "r6"
>=20
>  inherit packagegroup
>=20
> @@ -11,6 +11,10 @@ CRYPTO_RDEPENDS =3D ""
>  CRYPTO_RDEPENDS_append_ti33x =3D " ti-crypto-examples-src"
>  CRYPTO_RDEPENDS_append_ti43x =3D " ti-crypto-examples-src"
>=20
> +CRYPTO_RDEPENDS_append_ti33x =3D " cryptodev-src"
> +CRYPTO_RDEPENDS_append_ti43x =3D " cryptodev-src"
> +CRYPTO_RDEPENDS_append_dra7xx-evm =3D " cryptodev-src"
> +
>  CRYPTO_RDEPENDS_append_am37x-evm =3D "\
>      ti-ocf-crypto-module-src \
>  "
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

