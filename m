Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2425452986
	for <meta-arago@arago-project.org>;
	Sat, 30 Nov 2013 17:39:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAUHd3UA009943
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:39:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAUHd28I004092
	for <meta-arago@arago-project.org>; Sat, 30 Nov 2013 11:39:03 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Sat, 30 Nov 2013 11:39:03 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 04/14] hostap-daemon-wl18xx: Removed
	ol_r8.a6.01 recipe.
Thread-Index: AQHO7C4yZiXc+AkTYkaiziJcrAZ3Wpo+DbaQ
Date: Sat, 30 Nov 2013 17:39:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C8429@DFLE08.ent.ti.com>
References: <1385638520-11753-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1385638520-11753-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 04/14] hostap-daemon-wl18xx: Removed	ol_r8.a6.01 recipe.
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
X-List-Received-Date: Sat, 30 Nov 2013 17:39:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, November 28, 2013 5:35 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 04/14] hostap-daemon-wl18xx: Removed
> ol_r8.a6.01 recipe.
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> Clean up unsupported version.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../hostap/hostap-daemon-wl18xx_r8.a6.01.bb        |   23 --------------=
------
>  1 files changed, 0 insertions(+), 23 deletions(-)  delete mode 100644 me=
ta-
> arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a6.01.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap=
-
> daemon-wl18xx_r8.a6.01.bb
> deleted file mode 100644
> index e232b32..0000000
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> wl18xx_r8.a6.01.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -# This is a TI specific version of the hostap-daemon recipe for use with=
 the -#
> wl18xx wlan and bluetooth module.
> -
> -require hostap.inc
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dab87f20cd7e8c0d0a6539b34d3791d0e"
> -
> -PR_append =3D "b+gitr${SRCPV}"
> -
> -FILESEXTRAPATHS_append :=3D "${THISDIR}/hostap-daemon:"
> -
> -# Add TI to the end to make it clear that this is a TI customized versio=
n -# of
> hostap -PV =3D "2.0-devel-ti"
> -
> -# Tag: ol_r8.a6.01
> -SRCREV =3D "7190ff7dbd43243290b626068ded0d61c5019050"
> -
> -PROVIDES +=3D "hostap-daemon"
> -RPROVIDES_${PN} +=3D "hostap-daemon"
> -RREPLACES_${PN} +=3D "hostap-daemon"
> -RCONFLICTS_${PN} +=3D "hostap-daemon"
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

