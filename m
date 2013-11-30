Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B16A95299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 18:20:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUIKsUB012442
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 12:20:54 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUIKsi4032190
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 12:20:54 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 12:20:53 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/14] arago-tisdk-connectivity: Restored
	connectivity modules compilation
Thread-Index: AQHO7C6n5OJ8jHbU90+fmJQe8lP8jpo+EnBQ
Date: Sat, 30 Nov 2013 18:20:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C85EC@DFLE08.ent.ti.com>
References: <1385638718-12093-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638718-12093-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 12/14] arago-tisdk-connectivity: Restored	connectivity modules compilation
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
X-List-Received-Date: Sat, 30 Nov 2013 18:20:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch only will make things work for Wilink 8 since  your hard coding =
Wilink 8 versions of the recipes. Just let the PREFERRED_PROVIDER handle se=
tting the correct recipes.
Also make tweaks to include only the bluetooth stuff if Wilink 6 is being u=
sed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:39 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 12/14] arago-tisdk-connectivity: Restored
> connectivity modules compilation
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Modules compatibility issues with libnl were fixed.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |   13 +++++--------
>  1 files changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 0aa019d..2ef4353 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-connectivity.bb
[Franklin] PR bump is missing.
> @@ -23,14 +23,11 @@ WLAN_COMMON =3D "\
>      pulseaudio-module-bluetooth-device \
>      eventdump \
>      ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
> +    wpa-supplicant-wl18xx \
[Franklin] Replace this with wpa-supplicant
> +    crda \
> +    hostap-daemon-wl18xx \
[Franklin] Replace this with hostap-daemon
> +    ti-wifi-utils-wl18xx \
[Franklin] Replace this with ti-wifi-utils
>  "
> -
> -# TI/ECS versions of wpa-supplicant/crda/hostap/wifi-utils require older=
 libnl, -
> # which no longer exists
> -#    wpa-supplicant
> -#    crda
> -#    hostap-daemon
> -#    ti-wifi-utils
>  # No bluetooth/bluetooth.h
>  #    oppserver
>=20
> @@ -44,7 +41,7 @@ WLAN_COMMON =3D "\
>  FIRMWARE_AND_DRIVERS =3D "\
>      bt-firmware \
>      bt-enable \
[Franklin] Change this so it includes this only if WILINK 6 is being use
> -    wl12xx-firmware \
> +    wl18xx-firmware \
[Franklin] Leave wl12xx-firmware.
>  "
>=20
>  BLUETOOTH_STACK =3D "\
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

