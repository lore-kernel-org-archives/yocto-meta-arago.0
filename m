Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 50743529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:07:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AF7qEZ002567
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AF7qrM015128
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:07:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:07:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 02/11] ti-connectivity/wl18xx-firmware:
	Add	Wilink8 r8.a7.02
Thread-Index: AQHOxcnwHP2u7yzojESRkyki7wHAtZnuCUYw
Date: Thu, 10 Oct 2013 15:07:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979B8E8@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-3-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-3-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 02/11] ti-connectivity/wl18xx-firmware: Add	Wilink8 r8.a7.02
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
X-List-Received-Date: Thu, 10 Oct 2013 15:07:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 02/11] ti-connectivity/wl18xx-
>firmware: Add Wilink8 r8.a7.02
>
>   * Add v r8.a7.02 engineering release wifi firmware
>   * This release supports the omap-a15 devices (omap5-evm/dra7-
>evm) with ES 2.1 WL8
>      * OMAP5432 UEVMs with the following SKU contain ES2.1
>Wilink8 TDK 18xx module
>         * OMAP5432x-xx-x1-xx
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> ...are_r8.a6.01.bb =3D> wl18xx-firmware_r8.a7.02.bb} |    8 +++++--
>-
> 1 file changed, 5 insertions(+), 3 deletions(-)
> copy meta-arago-extras/recipes-bsp/wl18xx-firmware/{wl18xx-
>firmware_r8.a6.01.bb =3D> wl18xx-firmware_r8.a7.02.bb} (82%)
>
>diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-
>firmware/wl18xx-firmware_r8.a7.02.bb
>similarity index 82%
>copy from meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a6.01.bb
>copy to meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a7.02.bb
>index 4b3f22a..f41edd5 100644
>--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a6.01.bb
>+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
>firmware_r8.a7.02.bb
>@@ -4,15 +4,17 @@ LIC_FILES_CHKSUM =3D
>"file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
>
> PACKAGE_ARCH =3D "all"
>
>-PR =3D "r2+gitr${SRCPV}"
>+PR =3D "r1+gitr${SRCPV}"
>
> PROVIDES +=3D "wl12xx-firmware"
> RPROVIDES_${PN} +=3D "wl12xx-firmware"
> RREPLACES_${PN} +=3D "wl12xx-firmware"
> RCONFLICTS_${PN} +=3D "wl12xx-firmware"
>
>-# Tag: ol_r8.a6.01
>-SRCREV =3D "1c0f45f0e8aec0823175f7ac977908888c424aa1"
>+COMPATIBLE_MACHINE =3D "(omap-a15)"
>+
>+# Tag: ol_r8.a7.02
>+SRCREV =3D "f3fe754d585f9af821c244a606761c5f69278ed6"
> SRC_URI =3D "git://github.com/TI-
>OpenLink/wl18xx_fw.git;protocol=3Dgit \
>            file://Makefile \
>           "
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

