Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 54DC95209D
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 19:45:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCE006N6XJ6Q161@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Oct 2012 14:45:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EAF972038D; Wed,
	24 Oct 2012 15:45:05 -0400 (EDT)
Date: Wed, 24 Oct 2012 15:45:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121024194505.GA3465@denix.org>
References: <20121010185225.GC32682@edge> <20121010185513.GD16944@denix.org>
	<9EA37CA2-92CB-4988-9E82-9D39A13B0F3C@ti.com>
	<7D46E86EC0A8354091174257B2FED10159257395@DLEE12.ent.ti.com>
	<20121010195738.GF16944@denix.org>
	<7D46E86EC0A8354091174257B2FED10159257515@DLEE12.ent.ti.com>
	<20121011025110.GB17839@edge>
	<9769EB7C-4976-4506-8936-C3CCB7687A1C@ti.com>
	<20121011025538.GC17839@edge>
	<8F29D6B095ED194EA1980491A5E029710C303705@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C303705@DFLE09.ent.ti.com>
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
X-List-Received-Date: Wed, 24 Oct 2012 19:45:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 12, 2012 at 04:20:03AM +0000, Cooper Jr., Franklin wrote:
> Do you have a git url to that repo? I don't see it on the http://arago-project.org/git/projects list.

You won't see it until you populate it. The name is tisdk-setup-scripts under 
projects.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, October 10, 2012 9:56 PM
> To: Cooper Jr., Franklin
> Cc: Maupin, Chase; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-setup: Port ti-tisdk-setup from arago
> 
> On Wed, Oct 10, 2012 at 10:53:27PM -0400, Cooper Jr., Franklin wrote:
> > Me
> 
> Ok, you too.
> 
> > On Oct 10, 2012, at 9:51 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> > 
> > > On Wed, Oct 10, 2012 at 04:01:17PM -0400, Maupin, Chase wrote:
> > >>> -----Original Message-----
> > >>> From: Dmytriyenko, Denys
> > >>> Sent: Wednesday, October 10, 2012 2:58 PM
> > >>> To: Maupin, Chase
> > >>> Cc: Cooper Jr., Franklin; Dmytriyenko, Denys; meta-arago@arago- 
> > >>> project.org
> > >>> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] ti-tisdk-
> > >>> setup: Port ti-tisdk-setup from arago
> > >>> 
> > >>> On Wed, Oct 10, 2012 at 07:43:08PM +0000, Maupin, Chase wrote:
> > >>>> There are lots of tweaks to the actual scripts that would be
> > >>> nice, but aside
> > >>>> from that no.  They all need to go into an SDK.  They make up a
> > >>> large part
> > >>>> of the OOBE and they tend to go together.  The only one that
> > >>> could be
> > >>>> separated (in that it is not a dependecy for another one) would
> > >>> be
> > >>>> create-sdcard.sh but we consider that script as critical as all
> > >>> the others
> > >>>> and a mandatory install as part of the setup for an SDK.
> > >>> 
> > >>> First of all, let's cut the patch from the email - I'm tired going 
> > >>> to the administrative interface to approve the oversize message to 
> > >>> the list... :)
> > >>> 
> > >>> Second, why can't we have a separate git repository for all those 
> > >>> shell scripts that are used for OOBE - you'll get version control 
> > >>> and move the bulk outside of the metadata. Is it feasible?
> > >> 
> > >> I'm OK with a separate git repo.  Can you create a 
> > >> tisdk-setup-scripts repo on arago for us?
> > > 
> > > You know I can, and I did :) Who do you want in contributors, 
> > > besides yourself?
> > > 
> > > --
> > > Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

