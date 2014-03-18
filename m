Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7967852A78
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 13:53:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IDrMdB007377
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 08:53:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IDrMPR008079
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 08:53:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Mar 2014 08:53:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IDrMKD008991;
	Tue, 18 Mar 2014 08:53:22 -0500
Date: Tue, 18 Mar 2014 09:53:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140318135321.GU12929@edge>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<20140317184929.GR12929@edge>
	<8F29D6B095ED194EA1980491A5E029710C668352@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C668352@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 0/5] updates for several recent OpenTest framework changes
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
X-List-Received-Date: Tue, 18 Mar 2014 13:53:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 18, 2014 at 09:25:47AM -0400, Cooper Jr., Franklin wrote:
> I'm not seeing the other patches. Did you just send PATCH 0/5?

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-arago/2044


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Monday, March 17, 2014 1:49 PM
> > To: Denys Dmytriyenko
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 0/5] updates for several
> > recent OpenTest framework changes
> > 
> > Ping. Any objectsion to me pushing these patches in?
> > 
> > 
> > On Mon, Mar 03, 2014 at 06:36:14PM -0500, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > There were several changes made in the OpenTest framework
> > > configuration and setup in the past few months, breaking compatibility
> > > with the old CLI client as well as several other assumptions made in
> > > the build scripts. This patchset updates the scripts with the new CLI
> > > and other config options to work with the new OpenTest framework setup
> > again.
> > >
> > > Denys Dmytriyenko (5):
> > >   run-opentest: make assigning tests to a specific TEE optional
> > >   run-opentest: pass test_scripts_root to always get latest vatf from
> > >     git
> > >   run-opentest: add support for new version of opentest CLI
> > >   linux-devtest.tgz: add new version of OpenTest CLI 13.11
> > >   arago-core-tisdk-dylan-puget: update to use new CLI
> > >
> > >  configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
> > >  lib/run-opentest                         |   25 ++++++++++++++++++++++---
> > >  linux-devtest.tgz                        |  Bin 0 -> 505553 bytes
> > >  3 files changed, 24 insertions(+), 5 deletions(-)  create mode 100644
> > > linux-devtest.tgz
> > >
> > > --
> > > 1.7.9.5
> > >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

