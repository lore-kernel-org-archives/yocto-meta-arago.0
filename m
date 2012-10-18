Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 20B4A52980
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:18:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9IFItv9002826;
	Thu, 18 Oct 2012 10:18:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9IFItxb025283;
	Thu, 18 Oct 2012 10:18:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 18 Oct 2012 10:18:54 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9IFIsmd028979;
	Thu, 18 Oct 2012 10:18:54 -0500
Date: Thu, 18 Oct 2012 11:18:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121018151853.GA4805@edge>
References: <1350022004-13294-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C450@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306C42@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C306C42@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-tisdk-image: Create image that builds	Sitara SDK filesystem
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
X-List-Received-Date: Thu, 18 Oct 2012 15:18:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 18, 2012 at 03:16:39AM +0000, Cooper Jr., Franklin wrote:
> 
> 
> -----Original Message-----
> From: Maupin, Chase 
> Sent: Friday, October 12, 2012 9:58 PM
> To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: RE: [meta-arago] [PATCH] arago-tisdk-image: Create image that builds Sitara SDK filesystem
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Friday, October 12, 2012 1:07 AM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH] arago-tisdk-image: Create image that 
> > builds Sitara SDK filesystem
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/images/arago-tisdk-image.bb       |   21
> > ++++++++++++++++++++
> >  1 files changed, 21 insertions(+), 0 deletions(-)  create mode 100644 
> > meta-arago-distro/recipes-core/images/arago-
> > tisdk-image.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-
> > image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-
> > image.bb
> > new file mode 100644
> > index 0000000..e9e6781
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
> > @@ -0,0 +1,21 @@
> > +# Arago TI SDK base image
> > +# gives you an image with Qt/E and other common packages shared
> > by all TI SDKs.
> > +
> > +require arago-image.inc
> > +PR_append = "-arago0"
> 
> Why are you appending the PR?
> 
> Franklin: Its something that I added a few months when I had a concern about 
> the arago-image.inc file but I never properly addressed.
> I am going to send an updated patch . Essentially I am going to add INC_PR = 
> "r0" to arago-image.inc and in this recipe replace PR_append with PR = 
> "${INC_PR}.1".
> http://www.openembedded.org/wiki/Styleguide talks a little bit about this.

That's something I wanted to comment on as well... There are no PV or PR for 
image recipes, as that doesn't make much sense. Images have special handling, 
they are deployed and not packaged, with a specially defined names. Moreover, 
do_rootfs will always run when you bitbake the image recipe. So, drop any PR, 
INC_PR etc. from image recipes.

-- 
Denys

