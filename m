Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B0F275299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:47:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHl23k022151
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHl2jl008738
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:02 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:47:02 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/14] ti-wifi-utils-wl18xx: Removed
	ol_r8.a6.01 recipe.
Thread-Index: AQHO7C6Ecd3H4N96IkmTj8FW87Oy15o+D/Jg
Date: Sat, 30 Nov 2013 17:47:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C8477@DFLE08.ent.ti.com>
References: <1385638660-11922-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638660-11922-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 08/14] ti-wifi-utils-wl18xx: Removed	ol_r8.a6.01 recipe.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:47:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:38 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 08/14] ti-wifi-utils-wl18xx: Removed ol_r8.a=
6.01
> recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Clean up unsupported version
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01.bb |   28 --------------=
------
>  1 files changed, 0 insertions(+), 28 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a6.01=
.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-uti=
ls-
> wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-=
wifi-
> utils-wl18xx_r8.a6.01.bb
> deleted file mode 100644
> index eab94fa..0000000
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-
> wl18xx_r8.a6.01.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION =3D "The calibrator and other useful utilities for TI wirele=
ss solution
> based on wl12xx driver"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
> -
> -DEPENDS =3D "libnl"
> -RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> -
> -PR =3D"r3+gitr${SRCPV}"
> -
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> -SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \ -"
> -
> -PROVIDES +=3D "ti-wifi-utils"
> -RPROVIDES_${PN} +=3D "ti-wifi-utils"
> -RREPLACES_${PN} +=3D  "ti-wifi-utils"
> -RCONFLICTS_${PN} +=3D  "ti-wifi-utils"
> -
> -S =3D "${WORKDIR}/git"
> -
> -export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> -CFLAGS +=3D " -DCONFIG_LIBNL20"
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 calibrator ${D}${bindir}/
> -}
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

