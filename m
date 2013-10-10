Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 66634529A8
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:09:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF90ZN030833
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:09:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF909V016615
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:09:00 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:09:00 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 09/11]
	ti-connectivity/ti-wifi-utils-wl18xx:	Add Wilink8 r8.a7.02
Thread-Index: AQHOxUuN4wwbQ8EqIEKy0BD3xVXg+5nuCm6g
Date: Thu, 10 Oct 2013 15:08:59 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C571A16@DFLE08.ent.ti.com>
References: <1381366658-13630-1-git-send-email-r-monk@ti.com>
	<1381366658-13630-10-git-send-email-r-monk@ti.com>
In-Reply-To: <1381366658-13630-10-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 09/11] ti-connectivity/ti-wifi-utils-wl18xx:	Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:09:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Similar comments as "[PATCH 01/11] ti-connectivity/ti-compat-wireless-wl18x=
x: Add Wilink8 r8.a7.02"

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Monk, Roger
> Sent: Wednesday, October 09, 2013 7:58 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 09/11] ti-connectivity/ti-wifi-utils-wl18xx:=
 Add
> Wilink8 r8.a7.02
>=20
>    * Add v r8.a7.02 engineering release wifi utilities for wilink8
>    * This release supports the omap-a15 devices (omap5-evm/dra7-evm) with=
 ES
> 2.1 WL8
>    * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8 TDK 18xx
> module
>       * OMAP5432x-xx-x1-xx
>=20
> Signed-off-by: Roger Monk <r-monk@ti.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb |   30 ++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-w=
ifi-
> utils-wl18xx_r8.a7.02.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-uti=
ls-
> wl18xx_r8.a7.02.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-=
wifi-
> utils-wl18xx_r8.a7.02.bb
> new file mode 100644
> index 0000000..fab2ee1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl1
> +++ 8xx_r8.a7.02.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "The calibrator and other useful utilities for TI wirele=
ss solution
> based on wl12xx driver"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
> +
> +COMPATIBLE_MACHINE =3D "(omap-a15)"
> +
> +DEPENDS =3D "libnl"
> +RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> +
> +PR =3D"r1+gitr${SRCPV}"
> +
> +# Tag: ol_r8.a7.02
> +SRCREV =3D "badbb7ecb70971857e4863c792a40e91f4f0a985"
> +SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \ "
> +
> +PROVIDES +=3D "ti-wifi-utils"
> +RPROVIDES_${PN} +=3D "ti-wifi-utils"
> +RREPLACES_${PN} +=3D  "ti-wifi-utils"
> +RCONFLICTS_${PN} +=3D  "ti-wifi-utils"
> +
> +S =3D "${WORKDIR}/git"
> +
> +export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> +CFLAGS +=3D " -DCONFIG_LIBNL20"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 calibrator ${D}${bindir}/ }
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

