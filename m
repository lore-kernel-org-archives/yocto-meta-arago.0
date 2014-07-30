Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E0013529BC
	for <meta-arago@arago-project.org>;
	Wed, 30 Jul 2014 00:50:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6U0obLu025624
	for <meta-arago@arago-project.org>; Tue, 29 Jul 2014 19:50:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6U0oaum013917
	for <meta-arago@arago-project.org>; Tue, 29 Jul 2014 19:50:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 29 Jul 2014 19:50:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] wl18xx-wlconf: version update
Thread-Index: AQHPq2pTQsgw+Jsgw0eSEe9lmebTyZu3ybEw
Date: Wed, 30 Jul 2014 00:50:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6EDB8D@DFLE08.ent.ti.com>
References: <1406664835-16595-1-git-send-email-yanivma@ti.com>
	<1406664835-16595-2-git-send-email-yanivma@ti.com>
In-Reply-To: <1406664835-16595-2-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] wl18xx-wlconf: version update
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
X-List-Received-Date: Wed, 30 Jul 2014 00:50:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Tuesday, July 29, 2014 3:14 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/2] wl18xx-wlconf: version update
>=20
>     - Update to latest version tag - ol_r8.a9.14
>     - move to git.ti.com
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../{wlconf_r8.a8.10.bb =3D> wlconf_r8.a9.14.bb}     |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)  rename meta-arago-
> extras/recipes-connectivity/wlconf/{wlconf_r8.a8.10.bb =3D> wlconf_r8.a9.=
14.bb}
> (85%)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.1=
0.bb
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
> similarity index 85%
> rename from meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_r8.a8.10.bb
> rename to meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.b=
b
> index 5f50e88..02af7f6 100644
> --- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a8.10.bb
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_r8.a9.14.bb
> @@ -2,12 +2,12 @@ DESCRIPTION =3D "Configuration utility for TI wireless
> drivers"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3a
> 9438"
>=20
> -PR =3D"r1"
> +PR =3D"r2"
>  PR_append =3D "+gitr${SRCPV}"
>=20
> -# Tag: ol_r8.a8.10
> -SRCREV =3D "c50159d66af1786414b819ebcaa8b2571ae790a1"
> -SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git"
> +# Tag: ol_r8.a9.14
> +SRCREV =3D "e014b59381f04b329fccd0ec18a5f2da7fa0fd63"
> +SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
>=20
>  S =3D "${WORKDIR}/git/wlconf"
>=20
> @@ -28,6 +28,7 @@ do_install() {
>  	install -m 0755 README ${D}${bindir}/wlconf/
>  	install -m 0755 example.conf ${D}${bindir}/wlconf/
>  	install -m 0755 example.ini ${D}${bindir}/wlconf/
> +	install -m 0755 configure-device.sh ${D}${bindir}/wlconf/
>  	install -m 0755 ${S}/official_inis/* \
>  			${D}${bindir}/wlconf/official_inis/
>  }
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

