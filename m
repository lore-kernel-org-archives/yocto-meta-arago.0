Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B1D7F5298B
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 16:05:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61G5oCm001538
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:05:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61G5ob2006441
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:05:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 11:05:50 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/5] arago-prefs: set PREFERRED_PROVIDER
	for	gstreamer based on mmip
Thread-Index: AQHPlUDLe8MJ/IhCHEqdORt+ttfBV5uLYhsg
Date: Tue, 1 Jul 2014 16:05:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D80B1@DFLE08.ent.ti.com>
References: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
	<1404228360-7510-2-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404228360-7510-2-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] arago-prefs: set PREFERRED_PROVIDER for	gstreamer based on mmip
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
X-List-Received-Date: Tue, 01 Jul 2014 16:05:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 10:26 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/5] arago-prefs: set PREFERRED_PROVIDER for
> gstreamer based on mmip
>=20
> * Set the preferred provider for GStreamer elements to accelerated
>   elements only if the MACHINE_FEATURES include the mmip attribute.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 6773053..8261d10 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -99,6 +99,11 @@ PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-
> supplicant"
>  PREFERRED_PROVIDER_wpa-supplicant_ti33x =3D "wpa-supplicant-wl18xx"
>  PREFERRED_PROVIDER_wpa-supplicant_ti43x =3D "wpa-supplicant-wl18xx"
>=20
> +PREFERRED_PROVIDER_gstreamer =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel',
> 'gstreamer', d)}"
> +PREFERRED_PROVIDER_gst-plugins-bad =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel',
> 'gst-plugins-bad', d)}"
> +PREFERRED_PROVIDER_gst-plugins-base =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-
> accel', 'gst-plugins-base', d)}"
> +PREFERRED_PROVIDER_gst-plugins-good =3D
> "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-
> accel', 'gst-plugins-good', d)}"
> +
>  def filter_out(f, str, d):
>      from re import match
>      return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

