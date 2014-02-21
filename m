Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5724F529AA
	for <meta-arago@arago-project.org>;
	Fri, 21 Feb 2014 17:29:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1LHTPTh028403;
	Fri, 21 Feb 2014 11:29:25 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1LHTPYs026216;
	Fri, 21 Feb 2014 11:29:25 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Feb 2014 11:29:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1LHTO6g012442;
	Fri, 21 Feb 2014 11:29:25 -0600
Date: Fri, 21 Feb 2014 12:29:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140221172924.GA18510@edge>
References: <1393003092-29016-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C65174D@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C65174D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-source-ipk: append kernel and u-boot short hash to source directory
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
X-List-Received-Date: Fri, 21 Feb 2014 17:29:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Actually, KERNEL_LOCALVERSION is generic itself. You can change it in a 
bbappend and it will propagate into kernel package, binary and sources and all 
will be matching. So, if you don't like the -gHASH suffix, you can do away 
with -tiX.X.X.X suffix instead and it will be populated everywhere.


On Fri, Feb 21, 2014 at 05:25:48PM +0000, Cooper Jr., Franklin wrote:
> Can we tweak this to use a generic variable
> 
> SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${<generic variable name>}"
> 
> And then in the kernel recipe
> 
> <generic variable name> = "${KERNEL_LOCALVERSION}"
> 
> I want to be able to override <generic variable name>  without touching the .conf file.
> 
> Similar comment for u-boot.
> 
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, February 21, 2014 11:18 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] arago-source-ipk: append kernel and u-boot
> > short hash to source directory
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago-source-ipk.conf | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-
> > distro/conf/distro/arago-source-ipk.conf
> > index 231e13d..d2a9600 100644
> > --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > @@ -116,7 +116,7 @@ SRCIPK_INSTALL_DIR_pn-x-load_beagleboard =
> > "board-support/${P}"
> >  SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
> > 
> >  CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
> > -SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}"
> > +SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-
> > ${PV}${UBOOT_LOCALVERSION}"
> >  SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
> >  SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
> > 
> > @@ -146,7 +146,7 @@ SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-
> > support/u-boot-${UVER}-psp${PSPREL}
> >  SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 = "${MACHINE_ARCH}"
> > 
> >  CREATE_SRCIPK_pn-linux-ti-staging = "1"
> > -SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
> > +SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-
> > ${PV}${KERNEL_LOCALVERSION}"
> >  SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
> >  SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
> > 
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

