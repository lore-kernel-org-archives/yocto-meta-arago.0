Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1305852A3B
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 13:48:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IDm1Yd007479;
	Mon, 18 Mar 2013 08:48:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IDm1tD024125;
	Mon, 18 Mar 2013 08:48:01 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 18 Mar 2013 08:48:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Eyal Reizer <eyalreizer@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/9] wlconf: configuration utility for
	wilink8	wireless driver
Thread-Index: AQHOI92q048ENN/xHUeI/EOUN396/pirdcMw
Date: Mon, 18 Mar 2013 13:48:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3E8757@DFLE09.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1363613762-6537-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] wlconf: configuration utility for wilink8	wireless driver
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
X-List-Received-Date: Mon, 18 Mar 2013 13:48:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If this program is going to be updated based on an actual "release" then le=
t's get away from using wlconf_git.bb and move to wlconf_r8.a6.01.bb or wha=
tever way want to format it.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Eyal Reizer
> Sent: Monday, March 18, 2013 8:36 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/9] wlconf: configuration utility for wilin=
k8
> wireless driver
>=20
> Add a recipe for building and installing the wlconf configuration utility=
 for TI
> Wilink8 familily of chips.
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../recipes-connectivity/wlconf/wlconf_git.bb      |   36 ++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-
> connectivity/wlconf/wlconf_git.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb
> b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb
> new file mode 100644
> index 0000000..0d8a057
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf_git.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "Configuration utility for TI wireless drivers"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Dadc05a1903d3f107f85c90328=
e3a
> 9438"
> +
> +PR =3D"r1"
> +PV =3D"0.0"
> +PR_append =3D "+gitr${SRCREV}"
> +
> +SRCREV =3D "ol_r8.a6.01"
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
> +	install -m 0755 ${S}/official_inis/*
> +${D}${bindir}/wlconf/official_inis
FC: Formatting seems off can you indent this file.
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

