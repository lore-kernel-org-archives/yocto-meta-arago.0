Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9D83152A23
	for <meta-arago@arago-project.org>;
	Thu, 19 Jun 2014 20:32:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5JKWqbe005868
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 15:32:52 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JKWqLH018524
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 15:32:52 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 19 Jun 2014 15:32:52 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] toolchain-*.inc: Replace variable
	overrides with bb.utils function
Thread-Index: AQHPiwY/mf1tgPIzW0Ccu6n9BlLZEpt48eOA//+sdiCAAF0jAP//vtXQgABpWAD//7pfwA==
Date: Thu, 19 Jun 2014 20:32:51 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D510A@DFLE08.ent.ti.com>
References: <1403103711-15485-1-git-send-email-fcooper@ti.com>
	<20140619161808.GP1825@edge>
	<8F29D6B095ED194EA1980491A5E029710C6D49CA@DFLE08.ent.ti.com>
	<20140619165230.GR1825@edge>
	<8F29D6B095ED194EA1980491A5E029710C6D4C55@DFLE08.ent.ti.com>
	<20140619191617.GU1825@edge>
In-Reply-To: <20140619191617.GU1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] toolchain-*.inc: Replace variable overrides with bb.utils function
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
X-List-Received-Date: Thu, 19 Jun 2014 20:32:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, June 19, 2014 2:16 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] toolchain-*.inc: Replace variable
> overrides with bb.utils function
>=20
> On Thu, Jun 19, 2014 at 02:01:59PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, June 19, 2014 11:53 AM
> > > To: Cooper Jr., Franklin
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH v2] toolchain-*.inc: Replace
> > > variable overrides with bb.utils function
> > >
> > > On Thu, Jun 19, 2014 at 12:37:47PM -0400, Cooper Jr., Franklin wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Thursday, June 19, 2014 11:18 AM
> > > > > To: Cooper Jr., Franklin
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH v2] toolchain-*.inc: Replace
> > > > > variable overrides with bb.utils function
> > > > >
> > > > > On Wed, Jun 18, 2014 at 10:01:51AM -0500, Franklin S. Cooper Jr
> wrote:
> > > > > > * Conf files are unable to use variable overrides instead bitba=
ke
> utility
> > > > > >   functions are needed to mimic the functionality.
> > > > > > * Currently the DEFAULTTUNE variable isn't being set properly
> > > > > > for non
> > > > > Cortex A8
> > > > > >   devices which causes uses when using an architecture
> > > > > > override for non
> > > > > Cortex
> > > > > >   A8 devices.
> > > > > > * This issue was first discovered due to the inability to build=
 valgrind
