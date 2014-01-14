Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 48CDC52A93
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSOnv013885
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:24 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSOXe030620
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:24 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:24 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/8] wlconf : Update recipe to ol_r8.a8.08
	version.
Thread-Index: AQHO8+5clVCdmuwSxkimHSnONyJOK5qEcR1w
Date: Tue, 14 Jan 2014 13:28:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604D77@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-3-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-3-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] wlconf : Update recipe to ol_r8.a8.08	version.
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 3/8] wlconf : Update recipe to ol_r8.a8.08
> version.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Added missing default configuration file.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../{wlconf_r8.a6.01.bb =3D> wlconf_r8.a8.08.bb}     |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)  rename meta-arago-
> extras/recipes-connectivity/wlconf/{wlconf_r8.a6.01.bb =3D>
> wlconf_r8.a8.08.bb} (88%)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.0=
1.bb
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> similarity index 88%
> rename from meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a6.01.bb
> rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.b=
b
> index 8076350..f4adc18 100644
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.08.bb
> @@ -2,11 +2,11 @@ DESCRIPTION =3D "Configuration utility for TI wireless
> drivers"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3
> a9438"
>=20
> -PR =3D"r2"
> +PR =3D"r0"
>  PR_append =3D "+gitr${SRCPV}"
>=20
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
> +# Tag: ol_r8.a8.08
> +SRCREV =3D "c976584589981c9ab8741d1819a5019e17cac13b"
>  SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
>=20
>  S =3D "${WORKDIR}/git/wlconf"
> @@ -21,6 +21,7 @@ do_install() {
>  	install -m 0755 wlconf ${D}${bindir}/wlconf/
>  	install -m 0755 dictionary.txt ${D}${bindir}/wlconf/
>  	install -m 0755 struct.bin ${D}${bindir}/wlconf/
> +	install -m 0755 default.conf ${D}${bindir}/wlconf/
>  	install -m 0755 wl18xx-conf-default.bin ${D}${bindir}/wlconf/
>  	install -m 0755 README ${D}${bindir}/wlconf/
>  	install -m 0755 example.conf ${D}${bindir}/wlconf/
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

