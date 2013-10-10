Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5E47B52090
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:03:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF30Hu007229
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:00 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF30Rb007850
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:03:00 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:03:00 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/11] ti-connectivity/wlconf: Add Wilink8
	r8.a7.02
Thread-Index: AQHOxUuOZuZbg/SyHkCnnbJktu55zZnuCMrQ
Date: Thu, 10 Oct 2013 15:02:59 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C571983@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-9-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366658-13630-9-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 08/11] ti-connectivity/wlconf: Add Wilink8	r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:03:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Similar comment that I made to "[PATCH	01/11]	ti-connectivity/ti-compat-wir=
eless-wl18xx: Add	Wilink8	r8.a7.02"

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Monk, Roger
> Sent: Wednesday, October 09, 2013 7:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 08/11] ti-connectivity/wlconf: Add Wilink8
> r8.a7.02
>=20
>    * Add v r8.a7.02 engineering release configuration utility for wilink8
>    * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with=
 ES
> 2.1 WL8
>    * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx
> module
>       * OMAP5432x-xx-x1-xx
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
>  .../recipes-connectivity/wlconf/wlconf_r8.a7.02.bb |   39
> ++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a7.02.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.0=
2.bb
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb
> new file mode 100644
> index 0000000..214d05b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a7.02.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "Configuration utility for TI wireless drivers"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3
> a9438"
> +
> +COMPATIBLE_MACHINE =3D "(omap-a15)"
> +
> +PR =3D"r1"
> +PR_append =3D "+gitr${SRCPV}"
> +
> +# Tag: ol_r8.a7.02
> +SRCREV =3D "badbb7ecb70971857e4863c792a40e91f4f0a985"
> +SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> +
> +S =3D "${WORKDIR}/git/wlconf"
> +
> +EXTRA_OEMAKE =3D "CC=3D${TARGET_PREFIX}gcc"
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -d ${D}${bindir}/wlconf/
> +	install -d ${D}${bindir}/wlconf/official_inis
> +
> +	install -m 0755 wlconf ${D}${bindir}/wlconf/
> +	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
> +	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> +	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
> +	install -m 0755 README ${D}${bindir}/wlconf/
> +	install -m 0755 example.conf ${D}${bindir}/wlconf/
> +	install -m 0755 example.ini ${D}${bindir}/wlconf/
> +	install -m 0755 ${S}/official_inis/* \
> +			${D}${bindir}/wlconf/official_inis/
> +}
> +
> +FILES_${PN} +=3D " \
> +	${bindir}/wlconf \
> +	${bindir}/wlconf/official_inis \
> +"
> +
> +FILES_${PN}-dbg +=3D "${bindir}/wlconf/.debug"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

