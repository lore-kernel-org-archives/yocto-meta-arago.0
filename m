Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 5DF1352993
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2012 22:36:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0400A15K56EA63@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 28 Feb 2012 16:36:42 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1C1782016E; Tue,
	28 Feb 2012 17:36:41 -0500 (EST)
Date: Tue, 28 Feb 2012 17:36:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120228223641.GB12073@denix.org>
References: <1330465723-24817-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED1012F04379A@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1012F04379A@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 0/3] update matrix sources
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
X-List-Received-Date: Tue, 28 Feb 2012 22:36:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 28, 2012 at 10:07:26PM +0000, Maupin, Chase wrote:
> Looks like Denys already got these, so NM

I didn't see your patches. I already synced up with changes you sent against 
arago, but then got distracted by a meeting, before pushing them in.

They look the same though, I just commented out nbench until it gets into 
oe-core/meta-oe...

-- 
Denys


> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Tuesday, February 28, 2012 3:49 PM
> > To: meta-arago@arago-project.org
> > Cc: Maupin, Chase
> > Subject: [PATCH 0/3] update matrix sources
> > 
> > The following patches update the matrix sources.
> > 
> > Patches 2 and 3 depend on the nbench-byte recipe being added
> > into meta-oe first.  The patch has been submitted to the list
> > but has not yet been committed.
> > 
> > Chase Maupin (3):
> >   refresh-screen: update to latest sources
> >   matrix-gui-apps-git: update to latest sources
> >   matrix-gui-armbenchmarks-demos: update dependencies
> > 
> >  .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> >  .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |    4 ++--
> >  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

