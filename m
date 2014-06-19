Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C4DAE52A66
	for <meta-arago@arago-project.org>;
	Thu, 19 Jun 2014 16:52:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5JGqVS0016472
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:52:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JGqVo9032263
	for <meta-arago@arago-project.org>; Thu, 19 Jun 2014 11:52:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Jun 2014 11:52:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5JGqVGb011715;
	Thu, 19 Jun 2014 11:52:31 -0500
Date: Thu, 19 Jun 2014 12:52:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140619165230.GR1825@edge>
References: <1403103711-15485-1-git-send-email-fcooper@ti.com>
	<20140619161808.GP1825@edge>
	<8F29D6B095ED194EA1980491A5E029710C6D49CA@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D49CA@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 19 Jun 2014 16:52:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 19, 2014 at 12:37:47PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, June 19, 2014 11:18 AM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v2] toolchain-*.inc: Replace variable
> > overrides with bb.utils function
> > 
> > On Wed, Jun 18, 2014 at 10:01:51AM -0500, Franklin S. Cooper Jr wrote:
> > > * Conf files are unable to use variable overrides instead bitbake utility
> > >   functions are needed to mimic the functionality.
> > > * Currently the DEFAULTTUNE variable isn't being set properly for non
> > Cortex A8
> > >   devices which causes uses when using an architecture override for non
> > Cortex
> > >   A8 devices.
> > > * This issue was first discovered due to the inability to build valgrind for
> > >   am43x and via testing determined that this affected any non Cortex A8
> > machine/SOC_FAMILY
> > >   within meta-ti.
> > 
> > Ok, so skipping the DEFAULTTUNE override issues for now, why would it affect
> > valgrind and it's COMPATIBLE_HOST setting?

> [Franklin] Well this is a long story :). I ended up having to put debug 
> statements in bitbake (lib/bb/data_smart.py)

> The list of valid overrides for this recipe didn't include armv7a. This was 
> due to TUNE_FEATURES being set to TUNE_FEATURES_tune_${DEFAULTTUNE} which is 
> defined in oe-core/meta/conf/bitbake.conf. Due to this bug this statement is 
> now set to 'TUNE_FEATURES_tune_cortexa8thf-neon'. This variable is defined 
> in tune-cortexa8.inc which is not used for non CortexA8 machines. Therefore, 
> bitbake is unable to expand this variable since it has never been defined. 
> The value from that variable is what bitbake uses to add the ARM 
> architecture override so without the expanded value armv7a isn't part of the 
> override list.
> 
> Valgrind sets the COMPATIBLE_HOST to:
> COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
> COMPATIBLE_HOST_armv7a = 'arm.*-linux'
> 
> So that architecture override is essential. Also changing 'arm.*-linux' -> 
> to ''arm.*-linux*' doesn't make a difference.


Everything seems to work for me. As you can see, OVERRIDES does contain 
"armv7a" and DEFAULTTUNE is set to "cortexa9thf-neon" and TUNE_FEATURES is 
expanded to the correct list of tunes:


$ MACHINE=am437x-evm bitbake tisdk-rootfs-image -e|grep -e '^OVERRIDES=' -e '^DEFAULTTUNE=' -e '^TUNE_FEATURES'|sort

