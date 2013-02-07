Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 875E352A15
	for <meta-arago@arago-project.org>;
	Thu,  7 Feb 2013 20:43:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHV003GUAWEBFU0@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 07 Feb 2013 14:43:27 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 002C7201D8; Thu,
	07 Feb 2013 15:43:25 -0500 (EST)
Date: Thu, 07 Feb 2013 15:43:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130207204325.GA10002@denix.org>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
	<1360117678-4395-2-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EDB9@DLEE09.ent.ti.com>
	<20130206035242.GA1341@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C38741D@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C38741D@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] nativesdk-qt4-tools: Use new native x11	package name.
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
X-List-Received-Date: Thu, 07 Feb 2013 20:43:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 06, 2013 at 04:08:00AM +0000, Cooper Jr., Franklin wrote:
> In oe-core nativesdk-qt4-tools.inc 
> DEPENDS = "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-native"
> 
> So I needed to make sure that libx11-nativesdk was filtered out because I 
> was getting an build error saying nothing provided libx11-nativesdk because 
> x11 is not part of the distro feature.

So, the proper fix was picked up to oe-core/master and is queued up for 
oe-core/danny - I was told it should land soon, in a day or so. If it doesn't 
make it there soon, we can always apply this patch temporarily to meta-arago.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Tuesday, February 05, 2013 9:53 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> > Subject: Re: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native x11
> > package name.
> > 
> > On Wed, Feb 06, 2013 at 03:39:17AM +0000, Dmytriyenko, Denys wrote:
> > > Didn't I push this already? I remember fixing this particular one few days
> > ago...
> > 
> > Ok, sorry, I didn't notice you were changing it back...
> > 
> > I did change it from libx11-nativesdk to nativesdk-libx11, because that's how
> > BBCLASSEXTEND=nativesdk calls its packages now. Why are you changing it
> > back?
> > 
> > --
> > Denys
> > 
> > 
> > > -----Original Message-----
> > > From: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
> > > Received: Tuesday, 05 Feb 2013, 20:28
> > > To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> > > CC: Cooper Jr., Franklin [fcooper@ti.com]
> > > Subject: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native x11
> > package name.
> > >
> > > From: Franklin S. Cooper Jr <fcooper@ti.com>
> > >
> > > * Nativesdk-libx11 has now been renamed to libx11-nativesdk.
> > > * This ensure the x11 package is filtered out which prevents parsing/build
> > >   errors due to x11 not being a distro feature.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../qt4/nativesdk-qt4-tools_4.8.3.bbappend         |    4 ++--
> > >  1 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-
> > tools_4.8.3.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-
> > tools_4.8.3.bbappend
> > > index 6296fbe..312571e 100644
> > > --- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
> > > +++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
> > > @@ -1,7 +1,7 @@
> > > -PR_append = "-arago2"
> > > +PR_append = "-arago3"
> > >
> > >  # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> > >  # For our distribution purposes we only use LGPLv2.1
> > >  LICENSE = "LGPLv2.1"
> > >
> > > -DEPENDS := "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
> > > +DEPENDS := "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

