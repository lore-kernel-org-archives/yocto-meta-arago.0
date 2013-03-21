Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DB221529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:18:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCIjAN019426
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCIjMH030041
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:45 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 21 Mar 2013 07:18:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 21 Mar 2013 07:18:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/17] wilink-calibrate: Add Wilink
	calibration	script
Thread-Index: AQHOJQ+2e+l6bnq5K0mXF7UF09YSuZiwEkjg
Date: Thu, 21 Mar 2013 12:18:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948EC64@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-12-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-12-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 12/17] wilink-calibrate: Add Wilink calibration	script
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
X-List-Received-Date: Thu, 21 Mar 2013 12:18:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



See re-order comment from last patch

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 12/17] wilink-calibrate: Add Wilink
> calibration script
>=20
> * Add a script that runs at startup that insures that the wilink
> MAC address used
>   is unique.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-wifi-utils/wilink-calibrate/calibrate.sh    |    7
> +++++++
>  .../ti-wifi-utils/wilink-calibrate_1.0.bb          |   17
> +++++++++++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/wilink-calibrate/calibrate.sh
>  create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-
> utils/wilink-calibrate_1.0.bb
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-
> utils/wilink-calibrate/calibrate.sh b/meta-arago-extras/recipes-
> devtools/ti-wifi-utils/wilink-calibrate/calibrate.sh
> new file mode 100644
> index 0000000..b028435
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-
> calibrate/calibrate.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +echo "Performing wifi calibration..."
> +rm /lib/firmware/ti-connectivity/wl1271-nvs.bin
> +rmmod wl12xx_sdio.ko
> +calibrator plt autocalibrate wlan0 /lib/modules/$(uname -
> r)/updates/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
> /usr/share/ti/wifi-utils/ini_files/127x/TQS_S_2.6.ini
> /lib/firmware/ti-connectivity/wl1271-nvs.bin 00:00:00:00:00:00
> +modprobe wl12xx_sdio
> +
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-
> utils/wilink-calibrate_1.0.bb b/meta-arago-extras/recipes-
> devtools/ti-wifi-utils/wilink-calibrate_1.0.bb
> new file mode 100644
> index 0000000..d0aadfb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/wilink-
> calibrate_1.0.bb
> @@ -0,0 +1,17 @@
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> +
> +inherit update-rc.d
> +INITSCRIPT_NAME=3D"calibrate.sh"
> +INITSCRIPT_PARAMS =3D "start 20 2 3 4 5 ."
> +
> +PR =3D"r0"
> +
> +SRC_URI =3D "file://calibrate.sh"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/calibrate.sh
> ${D}${sysconfdir}/init.d
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

