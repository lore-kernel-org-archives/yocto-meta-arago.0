Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B5FA252A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:18:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJIM1M022689;
	Fri, 20 Jun 2014 14:18:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJILjo012064;
	Fri, 20 Jun 2014 14:18:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:18:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
	DEFAULTTUNE settings that went to meta-ti
Thread-Index: AQHPjLJunSWK+C7dcU24Z4iPd9m0KJt6sRwA//+s4IA=
Date: Fri, 20 Jun 2014 19:18:21 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D6362@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-16-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9495@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D9495@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 15/19] toolchain-linaro/gcc: remove DEFAULTTUNE settings that went to meta-ti
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
X-List-Received-Date: Fri, 20 Jun 2014 19:18:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

I don't see any DEFAULTTUNE settings in meta-ti. Is there a package in the =
future that will make that change? I have no issue with this in general sin=
ce this was another way I solved my valgrind issue and in oe-core it is set=
ting a working value but I'm just curious.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:11 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> DEFAULTTUNE settings that went to meta-ti
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> >DEFAULTTUNE settings that went to meta-ti
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 5 --
> >---
> > meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 5 --
> >---
> > 2 files changed, 10 deletions(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> >gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> >index f7c8032..530f3c3 100644
> >--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> >+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> >@@ -2,11 +2,6 @@
> > TCMODE =3D "default"
> > TCLIBC =3D "eglibc"
> >
> >-DEFAULTTUNE =3D "cortexa8thf-neon"
> >-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> >-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> >-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> >-
> > # Match some of the external vars
> > TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
> > TOOLCHAIN_PREFIX :=3D "${TARGET_PREFIX}"
> >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> >linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
> >linaro.inc
> >index 95269a7..26e69ae 100644
> >--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> >+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> >@@ -3,11 +3,6 @@ TCMODE =3D "external-linaro"
> > TCLIBC =3D "external-linaro-toolchain"
> >
> > ELT_TARGET_SYS =3D "arm-linux-gnueabihf"
> >-DEFAULTTUNE =3D "cortexa8thf-neon"
> >-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> >-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> >-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> >-DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
> >
> > PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
> >"external-linaro-toolchain"
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

