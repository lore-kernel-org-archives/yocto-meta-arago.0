Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6104A529FE
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2013 17:31:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83HVQbO014547
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2013 12:31:26 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83HVQq1023662
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2013 12:31:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 12:31:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83HVQHw021201;
	Tue, 3 Sep 2013 12:31:26 -0500
Date: Tue, 3 Sep 2013 13:31:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130903173125.GE22235@edge>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596F8113@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C53FD63@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C53FD63@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/6 v2] gst-plugins-bad: Use new PACKAGECONFIG	feature
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
X-List-Received-Date: Tue, 03 Sep 2013 17:31:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 30, 2013 at 03:44:26PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Friday, August 30, 2013 10:04 AM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH 1/6 v2] gst-plugins-bad: Use new
> > PACKAGECONFIG feature
> > 
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >Sent: Tuesday, August 27, 2013 2:51 PM
> > >To: meta-arago@arago-project.org
> > >Cc: Cooper Jr., Franklin
> > >Subject: [meta-arago] [PATCH 1/6 v2] gst-plugins-bad: Use new
> > >PACKAGECONFIG feature
> > >
> > >* Recent patch in oe-core allows certain features to be enabled or
> > >disabled
> > >  based on the PACKAGECONFIG variable.
> > >* Use this variable which will obsolete alot of the code in this
> > >bbappend while
> > >  achieving the same result.
> > >
> > >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >---
> > >Version 2 changes:
> > >Update patch tailored to recent change to base recipe in oe-core.
> > >
> > >
> > > .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   14 ++-----
> > >-------
> > > 1 files changed, 2 insertions(+), 12 deletions(-)
> > >
> > >diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> > >plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
> > >multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> > >index 8ae8050..8cee785 100644
> > >--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> > >bad_0.10.23.bbappend
> > >+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> > >bad_0.10.23.bbappend
> > >@@ -1,21 +1,11 @@
> > >-PR_append = "-arago3"
> > >+PR_append = "-arago4"
> > >
> > > # look for files in this layer first
> > > FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >
> > >-# Disable rsvg which caused gtk+ to be pulled in -DEPENDS :=
> > >"${@oe_filter_out('librsvg','${DEPENDS}', d)}"
> > >-EXTRA_OECONF += "--disable-rsvg"
> > >-
> > >-# Remove the restriction of which plugins are built. Previously
> > >fbdevsink -# was not built which is needed by the gstreamer demos
> > >included in the SDK.
> > >-EXTRA_OECONF := "${@oe_filter_out('--with-
> > >plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECON
> > >F}', d)}"
> > 
> > I'm assuming that these are removed because of the COMMERCIAL filter setting
> > (I don't remember the full variable off the top of my head)
> > 
> > Should this be called out in the commit message?

> [Franklin] So this oe_filter_out wasn't due to COMMERCIAL filter it was due 
> to with-plugins will only build plugins in the list. So by filtering out 
> that string gst-plugins-bad will attempt to build all plugins. Further down 
> in the recipe you can see where certain plugins are explicitly removed 
> because of license reasoning. There is even a comment about it addressing 
> that.

> > 
> > >-
> > > SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-
> > >GST_VIDEO_CAPS_RGB_.patch"
> > >
> > >-# Add faad has a dependency to insure gst-plugins-bad-faad is built.
> > >-DEPENDS += "faad2"
> > >-RDEPENDS_${PN}-faad += "libfaad"
> > >+PACKAGECONFIG = "bzip curl faad"
> > 
> > I have some question here.  You changed the DEPENDS to faad instead of faad2.
> > I see in base.bbclass the DEPENDS magic based on PACKAGECONFIG, but the
> > RDEPENDS setting there didn't look like it would add libfaad.  Maybe I am just
> > not reading it right but did you check that?
> [Franklin] Ah your right.
> 
> Comment from base.bbclass
> PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
> 
> Snippet from gst-plugins-bad
> PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2"
> 
> So I probably need to change the override the above line with
> PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2,libfaad"
> 
> Let me double check this.

That is the correct use of PACKAGECONFIG, although handling shlib dependencies 
is usually done automatically. In other words, if you have DEPENDS on faad 
already and it installs libfaad that this package uses, it will figure out 
RDEPENDS automatically...


> > Also, why add curl and bzip too?  If needed should that be a separate patch or at
> > least updated in the commit message?

> [Franklin] In the base recipe PACKAGECONFIG is set to "bzip curl". Since I 
> am adding faad I needed to override that variable but I didn't want to lose 
> the default. Probably a better approach is

> PACKAGECONFIG = "${PACKAGECONFIG} faad"
> Although I don't know what ??= means so I will have to see if that works.

It is just a "lazy" variant of a regular ?= conditional assignment, i.e. it 
just wait until the end of the parsing to decide upon it:

http://docs.openembedded.org/bitbake/html/ch02.html#id398548


> > >
> > > # Disable features that have potential commercial licensing
> > >restrictions
> > > EXTRA_OECONF += "\
> > >--
> > >1.7.0.4
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

