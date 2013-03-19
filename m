Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B62115203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:50:05 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFo5ja000998
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:50:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFo56h013732
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:50:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Mar 2013 10:50:04 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 2/9] wl18xx-firmware: install Wilink8
	wlan	firmware files
Thread-Index: AQHOJLj0/VI3BE+Bk0GII4WD8XnchZitKLqw
Date: Tue, 19 Mar 2013 15:50:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159485C17@DLEE11.ent.ti.com>
References: <1363707935-2749-2-git-send-email-eyalr@ti.com>
In-Reply-To: <1363707935-2749-2-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2 2/9] wl18xx-firmware: install Wilink8 wlan	firmware files
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
X-List-Received-Date: Tue, 19 Mar 2013 15:50:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Reizer, Eyal
> Sent: Tuesday, March 19, 2013 10:45 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCHv2 2/9] wl18xx-firmware: install
> Wilink8 wlan firmware files
>=20

What changed in v2?  You need to add that note.

> Add a recipe for installing the Wilink8 wlan firmware files into
> the target file system.
>=20
> This package replace the wilink6 package which is provided by the
> wl12xx-firmware recipe. Selection between the two is done using a
> "WILINK_VERSION" switch added to arago.conf
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
>  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30
> ++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware/Makefile
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-
> bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> new file mode 100644
> index 0000000..0bb7ab8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware/Makefile
> @@ -0,0 +1,7 @@
> +# Installs the the ti-connectiviy wlan firmware files into the
> root file system
> +
> +install:
> +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> +
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-
> bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> new file mode 100644
> index 0000000..fd463cc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_r8.a6.01.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> +LICENSE =3D "TI-TSPA"
> +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922969"
> +
> +PACKAGE_ARCH =3D "all"
> +
> +PR =3D "r1+gitr${SRCREV}"
> +
> +PROVIDES +=3D "wl12xx-firmware"
> +RPROVIDES +=3D "wl12xx-firmware"
> +RREPLACES +=3D "wl12xx-firmware"
> +RCONFLICTS +=3D "wl12xx-firmware"

This seems wrong.  You are providing wl12xx-firmware and also saying you re=
place and conflict with wl12xx firmware.

I'm thinking you should use wl-firmware as the package name and then your P=
REFERRED_PROVIDER settings can be updated and the PROVIDES here would be up=
dated.

> +
> +SRCREV =3D "ol_r8.a6.01"
> +SRC_URI =3D "git://github.com/TI-
> OpenLink/wl18xx_fw.git;protocol=3Dgit \
> +           file://Makefile \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    cp ${WORKDIR}/Makefile ${S}
> +    oe_runmake 'DEST_DIR=3D${D}' install
> +}
> +
> +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

