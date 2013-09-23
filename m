Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0BC44529A8
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2013 15:34:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NFYjkM015326
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 10:34:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NFYjiZ010504
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 10:34:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 10:34:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NFYi6Z018351;
	Mon, 23 Sep 2013 10:34:44 -0500
Date: Mon, 23 Sep 2013 11:34:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130923153444.GD3456@edge>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553A50@DFLE08.ent.ti.com>
	<20130920193051.GB30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C55817B@DFLE08.ent.ti.com>
	<20130920201855.GD30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C558370@DFLE08.ent.ti.com>
	<20130920211425.GF30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C55A51B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C55A51B@DFLE08.ent.ti.com>
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
X-List-Received-Date: Mon, 23 Sep 2013 15:34:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 23, 2013 at 10:53:54AM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, September 20, 2013 4:14 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
> > file system image
> > 
> > On Fri, Sep 20, 2013 at 04:55:07PM -0400, Cooper Jr., Franklin wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Friday, September 20, 2013 3:19 PM
> > > > To: Cooper Jr., Franklin
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
> > > > Rename base file system image
> > > >
> > > > On Fri, Sep 20, 2013 at 03:38:06PM -0400, Cooper Jr., Franklin wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Dmytriyenko, Denys
> > > > > > Sent: Friday, September 20, 2013 2:31 PM
> > > > > > To: Cooper Jr., Franklin
> > > > > > Cc: meta-arago@arago-project.org
> > > > > > Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
> > > > > > Rename base file system image
> > > > > >
> > > > > > On Tue, Sep 17, 2013 at 04:05:10PM -0400, Cooper Jr., Franklin wrote:
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Dmytriyenko, Denys
> > > > > > > > Sent: Tuesday, September 17, 2013 2:52 PM
> > > > > > > > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > > > > > > > Subject: RE: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
> > > > > > > > Rename base file system image
> > > > > > > >
> > > > > > > > What was the initial reason to start naming rootfs images
> > > > > > > > with
> > > > > > > > tisdk-rootfs- prefix? I remember it was something forced by
> > > > > > > > the SDK
> > > > setup...
> > > > > > > [Franklin]
> > > > > > > This was before my time so I am not sure what the original reasoning
> > was.
> > > > > > >
> > > > > > > I do assume there might be instances where some script
> > > > > > > somewhere will need to be updated if it refers to the full image as
> > "tisdk-rootfs*"
> > > > > >
> > > > > > So, I located the change I was talking about:
> > > > > > http://arago-project.org/git/?p=meta-
> > > > > >
> > arago.git;a=commitdiff;h=91f2be34e301deebbc75c54bbad6a5a27e25bf2
> > > > > > c
> > > > > >
> > > > > > The "tisdk-image class had issues" is a rather vague
> > > > > > description, so I'm not sure or don't remember what was the
> > > > > > problem that you had to rename the original arago-tisdk-image into
> > tisdk-rootfs-image...
> > > > > >
> > > >
> > > > > [Franklin] Ah I remember. The TARGET_IMAGES variable is used in
> > > > > two ways in that class. 1 to add a build dependency and 2 to
> > > > > reference the image tarball. So the assumption was that the
> > > > > recipe/package name was the same as the IMAGE_BASENAME. So the
> > > > > recipe and IMAGE_BASENAME
> > > > must
> > > > > match. Otherwise the image would be built but the class wouldn't
> > > > > know what tarball to look for.
> > > >
> > > > Ah, OK, this is not exactly what I was looking for. Tracing even
> > > > further back shows that you added the recipe to have IMAGE_BASENAME =
> > "tisdk-rootfs":
> > > >
> > > > http://arago-project.org/git/?p=meta-
> > > > arago.git;a=commitdiff;h=f27b1f34aee2c2cbee25a0fb5b21cdb04f16ec4a
> > > >
> > > > Do you remember the reason for that? This image recipe was in
> > > > Classic arago, but there it had the basename matching the recipe
> > > > name. Wondering why the change?
> > 
> > > [Franklin] I think I was simply trying to match the filesystem tarball
> > > with the name used in previous sdks. I am assuming that the SDK
> > > backend script that built the sdk renamed those filesystem files.
> > > Looking at Sitara AMSDK
> > > 05.05.01 (last oe-classic based sdk) the two filesystem tarballs were
> > > named base-rootfs-am335x-evm.tar.gz and
> > > tisdk-rootfs-am335x-evm.tar.gz. During that time I was focused on just
> > > getting the filesystem working and wanted it to look like the output
> > > from previous sdks. I don't think I had any other reason.
> > 
> > Thanks! Just wanted to check if there was some sort of requirement for that
> > name change. If there is not, then we can look for a better names for full image
> > as well as base image.
> > 
> > Should we look into unifying the names for other image recipes? Is
> > tisdk-rootfs- the best base we can think of?

