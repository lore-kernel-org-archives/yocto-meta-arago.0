Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 48061529B3
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:35:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKZSIm031272;
	Tue, 10 Feb 2015 14:35:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKZRTU018414;
	Tue, 10 Feb 2015 14:35:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 14:35:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKZNG3013685;
	Tue, 10 Feb 2015 14:35:25 -0600
Date: Tue, 10 Feb 2015 15:35:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150210203521.GO13231@edge>
References: <1423595959-23271-1-git-send-email-denis@denix.org>
	<4F9216F96E5DF9428610502835A9F4905811188E@DLEE11.ent.ti.com>
	<20150210200501.GJ13231@edge>
	<4F9216F96E5DF9428610502835A9F49058111931@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058111931@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 20:35:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 10, 2015 at 03:31:32PM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, February 10, 2015 3:05 PM
> > To: Nelson, Sam
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago-base-
> > tisdk: move psplash to IMAGE_FEATURES, sans server
> > 
> > On Tue, Feb 10, 2015 at 07:50:05PM +0000, Nelson, Sam wrote:
> > > Is this patch based on master? I am having trouble using the patch AS IS.
> > 
> > Ah, indeed. Fixed in v2.
> > 
> > 
> > > See comments inline.
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Tuesday, February 10, 2015 2:19 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH] arago-image, packagegroup-arago-base-
> > tisdk:
> > > > move psplash to IMAGE_FEATURES, sans server
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  meta-arago-distro/recipes-core/images/arago-image.inc                  | 2 +-
> > > >  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb     | 2
> > ++
> > > >  .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb        | 3
> > +--
> > > >  3 files changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-
> > > > arago-distro/recipes-core/images/arago-image.inc
> > > > index 98af6c3..977ce8f 100644
> > > > --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > @@ -3,7 +3,7 @@
> > > >  LICENSE = "MIT"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> > > >
> > > > -IMAGE_FEATURES += "package-management"
> > > > +IMAGE_FEATURES += "package-management splash"
> > 
> > 1. We add standard "splash" feature to IMAGE_FEATURES list for all our
> > images.
> > And image class will pull in psplash by default.
> > 
> > 
> > > >  # 4KB per 1 inode should be enough
> > > >  EXTRA_IMAGECMD_ext2.gz += "-i 4096"
> > > > diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-
> > image.bb
> > > > b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > > > index e5ce2b5..908325f 100644
> > > > --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> > > > @@ -3,6 +3,8 @@ COMPATIBLE_MACHINE =
> > > > "omap3|omapl138|ti33x|keystone"
> > > >
> > > >  require arago-image.inc
> > > >
> > > > +SPLASH = ""
> > > > +
> > > [Sam] I am not sure why is this needed. Appreciate if you clarify.
> > 
> > 2. For "server" image, we empty SPLASH variable, which is "psplash" by default.
> > 
> > 
> > > >  IMAGE_INSTALL += "\
> > > >      packagegroup-arago-base \
> > > >      packagegroup-arago-console \
> > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > > index 704e840..c291a42 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > base-
> > > > tisdk.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > > base-tisdk.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION = "Additional packages beyond console packages shared by TI
> > > > SDKs"
> > > >  LICENSE = "MIT"
> > > > -PR = "r14"
> > > > +PR = "r15"
> > > >
> > > >  inherit packagegroup
> > > >
> > > > @@ -12,7 +12,6 @@ RDEPENDS_${PN} = "\
> > > >      libpcre \
> > > >      iptables \
> > > >      iperf \
> > > > -    psplash \
> > 
> > > [Sam] I see psplash getting removed here. Does not this be moved to a
> > > different package group? ( I don't see any addition to different package
> > > group).
> > 
> > 3. We no longer add psplash explicitly in the packagegroup, since image class
> > takes care of that for us with the steps above.
> > 
> [Sam] Ok. 

> So the idea is, to disable psplash for headless distribution, probably need 
> to remove IMAGE_FEATURES_remove = "psplash" ?  Does that make sense?

Step #2 above.


> Also I tried the patch v2, and I see psplash does not seem to be added 
> automatically. Can you cross check this?

Which image is that? I've checked the resulting RDEPENDS for our rootfs images 
and they look fine.


> > 
> > > >      arago-gpl-notice \
> > > >      nfs-utils-client \
> > > >      "
> > > > --
> > > > 2.2.0
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

