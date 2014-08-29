Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9967752979
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:43:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THhid9021876
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:43:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THhinr007397
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:43:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:43:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THhir2009707;
	Fri, 29 Aug 2014 12:43:44 -0500
Date: Fri, 29 Aug 2014 13:43:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140829174343.GM18620@edge>
References: <1408675495-24120-1-git-send-email-fcooper@ti.com>
	<1408675495-24120-2-git-send-email-fcooper@ti.com>
	<20140829173535.GL18620@edge>
	<8F29D6B095ED194EA1980491A5E029710C721C48@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C721C48@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] arago-core-tisdk-image: Work around SOC_FAMILY issue
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
X-List-Received-Date: Fri, 29 Aug 2014 17:43:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 29, 2014 at 01:39:15PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, August 29, 2014 12:36 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 2/2] arago-core-tisdk-image: Work
> > around SOC_FAMILY issue
> > 
> > On Thu, Aug 21, 2014 at 09:44:54PM -0500, Franklin S. Cooper Jr wrote:
> > > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> > >
> > > * Some reason the SOC_FAMILY dra7xx has precedences over machine
> > overrides.
> > > * Change dra7xx to dra7xx-evm to avoid SOC_FAMILY override issue.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > > b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > > index 37f71d6..475c9d6 100644
> > > --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > > +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > > @@ -19,7 +19,7 @@ TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev
> > > libgnutls-extra26 libgnutls-openssl2  DTB_FILTER = "unknown"
> > >  DTB_FILTER_ti33x = "am335x"
> > >  DTB_FILTER_omap5-evm = "omap5"
> > > -DTB_FILTER_dra7xx = "dra7"
> > > +DTB_FILTER_dra7xx-evm = "dra7"
> > >  DTB_FILTER_am57xx-evm = "am57xx"
> > 
> > Are you sure you are basing your patch on master? The above entry for
> > am57xx doesn exist yet in meta-arago/master. Looks like another patch is
> > missing or your need to rebase.
> [Franklin] This patch set was based on my previous patch set.  The patch for that entry is here:
> http://arago-project.org/pipermail/meta-arago/2014-August/004042.html
> Sorry I should have been clear about the dependencies especially between patch sets.

Right, and I was trying to skip that patchset due to other comments. But now 
it's in, so it should satisfy the dependency. And I knew I saw the entry for 
am57xx someplace, just forgot it was the first patch from the previous series 
:)

-- 
Denys



