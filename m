Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 4D8B5529C9
	for <meta-arago@arago-project.org>;
	Mon, 26 Aug 2013 14:48:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS500ARJ7S74W51@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 26 Aug 2013 09:48:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 67E6F200BE; Mon,
	26 Aug 2013 10:48:07 -0400 (EDT)
Date: Mon, 26 Aug 2013 10:48:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130826144807.GA20807@denix.org>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
	<20130823211516.GI27308@edge>
	<8F29D6B095ED194EA1980491A5E029710C52B79D@DFLE08.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C52B79D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION	and AUTOREV
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
X-List-Received-Date: Mon, 26 Aug 2013 14:48:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 23, 2013 at 09:54:44PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, August 23, 2013 4:15 PM
> > To: Cooper Jr., Franklin
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION
> > and AUTOREV
> > 
> > On Fri, Aug 23, 2013 at 09:08:06PM +0000, Cooper Jr., Franklin wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Friday, August 23, 2013 4:04 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> > > > LOCALVERSION and AUTOREV
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > > v2 - removed the comment about upstreaming LOCALVERSION, may not
> > > > happen
> > > >
> > > >  .../recipes-kernel/linux/linux-ti-staging_git.bbappend  | 17
> > > > +++++++++++++++++
> > > >  1 file changed, 17 insertions(+)
> > > >  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > > staging_git.bbappend
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappe
> > > > nd
> > > > b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappe
> > > > nd
> > > > new file mode 100644
> > > > index 0000000..f99482c
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb
> > > > +++ append
> > > > @@ -0,0 +1,17 @@
> > > > +MACHINE_KERNEL_PR_append = "-arago0"
> > > > +
> > > > +FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> > > > +
> > > > +require copy-defconfig.inc
> > 
> > > [Franklin] Are we really planning on have different defconfigs for
> > > each machine? I thought with DT all machines will share the same defconfig.
> > 
> > Yes, linux-ti-staging uses a blank defconfig that points to omap2plus_defconfig.
> > 
> > But copy-defconfig just saves the current config for SDK use - they will be the
> > same for machines using this recipe. But still, there are currently only 2 OMAP
> > machines supported by this kernel and will be 2 Sitara machines with this
> > patchset. If/when we switch remaining SDK machines to use the latest kernel,
> > we can revisit this matter, I guess.
> [Franklin] 
> I guess my point was that copy-defconfig.inc renames the .config to 
> tisdk_${MACHINE}_defconfig. Can we set CONFIG_NAME to "omap2plus_defconfig" 
> since we should stick with that defconfig name for all machines?

And what I was trying to say before, is that "all machines" is currently only 2 
out of several and even then, omap2plus_defconfig in the kernel may not match 
exactly the one produced by the SDK - there may be some mangling involved to 
adjust some config options to sane defaults (although we no longer include 
linux.inc with that code), plus we run "make oldconfig" on it, which checks 
dependecies between config options and may change some os them. In other 
words: omap2plus_defconfig != .config which we package in the SDK. It is like 
the difference between pristine sources and sources that were patched and 
configured...

-- 
Denys


> > > > +SRCREV = "${AUTOREV}"
> > > > +
> > > > +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
> > > > True).partition('+')[2][0:7]}"
> > > > +
> > > > +kernel_do_configure_prepend() {
> > > > +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> > > > +    then
> > > > +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > > > +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > > > +    fi
> > > > +}
> > > > --
> > > > 1.8.3.2
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

