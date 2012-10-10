Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id B1D31529A1
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:57:54 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBP005VH0S2J740@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Oct 2012 14:57:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 86CCE200DD; Wed,
	10 Oct 2012 15:57:38 -0400 (EDT)
Date: Wed, 10 Oct 2012 15:57:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20121010195738.GF16944@denix.org>
References: <1348275070-27814-1-git-send-email-fcooper@ti.com>
	<20120924215703.GG4278@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C300E9C@DFLE09.ent.ti.com>
	<20121010185225.GC32682@edge> <20121010185513.GD16944@denix.org>
	<9EA37CA2-92CB-4988-9E82-9D39A13B0F3C@ti.com>
	<7D46E86EC0A8354091174257B2FED10159257395@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED10159257395@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Wed, 10 Oct 2012 19:57:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 10, 2012 at 07:43:08PM +0000, Maupin, Chase wrote:
> There are lots of tweaks to the actual scripts that would be nice, but aside 
> from that no.  They all need to go into an SDK.  They make up a large part 
> of the OOBE and they tend to go together.  The only one that could be 
> separated (in that it is not a dependecy for another one) would be 
> create-sdcard.sh but we consider that script as critical as all the others 
> and a mandatory install as part of the setup for an SDK.

First of all, let's cut the patch from the email - I'm tired going to the 
administrative interface to approve the oversize message to the list... :)

Second, why can't we have a separate git repository for all those shell 
scripts that are used for OOBE - you'll get version control and move the bulk 
outside of the metadata. Is it feasible?

-- 
Denys


> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Wednesday, October 10, 2012 2:09 PM
> > To: Dmytriyenko, Denys; Maupin, Chase
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-
> > setup: Port ti-tisdk-setup from arago
> > 
> > I'll look at this tomorrow then.
> > 
> > Chase,
> > Did you have any thoughts over the years about improvement to
> > this recipe/ scripts over the years that u wanted to make but
> > couldn't due to legacy reasons?
> > 
> > On Oct 10, 2012, at 1:55 PM, "Dmytriyenko, Denys" <denys@ti.com>
> > wrote:
> > 
> > > On Wed, Oct 10, 2012 at 02:52:25PM -0400, Denys Dmytriyenko
> > wrote:
> > >> On Wed, Oct 10, 2012 at 02:21:35PM -0400, Cooper Jr., Franklin
> > wrote:
> > >>> What's concerning you about this patch?
> > >>
> > >> It's size and complexity, mostly.
> > >
> > > It doesn't even fit in the mailing list size limit of 100KB...
> > :)