> [Franklin] I think it's important to separate the "arago" images from the 
> "sdk" images. I am currently ok with the naming convention we use for our 
> current images minus the one I created this patch for :). But I'm open to 
> suggestions.

I'm not really sure what do you mean by separating arago from sdk. Arago 
distro is becoming the SDK, the Core TISDK one, to be exact. Other SDK 
products can build on top with slight variations.

We can place more generic packagegroups and images into meta-arago-extras and 
keep TISDK specific ones in meta-arago-distro.

As of the naming convention - I'm not exactly married to the arago- prefix for 
the image recipes, it was just a historic tradition - arago-base-image, 
arago-console-image, etc. I'm Ok with tisdk- prefix, but "rootfs" part always 
felt slightly artificial to me, as it was forced from outside and in OE images 
are images and there's no need to call them rootfs.

Anyway, what I'm trying to say is that now is the perfect time to align on the 
naming convention for our images and we don't need to stick to any of the 
existing names...

-- 
Denys


> > > > > > > > -----Original Message-----
> > > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > > > > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > > > > > > > Sent: Tuesday, September 17, 2013 3:13 PM
> > > > > > > > To: meta-arago@arago-project.org
> > > > > > > > Cc: Cooper Jr., Franklin
> > > > > > > > Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename
> > > > base
> > > > > > file
> > > > > > > > system image
> > > > > > > >
> > > > > > > > * People are frequently confused by the difference in naming
> > between
> > > > the
> > > > > > > > minimal
> > > > > > > >   file system and the larger file system.
> > > > > > > > * Rename the minimal file system to mimic the naming convention of
> > the
> > > > > > larger
> > > > > > > >   file system.
> > > > > > > >
> > > > > > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > > > > > ---
> > > > > > > >  ...e-tisdk-image.bb => tisdk-rootfs-base-image.bb} |    2 +-
> > > > > > > >  1 files changed, 1 insertions(+), 1 deletions(-)  rename meta-arago-
> > > > > > > > distro/recipes-core/images/{arago-base-tisdk-image.bb => tisdk-
> > rootfs-
> > > > > > base-
> > > > > > > > image.bb} (87%)
> > > > > > > >
> > > > > > > > diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
> > > > > > image.bb
> > > > > > > > b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
> > image.bb
> > > > > > > > similarity index 87%
> > > > > > > > rename from meta-arago-distro/recipes-core/images/arago-base-
> > tisdk-
> > > > > > > > image.bb
> > > > > > > > rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
> > > > > > image.bb
> > > > > > > > index 2c0e217..a3a9123 100644
> > > > > > > > --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
> > image.bb
> > > > > > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
> > > > image.bb
> > > > > > > > @@ -12,4 +12,4 @@ IMAGE_INSTALL += "\
> > > > > > > >      packagegroup-arago-base-tisdk \
> > > > > > > >      "
> > > > > > > >
> > > > > > > > -export IMAGE_BASENAME = "arago-base-tisdk-image"
> > > > > > > > +export IMAGE_BASENAME = "tisdk-rootfs-base-image"
> > > > > > > > --
> > > > > > > > 1.7.0.4
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > meta-arago mailing list
> > > > > > > > meta-arago@arago-project.org
> > > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

