Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C6674529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:22:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCMVEw008130
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:22:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCMVeu002138
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:22:31 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:22:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs
	for	Wilink 6 recipes
Thread-Index: AQHOJRT35Hq2J+8k7EaTsH78FfmylpiwEuvQ
Date: Thu, 21 Mar 2013 12:22:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948EDAF@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-17-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-17-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs for	Wilink 6 recipes
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
X-List-Received-Date: Thu, 21 Mar 2013 12:22:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 17/17] arago.conf: Set
> PREFERRED_VERSIONs for Wilink 6 recipes
>=20
> * Currently two versions of Wilink 6 need to be supported.
> * The latest version supports the PG 3 wilink 6 module which is
> the version that
>   comes with the am37x-evm and am335x-evm .
> * An older version supports the PG 2 wilink 6 module which is the
> version that
>   comes with the am180x-evm.
> * Specifying the PREFERRED_VERSION to match this requirement.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf |   17
> +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> arago-distro/conf/distro/arago.conf
> index 9e43ea3..44141c1 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -105,6 +105,23 @@ PREFERRED_VERSION_bluez-hcidump =3D "2.2"
>  PREFERRED_VERSION_bash =3D "3.2.48"
>  PREFERRED_VERSION_gettext =3D "0.16.1"
>=20
> +# Support Wilink 6 PG 3 modules
> +PREFERRED_VERSION_ti-compat-bluetooth =3D "r5.sp3.05"
> +PREFERRED_VERSION_ti-compat-wireless-wl12xx =3D "r5.sp4.01"
> +PREFERRED_VERSION_wl12xx-firmware =3D "r5.sp4.01"
> +PREFERRED_VERSION_wpa-supplicant =3D "r5.sp4.01"
> +PREFERRED_VERSION_hostap-daemon =3D "r5.sp4.01"
> +PREFERRED_VERSION_ti-wifi-utils =3D "r5.sp3.05"
> +
> +# Support Wilink 6 PG 2 modules
> +# By default am180x-evms come with an outdated wilink 6 module
> +PREFERRED_VERSION_ti-compat-bluetooth_am180x-evm =3D "r5.00.18"
> +PREFERRED_VERSION_ti-compat-wireless-wl12xx_am180x-evm =3D
> "r5.00.18"
> +PREFERRED_VERSION_wl12xx-firmware_am180x-evm =3D "r5.00.18"
> +PREFERRED_VERSION_wpa-supplicant_am180x-evm =3D "r5.00.18"
> +PREFERRED_VERSION_hostap-daemon_am180x-evm =3D "r5.00.18"
> +PREFERRED_VERSION_ti-wifi-utils_am180x-evm =3D "r5.00.18"

Could you use a variable here?  I see for the PG3 modules that the versions=
 don't all match, but I'm thinking it might be nice to have only one update=
 place.  That being said I don't expect this to change going forward so I'm=
 OK if you want to leave it alone.

> +
>  # Disable polkit's systemd configuration from meta-oe
>  POLKITAUTH =3D ""
>=20
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

