Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id CDD1D529EF
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 20:35:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MID00JK9T71DP92@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 17 Feb 2013 14:35:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4732C201C7; Sun,
	17 Feb 2013 15:35:24 -0500 (EST)
Date: Sun, 17 Feb 2013 15:35:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130217203524.GA2174@denix.org>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-12-git-send-email-fcooper@ti.com>
	<20130215034205.GF9154@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C3918EB@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3918EB@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Sun, 17 Feb 2013 20:35:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 15, 2013 at 03:54:29AM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Thursday, February 14, 2013 9:42 PM
> > To: fcooperjr27@gmail.com
> > Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> > Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use
> > generic name for kernel sources
> > 
> > On Mon, Feb 11, 2013 at 06:46:13PM -0600, fcooperjr27@gmail.com wrote:
> > > From: Franklin S. Cooper Jr <fcooper@ti.com>
> > >
> > > * Use generic name for kernel sources which will allow for any machine to be
> > >   used without modification.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
> > >  1 files changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > > k-amsdk-sdk-host.bb
> > > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > > k-amsdk-sdk-host.bb
> > > index 14626c8..b990235 100644
> > > ---
> > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > > k-amsdk-sdk-host.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > +++ tisdk-amsdk-sdk-host.bb
> > > @@ -1,17 +1,15 @@
> > >  DESCRIPTION = "Task to install additional scripts and applications into the
> > SDK"
> > >  LICENSE = "MIT"
> > > -PR = "r3"
> > > +PR = "r4"
> > >
> > >  inherit packagegroup
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > >  # Choose the kernel and u-boot recipe sources to use -U-BOOT_SRC = ""
> > > -KERNEL_SRC = ""
> > >
> > > -U-BOOT_SRC_am335x-evm = "u-boot-src"
> > > -KERNEL_SRC_am335x-evm = "linux-am335x-src"
> > > +U-BOOT_SRC  = "u-boot-src"
> > > +KERNEL_SRC := "${PREFERRED_PROVIDER_virtual/kernel}-src"
> > 
> > 1. Do you need to use := assignment here?
> No. I'll fix that.
> > 2. Should we also consider using existing
> > PREFERRED_PROVIDER_virtual/bootloader
> > for u-boot sources here as well?
> PREFERRED_PROVIDER_virtual/bootloader is a big annoyance that I struggled 
> with. The problem is in meta-arago we define 
> PREFERRED_PROVIDER_virtual/kernel for all platforms so it works well for the 
> kernel. Some platforms don't define that variable so it will fail for those 
> platforms. All of our platforms use u-boot as the ${PN} so it was safe to 
> make the assumption.

I thought all our platforms in meta-ti had virtual/bootloader set - which ones 
are missing?
On the other hand, I guess we could just drop it altogether...

-- 
Denys

