Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9CDDE52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKH6Xt004399;
	Fri, 20 Jun 2014 15:17:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKH6aS028080;
	Fri, 20 Jun 2014 15:17:06 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 19/19] arago.conf: update version, remove
	FETCHCMD_wget workaround
Thread-Index: AQHPjLEcLvUaGwpJC0yKRHKJGkxZAJt6sVeA//++emA=
Date: Fri, 20 Jun 2014 20:17:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D65BD@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-20-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D95A0@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D95A0@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 19/19] arago.conf: update version, remove FETCHCMD_wget workaround
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:12 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 19/19] arago.conf: update version, remov=
e
> FETCHCMD_wget workaround
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 19/19] arago.conf: update version, remove
> >FETCHCMD_wget workaround
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/conf/distro/arago.conf | 5 +----
> > 1 file changed, 1 insertion(+), 4 deletions(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> >arago-distro/conf/distro/arago.conf
> >index b652fda..7d916e3 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -1,6 +1,6 @@
> > # Name and version of the distribution  DISTRO_NAME =3D "Arago"
> >-DISTRO_VERSION =3D "2014.05"
> >+DISTRO_VERSION =3D "2014.06"
> >
> > # SDK paths and names
> > SDK_NAME_PREFIX =3D "arago"
> >@@ -13,9 +13,6 @@ SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
> > # Mask any broken recipes (currently none)  #BBMASK =3D ""
> >
> >-# Bump the connection timeout to 5 minutes to overcome slow proxy
> >servers -FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 300 -nv
> >--passive-ftp --no-check-certificate"
> >-
> > # Also build 32bit Pseudo on 64bit machines, fix error when preloading
> >libpseudo.so  NO32LIBS =3D "0"
> >
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

