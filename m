Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id F138052961
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 22:15:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJX00AGMHTA17F2@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Mar 2013 17:15:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E26C2200E5; Tue,
	19 Mar 2013 18:15:09 -0400 (EDT)
Date: Tue, 19 Mar 2013 18:15:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130319221509.GN14761@denix.org>
References: <20130319013754.03D0152A56@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C3E9EE5@DFLE09.ent.ti.com>
	<20130319194110.GK14761@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C3EAE19@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3EAE19@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [arago-devel] [arago-commits] Denys Dmytriyenko : ltp-ddt: use special branch for	platforms with older <= 3.2 kernel
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
X-List-Received-Date: Tue, 19 Mar 2013 22:15:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 19, 2013 at 09:46:17PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Tuesday, March 19, 2013 2:41 PM
> > To: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [arago-devel] [arago-commits] Denys
> > Dmytriyenko : ltp-ddt: use special branch for platforms with older <= 3.2
> > kernel
> > 
> > Ah, I'd need to update the Reply-to: used in arago-commits to point to the
> > new list instead of the old one...
> > 
> > 
> > On Tue, Mar 19, 2013 at 11:47:05AM +0000, Cooper Jr., Franklin wrote:
> > > Until the mainline kernel for am335x is official released we should add
> > > am335x to this list since the default kernel in meta-arago until that time
> > > will be the 3.2 kernel.
> > 
> > Sure, while meta-arago uses 3.2 kernel for am335x by default, we can also
> > switch it to using the corresponding branch of ltp-ddt. It's not failing for
> > now with ltp-ddt master though...
> 
> The nightly target side test does not use those ltp-ddt script/files. So 
> unless you're doing something different it might explain why you're not 
> running into the issue. I don't know what changes Carlos's team have made to 
> that branch.

Ah, I was talking from a build perspective. But you are right, even if the 
build is not broken, it can fail at run-time, if a specific test case is 
crafted for the wrong kernel version...


> > > I also have 3 patches that creates a brand new ltp-ddt recipe that is meant
> > > for the <= 3.2 kernels. So I have a 3.8+ recipe and a <= 3.2 recipe. It
> > > might be easier to have two so you can have the <= 3.2 recipe as the
> > default
> > > but then you can easily override it.
> > 
> > I haven't seen the patches, but would it be too much code duplication just to
> > exclude 3 platforms and point them to a separate branch? Moreover, am335
> > will
> > eventually switch to 3.8, while am180 and am37 are stuck with 2.6.37. So, I
> > thought having 2 BRANCH_mach overrides was very isolated, self-contained
> > and
> > easy to maintain. Creating multiple providers w/o real need should be
> > avoided,
> > due to maintenance overhead...
> 
> Yeah I like your approach better :) If we add the 3.2 branch override for 
> am335x and am3517-evm (currently missing) I will be happy.

Sounds good, I'll add those 2 as well.

-- 
Denys

