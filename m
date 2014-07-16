Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3612D52974
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 14:09:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GE9tEx020190
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 09:09:55 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GE9tND019721
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 09:09:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 16 Jul 2014 09:09:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/5 v2] wl18xx : update to ol_r8.a9.14
Thread-Index: AQHPoOFeSAJ1cL1DLEeL+t2XC4Emc5uivW+Q
Date: Wed, 16 Jul 2014 14:09:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E3471@DFLE08.ent.ti.com>
References: <1405506511-20607-1-git-send-email-yanivma@ti.com>
	<1405506511-20607-3-git-send-email-yanivma@ti.com>
In-Reply-To: <1405506511-20607-3-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5 v2] wl18xx : update to ol_r8.a9.14
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
X-List-Received-Date: Wed, 16 Jul 2014 14:09:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Wednesday, July 16, 2014 5:29 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/5 v2] wl18xx : update to ol_r8.a9.14
>=20
>     - Changed git sources to git.ti.com
>     - Updated to latest release.
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
> V2 Changes
>     - Fixed mode change
>=20
>  ...are_r8.a8.10.bb =3D> wl18xx-firmware_r8.a9.14.bb} |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)  rename meta-arago-
> extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb =3D> wl18=
xx-
> firmware_r8.a9.14.bb} (72%)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a9.14.bb
> similarity index 72%
> rename from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb
> rename to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a9.14.bb
> index b59f1c4..45d4ea7 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a
> +++ 9.14.bb
> @@ -4,16 +4,17 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32a9e"
>=20
>  PACKAGE_ARCH =3D "all"
>=20
> -PR =3D "r3+gitr${SRCPV}"
> +PR =3D "r4+gitr${SRCPV}"
>=20
>  PROVIDES +=3D "wl12xx-firmware"
>  RPROVIDES_${PN} +=3D "wl12xx-firmware"
>  RREPLACES_${PN} +=3D "wl12xx-firmware"
>  RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>=20
> -# Tag: ol_r8.a8.10
> -SRCREV =3D "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
> -SRC_URI =3D "git://github.com/TI-
> OpenLink/wl18xx_fw.git;protocol=3Dgit;branch=3Dmbss \
> +# Tag: ol_r8.a9.14
> +SRCREV =3D "2568d8f61fd509eabb112110c20ea31c088ef6b9"
> +BRANCH =3D "ap_dfs"
> +SRC_URI =3D
> +"git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=3D${B=
RAN
> +CH} \
>             file://0001-Add-Makefile-for-SDK.patch \
>            "
>=20
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

