Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 18A7752A47
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 15:34:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IFYwo0021011;
	Mon, 18 Mar 2013 10:34:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IFYwD9025899;
	Mon, 18 Mar 2013 10:34:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 18 Mar 2013 10:34:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Eyal Reizer <eyalreizer@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/9] wl18xx-firmware: install Wilink8 wlan
	firmware files
Thread-Index: AQHOI92a68EG0FO2R0SQWg0xYQYlzpirk/JQ
Date: Mon, 18 Mar 2013 15:34:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159480CD2@DLEE11.ent.ti.com>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-2-git-send-email-eyalr@ti.com>
In-Reply-To: <1363613762-6537-2-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] wl18xx-firmware: install Wilink8 wlan	firmware files
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
X-List-Received-Date: Mon, 18 Mar 2013 15:35:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Eyal Reizer
> Sent: Monday, March 18, 2013 8:36 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/9] wl18xx-firmware: install
> Wilink8 wlan firmware files
>=20
> Add a recipe for installing the Wilink8 wlan firmware files into
> the target file system.
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
>  .../wl18xx-firmware/wl18xx-firmware_git.bb         |   28
> ++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware/Makefile
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-firmware_git.bb
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
> firmware/wl18xx-firmware_git.bb b/meta-arago-extras/recipes-
> bsp/wl18xx-firmware/wl18xx-firmware_git.bb

Same comment as Franklin had about the wlconf recipe.  Should you drop the =
_git version if you are going to be using releases with a version?

> new file mode 100644
> index 0000000..43c40bb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> firmware_git.bb
> @@ -0,0 +1,28 @@
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

Why does this PROVIDES and RPROVIDES wl12xx-firmware?  Shouldn't this be wl=
18xx-firmware?

Should this RCONFLICTS with wl12xx-firmware?  Or is it OK to install both? =
  Does it make sense to install both though if they cannot co-exist?

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

