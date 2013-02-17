Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id ED6D952A1D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 21:35:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MID00M8HVZ06570@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 17 Feb 2013 15:35:35 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C943620085; Sun,
	17 Feb 2013 16:35:24 -0500 (EST)
Date: Sun, 17 Feb 2013 16:35:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20130217213524.GD2174@denix.org>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-12-git-send-email-fcooper@ti.com>
	<20130215034205.GF9154@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C3918EB@DFLE09.ent.ti.com>
	<20130217203524.GA2174@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C393B7E@DFLE09.ent.ti.com>
	<5B708603-AD53-4D90-A882-7A22CF03ED95@ti.com>
MIME-version: 1.0
In-reply-to: <5B708603-AD53-4D90-A882-7A22CF03ED95@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use generic name for kernel sources
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
X-List-Received-Date: Sun, 17 Feb 2013 21:35:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Feb 17, 2013 at 09:29:55PM +0000, Maupin, Chase wrote:
> +1

Is that +1 for using this patch as is with := fixed? :)

I'm going to fix the remaining machines for now, since I'm already working on 
meta-ti today. BTW, some of those can be removed soon, like hawkboard and 
omap3-touchbook, as we don't support them at all.

-- 
Denys


> On Feb 17, 2013, at 3:07 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:
> 
> > 
> > 
> >> -----Original Message-----
> >> From: Dmytriyenko, Denys
> >> Sent: Sunday, February 17, 2013 2:35 PM
> >> To: Cooper Jr., Franklin
> >> Cc: Dmytriyenko, Denys; fcooperjr27@gmail.com; meta-arago@arago-
> >> project.org
> >> Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use
> >> generic name for kernel sources
> >> 
> >> On Fri, Feb 15, 2013 at 03:54:29AM +0000, Cooper Jr., Franklin wrote:
> >>> 
> >>> 
> >>>> -----Original Message-----
> >>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >>>> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> >>>> Sent: Thursday, February 14, 2013 9:42 PM
> >>>> To: fcooperjr27@gmail.com
> >>>> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> >>>> Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host:
> >>>> Use generic name for kernel sources
> >>>> 
> >>>> On Mon, Feb 11, 2013 at 06:46:13PM -0600, fcooperjr27@gmail.com
> >> wrote:
> >>>>> From: Franklin S. Cooper Jr <fcooper@ti.com>
> >>>>> 
> >>>>> * Use generic name for kernel sources which will allow for any machine
> >> to be
> >>>>>  used without modification.
> >>>>> 
> >>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >>>>> ---
> >>>>> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
> >>>>> 1 files changed, 3 insertions(+), 5 deletions(-)
> >>>>> 
> >>>>> diff --git
> >>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >>>>> tisd
> >>>>> k-amsdk-sdk-host.bb
> >>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >>>>> tisd
> >>>>> k-amsdk-sdk-host.bb
> >>>>> index 14626c8..b990235 100644
> >>>>> ---
> >>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >>>>> tisd
> >>>>> k-amsdk-sdk-host.bb
> >>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar
> >>>>> +++ ago-
> >>>>> +++ tisdk-amsdk-sdk-host.bb
> >>>>> @@ -1,17 +1,15 @@
> >>>>> DESCRIPTION = "Task to install additional scripts and
> >>>>> applications into the
> >>>> SDK"
> >>>>> LICENSE = "MIT"
> >>>>> -PR = "r3"
> >>>>> +PR = "r4"
> >>>>> 
> >>>>> inherit packagegroup
> >>>>> 
> >>>>> PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>> 
> >>>>> # Choose the kernel and u-boot recipe sources to use -U-BOOT_SRC = ""
> >>>>> -KERNEL_SRC = ""
> >>>>> 
> >>>>> -U-BOOT_SRC_am335x-evm = "u-boot-src"
> >>>>> -KERNEL_SRC_am335x-evm = "linux-am335x-src"
> >>>>> +U-BOOT_SRC  = "u-boot-src"
> >>>>> +KERNEL_SRC := "${PREFERRED_PROVIDER_virtual/kernel}-src"
> >>>> 
> >>>> 1. Do you need to use := assignment here?
> >>> No. I'll fix that.
> >>>> 2. Should we also consider using existing
> >>>> PREFERRED_PROVIDER_virtual/bootloader
> >>>> for u-boot sources here as well?
> >>> PREFERRED_PROVIDER_virtual/bootloader is a big annoyance that I
> >>> struggled with. The problem is in meta-arago we define
> >>> PREFERRED_PROVIDER_virtual/kernel for all platforms so it works well
> >>> for the kernel. Some platforms don't define that variable so it will
> >>> fail for those platforms. All of our platforms use u-boot as the ${PN}
> >>> so it was safe to make the assumption.
> >> 
> >> I thought all our platforms in meta-ti had virtual/bootloader set - which ones
> >> are missing?
> >> On the other hand, I guess we could just drop it altogether...
> > 
> > Machines missing virtual/bootloader being set in machine config file:
> > Beagleboard <-- the one that caused me problems.
> > Beaglebone
> > Hawkboard
> > Keystone
> > Omap3-touchbook
> > 
> > I can add virtual/bootloader to all the missing machines in meta-ti and update this recipe to use virtual/bootloader or we can use this recipe as is minus the := change.
> > 
> > I would vote for adding virtual/bootloader to all machines in meta-ti since it will future proof this recipe a bit more if someone later decides to use a bootloader recipe whose ${PN} isn't u-boot.
> >> 
> >> --
> >> Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

