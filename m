Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7818152976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:43:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EhDlc008674
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:43:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EhDPx018593
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:43:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:43:14 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 03/12] wpa-supplicant:
	specify	the branch being used for this version
Thread-Index: AQHPx3R2cm9RvwGObkKpvzbGRuDZOpvve9uw
Date: Wed, 3 Sep 2014 14:43:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C727003@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-4-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-4-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 03/12] wpa-supplicant: specify	the branch being used for this version
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
X-List-Received-Date: Wed, 03 Sep 2014 14:43:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 03/12] wpa-supplicant: specify
> the branch being used for this version
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Bitbake fetcher now requires the branch to be specified when SRCREV is no=
t
> on master
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb                    =
| 1 +
>  .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc              =
| 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.10.bb
> index 6340967..bfe617e 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a8.10.bb
> @@ -12,6 +12,7 @@ FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-
> supplicant:"
>=20
>  # Tag: ol_r8.a8.10
>  SRCREV =3D "257ab333aad993b4be81808524bc0d939c276058"
> +BRANCH =3D "mbss_suspend"
>  PR_append =3D "b+gitr${SRCPV}"
>=20
>  # Add ti to the PV to indicate that this is a TI modify version of wpa-
> supplicant.
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-
> supplicant/wpa-supplicant.inc
> index 9678b1b..e0bda11 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant.inc
> @@ -16,7 +16,7 @@ DEFAULT_PREFERENCE =3D "-1"
>=20
>  PR =3D "r6"
>=20
> -SRC_URI =3D "git://github.com/TI-OpenLink/hostap.git;protocol=3Dgit \
> +SRC_URI =3D "git://github.com/TI-
> OpenLink/hostap.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
>             file://defaults-sane \
>             file://wpa-supplicant.sh \
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

