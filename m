Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EAAD1529E6
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 23:06:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94N60Dh013129
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 18:06:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94N60EG010372
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 18:06:00 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 4 Oct 2013 18:06:00 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/4] ti-tisdk-makefile: Speed up building
	of	kernel and u-boot
Thread-Index: AQHOwVUxJtRDIXRGrUeEAzm+1iMv/ZnlKUEQ
Date: Fri, 4 Oct 2013 23:05:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C56BD73@DFLE08.ent.ti.com>
References: <1380929996-30089-1-git-send-email-fcooper@ti.com>,
	<1380929996-30089-2-git-send-email-fcooper@ti.com>
	<618DBEA0-435A-4520-8B8B-548311D810D8@ti.com>
In-Reply-To: <618DBEA0-435A-4520-8B8B-548311D810D8@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] ti-tisdk-makefile: Speed up building of	kernel and u-boot
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
X-List-Received-Date: Fri, 04 Oct 2013 23:06:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, October 04, 2013 5:58 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 2/4] ti-tisdk-makefile: Speed up buildin=
g of
> kernel and u-boot
>=20
> Why not default to a valid value like 1, then change it later?  That way =
you don't
> depend on the install script running first.
[Franklin] I thought about it but the top level Makefile is broken until yo=
u run the install script since it depends on a some of the Rules.make varia=
bles  that aren't set properly until that script runs. Especially for the k=
ernel since LINUXKERNEL_INSTALL_DIR is set by that script.

To be honest even though the above is true it probably still wouldn't hurt.
>=20
> Sincerely,
> Chase Maupin
>=20
> Sent from my iPad
>=20
> > On Oct 4, 2013, at 5:54 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wro=
te:
> >
> > * Introduce a new variable MAKE_JOBS that will be used with make's -j
> > option to  speed up the build of the kernel and u-boot.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > .../ti-tisdk-makefile/Makefile_linux               |    4 ++--
> > .../ti-tisdk-makefile/Makefile_linux-dtbs          |    2 +-
> > .../ti-tisdk-makefile/Makefile_u-boot-legacy       |    4 ++--
> > .../ti-tisdk-makefile/Makefile_u-boot-spl          |    4 ++--
> > .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |    2 ++
> > .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> > 6 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux
> > index 457bd24..4a13f48 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile/Makefile_linux
> > @@ -4,8 +4,8 @@ linux:
> >    @echo     Building the Linux Kernel
> >    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    $(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
> > -    $(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) uImage
> > -    $(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) modules
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) uImage
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> > + CROSS_COMPILE=3D$(CROSS_COMPILE) modules
> >
> > linux_install:
> >    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux-dtbs
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux-dtbs
> > index b195730..5093649 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_linux-dtbs
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile/Makefile_linux-dtbs
> > @@ -3,7 +3,7 @@ linux-dtbs:
> >    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    @echo     Building the Linux Kernel DTBs
> >    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -    $(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> CROSS_COMPILE=3D$(CROSS_COMPILE) dtbs
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
> > + CROSS_COMPILE=3D$(CROSS_COMPILE) dtbs
> >
> > linux-dtbs_install:
> >    @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-legacy
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-legacy
> > index 70640e2..028644d 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-legacy
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile/Makefile_u-boot-legacy
> > @@ -4,8 +4,8 @@ u-boot-legacy_clean: u-boot_clean
> > u-boot-legacy_install: u-boot_install
> >
> > u-boot:
> > -    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> > -    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE)
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-*
> > + CROSS_COMPILE=3D$(CROSS_COMPILE)
> >
> > u-boot_clean:
> >    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> > CROSS_COMPILE=3D$(CROSS_COMPILE) clean diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-spl
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-spl
> > index 566647c..9ce6429 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Makefile_u-boot-spl
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile/Makefile_u-boot-spl
> > @@ -4,8 +4,8 @@ u-boot-spl_clean: u-boot_clean
> > u-boot-spl_install: u-boot_install
> >
> > u-boot:
> > -    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> > -    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE)
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-*
> CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> > +    $(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-*
> > + CROSS_COMPILE=3D$(CROSS_COMPILE)
> >
> > u-boot_clean:
> >    $(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
> > CROSS_COMPILE=3D$(CROSS_COMPILE) clean diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Rules.make
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Rules.make
> > index a20c684..4cc3333 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/
> > Rules.make
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile/Rules.make
> > @@ -4,6 +4,8 @@ PLATFORM=3D__PLATFORM__
> > #Architecture
> > ARCH=3D__ARCH__
> >
> > +MAKE_JOBS=3D__MAKE_JOBS__
> > +
> > #u-boot machine
> > UBOOT_MACHINE=3D__UBOOT_MACHINE__
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > index 74a93c6..a1faffd 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile_1.0.bb
> > @@ -33,7 +33,7 @@ SRC_URI =3D "\
> >     file://Makefile_oprofile-example \ "
> >
> > -PR =3D "r14"
> > +PR =3D "r15"
> >
> > MAKEFILES_COMMON =3D "linux \
> >                     matrix-gui \
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

