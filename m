Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 27A695299E
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 15:07:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2F7TXY008874
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:07:29 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2F7Tw5000683
	for <meta-arago@arago-project.org>; Mon, 2 Dec 2013 09:07:29 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 09:07:29 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 11/14 v2] arago-prefs: update default
	value for	am335x and am43x for WILINK-8
Thread-Index: AQHO72hQ2nbhflnd+U6yt0NZe6EgkZpBAPjg
Date: Mon, 2 Dec 2013 15:07:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C9F19@DFLE08.ent.ti.com>
References: <1385993331-3176-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385993331-3176-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 11/14 v2] arago-prefs: update default value for	am335x and am43x for WILINK-8
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
X-List-Received-Date: Mon, 02 Dec 2013 15:07:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Like in the previous patches please mention what the differences are betwee=
n versions of a patch.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Monday, December 02, 2013 8:09 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 11/14 v2] arago-prefs: update default value =
for
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
> index 24f3785..616885e 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -92,7 +92,10 @@ PREFERRED_VERSION_bluez-hcidump =3D "2.2"
>  PREFERRED_VERSION_bash =3D "3.2.48"
>  PREFERRED_VERSION_gettext =3D "0.16.1"
>=20
> -WILINK_VERSION =3D "WILINK-6"
> +WILINK_VERSION =3D "WILINK-8"
[Franklin] Don't bother changing this. The point of those SOC specific over=
rides below is to allow other platforms to stick with wilink 6  (am18 and a=
m37) and only use wilink 8 for platforms that need it. Right now your forci=
ng all platforms to use wilink 8 with the above statement.

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

