Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 581F952ABE
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:44:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EiF73027476
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EiFx4019231
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:44:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 07/12] Wl18xx : recipes
	update -	tag changed to ol_r8.a9.14
Thread-Index: AQHPx3R7S6V8/KupUE6YWjZgf4q1f5vvfCWw
Date: Wed, 3 Sep 2014 14:44:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C727021@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-8-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-8-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 07/12] Wl18xx : recipes update -	tag changed to ol_r8.a9.14
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
X-List-Received-Date: Wed, 03 Sep 2014 14:44:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 07/12] Wl18xx : recipes update=
 -
> tag changed to ol_r8.a9.14
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Changed git sources to git.ti.com
>      - Updated to latest release.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ...-utils-wl18xx_r8.a8.10.bb =3D> ti-wifi-utils-wl18xx_r8.a9.14.bb} | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)  rename meta-arago-
> extras/recipes-devtools/ti-wifi-utils/{ti-wifi-utils-wl18xx_r8.a8.10.bb =
=3D> ti-
> wifi-utils-wl18xx_r8.a9.14.bb} (81%)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-uti=
ls-
> wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils-wl18xx_r8.a9.14.bb
> similarity index 81%
> rename from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-util=
s-
> wl18xx_r8.a8.10.bb
> rename to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-
> wl18xx_r8.a9.14.bb
> index 26faa6f..f74c2f9 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-
> wl18xx_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl1
> +++ 8xx_r8.a9.14.bb
> @@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
>  DEPENDS =3D "libnl"
>  RDEPENDS_${PN} =3D "wl18xx-firmware"
>=20
> -PR =3D"r1+gitr${SRCPV}"
> +PR =3D"r2+gitr${SRCPV}"
>=20
> -#Tag: ol_r8.a8.10
> -SRCREV =3D "c50159d66af1786414b819ebcaa8b2571ae790a1"
> -SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \
> +#Tag: ol_r8.a9.14
> +SRCREV =3D "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
> +SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
>  "
>=20
>  PROVIDES +=3D "ti-wifi-utils"
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

