Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C578652976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:44:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EiokK027543
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EioTl019455
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:44:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 05/12] hostap-daemon-wl18xx:
	Update recipe to ol_r8.a9.14 version
Thread-Index: AQHPx3R8TWgMwc7ifUq16ihrvaNwK5vvfE9g
Date: Wed, 3 Sep 2014 14:44:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C727045@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-6-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-6-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 05/12] hostap-daemon-wl18xx:	Update recipe to ol_r8.a9.14 version
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
X-List-Received-Date: Wed, 03 Sep 2014 14:44:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 05/12] hostap-daemon-wl18xx:
> Update recipe to ol_r8.a9.14 version
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Changed git sources to git.ti.com
>     - Updated Defconfig.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ...daemon-wl18xx_r8.a8.10.bb =3D> hostap-daemon-wl18xx_r8.a9.14.bb} | 8
> ++++----
>  .../recipes-connectivity/hostap/hostap-daemon/defconfig           | 2 +-
>  meta-arago-extras/recipes-connectivity/hostap/hostap.inc          | 7 ++=
+----
>  3 files changed, 8 insertions(+), 9 deletions(-)  rename meta-arago-
> extras/recipes-connectivity/hostap/{hostap-daemon-wl18xx_r8.a8.10.bb =3D>
> hostap-daemon-wl18xx_r8.a9.14.bb} (79%)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon-wl18xx_r8.a9.14.bb
> similarity index 79%
> rename from meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon-wl18xx_r8.a8.10.bb
> rename to meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a9.14.bb
> index cd5d8d3..3981b78 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx
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
> daemon/defconfig b/meta-arago-extras/recipes-
> connectivity/hostap/hostap-daemon/defconfig
> index ccc0996..3ee35bc 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/defconfig
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-
> daemon/defcon
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
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
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
>  DESCRIPTION =3D "User space daemon for extended IEEE 802.11
> management"
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
> +SRC_URI =3D
> +"git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;branch=3D${BRAN=
CH}
> +\
>             file://defconfig \
>  	       file://init"
>=20
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

