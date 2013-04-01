Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EFB1C52981
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 20:31:05 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31KV5nZ031001
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:31:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31KV5wh030405
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:31:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 15:31:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] tisdk-connectivity: move ti-wifi-utils
Thread-Index: AQHOLvWOH/N6m0Ass0u2CTUgz5c+LJjB0ZMQ
Date: Mon, 1 Apr 2013 20:31:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C418FEB@DFLE08.ent.ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
	<1364833527-8440-2-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364833527-8440-2-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] tisdk-connectivity: move ti-wifi-utils
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
X-List-Received-Date: Mon, 01 Apr 2013 20:31:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

WLAN_COMMON packages were meant to aid the other software include the packa=
gegroup including those in the FIRMWARE_AND_DRIVERS section.

So if the firmware and drivers aren't being used then why bother bringing i=
n the connectivity packagegroup?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, April 01, 2013 11:25 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/3] tisdk-connectivity: move ti-wifi-utils
>=20
> * Move the ti-wifi-utils into the drivers and firmware section
>   because these utilities depend on the drivers and firmware being
>   in place.  Having them in the common section would break builds
>   where those packages were not available.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index d936f83..d3b1f46 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-connectivity.bb
> @@ -10,7 +10,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  # These are the packages that all platforms use for WLAN support
> WLAN_COMMON =3D "\
>      hostap-daemon \
> -    ti-wifi-utils \
>      wireless-tools \
>      htop \
>      netperf \
> @@ -31,6 +30,7 @@ WLAN_COMMON =3D "\
>  "
>=20
>  FIRMWARE_AND_DRIVERS =3D "\
> +    ti-wifi-utils \
>      ti-compat-wireless-wl12xx \
>      ti-compat-bluetooth \
>      bt-firmware \
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

