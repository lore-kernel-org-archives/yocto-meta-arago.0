Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 72EF952A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 21:15:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NLFHd1029718;
	Fri, 23 Aug 2013 16:15:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NLFHWG016023;
	Fri, 23 Aug 2013 16:15:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 16:15:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NLFHg1023962;
	Fri, 23 Aug 2013 16:15:17 -0500
Date: Fri, 23 Aug 2013 17:15:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130823211516.GI27308@edge>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
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
X-List-Received-Date: Fri, 23 Aug 2013 21:15:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 23, 2013 at 09:08:06PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, August 23, 2013 4:04 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION
> > and AUTOREV
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v2 - removed the comment about upstreaming LOCALVERSION, may not
> > happen
> > 
> >  .../recipes-kernel/linux/linux-ti-staging_git.bbappend  | 17
> > +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-
> > staging_git.bbappend
> > 
> > diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
> > b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
> > new file mode 100644
> > index 0000000..f99482c
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bbappend
> > @@ -0,0 +1,17 @@
> > +MACHINE_KERNEL_PR_append = "-arago0"
> > +
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> > +
> > +require copy-defconfig.inc

> [Franklin] Are we really planning on have different defconfigs for each 
> machine? I thought with DT all machines will share the same defconfig.

Yes, linux-ti-staging uses a blank defconfig that points to 
omap2plus_defconfig.

But copy-defconfig just saves the current config for SDK use - they will be 
the same for machines using this recipe. But still, there are currently only 2 
OMAP machines supported by this kernel and will be 2 Sitara machines with this 
patchset. If/when we switch remaining SDK machines to use the latest kernel, 
we can revisit this matter, I guess.


> > +SRCREV = "${AUTOREV}"
> > +
> > +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
> > True).partition('+')[2][0:7]}"
> > +
> > +kernel_do_configure_prepend() {
> > +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> > +    then
> > +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > +    fi
> > +}
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

