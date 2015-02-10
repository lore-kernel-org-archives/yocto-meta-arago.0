Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1892A52A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:36:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGapdE015639
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:36:51 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGaoUO016634
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:36:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 10:36:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGanR3010309;
	Tue, 10 Feb 2015 10:36:49 -0600
Date: Tue, 10 Feb 2015 11:36:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150210163649.GF13231@edge>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49058111635@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058111635@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Make psplash	conditional with splash feature
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
X-List-Received-Date: Tue, 10 Feb 2015 16:36:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 10, 2015 at 04:30:57PM +0000, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Tuesday, February 10, 2015 11:16 AM
> > To: Nelson, Sam; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> > psplash conditional with splash feature
> > 
> > Splash is not a distro feature we use so this will essentially remove it from all
> > devices.
> > 
> > You can either put this in a packagegroup that isn't included for headless
> > filesystems. But pick one that makes sense.
> > You can conditional include or not include psplash depending on machines.
> > You can use machine features and check for touchscreen. Although some kind
> > of generic "display" machine feature would be better. But it currently doesn't
> > exist.
> > Or you can add splash as a distro feature for the various branding files
> > excluding yours.

> [Sam] Do you see any issues using the "IMAGE_FEATURES" instead? 
> Core-image-base include splash by default ( so all products will include 
> psplash).

That's the wrong assumption.


> And I am thinking of removing it for Keystone using branding file 
> and can be done for any other headless distribution similarly.

Won't work due to above.


> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > Sent: Tuesday, February 10, 2015 10:01 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make psplash
> > > conditional with splash feature
> > >
> > > - This is meant to avoid error message with headless distribution
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > index 7652622..7b71aa4 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > base-tisdk.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > base-tisdk.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "Additional packages beyond console packages shared by TI
> > > SDKs"
> > >  LICENSE = "MIT"
> > > -PR = "r15"
> > > +PR = "r16"
> > >
> > >  inherit packagegroup
> > >
> > > @@ -12,7 +12,7 @@ RDEPENDS_${PN} = "\
> > >      libpcre \
> > >      iptables \
> > >      iperf \
> > > -    psplash \
> > > +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash', '',d)} \
> > >      arago-gpl-notice \
> > >      arago-feed-config \
> > >      nfs-utils-client \
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

