Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B71EB5299E
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 15:04:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2F4Z2j002286
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:04:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2F4Zcm031248
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:04:35 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 09:04:34 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/14] arago-tisdk-connectivity: Restored
	connectivity modules compilation
Thread-Index: AQHO72harDYphIu+LU+D0fqbfutghZpBAJLg
Date: Mon, 2 Dec 2013 15:04:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C9F05@DFLE08.ent.ti.com>
References: <1385993347-3223-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385993347-3223-1-git-send-email-yanivma@ti.com>
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
X-List-Received-Date: Mon, 02 Dec 2013 15:04:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You addressed all my comments thanks.
Although like my other comment please mention what the differences are betw=
een versions of a patch.

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Monday, December 02, 2013 8:09 AM
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
>  .../packagegroup-arago-tisdk-connectivity.bb       |   16 ++++++--------=
--
>  1 files changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 0aa019d..c159b9d 100644
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
> @@ -23,14 +23,11 @@ WLAN_COMMON =3D "\
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
>  #    oppserver
>=20
> @@ -42,8 +39,7 @@ WLAN_COMMON =3D "\
>  #    ti-compat-bluetooth
>=20
>  FIRMWARE_AND_DRIVERS =3D "\
> -    bt-firmware \
> -    bt-enable \
> +    "${@base_contains('WILINK_VERSION','WILINK-6',' oppserver bt-firmwar=
e
> bt-enable' , '',d)}"
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

