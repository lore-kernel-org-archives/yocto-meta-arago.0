Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B648952A22
	for <meta-arago@arago-project.org>;
	Tue, 25 Mar 2014 15:06:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2PF64vD021446
	for <meta-arago@arago-project.org>; Tue, 25 Mar 2014 10:06:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2PF64l8019846
	for <meta-arago@arago-project.org>; Tue, 25 Mar 2014 10:06:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 25 Mar 2014 10:06:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] bt-firmware: Add support for am437x
Thread-Index: AQHPJzJzT1YTzXhpRUSW/XbEOxUh2prsigWA//+0d8CABbUTwIAANXbA
Date: Tue, 25 Mar 2014 15:06:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C66DBCA@DFLE08.ent.ti.com>
References: <1392127492-3220-1-git-send-email-eyalr@ti.com>
	<20140321201527.GQ12929@edge>
	<8F29D6B095ED194EA1980491A5E029710C66BA7D@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015CF51843@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF51843@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] bt-firmware: Add support for am437x
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
X-List-Received-Date: Tue, 25 Mar 2014 15:06:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Tuesday, March 25, 2014 6:55 AM
> To: Cooper Jr., Franklin; Dmytriyenko, Denys; meta-arago@arago-project.or=
g
> Subject: RE: [meta-arago] [PATCH] bt-firmware: Add support for am437x
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Friday, March 21, 2014 3:46 PM
> >To: Dmytriyenko, Denys; meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH] bt-firmware: Add support for am437x
> >
> >Yep please pull this in. It won't be apart of our next sdk but the next
> >dot release that will probably stick with 3.12 will need this.
>=20
> Will your next dot release move to Dora or stick with Dylan?
[Franklin] Dylan.
>=20
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> >> Sent: Friday, March 21, 2014 3:15 PM
> >> To: meta-arago@arago-project.org
> >> Subject: Re: [meta-arago] [PATCH] bt-firmware: Add support for
> >am437x
> >>
> >> Franklin,
> >>
> >> Do you need this patch in dylan? It was not picked up for
> >2013.12.01 release,
> >> as the corresponding kernel changes were not approved. I pushed
> >it to dora...
> >>
> >> --
> >> Denys
> >>
> >>
> >> On Tue, Feb 11, 2014 at 04:04:52PM +0200, Eyal Reizer wrote:
> >> > Modify the recipe to allow installing the bluetooth init
> >script for
> >> > am437x-evm
> >> >
> >> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
> >> > ---
> >> >  ...001-Makefile-allow-building-within-the-OE.patch |   29
> >+++++++++++--------
> >> >  .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    9
> >+++---
> >> >  2 files changed, 22 insertions(+), 16 deletions(-)
> >> >
> >> > diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware/0001-
> >> Makefile-allow-building-within-the-OE.patch b/meta-arago-
> >extras/recipes-
> >> bsp/bt-firmware/bt-firmware/0001-Makefile-allow-building-within-
> >the-
> >> OE.patch
> >> > index 49caa85..a8642a9 100644
> >> > --- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware/0001-
> >> Makefile-allow-building-within-the-OE.patch
> >> > +++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware/0001-
> >> Makefile-allow-building-within-the-OE.patch
> >> > @@ -1,6 +1,6 @@
> >> > -From 8f226ccc9d2cbd10d454e131376c35f502a45e3b Mon Sep 17
> >00:00:00
> >> 2001
> >> > -From: Chase Maupin <Chase.Maupin@ti.com>
> >> > -Date: Wed, 7 Mar 2012 14:11:42 -0600
> >> > +From 465ffd990e3366732eb5e2271313539b55c4ccb7 Mon Sep 17
> >00:00:00
> >> 2001
> >> > +From: Eyal Reizer <eyalr@ti.com>
> >> > +Date: Tue, 11 Feb 2014 15:17:53 +0200
> >> >  Subject: [PATCH] Makefile: allow building with OE
> >> >
> >> >  * Use defaults and source values that allow building this @@
> >> > -10,17 +10,19 @@ Upstread-Status: Pending
> >> >      * Will be accepted into next release
> >> >
> >> >  Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> > +    < adapated for am437x>
> >> > +Signed-off-by: Eyal Reizer <eyalr@ti.com>
> >> >  ---
> >> > - Makefile |   21 +++++++++++++++++++++
> >> > - 1 files changed, 21 insertions(+), 0 deletions(-)
> >> > + Makefile |   23 +++++++++++++++++++++++
> >> > + 1 files changed, 23 insertions(+), 0 deletions(-)
> >> >
> >> >  diff --git a/Makefile b/Makefile
> >> > -index 9035e40..bd94881 100644
> >> > +index 9035e40..23bc5b6 100644
> >> >  --- a/Makefile
> >> >  +++ b/Makefile
> >> > -@@ -1,5 +1,26 @@
> >> > +@@ -1,5 +1,28 @@
> >> >   # Installs the the Bluetooth firmware files into the root
> >file system
> >> > -
> >> > +
> >> >  +-include ../../../Rules.make
> >> >  +
> >> >  +# If KERNEL_DIR is not set then use the default in
> >Rules.make
> >> > @@ -41,9 +43,12 @@ index 9035e40..bd94881 100644  +ifeq
> >> > ($(PLATFORM), am37x-evm)
> >> >  +    MACHINE_NAME :=3D omap3evm
> >> >  +endif
> >> > -+
> >> > ++ifeq ($(PLATFORM), am437x-evm)
> >> > ++    MACHINE_NAME :=3D am43xx
> >> > ++endif
> >> >   install:
> >> > -	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
> >> > -	cp -f ./${MACHINE_NAME}/*
> >$(DEST_DIR)${BASE_LIB_DIR}/firmware
> >> > ---
> >> > + 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
> >> > + 	cp -f ./${MACHINE_NAME}/*
> >$(DEST_DIR)${BASE_LIB_DIR}/firmware
> >> > +--
> >> >  1.7.0.4
> >> > +
> >> > diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware_git.bb
> >> b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
> >> > index d788875..9aff61a 100644
> >> > --- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware_git.bb
> >> > +++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-
> >firmware_git.bb
> >> > @@ -1,6 +1,6 @@
> >> >  DESCRIPTION =3D "Firmware files for Bluetooth"
> >> >  LICENSE =3D "TI-TSPA"
> >> > -LIC_FILES_CHKSUM =3D
> >> "file://am335x/LICENCE;md5=3D5f67a65df8b40038a3251b2fe5b912df \
> >> > +LIC_FILES_CHKSUM =3D
> >> "file://am335x/LICENCE;md5=3D4b46aed2a87412c84f9363a8db053e1b \
> >> >  "
> >> >
> >> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> > @@ -11,16 +11,17 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> >  RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
> >> >  RREPLACES_${PN}  =3D "linux-firmware-wl12xx"
> >> >
> >> > -PR =3D "r3+gitr${SRCPV}"
> >> > +PR =3D "r4+gitr${SRCPV}"
> >> >
> >> > -COMPATIBLE_MACHINE =3D "ti33x"
> >> > +COMPATIBLE_MACHINE =3D "ti33x|ti43x"
> >> >
> >> > -SRCREV =3D "57a8e569575e742c47dc2452c4932dcfff816442"
> >> > +SRCREV =3D "7496df8d130f2db85d5d50b1f703213edf0b54fb"
> >> >  SRC_URI =3D "git://github.com/TI-ECS/bt-
> >firmware.git;protocol=3Dgit \
> >> >             file://0001-Makefile-allow-building-within-the-
> >OE.patch"
> >> >
> >> >  PLATFORM =3D "unknown"
> >> >  PLATFORM_ti33x =3D "am335x-evm"
> >> > +PLATFORM_ti43x =3D "am437x-evm"
> >> >
> >> >  S =3D "${WORKDIR}/git"
> >> >
> >> > --
> >> > 1.7.0.4
> >> >
> >> > _______________________________________________
> >> > meta-arago mailing list
> >> > meta-arago@arago-project.org
> >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

