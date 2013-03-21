Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 687A7529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:18:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCISFq019361
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCIS4a029879
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:18:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 11/17] ti-wifi-utils: Split recipe
Thread-Index: AQHOJREIdE96Eru9SU+OPtjnEhK4Y5iwERyg
Date: Thu, 21 Mar 2013 12:18:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948EC38@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-11-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-11-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 11/17] ti-wifi-utils: Split recipe
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
X-List-Received-Date: Thu, 21 Mar 2013 12:18:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 11/17] ti-wifi-utils: Split recipe
>=20
> * Split recipe to create a generic .inc file to allow support for
> multiple
>   versions of ti-wifi-utils.
> * Rename recipe to use the specific version of ti-wifi-utils.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils.inc                |   29
> ++++++++++++++
>  .../ti-wifi-utils/ti-wifi-utils/calibrate.sh       |    7 ---
>  .../ti-wifi-utils/ti-wifi-utils_git.bb             |   40 ------
> --------------
>  .../ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb       |    8 ++++
>  4 files changed, 37 insertions(+), 47 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils.inc
>  delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils/calibrate.sh
>  delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils_git.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils_r5.sp3.05.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils.inc b/meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils.inc
> new file mode 100644
> index 0000000..4e3f628
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils.inc
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "The calibrator and other useful utilities for TI
> wireless solution based on wl12xx driver"
> +
> +DEPENDS =3D "libnl"
> +RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> +
> +PR =3D"r1"
> +
> +SRCREV =3D "ol_R5.00.18"

I don't think you want to set a SRCREV in the .inc file.

> +SRC_URI =3D "git://github.com/TI-OpenLink/ti-
> utils.git;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> +
> +export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> +CFLAGS +=3D " -DCONFIG_LIBNL20"
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
> +	install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
> +
> +	install -m 0755 calibrator ${D}${bindir}/
> +	install -m 0755 ${S}/hw/ini_files/127x/*
> ${D}${datadir}/ti/wifi-utils/ini_files/127x
> +	install -m 0755 ${S}/hw/ini_files/128x/*
> ${D}${datadir}/ti/wifi-utils/ini_files/128x
> +}
> +
> +FILES_${PN} +=3D " \
> +	${datadir}/ti/wifi-utils/ini_files/127x \
> +	${datadir}/ti/wifi-utils/ini_files/128x \
> +"
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils/calibrate.sh b/meta-arago-extras/recipes-devtools/ti-
> wifi-utils/ti-wifi-utils/calibrate.sh
> deleted file mode 100644
> index b028435..0000000
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils/calibrate.sh
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#!/bin/sh
> -echo "Performing wifi calibration..."
> -rm /lib/firmware/ti-connectivity/wl1271-nvs.bin
> -rmmod wl12xx_sdio.ko
> -calibrator plt autocalibrate wlan0 /lib/modules/$(uname -
> r)/updates/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
> /usr/share/ti/wifi-utils/ini_files/127x/TQS_S_2.6.ini
> /lib/firmware/ti-connectivity/wl1271-nvs.bin 00:00:00:00:00:00
> -modprobe wl12xx_sdio
> -

I think you need to re-order your patches so that the wilink-calibrate patc=
h comes first, then you can combine this patch with patch 13 that adds runt=
ime dependency on wilink-calibrate.

So in your patch sequence this would go from 11, 12, 13 to 12, 11+13.

This is so that there isn't a commit in time where this script has disappea=
red.

> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-
> utils/ti-wifi-utils_git.bb
> deleted file mode 100644
> index 142a720..0000000
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils_git.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -DESCRIPTION =3D "The calibrator and other useful utilities for TI
> wireless solution based on wl12xx driver"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
> -
> -DEPENDS =3D "libnl"
> -RDEPENDS =3D "ti-compat-wireless-wl12xx wl12xx-firmware"
> -
> -inherit update-rc.d
> -INITSCRIPT_NAME=3D"calibrate.sh"
> -INITSCRIPT_PARAMS =3D "start 20 2 3 4 5 ."
> -
> -PR =3D"r2+gitr${SRCPV}"
> -PV =3D"0.0"
> -
> -SRCREV =3D "ol_R5.SP3.05"
> -SRC_URI =3D "git://github.com/TI-OpenLink/ti-
> utils.git;protocol=3Dgit \
> -           file://calibrate.sh \
> -"
> -
> -S =3D "${WORKDIR}/git"
> -
> -export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> -CFLAGS +=3D " -DCONFIG_LIBNL20"
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -d ${D}${datadir}/ti/wifi-utils/ini_files/127x
> -    install -d ${D}${datadir}/ti/wifi-utils/ini_files/128x
> -    install -d ${D}${sysconfdir}/init.d
> -
> -    install -m 0755 calibrator ${D}${bindir}/
> -    install -m 0755 ${S}/hw/ini_files/127x/*
> ${D}${datadir}/ti/wifi-utils/ini_files/127x
> -    install -m 0755 ${S}/hw/ini_files/128x/*
> ${D}${datadir}/ti/wifi-utils/ini_files/128x
> -    install -m 0755 ${WORKDIR}/calibrate.sh
> ${D}${sysconfdir}/init.d
> -}
> -
> -FILES_${PN} +=3D " \
> -    ${datadir}/ti/wifi-utils/ini_files/127x \
> -    ${datadir}/ti/wifi-utils/ini_files/128x \
> -"
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils_r5.sp3.05.bb b/meta-arago-extras/recipes-devtools/ti-
> wifi-utils/ti-wifi-utils_r5.sp3.05.bb
> new file mode 100644
> index 0000000..e9f5a3c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils_r5.sp3.05.bb
> @@ -0,0 +1,8 @@
> +require ti-wifi-utils.inc
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
> +
> +PR_append =3D"a+gitr${SRCPV}"
> +
> +SRCREV =3D "ol_R5.SP3.05"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

