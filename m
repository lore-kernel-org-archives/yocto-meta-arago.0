Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 41851529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:43:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFhUiJ012355
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:43:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFhUVn003980
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:43:30 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:43:30 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 09/11]
	ti-connectivity/ti-wifi-utils-wl18xx:	Add Wilink8 r8.a7.02
Thread-Index: AQHOxcoERcQPLAxJfEazrw6ldP0/o5nuE1XA
Date: Thu, 10 Oct 2013 15:43:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979BE1E@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-10-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-10-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 09/11] ti-connectivity/ti-wifi-utils-wl18xx:	Add Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:43:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 09/11] ti-connectivity/ti-wifi-
>utils-wl18xx: Add Wilink8 r8.a7.02
>
>   * Add v r8.a7.02 engineering release wifi utilities for wilink8
>   * This release supports the omap-a15 devices (omap5-evm/dra7-
>evm) with ES 2.1 WL8
>   * OMAP5432 UEVMs with the following SKU contain ES2.1 Wilink8
>TDK 18xx module
>      * OMAP5432x-xx-x1-xx
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> ...8.a6.01.bb =3D> ti-wifi-utils-wl18xx_r8.a7.02.bb} |    8 +++++--
>-
> 1 file changed, 5 insertions(+), 3 deletions(-)
> copy meta-arago-extras/recipes-devtools/ti-wifi-utils/{ti-wifi-
>utils-wl18xx_r8.a6.01.bb =3D> ti-wifi-utils-wl18xx_r8.a7.02.bb}
>(83%)
>
>diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
>wifi-utils-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-
>devtools/ti-wifi-utils/ti-wifi-utils-wl18xx_r8.a7.02.bb
>similarity index 83%
>copy from meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
>wifi-utils-wl18xx_r8.a6.01.bb
>copy to meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
>utils-wl18xx_r8.a7.02.bb
>index eab94fa..fab2ee1 100644
>--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
>utils-wl18xx_r8.a6.01.bb
>+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
>utils-wl18xx_r8.a7.02.bb
>@@ -2,13 +2,15 @@ DESCRIPTION =3D "The calibrator and other useful
>utilities for TI wireless solutio
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
>
>+COMPATIBLE_MACHINE =3D "(omap-a15)"
>+
> DEPENDS =3D "libnl"
> RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
>
>-PR =3D"r3+gitr${SRCPV}"
>+PR =3D"r1+gitr${SRCPV}"
>
>-# Tag: ol_r8.a6.01
>-SRCREV =3D "214dfbdf97cc390b0020c4ea9331a1cf82240a64"
>+# Tag: ol_r8.a7.02
>+SRCREV =3D "badbb7ecb70971857e4863c792a40e91f4f0a985"
> SRC_URI =3D "git://github.com/TI-OpenLink/18xx-ti-utils.git \
> "
>
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

