Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 059FF529B5
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 19:20:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OJKiFC014098;
	Thu, 24 Apr 2014 14:20:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OJKiFk021718;
	Thu, 24 Apr 2014 14:20:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 14:20:44 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH 2/3] local.conf.sample:
	remove no longer needed BBMASK
Thread-Index: AQHPX+Gy1nCxkQ6tq02OmSEcFwSLBJshJNEw
Date: Thu, 24 Apr 2014 19:20:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68EA56@DFLE08.ent.ti.com>
References: <1398359871-24257-1-git-send-email-denis@denix.org>
	<1398359871-24257-2-git-send-email-denis@denix.org>
In-Reply-To: <1398359871-24257-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH 2/3] local.conf.sample: remove no longer needed BBMASK
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
X-List-Received-Date: Thu, 24 Apr 2014 19:20:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Thursday, April 24, 2014 12:18 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [oe-layersetup][PATCH 2/3] local.conf.sample: remov=
e
> no longer needed BBMASK
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  sample-files/local.conf.sample | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/sample-files/local.conf.sample b/sample-files/local.conf.sam=
ple
> index 24cb44f..66c1d51 100644
> --- a/sample-files/local.conf.sample
> +++ b/sample-files/local.conf.sample
> @@ -149,9 +149,6 @@ PARALLEL_MAKE =3D "-j 1"
>  # By default, go with the "distroless" configuration, when not set
>  #DISTRO   =3D "arago"
>=20
> -# Mask misc recipes for distroless setup -BBMASK =3D "meta-ti/recipes-mi=
sc"
> -
>  # Set terminal types by default it expects gnome-terminal  # but we chos=
e
> xterm  TERMCMD =3D "${XTERM_TERMCMD}"
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

