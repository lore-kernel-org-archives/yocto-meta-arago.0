Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 51DE15299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:51:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHpYFH022362
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:51:34 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHpYD4025147
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:51:34 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:51:34 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 11/14] arago-prefs: update default value
	for	am335x for WILINK-8
Thread-Index: AQHO7C6hYZUWxYdgbkWNyg5Co+Mw65o+EJ/A
Date: Sat, 30 Nov 2013 17:51:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C84F7@DFLE08.ent.ti.com>
References: <1385638708-12051-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638708-12051-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 11/14] arago-prefs: update default value for	am335x for WILINK-8
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
X-List-Received-Date: Sat, 30 Nov 2013 17:51:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Shouldn't AM43x also be supported? If so WILINK_VERSION_ti43x =3D "WILINK-8=
" should also be set.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:38 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 11/14] arago-prefs: update default value for
> am335x for WILINK-8
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Also change the default supported WILINK version
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 24f3785..5c20a0f 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -92,7 +92,9 @@ PREFERRED_VERSION_bluez-hcidump =3D "2.2"
>  PREFERRED_VERSION_bash =3D "3.2.48"
>  PREFERRED_VERSION_gettext =3D "0.16.1"
>=20
> -WILINK_VERSION =3D "WILINK-6"
> +WILINK_VERSION =3D "WILINK-8"
> +# For AM335x Wilink 8 is now the default version to be used
> +WILINK_VERSION_ti33x =3D "WILINK-8"
>  PREFERRED_PROVIDER_wl12xx-firmware =3D
> "${@base_contains('WILINK_VERSION','WILINK-8','wl18xx-firmware','wl12xx-
> firmware',d)}"
>  PREFERRED_PROVIDER_ti-compat-wireless-wl12xx =3D
> "${@base_contains('WILINK_VERSION','WILINK-8','ti-compat-wireless-
> wl18xx','ti-compat-wireless-wl12xx',d)}"
>  PREFERRED_PROVIDER_hostap-daemon =3D
> "${@base_contains('WILINK_VERSION','WILINK-8','hostap-daemon-
> wl18xx','hostap-daemon',d)}"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

