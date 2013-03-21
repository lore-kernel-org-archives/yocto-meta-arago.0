Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B115B5203A
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 11:46:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LBkS7S026856
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:46:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LBkS0P027076
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:46:28 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 21 Mar 2013 06:46:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Mar 2013 06:46:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/17] wl12xx-firmware: Pull back in old
	r5.00.18 recipe.
Thread-Index: AQHOJRRuJy+eM9Iwy026F1SRg/XqJ5iwCP0g
Date: Thu, 21 Mar 2013 11:46:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948E8C7@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 01/17] wl12xx-firmware: Pull back in old	r5.00.18 recipe.
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
X-List-Received-Date: Thu, 21 Mar 2013 11:46:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



Acked-by: Chase Maupin <chase.maupin@ti.com>

NOTE: Some question about the TI-TSPA license but I think you have already =
been asking wireless group about this right?

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:05 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 01/17] wl12xx-firmware: Pull back in
> old r5.00.18 recipe.
>=20
> * Current am180x-evm ships with a PG 2 wilink 6 module that isn't
> supported in
>   newer wilink 6 releases.
> * A newer PG 3 wilink 6 module is available for am180x-evm but
> needs to be
>   purchased separately..
> * Bring old r5.00.18 wl12x-firmware recipe with updated recipe
> name to add
>   support for am180x-evm default wilink 6 module.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../wl12xx-firmware/wl12xx-firmware_r5.00.18.bb    |   28
> ++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware_r5.00.18.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware_r5.00.18.bb b/meta-arago-extras/recipes-
> bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
> new file mode 100644
> index 0000000..12df963
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware_r5.00.18.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Firmware files for use with TI wl12xx"
> +LICENSE =3D "TI-TSPA"
> +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Dba590e1d103f891d0151609046aef9e8"
> +
> +PACKAGE_ARCH =3D "all"
> +
> +PR =3D "r0+gitr${SRCREV}"
> +
> +# This recipe provides the latest firmware files for wl12xx.
> +# Therefore, use the contents of this recipe instead of the
> contents
> +# of linux-firmware-wl12xx.
> +RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
> +RPROVIDES_${PN}  =3D "linux-firmware-wl12xx"
> +
> +SRCREV =3D "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
> +SRC_URI =3D "git://github.com/TI-ECS/ti-utils.git;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git/hw/firmware"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    oe_runmake 'DEST_DIR=3D${D}' install
> +}
> +
> +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

