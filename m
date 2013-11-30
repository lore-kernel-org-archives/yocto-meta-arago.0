Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D48AD52986
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:40:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHeJnZ009297
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:40:19 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHeJ4M018435
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:40:19 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:40:19 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/14] wlconf : Removed ol_r8.a6.01 recipe.
Thread-Index: AQHO7C5y3Qs3uI0Bskq2ToEBaGj2TJo+DhJw
Date: Sat, 30 Nov 2013 17:40:18 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C8452@DFLE08.ent.ti.com>
References: <1385638629-11836-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638629-11836-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 06/14] wlconf : Removed ol_r8.a6.01 recipe.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:40:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:37 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 06/14] wlconf : Removed ol_r8.a6.01 recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Clean up unsupported version.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |   37 --------------=
------
>  1 files changed, 0 insertions(+), 37 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.0=
1.bb
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> deleted file mode 100644
> index 8076350..0000000
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION =3D "Configuration utility for TI wireless drivers"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3
> a9438"
> -
> -PR =3D"r2"
> -PR_append =3D "+gitr${SRCPV}"
> -
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> -SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> -
> -S =3D "${WORKDIR}/git/wlconf"
> -
> -EXTRA_OEMAKE =3D "CC=3D${TARGET_PREFIX}gcc"
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -d ${D}${bindir}/wlconf/
> -	install -d ${D}${bindir}/wlconf/official_inis
> -
> -	install -m 0755 wlconf ${D}${bindir}/wlconf/
> -	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> -	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> -	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> -	install -m 0755 README ${D}${bindir}/wlconf/
> -	install -m 0755 example.conf ${D}${bindir}/wlconf/
> -	install -m 0755 example.ini ${D}${bindir}/wlconf/
> -	install -m 0755 ${S}/official_inis/* \
> -			${D}${bindir}/wlconf/official_inis/
> -}
> -
> -FILES_${PN} +=3D " \
> -	${bindir}/wlconf \
> -	${bindir}/wlconf/official_inis \
> -"
> -
> -FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

