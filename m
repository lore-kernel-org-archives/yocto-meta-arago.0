Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E162752A32
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 15:01:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GF1cJZ016782
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 10:01:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GF1c2i028388
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 10:01:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 16 Jul 2014 10:01:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GF1crM003540;
	Wed, 16 Jul 2014 10:01:38 -0500
Date: Wed, 16 Jul 2014 11:01:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140716150137.GL15788@edge>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-5-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6E34D4@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E34D4@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] linux-ti-staging: update bbappend for 3.14	version
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
X-List-Received-Date: Wed, 16 Jul 2014 15:01:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 16, 2014 at 02:30:56PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Tuesday, July 15, 2014 6:29 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend for 3.14
> > version
> > 
> > * Update the bbappend for the linux-ti-staging to work with the
> >   3.14 kernel version.
> > * Set the kernel to AUTOREV while developing the latest 3.14 kernel
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  ....12.bbappend => linux-ti-staging_3.14.bbappend} |    2 ++
> >  1 file changed, 2 insertions(+)
> >  copy meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappend
> > => linux-ti-staging_3.14.bbappend} (94%)
> > 
> > diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> > staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> > staging_3.14.bbappend
> > similarity index 94%
> > copy from meta-arago-distro/recipes-kernel/linux/linux-ti-
> > staging_3.12.bbappend
> > copy to meta-arago-distro/recipes-kernel/linux/linux-ti-
> > staging_3.14.bbappend
> > index 2a6f090..b178b5e 100644
> > --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
> > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
> > @@ -6,6 +6,8 @@ require copy-defconfig.inc
> > 
> >  KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
> > 
> [Franklin] PR bump missing.

How so?


> > +SRCREV = "${AUTOREV}"
> > +
> >  kernel_do_configure_prepend() {
> >      if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >      then
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

