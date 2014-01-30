Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B25DD529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:28:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMSQYF029511
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:28:26 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMSQQr010583
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:28:26 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 30 Jan 2014 16:28:25 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] Update sd card partition mount location
Thread-Index: AQHPHgpD1k67ISPrWEeC+//NnyHYspqd2JZg
Date: Thu, 30 Jan 2014 22:28:24 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6165AF@DFLE08.ent.ti.com>
References: <1391125952-5569-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1391125952-5569-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] Update sd card partition mount location
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
X-List-Received-Date: Thu, 30 Jan 2014 22:28:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Another patch should be sent soon that is tweaking mount.sh that this patch=
 depends on.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, January 30, 2014 5:53 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] Update sd card partition mount location
>=20
> * The location where the mmc partitions will be mounted has changed from
> /media/
>    to /run/media/ (/var/run/media).
> * Update the various scripts that care about the location of the mmc part=
itions
>   that are mounted in /media.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-tisdk/parse-ip/parse-ip.bb             |    2 +-
>  .../recipes-tisdk/parse-ip/parse-ip/init           |    4 ++--
>  .../recipes-graphics/tslib/ts-calibrate-init/init  |    4 ++--
>  .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-=
arago-
> distro/recipes-tisdk/parse-ip/parse-ip.bb
> index cf3ad89..f20db31 100644
> --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> @@ -7,7 +7,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  SRC_URI =3D "file://init"
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  S =3D "${WORKDIR}"
>=20
> diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/met=
a-arago-
> distro/recipes-tisdk/parse-ip/parse-ip/init
> index 0020ea2..4050efb 100644
> --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> @@ -32,9 +32,9 @@
>=20
>  case "$1" in
>      start )
> -        if [ -e /media/mmcblk0p1 ]
> +        if [ -e /run/media/mmcblk0p1 ]
>          then
> -            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | c=
ut -d: -f2 | awk
> '{print $1}'` > /media/mmcblk0p1/.ipaddr
> +            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | c=
ut -d: -f2 | awk
> '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
>              sync
>  	    sync
>  	fi
> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/i=
nit b/meta-
> arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> index ab19da3..db5c278 100644
> --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> @@ -27,10 +27,10 @@ fi
>=20
>  #TODO how can we find the SD card and not eMMC?  can we look for a "boot=
"
>  # LABEL?
> -mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> +mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
>  if [ "$?" =3D "0" ]
>  then
> -    tsfile=3D/media/mmcblk0p1/pointercal
> +    tsfile=3D/run/media/mmcblk0p1/pointercal
>  fi
>=20
>  export TSLIB_CALIBFILE=3D$tsfile
> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1=
.0.bb
> b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> index 0915941..747a9ef 100644
> --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> @@ -6,7 +6,7 @@ RDEPENDS_${PN} +=3D "tslib"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afdc=
c6c60
> "
>=20
> -PR =3D "r3"
> +PR =3D "r4"
>=20
>  S =3D "${WORKDIR}"
>=20
> --
> 1.7.0.4


