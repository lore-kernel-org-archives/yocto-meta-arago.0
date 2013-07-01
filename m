Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4419052A4D
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 16:03:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61G3EJ7002621
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:03:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61G3ECM003502
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 11:03:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 11:03:13 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r61G3Dpd023556;
	Mon, 1 Jul 2013 11:03:13 -0500
Date: Mon, 1 Jul 2013 12:03:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130701160312.GE4588@edge>
References: <20130701154814.GA1802@ti.com>
 <20130701160057.GD4588@edge>
MIME-Version: 1.0
In-Reply-To: <20130701160057.GD4588@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] images: Add new arago-glsdk-console-image
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
X-List-Received-Date: Mon, 01 Jul 2013 16:03:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2013 at 12:00:57PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 01, 2013 at 09:18:14PM +0530, Siddharth Heroor wrote:
> > Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > ---
> >  .../images/arago-glsdk-console-image.bb            |   16 ++++++++++++++++
> >  1 files changed, 16 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb b/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
> > new file mode 100644
> > index 0000000..8ce905c
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/arago-glsdk-console-image.bb
> > @@ -0,0 +1,16 @@
> > +# GLSDK console image
> > +# gives you an image with basic media libraries
> 
> Why???
> 
> 
> > +require arago-image.inc
> > +
> > +COMPATIBLE_MACHINE = "(?!omap-a15)"
> 
> I thought GLSDK was mainly OMAP5 and here you say it's NOT compatible with 
> omap-a15?
> 
> 
> > +
> > +# The size of the uncompressed ramdisk is 32MB
> > +ROOTFS_SIZE = "32768"
> > +
> > +IMAGE_INSTALL += "\
> > +    packagegroup-arago-base \
> > +    packagegroup-arago-console \
> > +    packagegroup-arago-glsdk-console \
> 
> Again, no changes from the original image - no need to create a new one.

Disregard this comment - missed the glsdk-console packagegroup. But please 
address the above comments.


> > +export IMAGE_BASENAME = "arago-glsdk-console-image"
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

