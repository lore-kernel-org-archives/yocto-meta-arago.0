Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CF76752A88
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 19:30:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KJUruS016396
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2013 14:30:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KJUrNN003739
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2013 14:30:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 20 Sep 2013 14:30:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KJUqwQ028460;
	Fri, 20 Sep 2013 14:30:52 -0500
Date: Fri, 20 Sep 2013 15:30:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130920193051.GB30673@edge>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553A50@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C553A50@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file	system image
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
X-List-Received-Date: Fri, 20 Sep 2013 19:30:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 17, 2013 at 04:05:10PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, September 17, 2013 2:52 PM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
> > file system image
> > 
> > What was the initial reason to start naming rootfs images with tisdk-rootfs-
> > prefix? I remember it was something forced by the SDK setup...
> [Franklin] 
> This was before my time so I am not sure what the original reasoning was.
> 
> I do assume there might be instances where some script somewhere will need 
> to be updated if it refers to the full image as "tisdk-rootfs*"

So, I located the change I was talking about:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=91f2be34e301deebbc75c54bbad6a5a27e25bf2c

The "tisdk-image class had issues" is a rather vague description, so I'm not 
sure or don't remember what was the problem that you had to rename the 
original arago-tisdk-image into tisdk-rootfs-image...

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > Sent: Tuesday, September 17, 2013 3:13 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base file
> > system image
> > 
> > * People are frequently confused by the difference in naming between the
> > minimal
> >   file system and the larger file system.
> > * Rename the minimal file system to mimic the naming convention of the larger
> >   file system.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  ...e-tisdk-image.bb => tisdk-rootfs-base-image.bb} |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)  rename meta-arago-
> > distro/recipes-core/images/{arago-base-tisdk-image.bb => tisdk-rootfs-base-
> > image.bb} (87%)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> > b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
> > similarity index 87%
> > rename from meta-arago-distro/recipes-core/images/arago-base-tisdk-
> > image.bb
> > rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
> > index 2c0e217..a3a9123 100644
> > --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
> > @@ -12,4 +12,4 @@ IMAGE_INSTALL += "\
> >      packagegroup-arago-base-tisdk \
> >      "
> > 
> > -export IMAGE_BASENAME = "arago-base-tisdk-image"
> > +export IMAGE_BASENAME = "tisdk-rootfs-base-image"
> > --
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

