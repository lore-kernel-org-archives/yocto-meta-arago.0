Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 49A5A5299E
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:47:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHlwwD009733
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:58 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHlwa0009118
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:47:58 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:47:58 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/14] wl18xx-firmware: Removed
	ol_r8.a6.01	recipe.
Thread-Index: AQHO7C6Ul2h70uh9G0e9IOqEG9tjLJo+EDQQ
Date: Sat, 30 Nov 2013 17:47:57 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C849B@DFLE08.ent.ti.com>
References: <1385638687-12009-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638687-12009-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 10/14] wl18xx-firmware: Removed ol_r8.a6.01	recipe.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:47:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:38 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 10/14] wl18xx-firmware: Removed ol_r8.a6.01
> recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   31 --------------=
------
>  1 files changed, 0 insertions(+), 31 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a6.01.bb
> deleted file mode 100644
> index 4b3f22a..0000000
> --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> -LICENSE =3D "TI-TSPA"
> -LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
> -
> -PACKAGE_ARCH =3D "all"
> -
> -PR =3D "r2+gitr${SRCPV}"
> -
> -PROVIDES +=3D "wl12xx-firmware"
> -RPROVIDES_${PN} +=3D "wl12xx-firmware"
> -RREPLACES_${PN} +=3D "wl12xx-firmware"
> -RCONFLICTS_${PN} +=3D "wl12xx-firmware"
> -
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
> -SRC_URI =3D "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=3Dgit \
> -           file://Makefile \
> -          "
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_compile() {
> -    :
> -}
> -
> -do_install() {
> -    cp ${WORKDIR}/Makefile ${S}
> -    oe_runmake 'DEST_DIR=3D${D}' install
> -}
> -
> -FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

