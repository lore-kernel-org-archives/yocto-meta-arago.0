Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7DEBE529DD
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 21:44:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88LiEvc017427;
	Mon, 8 Sep 2014 16:44:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LiEIW029755;
	Mon, 8 Sep 2014 16:44:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Sep 2014 16:44:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LiELb020563;
	Mon, 8 Sep 2014 16:44:14 -0500
Date: Mon, 8 Sep 2014 17:44:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140908214413.GL18620@edge>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
	<1410205737-7590-2-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C72C4CA@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C72C4CA@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 2/2] test-files: disable Qt4 specific test cases, may add Qt5 in the future
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
X-List-Received-Date: Mon, 08 Sep 2014 21:44:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 08, 2014 at 09:37:23PM +0000, Cooper Jr., Franklin wrote:
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> Although I don't think these test make much sense. Maybe we should just use 
> a simple boot "testplan" and don't even worry about these scripts unless we 
> plan on doing a bit more testing.

I wouldn't mind switching to standard OpenTest test plans, but I don't yet 
have enough experience for that, maybe after the release...


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, September 08, 2014 2:49 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [tisdk-build-scripts][PATCH 2/2] test-files: disable Qt4
> > specific test cases, may add Qt5 in the future
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  test-scripts/test-files/mandatory-oesdk-armv7a.txt | 2 +-
> >  test-scripts/test-files/mandatory-oesdk.txt        | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/test-scripts/test-files/mandatory-oesdk-armv7a.txt b/test-
> > scripts/test-files/mandatory-oesdk-armv7a.txt
> > index 4931d1f..51832d3 100644
> > --- a/test-scripts/test-files/mandatory-oesdk-armv7a.txt
> > +++ b/test-scripts/test-files/mandatory-oesdk-armv7a.txt
> > @@ -1 +1 @@
> > -check_app.sh -a
> > /usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
> > +#check_app.sh -a
> > +/usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
> > diff --git a/test-scripts/test-files/mandatory-oesdk.txt b/test-scripts/test-
> > files/mandatory-oesdk.txt
> > index 91aece1..ac85a72 100644
> > --- a/test-scripts/test-files/mandatory-oesdk.txt
> > +++ b/test-scripts/test-files/mandatory-oesdk.txt
> > @@ -1,7 +1,7 @@
> >  check_app.sh -a runDhrystone
> >  check_app.sh -a runLinpack
> >  check_app.sh -a runWhetstone
> > -check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator -x
> > -check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x -check_app.sh -
> > a /usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x -
> > check_app.sh -a
> > /usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
> > +#check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator
> > +-x #check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x
> > +#check_app.sh -a
> > +/usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x
> > +#check_app.sh -a
> > +/usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
> > --
> > 2.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

