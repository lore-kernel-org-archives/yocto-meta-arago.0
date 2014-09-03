Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 500E652976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:42:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Egkrm027330
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:42:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EgkNh018417
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:42:46 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:42:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-firmware:
	specify	the branch being used for this version
Thread-Index: AQHPx3RwApAa+1DUGEK0cvo121pC6Jvve7Jw
Date: Wed, 3 Sep 2014 14:42:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C726FE9@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-2-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-2-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 01/12] wl18xx-firmware: specify	the branch being used for this version
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
X-List-Received-Date: Wed, 03 Sep 2014 14:42:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-firmware: specif=
y
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
>  .../recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb             =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a8.10.bb
> index 5db1c99..b59f1c4 100644
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a8.10.bb
> @@ -13,7 +13,7 @@ RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>=20
>  # Tag: ol_r8.a8.10
>  SRCREV =3D "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
> -SRC_URI =3D "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=3Dgit \
> +SRC_URI =3D "git://github.com/TI-
> OpenLink/wl18xx_fw.git;protocol=3Dgit;branch=3Dmbss \
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

