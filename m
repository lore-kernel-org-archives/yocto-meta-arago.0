Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AE64752990
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 19:49:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GJnEsk008774;
	Mon, 16 Sep 2013 14:49:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GJnECS012975;
	Mon, 16 Sep 2013 14:49:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 14:49:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GJnEQI015976;
	Mon, 16 Sep 2013 14:49:14 -0500
Date: Mon, 16 Sep 2013 15:49:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130916194913.GB19671@edge>
References: <1378952413-6388-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C5525D9@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5525D9@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass package modules automatically
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
X-List-Received-Date: Mon, 16 Sep 2013 19:49:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I thought that was already done. There's RDEPENDS on ti-ocf-crypto-module in 
crypto packagegroup and ti-pru-sw-examples RDEPENDS on ti-pru-sw-edma-driver.

-- 
Denys


On Mon, Sep 16, 2013 at 07:39:32PM +0000, Cooper Jr., Franklin wrote:
> Base on this patch and a similar patch for ocf-crypto-module are their 
> patches that need to be added in meta-arago to make sure the kernel modules 
> are included in the file system?
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, September 11, 2013 9:20 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass package
> > modules automatically
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > The new method is to automatically package modules into kernel-module-
> > <modname> and make the custom name depend on the standard unified one.
> > Messing with FILES_${PN} usually causes problems, so avoid it and let
> > module.bbclass do it's magic.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-
> > bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > index c7fdfd1..1a418d7 100644
> > --- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > +++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
> > 
> >  INHIBIT_PACKAGE_STRIP = "1"
> > 
> > -MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "b+svnr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> > 
> >  SRC_URI =
> > "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonym
> > ous;pswd=''"
> > @@ -28,5 +28,3 @@ do_install () {
> >          install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
> >          install -m 0755 ${S}/edmautils.ko
> > ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
> >  }
> > -
> > -FILES_${PN} =
> > "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

