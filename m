Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2F2F2529B7
	for <meta-arago@arago-project.org>;
	Thu,  9 Oct 2014 21:19:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s99LJA61025263
	for <meta-arago@arago-project.org>; Thu, 9 Oct 2014 16:19:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s99LJAwn028360
	for <meta-arago@arago-project.org>; Thu, 9 Oct 2014 16:19:10 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 9 Oct 2014 16:19:10 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Machani, Yaniv" <yanivma@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] wl18xx: scripts: fix station dhcpc script
Thread-Index: AQHP49foMO/q/9Wnc0GN5cAQAXW0gpwoRZlA
Date: Thu, 9 Oct 2014 21:19:09 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C748F68@DFLE08.ent.ti.com>
References: <1412869083-16325-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1412869083-16325-1-git-send-email-yanivma@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] wl18xx: scripts: fix station dhcpc script
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
X-List-Received-Date: Thu, 09 Oct 2014 21:19:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Machani, Yaniv
> Sent: Thursday, October 09, 2014 10:38 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] wl18xx: scripts: fix station dhcpc script
>=20
>  - Check if DHCPC was already started for wlan0 only.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wl18xx-target-scripts_r8.a9.14.bb              |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-
> scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-
> connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> index 65fcd20..cdd8d16 100644
> --- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx=
-
> target-scripts_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-
> scripts/wl18xx-target-scripts_r8.a9.14.bb
> @@ -2,10 +2,10 @@ DESCRIPTION =3D "Scripts and configuration files for TI
> wireless drivers"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Db8d6a0865f50159bf5c0d175d=
1
> f4a705"
>=20
> -PR =3D"r3+gitr${SRCPV}"
> +PR =3D"r4+gitr${SRCPV}"
>=20
>  # Tag: ol_r8.a9.14
> -SRCREV =3D "2570d350f0bccf7e3df7bc5c7398a0a846724f58"
> +SRCREV =3D "f6c66162e75c6a31fa7142530534e4df8f1a7bed"
>  BRANCH =3D "sitara-mbss"
>  SRC_URI =3D "git://git.ti.com/wilink8-wlan/wl18xx-target-
> scripts.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> --
> 1.7.9
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

