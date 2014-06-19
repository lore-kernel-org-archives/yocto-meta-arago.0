Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5A25952A0F
	for <meta-arago@arago-project.org>;
	Thu, 19 Jun 2014 16:37:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5JGblHH015183
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:37:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JGblPj018661
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:37:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 19 Jun 2014 11:37:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] toolchain-*.inc: Replace variable
	overrides with bb.utils function
Thread-Index: AQHPiwY/mf1tgPIzW0Ccu6n9BlLZEpt48eOA//+sdiA=
Date: Thu, 19 Jun 2014 16:37:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D49CA@DFLE08.ent.ti.com>
References: <1403103711-15485-1-git-send-email-fcooper@ti.com>
	<20140619161808.GP1825@edge>
In-Reply-To: <20140619161808.GP1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Thu, 19 Jun 2014 16:37:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, June 19, 2014 11:18 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] toolchain-*.inc: Replace variable
> overrides with bb.utils function
>=20
> On Wed, Jun 18, 2014 at 10:01:51AM -0500, Franklin S. Cooper Jr wrote:
> > * Conf files are unable to use variable overrides instead bitbake utili=
ty
> >   functions are needed to mimic the functionality.
> > * Currently the DEFAULTTUNE variable isn't being set properly for non
> Cortex A8
> >   devices which causes uses when using an architecture override for non
> Cortex
> >   A8 devices.
> > * This issue was first discovered due to the inability to build valgrin=
d for
> >   am43x and via testing determined that this affected any non Cortex A8
> machine/SOC_FAMILY
> >   within meta-ti.
>=20
> Ok, so skipping the DEFAULTTUNE override issues for now, why would it aff=
ect
> valgrind and it's COMPATIBLE_HOST setting?
[Franklin] Well this is a long story :). I ended up having to put debug sta=
tements in bitbake (lib/bb/data_smart.py)
The list of valid overrides for this recipe didn't include armv7a. This was=
 due to TUNE_FEATURES being set to TUNE_FEATURES_tune_${DEFAULTTUNE} which =
is defined in oe-core/meta/conf/bitbake.conf. Due to this bug this statemen=
t is now set to 'TUNE_FEATURES_tune_cortexa8thf-neon'. This variable is def=
ined in tune-cortexa8.inc which is not used for non CortexA8 machines. Ther=
efore, bitbake is unable to expand this variable since it has never been de=
fined. The value from that variable is what bitbake uses to add the ARM arc=
hitecture override so without the expanded value armv7a isn't part of the o=
verride list.

Valgrind sets the COMPATIBLE_HOST to:
COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'

So that architecture override is essential. Also changing 'arm.*-linux' -> =
to ''arm.*-linux*' doesn't make a difference.
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > Version 2 changes:
> > Remove all the extra spaces
> >
> >  .../conf/distro/include/toolchain-gcc.inc          |    7 ++++---
> >  .../conf/distro/include/toolchain-linaro.inc       |    9 +++++----
> >  2 files changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/=
meta-
> arago-distro/conf/distro/include/toolchain-gcc.inc
> > index f7c8032..8388d13 100644
> > --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > @@ -3,9 +3,10 @@ TCMODE =3D "default"
> >  TCLIBC =3D "eglibc"
> >
> >  DEFAULTTUNE =3D "cortexa8thf-neon"
> > -DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > -DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > -DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9t=
hf-
> neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap-
> a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D
> "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9t=
hf-
> neon','${DEFAULTTUNE}',d)}"
> >
> >  # Match some of the external vars
> >  TOOLCHAIN_SYS :=3D "${TARGET_SYS}"
> > diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > index 95269a7..0418359 100644
> > --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > @@ -3,11 +3,12 @@ TCMODE =3D "external-linaro"
> >  TCLIBC =3D "external-linaro-toolchain"
> >
> >  ELT_TARGET_SYS =3D "arm-linux-gnueabihf"
> > +
> >  DEFAULTTUNE =3D "cortexa8thf-neon"
> > -DEFAULTTUNE_omap-a15 =3D "cortexa15thf-neon"
> > -DEFAULTTUNE_keystone =3D "cortexa15thf-neon"
> > -DEFAULTTUNE_omap4 =3D "cortexa9thf-neon"
> > -DEFAULTTUNE_ti43x =3D "cortexa9thf-neon"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9t=
hf-
> neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap-
> a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D
> "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> neon','${DEFAULTTUNE}',d)}"
> > +DEFAULTTUNE :=3D "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9t=
hf-
> neon','${DEFAULTTUNE}',d)}"
> >
> >  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D
> "external-linaro-toolchain"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

