Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CCB7E52A04
	for <meta-arago@arago-project.org>;
	Tue,  5 Feb 2013 15:54:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r15Fs0T8004077
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 09:54:00 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r15Fs0bp026429
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 09:54:00 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 5 Feb 2013 09:54:00 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r15Fs0VV016812;
	Tue, 5 Feb 2013 09:54:00 -0600
Date: Tue, 5 Feb 2013 10:53:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130205155359.GA26860@edge>
References: <20130130221217.GA1060@denix.org> <20130202015559.GA7440@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C386449@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C386449@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Danny migration
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
X-List-Received-Date: Tue, 05 Feb 2013 15:54:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 05, 2013 at 06:59:55AM -0500, Cooper Jr., Franklin wrote:
> What is the new recommend bitbake branch or commit to use?

arago-danny-config in oe-layersetup should be up to date, which pins bitbake 
at 1.17.0 for now. There are some issues with bitbake master...

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Friday, February 01, 2013 7:56 PM
> > To: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] Danny migration
> > 
> > On Wed, Jan 30, 2013 at 05:12:17PM -0500, Denys Dmytriyenko wrote:
> > > All,
> > >
> > > I've started migrating meta-arago from "denzil" stable branch (based
> > > on the Yocto Project 1.2) to "danny" stable branch (Yocto Project 1.3).
> > >
> > > Please use arago-danny-config from oe-layersetup:
> > > http://arago-project.org/git/projects/?p=oe-layersetup.git;a=summary
> > >
> > > The first set of generic fixes is now in meta-arago master. There are
> > > still plenty of issues. The biggest being the absence of gcc-4.5 base
> > > recipes to support packaging of the Arago toolchain into the
> > > filesystem images. I'm looking into a short-term fix of overlaying
> > > those, until we move to a newer toolchain for our SDKs. But it's still
> > > possible to use Arago gcc-4.5 based toolchain for now to build
> > > packages, but not images, as TC is not packaged itself.
> > >
> > > There are other lingering issues and I'm going through them now. I may
> > > not be able to accept your fixes/patches right now or for the next
> > > couple of days, while I'm still working on the basic porting/migration issues...
> > 
> > I've pushed additional patches today, including the ones needed for the
> > toolchain. And it is now possible to build tisdk-rootfs-image. While I've only
> > done very minimal testing, it should be good enough to start using danny setup
> > for SDK porting.
> > 
> > --
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

