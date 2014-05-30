Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D585652A28
	for <meta-arago@arago-project.org>;
	Fri, 30 May 2014 14:00:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4UE05BM028102
	for <meta-arago@arago-project.org>; Fri, 30 May 2014 09:00:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4UE045J019126
	for <meta-arago@arago-project.org>; Fri, 30 May 2014 09:00:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 30 May 2014 09:00:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4UE02LG013651;
	Fri, 30 May 2014 09:00:02 -0500
Date: Fri, 30 May 2014 10:00:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140530140001.GA21819@edge>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-6-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6BDDA3@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6BDDA3@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 05/19] gst-plugins-base: Add TI version with	bbappend
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
X-List-Received-Date: Fri, 30 May 2014 14:00:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 30, 2014 at 01:06:19PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Monday, May 19, 2014 2:20 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 05/19] gst-plugins-base: Add TI version with
> > bbappend
> > 
> > From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > 
> > * Pulled in the bbappend from meta-arago-glsdk and kept
> >   authorship for Mrinmayee
> > * This bbappend modifies the gst-plugins-base package to pull
> >   from git.ti.com/glsdk which has additional patches to support
> >   TI devices
> > * Modified the following for upstreaming:
> >     * Removed setting of LICENSE since this would override the
> >       LICENSE value in the base recipe
> > * Make machines specific due to changed SRC_URI
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  ....bbappend => gst-plugins-base_0.10.36.bbappend} |   12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)  copy meta-arago-extras/recipes-
> > multimedia/gstreamer/{gst-plugins-bad_0.10.23.bbappend => gst-plugins-
> > base_0.10.36.bbappend} (58%)
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > bad_0.10.23.bbappend b/meta-arago-extras/recipes-
> > multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
> > similarity index 58%
> > copy from meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > bad_0.10.23.bbappend
> > copy to meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > base_0.10.36.bbappend
> > index 74cc9ce..6691ee3 100644
> > --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-
> > bad_0.10.23.bbappend
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.
> > +++ 10.36.bbappend
> > @@ -1,22 +1,20 @@
> > -DEPENDS_append_omap-a15 = " omap5-sgx-ddk-um-linux libdce libdrm
> > wayland "
> > +PR_append = "-arago1"
> > 
> >  # Make MACHINE specific since we pull different sources per MACHINE
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > -PR_append = "-arago1"
> > -
> > -SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"

> [Franklin] I don't see nightly builds failing but I'm curious why the above 
> is ok. Isn't this SRCREV specific to the git.ti.com/glsdk/... repo so for 
> devices other then omap-a15 won't the commit id be invalid?

I already had this question - see discussion on one of the other gstreamer 
patches. The answer is that SRC_URI_omap-a15 is git, while for other platforms 
it's tar.gz, hence SRCREV only works for omap-a15. It would have been better 
to use machine override for SRCREV too, just to be safe in the future.


> > -SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-bad0-
> > 10.git;protocol=git"
> > +SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-base0-
> > 10.git;protocol=git"
> > +SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
> > 
> >  S_omap-a15 = "${WORKDIR}/git"
> > 
> > -EXTRA_OECONF += " --disable-pvr"
> > -
> >  do_configure_prepend_omap-a15() {
> >  	git submodule init && git submodule update
> >  	autopoint -f
> >  }
> > 
> > +EXTRA_OECONF +="--disable-ivorbis "
> > +
> >  FILES_${PN} += "\
> >                  ${libdir}/*.so \
> >                  ${libdir}/gstreamer-0.10/*"
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

