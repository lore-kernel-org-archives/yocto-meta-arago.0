Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 91EC7529BF
	for <meta-arago@arago-project.org>;
	Mon,  2 Dec 2013 21:31:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MX7004C77SFIBBU@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Dec 2013 15:31:33 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F27442008E; Mon,
	02 Dec 2013 16:31:26 -0500 (EST)
Date: Mon, 02 Dec 2013 16:31:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tom Rini <trini@ti.com>
Message-id: <20131202213126.GB17528@denix.org>
References: <1385135121-14345-1-git-send-email-fcooper@ti.com>
	<1385135121-14345-5-git-send-email-fcooper@ti.com>
	<20131122200029.GT420@bill-the-cat>
	<8F29D6B095ED194EA1980491A5E029710C5C059E@DFLE08.ent.ti.com>
	<20131123021545.GV420@bill-the-cat>
MIME-version: 1.0
In-reply-to: <20131123021545.GV420@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 5/6] mount-sdcard: Update to use new udev entry
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
X-List-Received-Date: Mon, 02 Dec 2013 21:31:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 22, 2013 at 09:15:45PM -0500, Tom Rini wrote:
> On Fri, Nov 22, 2013 at 10:27:06PM +0000, Cooper Jr., Franklin wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
> > > Sent: Friday, November 22, 2013 2:00 PM
> > > To: Cooper Jr., Franklin
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 5/6] mount-sdcard: Update to use new udev
> > > entry
> > > 
> > > On Fri, Nov 22, 2013 at 09:45:20AM -0600, Franklin S. Cooper Jr wrote:
> > > 
> > > > * Patch 1c1b695310309ec3526f1b6b415c5e1b74a567e1 added a udev
> > > entry to
> > > >   automatically mount sd card partition.
> > > > * For some reason that udev entry isn't automatically ran.
> > > > * As a workaround manually trigger udev to run twice (not sure why thats
> > > needed)
> > > >   for the udev rule to run correctly.
> > > >
> > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > 
> > > This issn't right.  Have you added debugging steps to the mount.sh script?
> > > We're saying, with this change "lets trigger all block devices 3 times", and on the
> > > 3rd attempt we finally do mount things.  I've seen some partitions NOT be auto-
> > > mounted due to being dirty and needing an fsck prior to mounting them.  If we
> > > need to do this type of change at the end as a "we can't figure out the root
> > > cause, but we need to release", OK.
> > > But I don't think we're there yet.  Thanks!

> > [Franklin] Just to give an update it looks like fsck is required to be ran 
> > to fix this problem however it wouldn't be safe to run fsck and let it 
> > auto fix the problem since that could cause potential issues. So if fsck 
> > is really the proper solution then I'm not sure that would work for 
> > something that needs to automatically work at bootup.
> 
> Well, dirty cards shouldn't be auto-mounted.  Or there's some option to
> mount we should be passing to say "no, it's OK".

So, what is the agreement here? I don't think forcing fsck for mounting a card 
is a good idea. I agree with Tom that if the card is dirty (could be corrupted), 
then user intervention is required anyway.

I'm planning on skipping these 2 patches, if nobody objects.

-- 
Denys

