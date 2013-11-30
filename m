Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EBB9452986
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:31:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHVrV7019279
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:31:53 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHVrnN032413
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:31:53 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:31:53 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 02/14] wpa-supplicant-wl18xx: Removed
	ol_r8.a6.01 recipe.
Thread-Index: AQHO7C3x2v9dbryQJky3fDN+gbec/Jo+C0GA
Date: Sat, 30 Nov 2013 17:31:51 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C83AA@DFLE08.ent.ti.com>
References: <1385638397-11663-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638397-11663-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 02/14] wpa-supplicant-wl18xx: Removed	ol_r8.a6.01 recipe.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:33 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 02/14] wpa-supplicant-wl18xx: Removed
> ol_r8.a6.01 recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Clean up unsupported version.
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wpa-supplicant-wl18xx_r8.a6.01.bb              |   24 --------------=
------
>  1 files changed, 0 insertions(+), 24 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-
> wl18xx_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-
> supplicant-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wp=
a-
> supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> deleted file mode 100644
> index f6c4f70..0000000
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-
> wl18xx_r8.a6.01.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -# This is a TI specific version of the wpa-supplicant recipe for use wit=
h the -#
> wl18xx wlan module.
> -
> -require wpa-supplicant.inc
> -
> -LICENSE =3D "GPLv2 | BSD"
> -LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e \
> -                    file://../README;md5=3D5cb758942d25f6f61fd4ac388fd44=
6fa \
> -
> file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=3D8835156c8ab8cad6=
356ec
> 7f39ebe3aba"
> -
> -FILESEXTRAPATHS_append :=3D "${THISDIR}/wpa-supplicant:"
> -
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "7190ff7dbd43243290b626068ded0d61c5019050"
> -PR =3D "r2+gitr${SRCPV}"
> -
> -# Add ti to the PV to indicate that this is a TI modify version of wpa-s=
upplicant.
> -PV =3D "2.0-devel-ti"
> -
> -PROVIDES +=3D "wpa-supplicant"
> -RPROVIDES_${PN}  +=3D "wpa-supplicant"
> -RREPLACES_${PN}  +=3D "wpa-supplicant"
> -RCONFLICTS_${PN}  +=3D "wpa-supplicant"
> -RDEPENDS_${PN} +=3D "wpa-supplicant-cli wpa-supplicant-passphrase"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

