Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3B7D7529DD
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 13:56:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GDuWBn020768
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 08:56:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GDuW4D006991
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 08:56:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 16 Jul 2014 08:56:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/5 v2] hostap-daemon-wl18xx: Update
	recipe to	ol_r8.a9.14 version
Thread-Index: AQHPoOFemeUmsP5KyUif7wzpOs0WTpuiuVUA
Date: Wed, 16 Jul 2014 13:56:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E3429@DFLE08.ent.ti.com>
References: <1405506511-20607-1-git-send-email-yanivma@ti.com>
	<1405506511-20607-2-git-send-email-yanivma@ti.com>
In-Reply-To: <1405506511-20607-2-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/5 v2] hostap-daemon-wl18xx: Update recipe to	ol_r8.a9.14 version
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
X-List-Received-Date: Wed, 16 Jul 2014 13:56:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Wednesday, July 16, 2014 5:28 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/5 v2] hostap-daemon-wl18xx: Update recipe
> to ol_r8.a9.14 version
>=20
>     - Changed git sources to git.ti.com
>     - Updated Defconfig.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
> V2 Changes
>     - Fixed mode change
>=20
>  ...8.a8.10.bb =3D> hostap-daemon-wl18xx_r8.a9.14.bb} |    8 ++++----
>  .../hostap/hostap-daemon/defconfig                 |    2 +-
>  .../recipes-connectivity/hostap/hostap.inc         |    7 +++----
>  3 files changed, 8 insertions(+), 9 deletions(-)  rename meta-arago-
> extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.10.bb =3D>
> hostap-daemon-wl18xx_r8.a9.14.bb} (79%)  mode change 100644 =3D> 100755
>=20
[Franklin] I'm assuming this lines mean ur still changing the mode.
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap=
-
> daemon-wl18xx_r8.a9.14.bb
> old mode 100644
> new mode 100755
> similarity index 79%
> rename from meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a8.10.bb
> rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a9.14.bb
> index cd5d8d3..3981b78
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx
> +++ _r8.a9.14.bb
> @@ -6,7 +6,7 @@ require hostap.inc
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
>=20
> -PR_append =3D "b+gitr${SRCPV}"
> +PR_append =3D "c+gitr${SRCPV}"
>=20
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon:"
>=20
> @@ -14,9 +14,9 @@ FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-
> daemon:"
>  # of hostap
>  PV =3D "2.0-devel-ti"
>=20
> -# Tag: ol_r8.a8.10
> -SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> -BRANCH =3D "mbss_suspend"
> +# Tag: ol_r8.a9.14
> +SRCREV =3D "281f5adb8eb7ee9e9220546c0227696b02aab332"
> +BRANCH =3D "single_hostap_dfs_dynamic"
>=20
>  PROVIDES +=3D "hostap-daemon"
>  RPROVIDES_${PN} +=3D "hostap-daemon"
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/defconfig b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/defconfig
> index ccc0996..3ee35bc 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/defconfig
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon/defcon
> +++ fig
> @@ -52,7 +52,7 @@ CONFIG_LIBNL32=3Dy
>  # This version is an experimental implementation based on IEEE
> 802.11w/D1.0  # draft and is subject to change since the standard has not=
 yet
> been finalized.
>  # Driver support is also needed for IEEE 802.11w.
> -#CONFIG_IEEE80211W=3Dy
> +CONFIG_IEEE80211W=3Dy
>=20
>  # Integrated EAP server
>  #CONFIG_EAP=3Dy
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/m=
eta-
> arago-extras/recipes-connectivity/hostap/hostap.inc
> index 15e82d5..180fc01 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> @@ -1,5 +1,5 @@
>  # This is a TI specific version of the hostap-daemon recipe for use with=
 the -#
> wl12xx wlan and bluetooth module.
> +# wl18xx wlan module
>=20
>  HOMEPAGE =3D "http://hostap.epitest.fi"
>  DESCRIPTION =3D "User space daemon for extended IEEE 802.11 management"
> @@ -11,15 +11,14 @@ DEPENDS =3D "libnl openssl"
>  # default
>  DEFAULT_PREFERENCE =3D "-1"
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
>  inherit update-rc.d
>  INITSCRIPT_NAME=3D"hostapd"
>=20
>  CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
>=20
> -SRC_URI =3D "git://github.com/TI-
> OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
> -           file://0001-hostapd-change-conf-file-for-better-oob-
> startup.patch;patchdir=3D.. \
[Franklin] Just reiterating Deny's comment about deleting the patch if you =
no longer need it.
> +SRC_URI =3D
> +"git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;branch=3D${BRAN=
CH}
> +\
>             file://defconfig \
>  	       file://init"
>=20
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

