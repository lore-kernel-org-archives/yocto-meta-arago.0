Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 550AA52ABA
	for <meta-arago@arago-project.org>;
	Thu,  8 Jan 2015 12:11:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t08CBjDD009757
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 06:11:45 -0600
Received: from DFRE70.ent.ti.com (dfre70.ent.ti.com [10.167.188.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t08CBjNX032091
	for <meta-arago@arago-project.org>; Thu, 8 Jan 2015 06:11:45 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE70.ent.ti.com ([fe80::645e:109b:13d3:dfa7%25]) with mapi id
	14.03.0174.001; Thu, 8 Jan 2015 13:11:44 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [v3 WILINK R8.5 0/2] Integration of R8.5
Thread-Index: AQHQKzutUj78m2/RWECvRPGrRhICR5y2IY8Q
Date: Thu, 8 Jan 2015 12:11:43 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B235DE005@DFRE01.ent.ti.com>
References: <1420718839-32155-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1420718839-32155-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.42]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [v3 WILINK R8.5 0/2] Integration of R8.5
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
X-List-Received-Date: Thu, 08 Jan 2015 12:11:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Karthik,

ACK. v3 Looks good to me.

Best Regards,
Eyal

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Thursday, January 08, 2015 2:07 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [v3 WILINK R8.5 0/2] Integration of R8.5
>=20
> This patch set integrates R8.5 Wilink release along with the required
> dependencies.
>=20
> Changes from v2:
>  * Fixed an offline comment from Eyal/Yaniv to move the
>    commit of wl18xx-target-scripts to a few commits below
>    R8.5 tag. This addresses the issue with running the
>    script /usr/share/wl18xx/ap_start.sh
>=20
> Changes from v1:
>  * Added PV for all the recipes
>  * Verified with the latest kernel that includes the probe
>    deferral fix
>=20
>=20
> Karthik Ramanan (2):
>   packagegroup-*-connectivity: Include iptables package
>   wl18xx, bt-firmware: Update to R8.5
>=20
>  .../packagegroup-arago-tisdk-connectivity.bb       |    3 ++-
>  .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
>  ...xx_r8.a9.14.bb =3D> ti-compat-wireless-wl18xx.bb} |    6 +++---
>  ...8xx-firmware_r8.a9.14.bb =3D> wl18xx-firmware.bb} |    8 +++++---
>  ...-wl18xx_r8.a9.14.bb =3D> hostap-daemon-wl18xx.bb} |    8 ++++----
>  ...cripts_r8.a9.14.bb =3D> wl18xx-target-scripts.bb} |    8 +++++---
>  .../wlconf/{wlconf_r8.a9.14.bb =3D> wlconf.bb}       |    8 +++++---
>  ...wl18xx_r8.a9.14.bb =3D> wpa-supplicant-wl18xx.bb} |    8 ++++----
>  ...-wl18xx_r8.a9.14.bb =3D> ti-wifi-utils-wl18xx.bb} |    8 +++++---
>  9 files changed, 35 insertions(+), 26 deletions(-)  rename meta-arago-
> extras/recipes-bsp/ti-compat-wireless/{ti-compat-wireless-
> wl18xx_r8.a9.14.bb =3D> ti-compat-wireless-wl18xx.bb} (93%)  rename meta-
> arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a9.14.bb =3D=
>
> wl18xx-firmware.bb} (86%)  rename meta-arago-extras/recipes-
> connectivity/hostap/{hostap-daemon-wl18xx_r8.a9.14.bb =3D> hostap-daemon-
> wl18xx.bb} (80%)  rename meta-arago-extras/recipes-connectivity/wl18xx-
> target-scripts/{wl18xx-target-scripts_r8.a9.14.bb =3D> wl18xx-target-scri=
pts.bb}
> (83%)  rename meta-arago-extras/recipes-
> connectivity/wlconf/{wlconf_r8.a9.14.bb =3D> wlconf.bb} (93%)  rename met=
a-
> arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-
> wl18xx_r8.a9.14.bb =3D> wpa-supplicant-wl18xx.bb} (86%)  rename meta-arag=
o-
> extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a9.14.bb =
=3D> ti-wifi-
> utils-wl18xx.bb} (88%)
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

