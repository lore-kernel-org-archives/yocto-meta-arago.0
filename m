Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C512452A79
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:40:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIesbm029054;
	Thu, 24 Jul 2014 13:40:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIesWM014111;
	Thu, 24 Jul 2014 13:40:54 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:40:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/11] matrix-gui-apps: set more specific
	CC-BY-SA-3.0 license
Thread-Index: AQHPorl0gTIW/rijZkmbLf4sjYrTm5uvmByg
Date: Thu, 24 Jul 2014 18:40:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C4C@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-10-git-send-email-denis@denix.org>
In-Reply-To: <1405709522-404-10-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 10/11] matrix-gui-apps: set more specific	CC-BY-SA-3.0 license
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
X-List-Received-Date: Thu, 24 Jul 2014 18:40:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 2:52 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 10/11] matrix-gui-apps: set more specific CC=
-BY-
> SA-3.0 license
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb       |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc          |=
 2 +-
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb    |=
 1 -
>  .../recipes-core/matrix/matrix-gui-armbenchmarks-demos_2.0.bb          |=
 1 -
>  .../recipes-core/matrix/matrix-gui-camera-loopback_2.0.bb              |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb         |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb   |=
 1 -
>  .../recipes-core/matrix/matrix-gui-display-control_2.0.bb              |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb |=
 3
> ++-
>  .../recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bb             |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0.bb |=
 1
> -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb       |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb      |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb      |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0.bb |=
 1
> -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb       |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb      |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb     |=
 1 -
>  meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb     |=
 1 -
>  19 files changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
> demos_2.0.bb
> index e1c3023..b87b925 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "3D demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index c985859..1e18411 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -1,4 +1,4 @@
> -LICENSE =3D "CC-BY-SA"
> +LICENSE =3D "CC-BY-SA-3.0"
>  #By default all Matrix v2 applications use the same license.
>  LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> images_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
> images_2.0.bb
> index 4d271c7..f422bc8 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.b
> +++ b
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Image package for Matrix GUI v2 Applications"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmar=
ks-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> armbenchmarks-demos_2.0.bb
> index 484aafe..7aa185d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-
> demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-dem
> +++ os_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Arm Benchmarks Applications for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-
> loopback_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera=
-
> loopback_2.0.bb
> index ae613fd..c105c6f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-
> loopback_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2
> +++ .0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Camera loopback application for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.=
bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
> index 5b80b90..5937c6d 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Clock setting descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb
> index 92fc916..04b0825 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.
> +++ bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Cryptography demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-
> control_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-display=
-
> control_2.0.bb
> index a93c7b8..b3094b2 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.=
0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2
> +++ .0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Display control descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-
> demos_2.0.bb
> index 8a8459a..e716f78 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-
> demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.
> +++ 0.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION =3D "Ethernet example applications"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA & GPLv2+"
>=20
>  require matrix-gui-apps-git.inc
>=20
> +LICENSE =3D "CC-BY-SA-3.0 & GPLv2+"
> +
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM} \
>=20
> file://../../udhcpd_eth1.conf;beginline=3D1;endline=3D14;md5=3D70668b1ed5=
416406
> a61ef9abdd90d601 \  "
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> multimedia-demos_2.0.bb
> index 55bed44..739e03f 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-
> demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_
> +++ 2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Multimedia demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-
> demos_2.0.bb
> index bc337ff..9630081 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.
> +++ 0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Oprofile demo applications for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> demos_2.0.bb
> index a040deb..e174574 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Power management demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-
> demos_2.0.bb
> index 3eb470c..0a09e33 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "PRU demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-
> demos_2.0.bb
> index 6f6ad69..e0ff0ca 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Qt4 demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-
> demos_2.0.bb
> index 6f51dba..faa64a3 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0=
.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.
> +++ 0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Settings demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> submenus_2.0.bb
> index d794277..cfbe124 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Submenu packages for Matrix GUI v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-
> demos_2.0.bb
> index 0c58f17..6a1ecc8 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "USB demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-
> demos_2.0.bb
> index b42c9f3..91d5d58 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "V4l2 demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-
> demos_2.0.bb
> index 263ae91..0b1cec5 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
> @@ -1,6 +1,5 @@
>  DESCRIPTION =3D "Wifi demo descriptions for Matrix v2"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> -LICENSE =3D "CC-BY-SA"
>=20
>  require matrix-gui-apps-git.inc
>=20
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

