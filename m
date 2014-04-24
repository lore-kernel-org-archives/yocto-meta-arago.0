Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2FF3C52998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:29:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OETGNO026999;
	Thu, 24 Apr 2014 09:29:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OETGAB031049;
	Thu, 24 Apr 2014 09:29:16 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 09:29:16 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/8] arago.conf: minor cleanup, version bump
Thread-Index: AQHPX1/G9AGiVkp6xE+RRq19n7BbY5shB2sA///M9NA=
Date: Thu, 24 Apr 2014 14:29:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68E162@DFLE08.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB1E8D@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB1E8D@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] arago.conf: minor cleanup, version bump
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
X-List-Received-Date: Thu, 24 Apr 2014 14:29:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, April 24, 2014 7:32 AM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/8] arago.conf: minor cleanup, version
> bump
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 8:51 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 1/8] arago.conf: minor cleanup, version
> >bump
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/conf/distro/arago.conf | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
> >arago-distro/conf/distro/arago.conf
> >index cc3cedf..1c8c572 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -1,6 +1,6 @@
> > # Name and version of the distribution  DISTRO_NAME =3D "Arago"
> >-DISTRO_VERSION =3D "2014.03"
> >+DISTRO_VERSION =3D "2014.05"
> >
> > # SDK paths and names
> > SDK_NAME_PREFIX =3D "arago"
> >@@ -10,8 +10,8 @@ SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
> > SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
> > SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
> >
> >-# Mask some broken recipes
> >-BBMASK =3D "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-
> >oe/recipes-extended/lighttpd|meta-linaro/recipes-core/netbase"
> >+# Mask any broken recipes (currently none) #BBMASK =3D ""
> >
> > # Bump the connection timeout to 5 minutes to overcome slow proxy
> >servers  FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 300 -nv
> >--passive-ftp --no-check-certificate"
> >--
> >1.9.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

