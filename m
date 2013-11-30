Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3C99F5299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 18:02:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUI23xb011302
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 12:02:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUI2337020217
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 12:02:03 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 12:02:03 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 13/14] crda: Update recipe to 1.1.3 version.
Thread-Index: AQHO7C6t74O9UOUidk2wSEsXE3P0zZo+E4Hw
Date: Sat, 30 Nov 2013 18:02:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C8539@DFLE08.ent.ti.com>
References: <1385638728-12135-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638728-12135-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 13/14] crda: Update recipe to 1.1.3 version.
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
X-List-Received-Date: Sat, 30 Nov 2013 18:02:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:39 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 13/14] crda: Update recipe to 1.1.3 version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Added missing libnl3 flag.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  .../crda/{crda_1.1.1.bb =3D> crda_1.1.3.bb}          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)  copy meta-arago-extras=
/recipes-
> connectivity/crda/{crda_1.1.1.bb =3D> crda_1.1.3.bb} (97%)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 5c20a0f..e9dc865 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -85,7 +85,7 @@ PREFERRED_VERSION_readline-native =3D "5.2"
>  PREFERRED_VERSION_readline-nativesdk =3D "5.2"
>=20
>  PREFERRED_VERSION_libnl =3D "3.2.21"
> -PREFERRED_VERSION_crda =3D "1.1.1"
> +PREFERRED_VERSION_crda =3D "1.1.3"
[Franklin] believe crda 1.1.1 is needed for Wilink 6 so select the version =
of crda to use based on the Wilink version used. Something like below would=
 work.
PREFERRED_VERSION_crda  =3D "${@base_contains('WILINK_VERSION','WILINK-8','=
1.1.3','1.1.1',d)}"
>  PREFERRED_VERSION_obex =3D "0.34"
>  PREFERRED_VERSION_bluez4 =3D "4.101"
>  PREFERRED_VERSION_bluez-hcidump =3D "2.2"
> diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/=
meta-
> arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> similarity index 97%
> copy from meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> copy to meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> index e3880a1..9c1e0c2 100644
> --- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> +++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D
> "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=3Dcrda \
>             http://wireless.kernel.org/download/wireless-
> regdb/regulatory.bins/2011.04.28-regulatory.bin;name=3Dreg \  "
>=20
> -CFLAGS +=3D " -DCONFIG_LIBNL20"
> +CFLAGS +=3D " -DCONFIG_LIBNL32"
>=20
>  EXTRA_OEMAKE =3D "MAKEFLAGS=3D"
>  do_compile() {
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

