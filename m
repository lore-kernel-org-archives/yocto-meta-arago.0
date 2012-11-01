Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3EAC6529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 19:12:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1JCihc029842;
	Thu, 1 Nov 2012 14:12:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1JCiZu008523;
	Thu, 1 Nov 2012 14:12:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 1 Nov 2012 14:12:44 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA1JCiCd014065;
	Thu, 1 Nov 2012 14:12:44 -0500
Date: Thu, 1 Nov 2012 15:12:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121101191243.GG22705@edge>
References: <1351794950-4321-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED10159290E2B@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C313819@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C313819@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-amsdk-image: Add additional tasks and	image
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
X-List-Received-Date: Thu, 01 Nov 2012 19:12:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The order cannot be guaranteed for the patches sent in the same batch w/o 
patch series numbers. Emails often come out of order.


On Thu, Nov 01, 2012 at 07:01:59PM +0000, Cooper Jr., Franklin wrote:
> I submitted the patches based on my commit order. However , your right. Some of these patches I created and then rebased when I added new recipes later on. I don't think this with be an issue with the remaining patches I sent but I will double check
> 
> -----Original Message-----
> From: Maupin, Chase 
> Sent: Thursday, November 01, 2012 1:55 PM
> To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: RE: [meta-arago] [PATCH] arago-amsdk-image: Add additional tasks and image
> 
> This depends on your patch that renames the arago-tisdk-image.  Without patch series numbers it's hard to know the ordering.
> 
> Sincerely,
> Chase Maupin
> Software Applications
> ARM MPU
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/ Wiki - http://wiki.davincidsp.com/ 
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Thursday, November 01, 2012 1:36 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH] arago-amsdk-image: Add additional tasks 
> > and image
> > 
> > * Add additional sdk-host tasks and target filesystem image
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/images/arago-amsdk-image.bb       |   13
> > ++++++++++---
> >  1 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-
> > image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-
> > image.bb
> > index 82e0527..6ddcb8b 100644
> > --- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
> > @@ -13,9 +13,16 @@ HOST_CLEANUP_PACKAGES = ""
> >  TOOLCHAIN_CLEANUP_PACKAGES = ""
> > 
> >  # List of target side images to build for the SDK -TARGET_IMAGES = 
> > "arago-base-tisdk-image"
> > -
> > -IMAGE_INSTALL = "task-arago-tisdk-addons-sdk-host"
> > +TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
> > +
> > +IMAGE_INSTALL = "\
> > +    task-arago-tisdk-addons-sdk-host \
> > +    task-arago-tisdk-connectivity-sdk-host \
> > +    task-arago-tisdk-crypto-sdk-host \
> > +    task-arago-tisdk-matrix-sdk-host \
> > +    task-arago-tisdk-multimedia-sdk-host \
> > +    task-arago-tisdk-qte-sdk-host \
> > +"
> > 
> >  export IMAGE_BASENAME = "arago-amsdk-image"
> > 
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

