Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 32705529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:24:46 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95COjx7027459;
	Fri, 5 Oct 2012 07:24:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95COjN0027789;
	Fri, 5 Oct 2012 07:24:45 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:24:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] bt-obex: Port recipe from arago
Thread-Index: AQHNosCIC/Dhvi4DdEuLhnQbGL0wW5eqoxag
Date: Fri, 5 Oct 2012 12:24:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247BB7@DLEE12.ent.ti.com>
References: <1349419299-21431-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419299-21431-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] bt-obex: Port recipe from arago
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
X-List-Received-Date: Fri, 05 Oct 2012 12:24:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:42 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] bt-obex: Port recipe from arago
>=20
> * Port recipe from Arago.
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-connectivity/bt-obex/bt-obex.bb        |   33
> ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/bt-
> obex/bt-obex.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/bt-obex/bt-
> obex.bb b/meta-arago-extras/recipes-connectivity/bt-obex/bt-
> obex.bb
> new file mode 100644
> index 0000000..594e5bc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "BT Obex - Agentfor OBEXD (OPP/FTP profile)"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +RDEPENDS +=3D "bluez4"
> +DEPENDS +=3D "glib-2.0 dbus-glib"
> +
> +PR =3D "r0+gitr${SRCREV}"
> +
> +SRCREV =3D "171181b6ef6c94aefc828dc7fd8de136b9f97532"
> +
> +SRC_URI =3D "git://gitorious.org/bluez-tools/bluez-
> tools.git;protocol=3Dgit \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 755 ${S}/src/bt-adapter ${D}${bindir}
> +       install -m 755 ${S}/src/bt-agent   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-audio   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-device  ${D}${bindir}
> +       install -m 755 ${S}/src/bt-input   ${D}${bindir}
> +       install -m 755 ${S}/src/bt-monitor ${D}${bindir}
> +       install -m 755 ${S}/src/bt-network ${D}${bindir}
> +       install -m 755 ${S}/src/bt-obex    ${D}${bindir}
> +       install -m 755 ${S}/src/bt-serial  ${D}${bindir}
> +}
> +
> +SRC_URI[md5sum] =3D "36080a767e63e54878cd6bcfb20c4f3b"
> +SRC_URI[sha256sum] =3D
> "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a
> "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

