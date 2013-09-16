Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1A8BA529D3
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 21:38:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GLcAEX019175
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 16:38:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GLcATF024817
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2013 16:38:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 16:38:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GLc9YQ023208;
	Mon, 16 Sep 2013 16:38:09 -0500
Date: Mon, 16 Sep 2013 17:38:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130916213808.GD19671@edge>
References: <1378747771-6201-1-git-send-email-fcooper@ti.com>
	<1378747771-6201-2-git-send-email-fcooper@ti.com>
	<20130909182229.GB2503@edge>
	<8F29D6B095ED194EA1980491A5E029710C552580@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C552580@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] kernel.bbclass: Pull in tweaks from oe-core patch to local copy
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
X-List-Received-Date: Mon, 16 Sep 2013 21:38:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 16, 2013 at 03:12:50PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, September 09, 2013 1:22 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 2/3] kernel.bbclass: Pull in tweaks from oe-
> > core patch to local copy
> > 
> > On Mon, Sep 09, 2013 at 12:29:30PM -0500, Franklin S. Cooper Jr wrote:
> > > The below patch has been submitted to oe-core. Modify local copy of
> > > kernel.bbclass to mimic this patch until patch is upstreamed.
> > 
> > Have you addressed the latest comments for the upstream patch:
> > 
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/41748/
> > focus=41752
> [Franklin] 
> Nope somehow I missed that comment. I'll submit an updated version.
> > 
> > I would prefer to avoid overlaying a complete class locally just for this simple fix.
> > Having a smaller bbappend with do_install_append() seems like a less intrusive
> > change... Comments?

> [Franklin] Based on the comment to my patch in oe-core the proper approach 
> is to make the change via pkg_postinst. If appending/prepending a 
> pkg_postinst is possible then I have no issue not overlaying the entire 

Shouldn't be a problem - we've done it before ourselves:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/libgles/libgles-omap3.inc#n404

And here's an example from meta-oe:
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb?h=master#n34


> class. Since this change would be a per recipe change is there any reason 
> not to directly modify the recipe in meta-ti to incorporate this change 
> instead of having an append in meta-arago?

It seems like a generic change, so meta-ti should be fine. Unfortunately, we 
deprecated use of generic linux.inc...


> > > kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to
> > > boot package
> > > * By default for some platforms U-boot assumes the kernel image is located in
> > >   the boot directory of the root filesystem.
> > > * The kernel.bbclass already includes the kernel image in the /boot directory
> > >   but adds a version number to the file name.
> > > * Create a symbolic link that names the kernel image in the exact way that
> > >   U-boot expects.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  meta-arago-distro/classes/kernel.bbclass |    1 +
> > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/classes/kernel.bbclass
> > > b/meta-arago-distro/classes/kernel.bbclass
> > > index 3320747..1211911 100644
> > > --- a/meta-arago-distro/classes/kernel.bbclass
> > > +++ b/meta-arago-distro/classes/kernel.bbclass
> > > @@ -109,6 +109,7 @@ kernel_do_install() {
> > >  	install -d ${D}/${KERNEL_IMAGEDEST}
> > >  	install -d ${D}/boot
> > >  	install -m 0644 ${KERNEL_OUTPUT}
> > > ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> > > +	ln      -sf ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-
> > ${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
> > >  	install -m 0644 System.map ${D}/boot/System.map-
> > ${KERNEL_VERSION}
> > >  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> > >  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

