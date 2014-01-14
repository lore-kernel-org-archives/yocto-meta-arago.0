Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 71090529CF
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSbnn013913
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSbAQ030795
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:37 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:35 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 6/8] arago-prefs: update default value for
	am335x and am43x for WILINK-8
Thread-Index: AQHO8+5e3NaUN6SXV0exHYMwAxGFgJqEcTDQ
Date: Tue, 14 Jan 2014 13:28:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604D9B@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-6-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-6-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] arago-prefs: update default value for	am335x and am43x for WILINK-8
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 6/8] arago-prefs: update default value for
> am335x and am43x for WILINK-8
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Also change the default supported WILINK version
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 7d9afe7..412fa3a 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -99,7 +99,10 @@ PREFERRED_VERSION_bluez-hcidump =3D "2.2"
>  PREFERRED_VERSION_bash =3D "3.2.48"
>  PREFERRED_VERSION_gettext =3D "0.16.1"
>=20
> -WILINK_VERSION =3D "WILINK-6"
> +WILINK_VERSION =3D "WILINK-8"
> +# For AM335x & AM43x Wilink 8 is now the default version to be used
> +WILINK_VERSION_ti33x =3D "WILINK-8"
> +WILINK_VERSION_ti43x =3D "WILINK-8"
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

