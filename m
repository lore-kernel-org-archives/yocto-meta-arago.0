Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 65BD352A42
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 19:51:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62Jp0t3002368;
	Wed, 2 Jul 2014 14:51:00 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62Jp06m011537;
	Wed, 2 Jul 2014 14:51:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 14:51:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62JoxqP032608;
	Wed, 2 Jul 2014 14:50:59 -0500
Date: Wed, 2 Jul 2014 15:50:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140702195059.GE15788@edge>
References: <53B44965.5050502@emagii.com> <53B449D5.30600@emagii.com>
	<20140702181315.GA15788@edge> <53B459CC.20805@emagii.com>
	<20140702191802.GB15788@edge> <53B45C0A.60805@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>
	<20140702193648.GD15788@edge>
	<8F29D6B095ED194EA1980491A5E029710C6DA93E@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6DA93E@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-ti] Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase.
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
X-List-Received-Date: Wed, 02 Jul 2014 19:51:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 02, 2014 at 03:42:36PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, July 02, 2014 2:37 PM
> > To: Cooper Jr., Franklin
> > Cc: Ulf Samuelsson; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Fwd: Fwd: Re: [meta-ti] Build of qtbase fails due to
> > no OpenGL libraries, but completes after cleaning qtbase.
> > 
> > On Wed, Jul 02, 2014 at 03:34:38PM -0400, Cooper Jr., Franklin wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Ulf Samuelsson
> > > > Sent: Wednesday, July 02, 2014 2:23 PM
> > > > To: Dmytriyenko, Denys
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] Fwd: Fwd: Re: [meta-ti] Build of qtbase
> > > > fails due to no OpenGL libraries, but completes after cleaning qtbase.
> > > >
> > > > 2014-07-02 21:18, Denys Dmytriyenko skrev:
> > > > > On Wed, Jul 02, 2014 at 09:13:16PM +0200, Ulf Samuelsson wrote:
> > > > >> 2014-07-02 20:13, Denys Dmytriyenko skrev:
> > > > >>> On Wed, Jul 02, 2014 at 08:05:09PM +0200, Ulf Samuelsson wrote:
> > > > >>>
> > > > >>>
> > > > >>> On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> > > > >>>>> When I build an image with QT5 using meta-arago, qtbase fails
> > > > >>>>> with a lot of error messages.
> > > > >>>>> This is the wrong mailing list - meta-ti has nothing to do with
> > qtbase.
> > > > >>>>> Moreover, why are you still using 5.1.1? There were many fixes
> > > > >>>>> in
> > > > >>>>> Qt5 5.2.x and 5.3.x. Also, it depends on your setup and what
> > > > >>>>> layers and features you configure. Either way, it's a
> > > > >>>>> discussion for a distro layer, you can use meta-arago mailing list for
> > that...
> > > > >>>> I looked through meta-arago and meta-qt5 about a month ago for
> > > > compatability.
> > > > >>>>
> > > > >>>> I checked again today:
> > > > >>>>
> > > > >>>> meta-qt5/master	= 5.3.0
> > > > >>>> meta-qt5/daisy	= 5.2.1
> > > > >>>> meta-qt5/dora	= 5.1.1
> > > > >>>>
> > > > >>>> meta-arago/master = 5.2.0
> > > > >>>> meta-arago/dora   = 5.2.0 (used to be 5.1.1)
> > > > >>>> There is no meta-arago/daisy branch.
> > > > >>>>
> > > > >>>> The only revision I could find which was available in both was 5.1.1.
> > > > >>>> and that is why I used it.
> > > > >>>>
> > > > >>>> It would make sense if the qt5 related recipes in meta-arago
> > > > >>>> matched
> > > > those in meta-qt5.
> > > > >>>>
> > > > >>>> Now meta-arago is using 5.2.0 which is not present in any
> > > > >>>> branch of
> > > > >>>> meta-qt5 (did not check old branches, only dora and daisy).
> > > > >>>>
> > > > >>>> I dont understand why the meta-arago:dora recipes for qt5 has
> > > > >>>> been updated from 5.1.1 to 5.2.0, thus making it incompatible
> > > > >>>> with meta-
> > > > qt5:dora. Isn't this a mistake.
> > > > >>> meta-qt5 for long time only had master, moreover, due to some
> > > > >>> requirements, we needed latest 5.2 version of qt5, which was
> > > > >>> only available from master and not from Dora, while meta-arago
> > > > >>> was generally Dora based. Since then meta-qt5 was updated to
> > > > >>> 5.2.1, and meta-arago has recently switched to Daisy - some
> > > > >>> cleanup is still going
> > > > on...
> > > > >>>
> > > > >> I think in order to clean up:
> > > > >> 1) meta-arago:dora should switch back to 5.1.1
> > > > >> 2) a daisy branch should be added to meta-arago (or daisy-devel)
> > > > >> using 5.2.1
> > > > >> 3) meta-arago:master should be 5.3.0
> > > > >>
> > > > >> 5.2.0 recipes should be deleted, or moved to an intermediate
> > > > >> branch
> > > > >> (daisy-rc1?)
> > > > > No.
> > > > So whats the plan?
> > > > Does it make sense to have different version numbers in meta-arago,
> > > > than in meta-qt5?
> > > >
> > > > Is there a time schedule to have 5.2.1/5,3,0 support?
> > 
> > > [Franklin] The way meta-qt5 and meta-arago works is indeed different
> > > compared to other layers. Meta-arago master tracks meta-qt5 master.
> > > Meta-arago dora tracks meta-arago daisy. I think we need to properly
> > 
> > What? Complete nonsense!
> [Franklin] Yeah looks like I was a bit off. But I saw your last email and 
> understand your plan. I guess the short answer is that there is work that 
> still needs to be done.

And while "meta-arago dora tracks meta-arago daisy" is obviously a typo, it 
was funnily recursive :)


> FYI
> Those graphics patches you mentioned I believe were supposed to be pushed 
> upstream to mainline Qt so they might not apply since they have already been 
> up streamed.

Yeah, I checked them quickly previously and noticed that not all of them got 
accepted upstream and sometimes even partially, so I can't really say what's 
in and what's not...


> > > document this and even include it in the README file but of course
> > > work on daisy is still being done so it might just be on someone's
> > > short term todo list.
> > >
> > > Ulf,
> > > Are you still having issues with Qt5 support when you use meta-qt5 master?
> > > >
> > > > BR
> > > > Ulf Samuelsson
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

