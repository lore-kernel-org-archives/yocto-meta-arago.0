Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9139A52AA9
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 19:34:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62JYppQ023889;
	Wed, 2 Jul 2014 14:34:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62JYotQ032152;
	Wed, 2 Jul 2014 14:34:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 14:34:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62JYo8Y032525;
	Wed, 2 Jul 2014 14:34:50 -0500
Date: Wed, 2 Jul 2014 15:34:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ulf Samuelsson <meta-arago@emagii.com>
Message-ID: <20140702193449.GC15788@edge>
References: <53B44965.5050502@emagii.com> <53B449D5.30600@emagii.com>
	<20140702181315.GA15788@edge> <53B459CC.20805@emagii.com>
	<20140702191802.GB15788@edge> <53B45C0A.60805@emagii.com>
MIME-Version: 1.0
In-Reply-To: <53B45C0A.60805@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Wed, 02 Jul 2014 19:34:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 02, 2014 at 09:22:50PM +0200, Ulf Samuelsson wrote:
> 2014-07-02 21:18, Denys Dmytriyenko skrev:
> >On Wed, Jul 02, 2014 at 09:13:16PM +0200, Ulf Samuelsson wrote:
> >>2014-07-02 20:13, Denys Dmytriyenko skrev:
> >>>On Wed, Jul 02, 2014 at 08:05:09PM +0200, Ulf Samuelsson wrote:
> >>>
> >>>
> >>>On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> >>>>>When I build an image with QT5 using meta-arago, qtbase fails with a
> >>>>>lot of error messages.
> >>>>>This is the wrong mailing list - meta-ti has nothing to do with qtbase.
> >>>>>Moreover, why are you still using 5.1.1? There were many fixes in Qt5 5.2.x
> >>>>>and 5.3.x. Also, it depends on your setup and what layers and features you
> >>>>>configure. Either way, it's a discussion for a distro layer, you can use
> >>>>>meta-arago mailing list for that...
> >>>>I looked through meta-arago and meta-qt5 about a month ago for compatability.
> >>>>
> >>>>I checked again today:
> >>>>
> >>>>meta-qt5/master	= 5.3.0
> >>>>meta-qt5/daisy	= 5.2.1
> >>>>meta-qt5/dora	= 5.1.1
> >>>>
> >>>>meta-arago/master = 5.2.0
> >>>>meta-arago/dora   = 5.2.0 (used to be 5.1.1)
> >>>>There is no meta-arago/daisy branch.
> >>>>
> >>>>The only revision I could find which was available in both was 5.1.1.
> >>>>and that is why I used it.
> >>>>
> >>>>It would make sense if the qt5 related recipes in meta-arago matched those in meta-qt5.
> >>>>
> >>>>Now meta-arago is using 5.2.0 which is not present in any branch of meta-qt5
> >>>>(did not check old branches, only dora and daisy).
> >>>>
> >>>>I dont understand why the meta-arago:dora recipes for qt5 has been updated from 5.1.1 to 5.2.0,
> >>>>thus making it incompatible with meta-qt5:dora. Isn't this a mistake.
> >>>meta-qt5 for long time only had master, moreover, due to some requirements, we
> >>>needed latest 5.2 version of qt5, which was only available from master and
> >>>not from Dora, while meta-arago was generally Dora based. Since then meta-qt5
> >>>was updated to 5.2.1, and meta-arago has recently switched to Daisy - some
> >>>cleanup is still going on...
> >>>
> >>I think in order to clean up:
> >>1) meta-arago:dora should switch back to 5.1.1
> >>2) a daisy branch should be added to meta-arago (or daisy-devel) using 5.2.1
> >>3) meta-arago:master should be 5.3.0
> >>
> >>5.2.0 recipes should be deleted, or moved to an intermediate branch
> >>(daisy-rc1?)
> >No.
> So whats the plan?

meta-arago always tracks stable and is currently being updated for Daisy. This 
is not yet complete and once it is, I'll have the bbappends updated to 
whatever the current version is at the time in meta-qt5/daisy. It's 5.2.1 
right now, but those bbappends with patches no longer apply cleanly, so some 
additional work with graphics team will be needed...


> Does it make sense to have different version numbers in meta-arago,
> than in meta-qt5?

If they are used, then no, they shouldn't be different. But they are not 
currently used though, with qt4 still being the default in meta-arago. That's 
why those bbappends are not yet updated, but are next on my plate.


> Is there a time schedule to have 5.2.1/5,3,0 support?

As of 5.3.0 - not until it gets merged into Daisy or until the next stable 
release, so October/November or even later. Unless we need it now for some 
other reason, like we had with 5.2.x for some specific critical fixed that 
were not available in 5.1.x and we needed them in Dylan/Dora. But I'm not 
aware of any breakage in 5.2.x that would push us towards 5.3.x.

For 5.2.1 - see above. Hopefully in the coming weeks. The only problem is that 
those bbappends carry some SGX/GLES patches, which no longer apply - would 
need our graphics experts to look at.

-- 
Denys

