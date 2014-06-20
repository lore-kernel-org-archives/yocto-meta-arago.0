Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6E0F652A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:35:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJZgQ9024262;
	Fri, 20 Jun 2014 14:35:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJZgqT006031;
	Fri, 20 Jun 2014 14:35:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:35:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJZgeA020705;
	Fri, 20 Jun 2014 14:35:42 -0500
Date: Fri, 20 Jun 2014 15:35:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140620193541.GH1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-16-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9495@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6D6362@DFLE08.ent.ti.com>
	<20140620192924.GE1825@edge>
	<8F29D6B095ED194EA1980491A5E029710C6D646B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D646B@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 20 Jun 2014 19:35:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 20, 2014 at 03:31:03PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, June 20, 2014 2:29 PM
> > To: Cooper Jr., Franklin
> > Cc: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> > DEFAULTTUNE settings that went to meta-ti
> > 
> > On Fri, Jun 20, 2014 at 07:18:21PM +0000, Cooper Jr., Franklin wrote:
> > > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> > >
> > > I don't see any DEFAULTTUNE settings in meta-ti.
> > 
> > https://lists.yoctoproject.org/pipermail/meta-ti/2014-June/004722.html
> > 
> > 
> > > Is there a package in the future that will make that change? I have no
> > > issue with this in general since this was another way I solved my
> > > valgrind issue
> > 
> > That's the right way to do it on per-machine level. Unfortunately, it seems like
> > a bitbake issue/feature when doing it on per-distro level, as I described it
> > yesterday.
> > 
> > 
> > > and in oe-core it is setting a working value but I'm just curious.
> > 
> > Huh? What do you mean?

> [Franklin] Ex oe-core/meta/conf/machine/include/tune-cortexa9.inc

Yes, it sets the DEFAULTTUNE if not already set, but it's not optimized. It 
doesn't have thumb enabled, doesn't have cortex pipeline optimizations and is 
not hardfp...


> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > > Sent: Friday, June 20, 2014 2:11 PM
> > > > To: Denys Dmytriyenko; meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> > > > DEFAULTTUNE settings that went to meta-ti
> > > >
> > > > Acked-by: Chase Maupin <chase.maupin@ti.com>
> > > >
> > > > >-----Original Message-----
> > > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > >Sent: Friday, June 20, 2014 12:57 PM
> > > > >To: meta-arago@arago-project.org
> > > > >Subject: [meta-arago] [PATCH 15/19] toolchain-linaro/gcc: remove
> > > > >DEFAULTTUNE settings that went to meta-ti
> > > > >
> > > > >From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > >---
> > > > > meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 5 --
> > > > >---
> > > > > meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 5 --
> > > > >---
> > > > > 2 files changed, 10 deletions(-)
> > > > >
> > > > >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> > > > >gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > >index f7c8032..530f3c3 100644
> > > > >--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > >+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> > > > >@@ -2,11 +2,6 @@
> > > > > TCMODE = "default"
> > > > > TCLIBC = "eglibc"
> > > > >
> > > > >-DEFAULTTUNE = "cortexa8thf-neon"
> > > > >-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> > > > >-DEFAULTTUNE_keystone = "cortexa15thf-neon"
> > > > >-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> > > > >-
> > > > > # Match some of the external vars
> > > > > TOOLCHAIN_SYS := "${TARGET_SYS}"
> > > > > TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
> > > > >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> > > > >linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-
> > > > >linaro.inc
> > > > >index 95269a7..26e69ae 100644
> > > > >--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > > >+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > > > >@@ -3,11 +3,6 @@ TCMODE = "external-linaro"
> > > > > TCLIBC = "external-linaro-toolchain"
> > > > >
> > > > > ELT_TARGET_SYS = "arm-linux-gnueabihf"
> > > > >-DEFAULTTUNE = "cortexa8thf-neon"
> > > > >-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
> > > > >-DEFAULTTUNE_keystone = "cortexa15thf-neon"
> > > > >-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
> > > > >-DEFAULTTUNE_ti43x = "cortexa9thf-neon"
> > > > >
> > > > > PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =
> > > > >"external-linaro-toolchain"
> > > > >
> > > > >--
> > > > >2.0.0
> > > > >
> > > > >_______________________________________________
> > > > >meta-arago mailing list
> > > > >meta-arago@arago-project.org
> > > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

