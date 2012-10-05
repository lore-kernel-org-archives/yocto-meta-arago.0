Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1D4A0529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 21:42:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95LgvH8029869;
	Fri, 5 Oct 2012 16:42:57 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95LgvUn004047;
	Fri, 5 Oct 2012 16:42:57 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 16:42:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH v2] bt-obex: Port recipe from arago
Thread-Index: AQHNozayyxlBbJz4gUikvK2wvlR1qJerkQWA//+su0A=
Date: Fri, 5 Oct 2012 21:42:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2F89CD@DFLE09.ent.ti.com>
References: <1349470067-26340-1-git-send-email-fcooper@ti.com>
	<20121005213853.GC27533@denix.org>
In-Reply-To: <20121005213853.GC27533@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] bt-obex: Port recipe from arago
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
X-List-Received-Date: Fri, 05 Oct 2012 21:42:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Your right. I didn't add to my notes that I renamed this recipe. I thought =
this recipe was familiar...

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Friday, October 05, 2012 4:39 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v2] bt-obex: Port recipe from arago

On Fri, Oct 05, 2012 at 03:47:47PM -0500, Franklin S. Cooper Jr wrote:
> * Port recipe from Arago.
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Use proper RDEPENDS syntax.

Wait, NAK - there is already the same recipe called bluez-tools in meta-ara=
go!

--=20
Denys


>  .../recipes-connectivity/bt-obex/bt-obex.bb        |   33 ++++++++++++++=
++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/bt-obex/bt-obe=
x.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb b/=
meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> new file mode 100644
> index 0000000..5c561f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/bt-obex/bt-obex.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "BT Obex - Agentfor OBEXD (OPP/FTP profile)"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
> +
> +RDEPENDS_${PN} +=3D "bluez4"
> +DEPENDS +=3D "glib-2.0 dbus-glib"
> +
> +PR =3D "r0+gitr${SRCREV}"
> +
> +SRCREV =3D "171181b6ef6c94aefc828dc7fd8de136b9f97532"
> +
> +SRC_URI =3D "git://gitorious.org/bluez-tools/bluez-tools.git;protocol=3D=
git \
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
> +SRC_URI[sha256sum] =3D "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb12=
2c2c7a112a09100a"
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