> for
> > > > > >   am43x and via testing determined that this affected any non
> > > > > > Cortex A8
> > > > > machine/SOC_FAMILY
> > > > > >   within meta-ti.
> > > > >
> > > > > Ok, so skipping the DEFAULTTUNE override issues for now, why
> > > > > would it affect valgrind and it's COMPATIBLE_HOST setting?
> > >
> > > > [Franklin] Well this is a long story :). I ended up having to put
> > > > debug statements in bitbake (lib/bb/data_smart.py)
> > >
> > > > The list of valid overrides for this recipe didn't include armv7a.
> > > > This was due to TUNE_FEATURES being set to
> > > > TUNE_FEATURES_tune_${DEFAULTTUNE} which is defined in
> > > > oe-core/meta/conf/bitbake.conf. Due to this bug this statement is
> > > > now set to 'TUNE_FEATURES_tune_cortexa8thf-neon'. This variable is
> > > > defined in tune-cortexa8.inc which is not used for non CortexA8
> machines.
> > > Therefore, bitbake is unable to expand this variable since it has
> > > never been defined.
> > > > The value from that variable is what bitbake uses to add the ARM
> > > > architecture override so without the expanded value armv7a isn't
> > > > part of the override list.
> > > >
> > > > Valgrind sets the COMPATIBLE_HOST to:
> > > > COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
> > > > COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
> > > >
> > > > So that architecture override is essential. Also changing
> > > > 'arm.*-linux' -> to ''arm.*-linux*' doesn't make a difference.
> > >
> > >
> > > Everything seems to work for me. As you can see, OVERRIDES does
> > > contain "armv7a" and DEFAULTTUNE is set to "cortexa9thf-neon" and
> > > TUNE_FEATURES is expanded to the correct list of tunes:
> > >
> > >
> > > $ MACHINE=3Dam437x-evm bitbake tisdk-rootfs-image -e|grep -e
> '^OVERRIDES=3D'
> > > -e '^DEFAULTTUNE=3D' -e '^TUNE_FEATURES'|sort
> > >
> > > DEFAULTTUNE=3D"cortexa9thf-neon"
> > > OVERRIDES=3D"linux-gnueabi:arm:build-linux:pn-tisdk-rootfs-
> > > image:armv7a:ti43x:am437x-evm:arago:class-target:forcevariable:thumb
> > > :libc-
> > > glibc"
> > > TUNE_FEATURES=3D"armv7a vfp thumb neon callconvention-hard cortexa9"
> > > TUNE_FEATURES_tune-armv4=3D"armv4"
> > > TUNE_FEATURES_tune-armv4b=3D"armv4 bigendian"
> > > TUNE_FEATURES_tune-armv4t=3D"armv4 thumb"
> > > TUNE_FEATURES_tune-armv4tb=3D"armv4 thumb bigendian"
> > > TUNE_FEATURES_tune-armv5=3D"armv5"
> > > TUNE_FEATURES_tune-armv5b=3D"armv5 bigendian"
> > > TUNE_FEATURES_tune-armv5b-vfp=3D"armv5 vfp bigendian"
> > > TUNE_FEATURES_tune-armv5e=3D"armv5 dsp"
> > > TUNE_FEATURES_tune-armv5eb=3D"armv5 dsp bigendian"
> > > TUNE_FEATURES_tune-armv5eb-vfp=3D"armv5 dsp vfp bigendian"
> > > TUNE_FEATURES_tune-armv5ehfb-vfp=3D"armv5 dsp vfp callconvention-hard
> > > bigendian"
> > > TUNE_FEATURES_tune-armv5ehf-vfp=3D"armv5 dsp vfp callconvention-hard"
> > > TUNE_FEATURES_tune-armv5e-vfp=3D"armv5 dsp vfp"
> > > TUNE_FEATURES_tune-armv5hfb-vfp=3D"armv5 vfp callconvention-hard
> > > bigendian"
> > > TUNE_FEATURES_tune-armv5hf-vfp=3D"armv5 vfp callconvention-hard"
> > > TUNE_FEATURES_tune-armv5t=3D"armv5 thumb"
> > > TUNE_FEATURES_tune-armv5tb=3D"armv5 thumb bigendian"
> > > TUNE_FEATURES_tune-armv5tb-vfp=3D"armv5 thumb vfp bigendian"
> > > TUNE_FEATURES_tune-armv5te=3D"armv5 thumb dsp"
> > > TUNE_FEATURES_tune-armv5teb=3D"armv5 thumb dsp bigendian"
> > > TUNE_FEATURES_tune-armv5teb-vfp=3D"armv5 thumb dsp vfp bigendian"
> > > TUNE_FEATURES_tune-armv5tehfb-vfp=3D"armv5 thumb dsp vfp
> > > callconvention- hard bigendian"
> > > TUNE_FEATURES_tune-armv5tehf-vfp=3D"armv5 thumb dsp vfp
> > > callconvention- hard"
> > > TUNE_FEATURES_tune-armv5te-vfp=3D"armv5 thumb dsp vfp"
> > > TUNE_FEATURES_tune-armv5thfb-vfp=3D"armv5 thumb vfp
> > > callconvention-hard bigendian"
> > > TUNE_FEATURES_tune-armv5thf-vfp=3D"armv5 thumb vfp callconvention-
> hard"
> > > TUNE_FEATURES_tune-armv5t-vfp=3D"armv5 thumb vfp"
> > > TUNE_FEATURES_tune-armv5-vfp=3D"armv5 vfp"
> > > TUNE_FEATURES_tune-armv6=3D"armv6 vfp"
> > > TUNE_FEATURES_tune-armv6b=3D"armv6 vfp bigendian"
> > > TUNE_FEATURES_tune-armv6b-novfp=3D"armv6 bigendian"
> > > TUNE_FEATURES_tune-armv6hf=3D"armv6 vfp callconvention-hard"
> > > TUNE_FEATURES_tune-armv6hfb=3D"armv6 vfp callconvention-hard
> bigendian"
> > > TUNE_FEATURES_tune-armv6-novfp=3D"armv6"
> > > TUNE_FEATURES_tune-armv6t=3D"armv6 thumb vfp"
> > > TUNE_FEATURES_tune-armv6tb=3D"armv6 thumb vfp bigendian"
> > > TUNE_FEATURES_tune-armv6tb-novfp=3D"armv6 thumb bigendian"
> > > TUNE_FEATURES_tune-armv6thf=3D"armv6 thumb vfp callconvention-hard"
> > > TUNE_FEATURES_tune-armv6thfb=3D"armv6 thumb vfp callconvention-hard
> > > bigendian"
> > > TUNE_FEATURES_tune-armv6t-novfp=3D"armv6 thumb"
> > > TUNE_FEATURES_tune-armv7a=3D"armv7a vfp"
> > > TUNE_FEATURES_tune-armv7ab=3D"armv7a vfp bigendian"
> > > TUNE_FEATURES_tune-armv7ab-neon=3D"armv7a vfp neon bigendian"
> > > TUNE_FEATURES_tune-armv7ahf=3D"armv7a vfp callconvention-hard"
> > > TUNE_FEATURES_tune-armv7ahfb=3D"armv7a vfp callconvention-hard
> > > bigendian"
> > > TUNE_FEATURES_tune-armv7ahfb-neon=3D"armv7a vfp neon callconvention-
> > > hard bigendian"
> > > TUNE_FEATURES_tune-armv7ahf-neon=3D"armv7a vfp neon callconvention-
> > > hard"
> > > TUNE_FEATURES_tune-armv7a-neon=3D"armv7a vfp neon"
> > > TUNE_FEATURES_tune-armv7at=3D"armv7a vfp thumb"
> > > TUNE_FEATURES_tune-armv7atb=3D"armv7a vfp thumb bigendian"
> > > TUNE_FEATURES_tune-armv7atb-neon=3D"armv7a vfp thumb neon
> bigendian"
> > > TUNE_FEATURES_tune-armv7athf=3D"armv7a vfp thumb callconvention-
> hard"
> > > TUNE_FEATURES_tune-armv7athfb=3D"armv7a vfp thumb callconvention-
> hard
> > > bigendian"
> > > TUNE_FEATURES_tune-armv7athfb-neon=3D"armv7a vfp thumb neon
> > > callconvention-hard bigendian"
> > > TUNE_FEATURES_tune-armv7athf-neon=3D"armv7a vfp thumb neon
> > > callconvention-hard"
> > > TUNE_FEATURES_tune-armv7at-neon=3D"armv7a vfp thumb neon"
> > > TUNE_FEATURES_tune-cortexa9=3D"armv7a vfp cortexa9"
> > > TUNE_FEATURES_tune-cortexa9hf=3D"armv7a vfp callconvention-hard
> cortexa9"
> > > TUNE_FEATURES_tune-cortexa9hf-neon=3D"armv7a vfp neon callconvention-
> > > hard cortexa9"
> > > TUNE_FEATURES_tune-cortexa9-neon=3D"armv7a vfp neon cortexa9"
> > > TUNE_FEATURES_tune-cortexa9t=3D"armv7a vfp thumb cortexa9"
> > > TUNE_FEATURES_tune-cortexa9thf=3D"armv7a vfp thumb callconvention-
> hard
> > > cortexa9"
> > > TUNE_FEATURES_tune-cortexa9thf-neon=3D"armv7a vfp thumb neon
> > > callconvention-hard cortexa9"
> > > TUNE_FEATURES_tune-cortexa9t-neon=3D"armv7a vfp thumb neon
> cortexa9"
> > >
> > > Can you please share your valgrind recipe?
>=20
> > [Franklin] I'm using the valgrind recipe that is apart of oe-core dora.
> > Looking at the recipe in daisy/master nothing really has changed other
> > than a valgrind version bump.
> > When you actually try to build valgrind does it work?
>=20
> No, it doesn't work as is. But not for the reasons you listed in the patc=
h!
>=20
> The reason it doesn't work is because it evaluates COMPATIBLE_HOST during
> recipe parsing _before_ all the overrides get chance to finalize and take
> effect... Especially since TUNE_FEATURES uses ??=3D assignment.
>=20
> So, basically, you are just pushing the correct assignment earlier with :=
=3D and
> that makes it work, as bitbake doesn't delay the override finalization ti=
ll the
> end of parsing and when valgrind recipe is being parsed, COMPATIBLE_HOST
> can match against the final value.
>=20
> Anyway, I'm trying something else here and will let you know the results.=
..
[Franklin] Hmm ok. I think I'll get an understanding once I see that patch =
you plan on sending. Thanks for looking into this.
>=20
> --
> Denys
>=20
>=20
> > > > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > > > ---
> > > > > > Version 2 changes:
> > > > > > Remove all the extra spaces
> > > > > >
> > > > > >  .../conf/distro/include/toolchain-gcc.inc          |    7 ++++=
---
> > > > > >  .../conf/distro/include/toolchain-linaro.inc       |    9 ++++=
+----
> > > > > >  2 files changed, 9 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/meta-arago-distro/conf/distro/include/toolchain-gc=
c.inc
> > > b/meta-
> > > > > arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > > > index f7c8032..8388d13 100644
> > > > > > --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > > > +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > > > @@ -3,9 +3,10 @@ TCMODE =3D "default"
> > > > > >  TCLIBC =3D "eglibc"
> > > > > >
> > > > > >  DEFAULTTUNE =3D "cortexa8thf-neon"
> > > > > > -DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > > > > > -DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > > > > > -DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > > > > > +DEFAULTTUNE :=3D
> > > "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap-
> > > > > a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D
> > > > > "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D
> > > "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > >
> > > > > >  # Match some of the external vars
> > > > > >  TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
> > > > > > diff --git a/meta-arago-distro/conf/distro/include/toolchain-li=
naro.inc
> > > > > b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > > > > index 95269a7..0418359 100644
> > > > > > --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.in=
c
> > > > > > +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.in=
c
> > > > > > @@ -3,11 +3,12 @@ TCMODE =3D "external-linaro"
> > > > > >  TCLIBC =3D "external-linaro-toolchain"
> > > > > >
> > > > > >  ELT_TARGET_SYS =3D "arm-linux-gnueabihf"
> > > > > > +
> > > > > >  DEFAULTTUNE =3D "cortexa8thf-neon"
> > > > > > -DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > > > > > -DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > > > > > -DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > > > > > -DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
> > > > > > +DEFAULTTUNE :=3D
> > > "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap-
> > > > > a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D
> > > > > "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > > +DEFAULTTUNE :=3D
> > > "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-
> > > > > neon','${DEFAULTTUNE}',d)}"
> > > > > >
> > > > > >  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =
=3D
> > > > > "external-linaro-toolchain"
> > > > > >
> > > > > > --
> > > > > > 1.7.0.4
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

