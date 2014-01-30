Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 14FBF5298F
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:49:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMnKFe008951
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:49:20 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMnKjB003300
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:49:20 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 30 Jan 2014 16:49:20 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE env variable
Thread-Index: AQHPHg0PVOCbe8b1AkKl8enBlNgwyZqd3tdg
Date: Thu, 30 Jan 2014 22:49:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6166A2@DFLE08.ent.ti.com>
References: <1391127157-6874-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1391127157-6874-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE env variable
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
X-List-Received-Date: Thu, 30 Jan 2014 22:49:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I made a mistake since this patch should go before " [PATCH] Update sd card=
 partition mount location". I can resubmit the patches to properly show the=
 dependencies if someone wants me to.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, January 30, 2014 6:13 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE env variable
>=20
> * Previously TSLIB_CALIBFILE env variable was only being exported if the =
mmc
>   partition was mounted.
> * Move the export statement outside of the if statement to insure that th=
is
>   important variable is always exported.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-graphics/tslib/ts-calibrate-init/init  |    3 ++-
>  .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/i=
nit b/meta-
> arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> index 5d5c0aa..ab19da3 100644
> --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> @@ -31,9 +31,10 @@ mount | grep /media/mmcblk0p1 | grep vfat >
> /dev/null 2>&1  if [ "$?" =3D "0" ]  then
>      tsfile=3D/media/mmcblk0p1/pointercal
> -    export TSLIB_CALIBFILE=3D$tsfile
>  fi
>=20
> +export TSLIB_CALIBFILE=3D$tsfile
> +
>  if [ ! -f $tsfile ] ; then
>      echo -n "Calibrating touchscreen (first time only)"
>      ts_calibrate
> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1=
.0.bb
> b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> index dde5c42..0915941 100644
> --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> @@ -6,7 +6,7 @@ RDEPENDS_${PN} +=3D "tslib"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afdc=
c6c60
> "
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  S =3D "${WORKDIR}"
>=20
> --
> 1.7.0.4