DEFAULTTUNE="cortexa9thf-neon"
OVERRIDES="linux-gnueabi:arm:build-linux:pn-tisdk-rootfs-image:armv7a:ti43x:am437x-evm:arago:class-target:forcevariable:thumb:libc-glibc"
TUNE_FEATURES="armv7a vfp thumb neon callconvention-hard cortexa9"
TUNE_FEATURES_tune-armv4="armv4"
TUNE_FEATURES_tune-armv4b="armv4 bigendian"
TUNE_FEATURES_tune-armv4t="armv4 thumb"
TUNE_FEATURES_tune-armv4tb="armv4 thumb bigendian"
TUNE_FEATURES_tune-armv5="armv5"
TUNE_FEATURES_tune-armv5b="armv5 bigendian"
TUNE_FEATURES_tune-armv5b-vfp="armv5 vfp bigendian"
TUNE_FEATURES_tune-armv5e="armv5 dsp"
TUNE_FEATURES_tune-armv5eb="armv5 dsp bigendian"
TUNE_FEATURES_tune-armv5eb-vfp="armv5 dsp vfp bigendian"
TUNE_FEATURES_tune-armv5ehfb-vfp="armv5 dsp vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv5ehf-vfp="armv5 dsp vfp callconvention-hard"
TUNE_FEATURES_tune-armv5e-vfp="armv5 dsp vfp"
TUNE_FEATURES_tune-armv5hfb-vfp="armv5 vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv5hf-vfp="armv5 vfp callconvention-hard"
TUNE_FEATURES_tune-armv5t="armv5 thumb"
TUNE_FEATURES_tune-armv5tb="armv5 thumb bigendian"
TUNE_FEATURES_tune-armv5tb-vfp="armv5 thumb vfp bigendian"
TUNE_FEATURES_tune-armv5te="armv5 thumb dsp"
TUNE_FEATURES_tune-armv5teb="armv5 thumb dsp bigendian"
TUNE_FEATURES_tune-armv5teb-vfp="armv5 thumb dsp vfp bigendian"
TUNE_FEATURES_tune-armv5tehfb-vfp="armv5 thumb dsp vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv5tehf-vfp="armv5 thumb dsp vfp callconvention-hard"
TUNE_FEATURES_tune-armv5te-vfp="armv5 thumb dsp vfp"
TUNE_FEATURES_tune-armv5thfb-vfp="armv5 thumb vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv5thf-vfp="armv5 thumb vfp callconvention-hard"
TUNE_FEATURES_tune-armv5t-vfp="armv5 thumb vfp"
TUNE_FEATURES_tune-armv5-vfp="armv5 vfp"
TUNE_FEATURES_tune-armv6="armv6 vfp"
TUNE_FEATURES_tune-armv6b="armv6 vfp bigendian"
TUNE_FEATURES_tune-armv6b-novfp="armv6 bigendian"
TUNE_FEATURES_tune-armv6hf="armv6 vfp callconvention-hard"
TUNE_FEATURES_tune-armv6hfb="armv6 vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv6-novfp="armv6"
TUNE_FEATURES_tune-armv6t="armv6 thumb vfp"
TUNE_FEATURES_tune-armv6tb="armv6 thumb vfp bigendian"
TUNE_FEATURES_tune-armv6tb-novfp="armv6 thumb bigendian"
TUNE_FEATURES_tune-armv6thf="armv6 thumb vfp callconvention-hard"
TUNE_FEATURES_tune-armv6thfb="armv6 thumb vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv6t-novfp="armv6 thumb"
TUNE_FEATURES_tune-armv7a="armv7a vfp"
TUNE_FEATURES_tune-armv7ab="armv7a vfp bigendian"
TUNE_FEATURES_tune-armv7ab-neon="armv7a vfp neon bigendian"
TUNE_FEATURES_tune-armv7ahf="armv7a vfp callconvention-hard"
TUNE_FEATURES_tune-armv7ahfb="armv7a vfp callconvention-hard bigendian"
TUNE_FEATURES_tune-armv7ahfb-neon="armv7a vfp neon callconvention-hard bigendian"
TUNE_FEATURES_tune-armv7ahf-neon="armv7a vfp neon callconvention-hard"
TUNE_FEATURES_tune-armv7a-neon="armv7a vfp neon"
TUNE_FEATURES_tune-armv7at="armv7a vfp thumb"
TUNE_FEATURES_tune-armv7atb="armv7a vfp thumb bigendian"
TUNE_FEATURES_tune-armv7atb-neon="armv7a vfp thumb neon bigendian"
TUNE_FEATURES_tune-armv7athf="armv7a vfp thumb callconvention-hard"
TUNE_FEATURES_tune-armv7athfb="armv7a vfp thumb callconvention-hard bigendian"
TUNE_FEATURES_tune-armv7athfb-neon="armv7a vfp thumb neon callconvention-hard bigendian"
TUNE_FEATURES_tune-armv7athf-neon="armv7a vfp thumb neon callconvention-hard"
TUNE_FEATURES_tune-armv7at-neon="armv7a vfp thumb neon"
TUNE_FEATURES_tune-cortexa9="armv7a vfp cortexa9"
TUNE_FEATURES_tune-cortexa9hf="armv7a vfp callconvention-hard cortexa9"
TUNE_FEATURES_tune-cortexa9hf-neon="armv7a vfp neon callconvention-hard cortexa9"
TUNE_FEATURES_tune-cortexa9-neon="armv7a vfp neon cortexa9"
TUNE_FEATURES_tune-cortexa9t="armv7a vfp thumb cortexa9"
TUNE_FEATURES_tune-cortexa9thf="armv7a vfp thumb callconvention-hard cortexa9"
TUNE_FEATURES_tune-cortexa9thf-neon="armv7a vfp thumb neon callconvention-hard cortexa9"
TUNE_FEATURES_tune-cortexa9t-neon="armv7a vfp thumb neon cortexa9"

Can you please share your valgrind recipe?

-- 
Denys


> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > > Version 2 changes:
> > > Remove all the extra spaces
> > >
> > >  .../conf/distro/include/toolchain-gcc.inc          |    7 ++++---
> > >  .../conf/distro/include/toolchain-linaro.inc       |    9 +++++----
> > >  2 files changed, 9 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-
> > arago-distro/conf/distro/include/toolchain-gcc.inc
> > > index f7c8032..8388d13 100644
> > > --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > @@ -3,9 +3,10 @@ TCMODE = "default"
> > >  TCLIBC = "eglibc"
> > >
> > >  DEFAULTTUNE = "cortexa8thf-neon"
> > > -DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> > > -DEFAULTTUNE_keystone = "cortexa15thf-neon"
> > > -DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-
> > neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-
> > a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE :=
> > "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> > neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-
> > neon','${DEFAULTTUNE}',d)}"
> > >
> > >  # Match some of the external vars
> > >  TOOLCHAIN_SYS := "${TARGET_SYS}"
> > > diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > index 95269a7..0418359 100644
> > > --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > @@ -3,11 +3,12 @@ TCMODE = "external-linaro"
> > >  TCLIBC = "external-linaro-toolchain"
> > >
> > >  ELT_TARGET_SYS = "arm-linux-gnueabihf"
> > > +
> > >  DEFAULTTUNE = "cortexa8thf-neon"
> > > -DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> > > -DEFAULTTUNE_keystone = "cortexa15thf-neon"
> > > -DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> > > -DEFAULTTUNE_ti43x = "cortexa9thf-neon"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-
> > neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-
> > a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE :=
> > "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-
> > neon','${DEFAULTTUNE}',d)}"
> > > +DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-
> > neon','${DEFAULTTUNE}',d)}"
> > >
> > >  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =
> > "external-linaro-toolchain"
> > >
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

