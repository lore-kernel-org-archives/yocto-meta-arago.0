Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 50ECE52A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 14:58:38 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31EwbtX000665
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:58:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31EwbMF029224
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 09:58:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 09:58:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs for Wilink 6
	recipes
Thread-Index: AQHOLuj0/n++KGiEMUWqw7ELF9B5JZjBdO4g
Date: Mon, 1 Apr 2013 14:58:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C418AFF@DFLE08.ent.ti.com>
References: <1364828095-28755-1-git-send-email-fcooper@ti.com>
	<1364828095-28755-17-git-send-email-fcooper@ti.com>
In-Reply-To: <1364828095-28755-17-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs for Wilink 6 recipes
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
X-List-Received-Date: Mon, 01 Apr 2013 14:58:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. Forgot to add v2 to the header.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, April 01, 2013 9:55 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs for Wilink 6
> recipes
>=20
> * Currently two versions of Wilink 6 need to be supported.
> * The latest version supports the PG 3 wilink 6 module which is the versi=
on
> that
>   comes with the am37x-evm and am335x-evm .
> * An older version supports the PG 2 wilink 6 module which is the version=
 that
>   comes with the am180x-evm.
> * Specifying the PREFERRED_VERSION to match this requirement.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> None. Apart of new patchset.
>=20
>  meta-arago-distro/conf/distro/arago.conf |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
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
> +
>  # Disable polkit's systemd configuration from meta-oe  POLKITAUTH =3D ""
>=20
> --
> 1.7.0.4


