Return-Path: <yanivma@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2B430529C3
	for <meta-arago@arago-project.org>;
	Sun,  1 Dec 2013 15:35:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB1FZEHE014680
	for <meta-arago@arago-project.org>; Sun, 1 Dec 2013 09:35:14 -0600
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB1FZDl9006561
	for <meta-arago@arago-project.org>; Sun, 1 Dec 2013 09:35:14 -0600
Received: from DNCE04.ent.ti.com ([fe80::50a2:cda3:1471:a76]) by
	DNCE70.ent.ti.com ([fe80::78db:4901:78e8:69bb%20]) with mapi id
	14.02.0342.003; Sun, 1 Dec 2013 16:35:13 +0100
From: "Machani, Yaniv" <yanivma@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 13/14] crda: Update recipe to 1.1.3 version.
Thread-Index: AQHO7C6qWe6t48yAoUCI4rFzwqeRkZo+A2kAgAF45dA=
Date: Sun, 1 Dec 2013 15:35:12 +0000
Message-ID: <AE1C82FB3D0EC64DB1F752C81CBD11011AC74AF1@DNCE04.ent.ti.com>
References: <1385638728-12135-1-git-send-email-yanivma@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C5C8539@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5C8539@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
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
X-List-Received-Date: Sun, 01 Dec 2013 15:35:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Saturday, November 30, 2013 8:02 PM
To: Machani, Yaniv; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 13/14] crda: Update recipe to 1.1.3 versio=
n.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
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
>  2 files changed, 2 insertions(+), 2 deletions(-)  copy=20
> meta-arago-extras/recipes- connectivity/crda/{crda_1.1.1.bb =3D>=20
> crda_1.1.3.bb} (97%)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc=20
> b/meta- arago-distro/conf/distro/include/arago-prefs.inc
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

[Machani, Yaniv] As crda 1.1.1 does not support libnl3, it's required to mo=
ve forward to version 1.1.3.=20
AFAIK, the crda version should be irrelevant to the Wilink version.

>  PREFERRED_VERSION_obex =3D "0.34"
>  PREFERRED_VERSION_bluez4 =3D "4.101"
>  PREFERRED_VERSION_bluez-hcidump =3D "2.2"
> diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb=20
> b/meta- arago-extras/recipes-connectivity/crda/crda_1.1.3.bb
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

