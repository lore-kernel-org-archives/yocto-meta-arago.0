Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3BB0152A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:31:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJV4nN018960;
	Fri, 20 Jun 2014 14:31:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJV4Av022487;
	Fri, 20 Jun 2014 14:31:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:31:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
	DEFAULTTUNE settings that went to meta-ti
Thread-Index: AQHPjLJunSWK+C7dcU24Z4iPd9m0KJt6sRwA//+s4ICAAFhTAP//rHPQ
Date: Fri, 20 Jun 2014 19:31:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D646B@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-16-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9495@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6D6362@DFLE08.ent.ti.com>
	<20140620192924.GE1825@edge>
In-Reply-To: <20140620192924.GE1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Fri, 20 Jun 2014 19:31:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, June 20, 2014 2:29 PM
> To: Cooper Jr., Franklin
> Cc: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> DEFAULTTUNE settings that went to meta-ti
>=20
> On Fri, Jun 20, 2014 at 07:18:21PM +0000, Cooper Jr., Franklin wrote:
> > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> >
> > I don't see any DEFAULTTUNE settings in meta-ti.
>=20
> https://lists.yoctoproject.org/pipermail/meta-ti/2014-June/004722.html
>=20
>=20
> > Is there a package in the future that will make that change? I have no
> > issue with this in general since this was another way I solved my
> > valgrind issue
>=20
> That's the right way to do it on per-machine level. Unfortunately, it see=
ms like
> a bitbake issue/feature when doing it on per-distro level, as I described=
 it
> yesterday.
>=20
>=20
> > and in oe-core it is setting a working value but I'm just curious.
>=20
> Huh? What do you mean?
[Franklin] Ex oe-core/meta/conf/machine/include/tune-cortexa9.inc
>=20
>=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > Sent: Friday, June 20, 2014 2:11 PM
> > > To: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> > > DEFAULTTUNE settings that went to meta-ti
> > >
> > > Acked-by: Chase Maupin <chase.maupin@ti.com>
> > >
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > >Sent: Friday, June 20, 2014 12:57 PM
> > > >To: meta-arago@arago-project.org
> > > >Subject: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> > > >DEFAULTTUNE settings that went to meta-ti
> > > >
> > > >From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > >---
> > > > meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 5 --
> > > >---
> > > > meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 5 --
> > > >---
> > > > 2 files changed, 10 deletions(-)
> > > >
> > > >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> > > >gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > >index f7c8032..530f3c3 100644
> > > >--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > >+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > >@@ -2,11 +2,6 @@
> > > > TCMODE =3D "default"
> > > > TCLIBC =3D "eglibc"
> > > >
> > > >-DEFAULTTUNE =3D "cortexa8thf-neon"
> > > >-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > > >-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > > >-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > > >-
> > > > # Match some of the external vars
> > > > TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
> > > > TOOLCHAIN_PREFIX :=3D "${TARGET_PREFIX}"
> > > >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> > > >linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
> > > >linaro.inc
> > > >index 95269a7..26e69ae 100644
> > > >--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > >+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > >@@ -3,11 +3,6 @@ TCMODE =3D "external-linaro"
> > > > TCLIBC =3D "external-linaro-toolchain"
> > > >
> > > > ELT_TARGET_SYS =3D "arm-linux-gnueabihf"
> > > >-DEFAULTTUNE =3D "cortexa8thf-neon"
> > > >-DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > > >-DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > > >-DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > > >-DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
> > > >
> > > > PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
> > > >"external-linaro-toolchain"
> > > >
> > > >--
> > > >2.0.0
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

