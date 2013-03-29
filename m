Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6E3FB52991
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 17:23:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2THNloL004504
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:23:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2THNlXM015758
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:23:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 29 Mar 2013 12:23:47 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2THNl7Z027726;
	Fri, 29 Mar 2013 12:23:47 -0500
Date: Fri, 29 Mar 2013 13:23:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130329172346.GO23022@edge>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
	<20130329170127.GM23022@edge>
	<7D46E86EC0A8354091174257B2FED101594B026A@DLEE11.ent.ti.com>
	<20130329171132.GN23022@edge>
	<7D46E86EC0A8354091174257B2FED101594B0310@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594B0310@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/4] omapconf: add omapconf utility to assist testing and debug
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
X-List-Received-Date: Fri, 29 Mar 2013 17:23:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 29, 2013 at 01:18:46PM -0400, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 29, 2013 12:12 PM
> > To: Maupin, Chase
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> > utility to assist testing and debug
> > 
> > On Fri, Mar 29, 2013 at 01:06:57PM -0400, Maupin, Chase wrote:
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Friday, March 29, 2013 12:01 PM
> > > > To: Maupin, Chase
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> > > > utility to assist testing and debug
> > > >
> > > > On Fri, Mar 29, 2013 at 08:50:30AM -0500, Chase Maupin wrote:
> > > > > * The omapconf utility gives useful information about the
> > > > >   state of the OMAP device and can be used in debug and
> > > > testing.
> > > > >
> > > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > > ---
> > > > >  .../recipes-devtools/omapconf/omapconf_git.bb      |   25
> > > > ++++++++++++++++++++
> > > > >  1 files changed, 25 insertions(+), 0 deletions(-)
> > > > >  create mode 100644 meta-arago-extras/recipes-
> > > > devtools/omapconf/omapconf_git.bb
> > > > >
> > > > > diff --git a/meta-arago-extras/recipes-
> > > > devtools/omapconf/omapconf_git.bb b/meta-arago-
> > extras/recipes-
> > > > devtools/omapconf/omapconf_git.bb
> > > > > new file mode 100644
> > > > > index 0000000..9fcd88d
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-extras/recipes-
> > > > devtools/omapconf/omapconf_git.bb
> > > > > @@ -0,0 +1,25 @@
> > > > > +DESCRIPTION = "Diagnostic tool for TI OMAP processors"
> > > > > +HOMEPAGE = "https://github.com/omapconf/omapconf"
> > > > > +
> > > > > +LICENSE = "GPLv2 BSD"
> > > > > +LIC_FILES_CHKSUM =
> > > > "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
> > > > > +
> > > > > +PV = "1.66"
> > > > > +PR = "r0"
> > > > > +
> > > > > +COMPATIBLE_MACHINE = "omap-a15"
> > > >
> > > > Is it compatible with omap4? I guess not omap3 though :)
> > >
> > > Correct.  Since it supports OMAP4 as well I went ahead and left
> > it at
> > > omap-a15.  OMAP3 wasn't listed as I recall.
> > 
> > I'm confused. Shouldn't it be omap-a15|omap4?
> 
> I didn't notice the pandaboard so I thought there wasn't an existing omap4.  
> My logic was that when/if omap4 was added it would go into the omap-a15 
> SOC_FAMILY.  I'll send an update.

Why would pandaboard go into omap-a15 SOC_FAMILY? It's not Cortex-A15 and it 
has it's own SOC_FAMILY.

Moreover, we had pandaboard in meta-ti for ages, the support is reasonably 
up-to-date and it is part of my nightly builds of distro-less config...


> > > > > +
> > > > > +BRANCH ?= "master"
> > > > > +SRCREV = "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> > > > > +
> > > > > +SRC_URI =
> > > >
> > "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRA
> > > > NCH}"
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +
> > > > > +do_compile () {
> > > > > +    oe_runmake CROSS_COMPILE=${TARGET_PREFIX} install
> > > > > +}
> > > > > +
> > > > > +do_install () {
> > > > > +    oe_runmake DESTDIR=${D}${bindir} install
> > > > > +}
> > > > > --
> > > > > 1.7.0.4
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > arago

