Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4426A52961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 15:53:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IFre34028384;
	Mon, 18 Mar 2013 10:53:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IFrepY016760;
	Mon, 18 Mar 2013 10:53:40 -0500
Received: from DFLE72.ent.ti.com (128.247.5.109) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 18 Mar 2013 10:53:39 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 10:53:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Eyal Reizer <eyalreizer@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/9] ti-wifi-utils-wl18xx: build the
	calibrator tool for wilin8
Thread-Index: AQHOI92yKRVJOGoY90qXSmeugflqoZirmYnQ
Date: Mon, 18 Mar 2013 15:53:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159480FB4@DLEE11.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-5-git-send-email-eyalr@ti.com>
In-Reply-To: <1363613762-6537-5-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] ti-wifi-utils-wl18xx: build the calibrator tool for wilin8
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
X-List-Received-Date: Mon, 18 Mar 2013 15:53:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Eyal Reizer
> Sent: Monday, March 18, 2013 8:36 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 5/9] ti-wifi-utils-wl18xx: build the
> calibrator tool for wilin8
>=20
> From: Eyal Reizer <eyalr@ti.com>
>=20
> Add a recipe for building and installing the calibrator tool
> used with the wilink8 family of chips.
>=20
> This package replace the wilink6 package which is provided by the
> ti-wifi-utils. Selection between the two is done using a
> "WILINK_VERSION" switch added to arago.conf
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils-wl18xx_git.bb      |   26
> ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils-wl18xx_git.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils-wl18xx_git.bb b/meta-arago-extras/recipes-devtools/ti-
> wifi-utils/ti-wifi-utils-wl18xx_git.bb
> new file mode 100644
> index 0000000..3d2d6f1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils-wl18xx_git.bb

Same comments as before about _git versions.

> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "The calibrator and other useful utilities for TI
> wireless solution based on wl12xx driver"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
> +
> +DEPENDS =3D "libnl"
> +RDEPENDS =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> +
> +PR =3D"r1+gitr${SRCREV}"
> +PV =3D"0.0"
> +
> +SRCREV =3D "ol_r8.a6.01"
> +SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \
> +"
> +
> +PROVIDES +=3D "ti-wifi-utils"
> +RPROVIDES +=3D "ti-wifi-utils"

Same comments as before.  This seems like it should also RCONFLICT with ti-=
wifi-utils.

> +
> +S =3D "${WORKDIR}/git"
> +
> +export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> +CFLAGS +=3D " -DCONFIG_LIBNL20"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 calibrator ${D}${bindir}/
> +}
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

