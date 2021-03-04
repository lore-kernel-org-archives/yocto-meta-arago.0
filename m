Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2AAAB529A2
	for <meta-arago@arago-project.org>;
	Thu,  4 Mar 2021 19:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1ACA40BEA;
	Thu,  4 Mar 2021 19:48:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 05srOYnYQw0p; Thu,  4 Mar 2021 19:48:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DDC140AB7;
	Thu,  4 Mar 2021 19:48:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 65184174524; Thu,  4 Mar 2021 14:48:36 -0500 (EST)
Date: Thu, 4 Mar 2021 14:48:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210304194836.GK4892@denix.org>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210304184811.GF4892@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago <meta-arago@arago-project.org>
Subject: Re: [PATCH dunfell] cryptodev: Move to 1.12 revision
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
X-List-Received-Date: Thu, 04 Mar 2021 19:48:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BTW, you'd need to ensure updating cryptodev from 1.10 to 1.12 does not affect 
current 5.4-based builds and/or releases. I'm sure it will build fine against 
this older kernel (most of Makefile changes), but concerned about any run-time 
regressions (the actual code changes).


On Thu, Mar 04, 2021 at 01:48:11PM -0500, Denys Dmytriyenko wrote:
> On Thu, Mar 04, 2021 at 12:52:00AM -0600, Nishanth Menon wrote:
> > Cryptodev out of kernel module and suite has yet another set of
> > challenge with broken API compatibility. However, the complete list of
> > patches beteween dunfell's default 1.10 and current latest 1.12 revisions:
> >  e0c25e289d6b (tag: cryptodev-linux-1.12) Release version 1.12
> >  55c6315058fc Fix build for Linux 5.11-rc1
> >  2f5e08aebf92 Fix build for Linux 5.9-rc1
> >  e8263d2d682b remove VLA usage from authenc.c
> >  dafa42cadc86 Fix for change in Kernel 4.4.168
> >  f4d3653c8dcb Release version 1.11
> >  9e765068582a Fix build for Linux 5.8-rc1
> >  7e72f6758f2d enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
> >  98b163a23f6b cryptlib.c: fix build on kernel v5.5+
> >  a1e738aef624 tests: cipher-aead-srtp: Fix cao->dst alignment
> >  f971e0cd4a0e Fix module loading with Linux v5.0-rc5
> > 
> > We have the following choices
> > 1) just cherry-pick minimum set of kernel patches relevant for kernel
> > compatibility
> > OR
> > 2) switch to a newer version with richer set of fixups
> > 
> > Attempting to switch to 1.12 version with minimal changes as a better
> > option to get a wider swath of kernel compatibility.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > 
> > DISCLAIMER: This is probably a dumb way of switching to 1.12.. open to
> > suggestions.
> 
> It is still probably the cleanest - just 2 vars in 3 bbappends. You might want 
> to mention that you need this for 5.10 (or 5.9+) kernel upgrade.
> 
> The issue is due to upgrading the kernel from one LTS to the next, while 
> staying on the older Yocto LTS, which was 5.4-specific... BTW, I haven't yet 
> reviewed your meta-ti patches, will do that next.
> 
> 
> > NOTE:
> > a) master is already on 1.12 -> So, I am suggesting this only for dunfell at the
> > moment: http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=master
> > 
> > b) gatesgarth is on 1.11 -> we wont get the fixes needed for newer
> > kernel, so a variant of this will be needed.. http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=gatesgarth
> > 
> > c) dunfell is still on 1.10 -> Same story as gatesgarth.. http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=dunfell
> > 
> >  .../recipes-kernel/cryptodev/cryptodev-linux_%.bbappend     | 5 +++++
> >  .../recipes-kernel/cryptodev/cryptodev-module_%.bbappend    | 5 +++++
> >  .../recipes-kernel/cryptodev/cryptodev-tests_%.bbappend     | 6 ++++++
> >  3 files changed, 16 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
> >  create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> > 
> > diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
> > new file mode 100644
> > index 000000000000..a3fb634463fd
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
> > @@ -0,0 +1,5 @@
> > +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> > +# just pull 1.12 revision, everything else remains the same.
> > +PR = "1.12"
> 
> PV here. Stands for Package Version. And PR is for Package Revision (i.e. 
> repackaging of the same version)
> 
> 
> > +PR_append = ".arago0"
> 
> Not necessarily needed, if PV is set correctly _and_ SRCREV matches the one 
> from OE-Core master for 1.12.
> 
> 
> > +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> > diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> > index f8a35cd73765..602ada0daf3a 100644
> > --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> > +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
> > @@ -1,3 +1,8 @@
> > +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> > +# just pull 1.12 revision, everything else remains the same.
> > +
> > +PR = "1.12"
> 
> Same.
> 
> 
> >  PR_append = ".arago0"
> 
> This one was already there due to KERNEL_MODULE_AUTOLOAD below.
> 
> 
> > +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> >  
> >  KERNEL_MODULE_AUTOLOAD += "cryptodev"
> > diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> > new file mode 100644
> > index 000000000000..dee8f40862cb
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
> > @@ -0,0 +1,6 @@
> > +# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
> > +# just pull 1.12 revision, everything else remains the same.
> > +
> > +PR = "1.12"
> 
> Same.
> 
> 
> > +PR_append = ".arago0"
> 
> Same.
> 
> 
> > +SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> > -- 
> > 2.25.1.377.g2d2118b814c1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > 
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

