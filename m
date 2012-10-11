Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C2C3652980
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 02:55:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9B2tci2022040
	for <meta-arago@arago-project.org>; Wed, 10 Oct 2012 21:55:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9B2tcTU021984
	for <meta-arago@arago-project.org>; Wed, 10 Oct 2012 21:55:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 10 Oct 2012 21:55:38 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9B2tcuF023175;
	Wed, 10 Oct 2012 21:55:38 -0500
Date: Wed, 10 Oct 2012 22:55:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121011025538.GC17839@edge>
References: <20120924215703.GG4278@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C300E9C@DFLE09.ent.ti.com>
	<20121010185225.GC32682@edge> <20121010185513.GD16944@denix.org>
	<9EA37CA2-92CB-4988-9E82-9D39A13B0F3C@ti.com>
	<7D46E86EC0A8354091174257B2FED10159257395@DLEE12.ent.ti.com>
	<20121010195738.GF16944@denix.org>
	<7D46E86EC0A8354091174257B2FED10159257515@DLEE12.ent.ti.com>
	<20121011025110.GB17839@edge>
	<9769EB7C-4976-4506-8936-C3CCB7687A1C@ti.com>
MIME-Version: 1.0
In-Reply-To: <9769EB7C-4976-4506-8936-C3CCB7687A1C@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-extras][PATCH] ti-tisdk-setup: Port ti-tisdk-setup from arago
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
X-List-Received-Date: Thu, 11 Oct 2012 02:55:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 10, 2012 at 10:53:27PM -0400, Cooper Jr., Franklin wrote:
> Me 

Ok, you too.

> On Oct 10, 2012, at 9:51 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Wed, Oct 10, 2012 at 04:01:17PM -0400, Maupin, Chase wrote:
> >>> -----Original Message-----
> >>> From: Dmytriyenko, Denys
> >>> Sent: Wednesday, October 10, 2012 2:58 PM
> >>> To: Maupin, Chase
> >>> Cc: Cooper Jr., Franklin; Dmytriyenko, Denys; meta-arago@arago-
> >>> project.org
> >>> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-
> >>> setup: Port ti-tisdk-setup from arago
> >>> 
> >>> On Wed, Oct 10, 2012 at 07:43:08PM +0000, Maupin, Chase wrote:
> >>>> There are lots of tweaks to the actual scripts that would be
> >>> nice, but aside
> >>>> from that no.  They all need to go into an SDK.  They make up a
> >>> large part
> >>>> of the OOBE and they tend to go together.  The only one that
> >>> could be
> >>>> separated (in that it is not a dependecy for another one) would
> >>> be
> >>>> create-sdcard.sh but we consider that script as critical as all
> >>> the others
> >>>> and a mandatory install as part of the setup for an SDK.
> >>> 
> >>> First of all, let's cut the patch from the email - I'm tired
> >>> going to the
> >>> administrative interface to approve the oversize message to the
> >>> list... :)
> >>> 
> >>> Second, why can't we have a separate git repository for all those
> >>> shell
> >>> scripts that are used for OOBE - you'll get version control and
> >>> move the bulk
> >>> outside of the metadata. Is it feasible?
> >> 
> >> I'm OK with a separate git repo.  Can you create a tisdk-setup-scripts repo 
> >> on arago for us?
> > 
> > You know I can, and I did :) Who do you want in contributors, besides 
> > yourself?
> > 
> > -- 
> > Denys

