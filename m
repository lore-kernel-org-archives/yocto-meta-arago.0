Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 756EC52976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:44:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EiRxp020970
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EiRvl019355
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:44:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:44:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 06/12] wl18xx : update to
	ol_r8.a9.14
Thread-Index: AQHPx3R6kxsa0Sfb7kyWJzM8oI9D4JvvfDUg
Date: Wed, 3 Sep 2014 14:44:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72702D@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-7-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-7-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 06/12] wl18xx : update to	ol_r8.a9.14
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
X-List-Received-Date: Wed, 03 Sep 2014 14:44:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 06/12] wl18xx : update to
> ol_r8.a9.14
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Changed git sources to git.ti.com
>     - Updated to latest release.
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../{wl18xx-firmware_r8.a8.10.bb =3D> wl18xx-firmware_r8.a9.14.bb} | 9
> +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)  rename meta-arago-
> extras/recipes-bsp/wl18xx-firmware/{wl18xx-firmware_r8.a8.10.bb =3D>
> wl18xx-firmware_r8.a9.14.bb} (72%)
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
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a
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
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

