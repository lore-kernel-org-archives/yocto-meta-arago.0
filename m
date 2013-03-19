Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D031452A24
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 19:41:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJX00JVDAOOZA80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Mar 2013 14:41:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5F9F920077; Tue,
	19 Mar 2013 15:41:10 -0400 (EDT)
Date: Tue, 19 Mar 2013 15:41:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-id: <20130319194110.GK14761@denix.org>
References: <20130319013754.03D0152A56@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C3E9EE5@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3E9EE5@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 19 Mar 2013 19:41:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ah, I'd need to update the Reply-to: used in arago-commits to point to the new 
list instead of the old one...


On Tue, Mar 19, 2013 at 11:47:05AM +0000, Cooper Jr., Franklin wrote:
> Until the mainline kernel for am335x is official released we should add 
> am335x to this list since the default kernel in meta-arago until that time 
> will be the 3.2 kernel.

Sure, while meta-arago uses 3.2 kernel for am335x by default, we can also 
switch it to using the corresponding branch of ltp-ddt. It's not failing for 
now with ltp-ddt master though...


> I also have 3 patches that creates a brand new ltp-ddt recipe that is meant 
> for the <= 3.2 kernels. So I have a 3.8+ recipe and a <= 3.2 recipe. It 
> might be easier to have two so you can have the <= 3.2 recipe as the default 
> but then you can easily override it.

I haven't seen the patches, but would it be too much code duplication just to 
exclude 3 platforms and point them to a separate branch? Moreover, am335 will 
eventually switch to 3.8, while am180 and am37 are stuck with 2.6.37. So, I 
thought having 2 BRANCH_mach overrides was very isolated, self-contained and 
easy to maintain. Creating multiple providers w/o real need should be avoided, 
due to maintenance overhead...

-- 
Denys


> > -----Original Message-----
> > From: arago-commits-bounces@arago-project.org [mailto:arago-commits-
> > bounces@arago-project.org] On Behalf Of Arago Project git
> > Sent: Monday, March 18, 2013 8:38 PM
> > To: arago-commits@arago-project.org
> > Subject: [arago-commits] Denys Dmytriyenko : ltp-ddt: use special branch for
> > platforms with older <= 3.2 kernel
> > 
> > Module: meta-arago
> > Branch: master
> > Commit: 7566753d23207b8b3a5d6387639341a68b8a18f2
> > URL:    http://arago-project.org/git/meta-
> > arago.git?a=commit;h=7566753d23207b8b3a5d6387639341a68b8a18f2
> > 
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Mon Mar 18 16:30:32 2013 -0400
> > 
> > ltp-ddt: use special branch for platforms with older <=3.2 kernel
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> > b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> > index 65a16f9..f8c99d8 100644
> > --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> > +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> > @@ -3,6 +3,10 @@ PR_append = "-arago0+gitr${SRCPV}"
> >  # Auto rev so we pick up the latest changes  SRCREV = "${AUTOREV}"
> > 
> > +# Use special branch for platforms with older <=3.2 kernel
> > +BRANCH_am37x-evm = "v3.2"
> > +BRANCH_am180x-evm = "v3.2"
> > +
> >  do_compile_kmodules() {
> >          unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >          oe_runmake modules
> > 
> > _______________________________________________
> > arago-commits mailing list
> > arago-commits@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> 
> _______________________________________________
> arago-devel mailing list
> arago-devel@gforge.ti.com
> https://gforge.ti.com/mailman/listinfo/arago-devel

