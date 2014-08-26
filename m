Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AD0F852972
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 18:13:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QIDclx029722;
	Tue, 26 Aug 2014 13:13:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QIDbtB018385;
	Tue, 26 Aug 2014 13:13:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 26 Aug 2014 13:13:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QIDb2T002530;
	Tue, 26 Aug 2014 13:13:37 -0500
Date: Tue, 26 Aug 2014 14:13:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140826181336.GG17427@edge>
References: <1409065964-13484-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C705A61@DFLE08.ent.ti.com>
	<20140826164832.GD17427@edge>
	<8F29D6B095ED194EA1980491A5E029710C705E8F@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C705E8F@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-*-graphics: add weston packages	globally
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
X-List-Received-Date: Tue, 26 Aug 2014 18:13:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 26, 2014 at 02:11:41PM -0400, Cooper Jr., Franklin wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, August 26, 2014 11:49 AM
> > To: Cooper Jr., Franklin
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
> > packages globally
> > 
> > On Tue, Aug 26, 2014 at 03:16:49PM +0000, Cooper Jr., Franklin wrote:
> > > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> > >
> > > FYI I made a similar change locally and Mesa (mesa-gl I think) was
> > > getting pulled in when building am57x-evm for some reason.
> > 
> > I'm testing a fix for that.
> > 
> > 
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Tuesday, August 26, 2014 10:13 AM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
> > > > packages globally
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > As long as Weston compositor runs on top of either DRM or fbdev,
> > > > should not depend on SGX libs
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-arago-tisdk-graphics.bb        | 11
> > ++++++--
> > > > ---
> > > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > > arago-tisdk-graphics.bb b/meta-arago-distro/recipes-
> > > > core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> > > > index 1439638..d730799 100644
> > > > ---
> > > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > > tisdk-graphics.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > > arago-ti
> > > > +++ sdk-graphics.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION = "Task to install graphics binaries"
> > > >  LICENSE = "MIT"
> > > > -PR = "r5"
> > > > +PR = "r6"
> > > >
> > > >  inherit packagegroup
> > > >
> > > > @@ -16,15 +16,16 @@ GRAPHICS_SDK = "\
> > > >      omap3-sgx-modules \
> > > >  "
> > > >
> > > > -GRAPHICS_RDEPENDS = ""
> > > > -
> > > > -GRAPHICS_RDEPENDS_ti33x = "\
> > > > -    ${GRAPHICS_SDK} \
> > > > +GRAPHICS_RDEPENDS = "\
> > > >      weston \
> > > >      weston-init \
> > > >      weston-examples \
> > > >  "
> > > >
> > > > +GRAPHICS_RDEPENDS_ti33x = "\
> > > > +    ${GRAPHICS_SDK} \
> > > > +"
> > > > +
> [Franklin] ^ shouldn't this be something like 
> GRAPHICS_RDEPENDS_append_ti33x? Same thing for ti43x and omap-a15

Yes, and another fix is in testing, I'm just blocked by git.ti.com 
maintenance...


> > > >  GRAPHICS_RDEPENDS_ti43x = "\
> > > >      ${GRAPHICS_SDK} \
> > > >  "
> > > > --
> > > > 2.0.4
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

