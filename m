Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 848D8529CF
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 13:28:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EDSoqs008035
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:50 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EDSosw026432
	for <meta-arago@arago-project.org>; Tue, 14 Jan 2014 07:28:50 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 07:28:50 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 8/8] crda: Removed redundant recipe.
Thread-Index: AQHO8+5eD8Y6mobtOE6EeQCV4mgcQpqEcTwA
Date: Tue, 14 Jan 2014 13:28:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C604DB5@DFLE08.ent.ti.com>
References: <1386490696-16318-1-git-send-email-yanivma@ti.com>
	<1386490696-16318-8-git-send-email-yanivma@ti.com>
In-Reply-To: <1386490696-16318-8-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] crda: Removed redundant recipe.
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
X-List-Received-Date: Tue, 14 Jan 2014 13:28:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Sunday, December 08, 2013 2:18 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 8/8] crda: Removed redundant recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - crda 1.1.3 from meta-openembedded can be used.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  .../recipes-connectivity/crda/crda_1.1.1.bb        |   37 --------------=
------
>  2 files changed, 1 insertions(+), 38 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-
> arago-distro/conf/distro/include/arago-prefs.inc
> index 412fa3a..a19e425 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -92,7 +92,7 @@ PREFERRED_VERSION_readline-native =3D "5.2"
>  PREFERRED_VERSION_readline-nativesdk =3D "5.2"
>=20
>  PREFERRED_VERSION_libnl =3D "3.2.21"
> -PREFERRED_VERSION_crda =3D "1.1.1"
> +PREFERRED_VERSION_crda =3D "1.1.3"
>  PREFERRED_VERSION_obex =3D "0.34"
>  PREFERRED_VERSION_bluez4 =3D "4.101"
>  PREFERRED_VERSION_bluez-hcidump =3D "2.2"
> diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb b/=
meta-
> arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> deleted file mode 100644
> index e3880a1..0000000
> --- a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.1.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION =3D "Wireless Central Regulatory Domain Agent"
> -HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
> -SECTION =3D "base"
> -LICENSE =3D "ISC"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D07c4f6dea3845b02a18dc00c8c87699c"
> -
> -PR =3D "r0"
> -
> -DEPENDS =3D "libgcrypt libnl python-native python-m2crypto-native"
> -RDEPENDS_${PN} =3D "udev"
> -
> -SRC_URI =3D "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=
=3Dcrda
> \
> -           http://wireless.kernel.org/download/wireless-
> regdb/regulatory.bins/2011.04.28-regulatory.bin;name=3Dreg \
> -"
> -
> -CFLAGS +=3D " -DCONFIG_LIBNL20"
> -
> -EXTRA_OEMAKE =3D "MAKEFLAGS=3D"
> -do_compile() {
> -    oe_runmake all_noverify
> -}
> -
> -do_install() {
> -    oe_runmake DESTDIR=3D${D} install
> -    install -d ${D}/usr/lib/crda/
> -    install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin
> ${D}/usr/lib/crda/regulatory.bin
> -}
> -
> -SRC_URI[crda.md5sum] =3D "5fc77af68b3e21736b8ef2f8b061c810"
> -SRC_URI[crda.sha256sum] =3D
> "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5
> "
> -SRC_URI[reg.md5sum] =3D "1535e98bcaba732e2f8e8f62dac6f369"
> -SRC_URI[reg.sha256sum] =3D
> "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe01011a318b3dceaba33b
> "
> -
> -FILES_${PN} +=3D "\
> -    /lib/udev/rules.d/85-regulatory.rules \
> -    /usr/lib/crda/regulatory.bin \
> -"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

