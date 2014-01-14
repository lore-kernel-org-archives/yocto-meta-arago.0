Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 81D41529CF
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSgYu006544
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:42 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSgIt026404
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:42 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:42 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 7/8] arago-tisdk-connectivity: Restored
	connectivity modules compilation
Thread-Index: AQHO8+5eYIg34kVBoUmCvQV4VYB28ZqEcTVQ
Date: Tue, 14 Jan 2014 13:28:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604DA2@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-7-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-7-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] arago-tisdk-connectivity: Restored	connectivity modules compilation
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 7/8] arago-tisdk-connectivity: Restored
> connectivity modules compilation
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Modules compatibility issues with libnl were fixed.
> - Removed unused components
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |   17 ++++++--------=
---
>  1 files changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 0aa019d..d7d2ef2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth packages into the ta=
rget FS"
>  LICENSE =3D "MIT"
> -PR =3D "r17"
> +PR =3D "r18"
>=20
>  inherit packagegroup
>=20
> @@ -23,16 +23,12 @@ WLAN_COMMON =3D "\
>      pulseaudio-module-bluetooth-device \
>      eventdump \
>      ${@base_contains('WILINK_VERSION','WILINK-8','wlconf','',d)} \
> +    wpa-supplicant \
> +    crda \
> +    hostap-daemon \
> +    ti-wifi-utils \
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
> -#    oppserver
>=20
>  # netperf has non-standard license, needs verifying
>  #    netperf
> @@ -42,8 +38,7 @@ WLAN_COMMON =3D "\
>  #    ti-compat-bluetooth
>=20
>  FIRMWARE_AND_DRIVERS =3D "\
> -    bt-firmware \
> -    bt-enable \
> +    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver
> + bt-firmware bt-enable' , '',d)}"\
>      wl12xx-firmware \
>  "
>=20
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

