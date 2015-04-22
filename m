Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4178F52A4E
	for <meta-arago@arago-project.org>;
	Wed, 22 Apr 2015 19:18:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3MJIG4A028283
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2015 14:18:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MJIFI2006475
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2015 14:18:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Apr 2015 14:18:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MJIFPm023453;
	Wed, 22 Apr 2015 14:18:15 -0500
Date: Wed, 22 Apr 2015 15:18:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150422191814.GL25236@edge>
References: <1428521510-1792-1-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C869430@DFLE08.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411DA2A@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C86952A@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C86952A@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-readme: Specify that uEnv.txt is optional.
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
X-List-Received-Date: Wed, 22 Apr 2015 19:18:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Was this patch superseeded by packagegroup-*-amsdk-sdk-host removal of 
tisdk-readme?

-- 
Denys


On Wed, Apr 08, 2015 at 07:45:48PM +0000, Cooper Jr., Franklin wrote:
> I would just include it for omap5-evm which is the only user of the customized uEnv.txt.
> I don't see anyone else using it.
> 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Wednesday, April 08, 2015 2:42 PM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
> > optional.
> > 
> > This is included now because for ti33xx and ti43xx, tisdk-readme is included if
> > the brand is not amsdk.
> > 
> > Should this package be removed completely for all brands?
> > 
> > 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Wednesday, April 08, 2015 3:38 PM
> > To: Stiffler, Jacob; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
> > optional.
> > 
> > I still don't understand the need to include this especially since it was never
> > included before and all this information is documented.
> > 
> > But anyway the wording needs to be updated. Remove all the parts that says
> > "usually called" since that's what it is called. ZImage should be used and not
> > uImage.
> > 
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > > Sent: Wednesday, April 08, 2015 2:32 PM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH] tisdk-readme: Specify that uEnv.txt is
> > > optional.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |    2 +-
> > >  .../recipes-tisdk/tisdk-readme/tisdk-readme/README |    2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> > > b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> > > index 6fdcaff..4ee3ec4 100644
> > > --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> > > +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> > > @@ -6,7 +6,7 @@ SRC_URI = "\
> > >      file://README \
> > >  "
> > >
> > > -PR = "r0"
> > > +PR = "r1"
> > >  PV = "1.0"
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> > > readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> > > readme/README
> > > index 873d1e8..b9aeefe 100644
> > > --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> > readme/README
> > > +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-
> > > readme/README
> > > @@ -11,7 +11,7 @@ By default these locations are:
> > >
> > >
> > ==========================================================
> > > ======================
> > >  |    MLO           | boot partition
> > >  |    u-boot.img    | boot partition
> > > -|    uEnv.txt      | boot partition
> > > +|    uEnv.txt      | boot partition (optional)
> > >  |    uImage        | /boot directory of the rootfs partition
> > >  |    *.dtb         | /boot directory of the rootfs partition
> > >
> > >
> > ==========================================================
> > > ======================
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

