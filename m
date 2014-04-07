Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 027AB529BC
	for <meta-arago@arago-project.org>;
	Mon,  7 Apr 2014 22:37:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s37Mb3hc025644
	for <meta-arago@arago-project.org>; Mon, 7 Apr 2014 17:37:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s37Mb2rY022629
	for <meta-arago@arago-project.org>; Mon, 7 Apr 2014 17:37:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 7 Apr 2014 17:37:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s37Mb1tf031000	for
	<meta-arago@arago-project.org>; Mon, 7 Apr 2014 17:37:01 -0500
Date: Mon, 7 Apr 2014 18:37:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Message-ID: <20140407223700.GC12929@edge>
References: <20140310121416.GC4423@ad.chargestorm.se>
	<20140314161649.GD12929@edge>
	<20140321142643.GA1479@ad.chargestorm.se>
	<20140402075039.GA5988@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20140402075039.GA5988@ad.chargestorm.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Issue building gcc-cross-initial
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
X-List-Received-Date: Mon, 07 Apr 2014 22:37:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Ok, it took me some time and effort (the error is severely misleading), but I 
was finally able to trace down what causes the breakage in the internal 
toolchain:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=e9797a456c99c890e5ff62334b7d65e1ff7db676

The addition of libc-headers version used for the platform into the 
PACKAGE_ARCH causes gcc-cross-initial to not find binutils binaries during 
bootstrap.

I'm still trying to figure out if it would be possible to unbreak the build, 
while keeping the change, but at least it should be possible to have a quick 
workaround for now...

-- 
Denys


On Wed, Apr 02, 2014 at 09:50:41AM +0200, Anders Darander wrote:
> Ping...
> 
> * Anders Darander <anders@chargestorm.se> [140321 15:30]:
> 
> > * Denys Dmytriyenko <denys@ti.com> [140314 17:17]:
> 
> > > Yeah, I'm seeing the same breakage even in dylan - I'm looking into it now...
> 
> > Good to know that I'm not alone in seeing this...
> 
> > Any ideas regarding the root cause or possible fixes? Sofar, I've been
> > occupied with work on our old release branch, though soon Ḯ'll start
> > working on the update again.
> 
> > Cheers,
> > Anders
> 
> > > On Mon, Mar 10, 2014 at 01:14:28PM +0100, Anders Darander wrote:
> > > > Hi,
> 
> > > > Summary:
> 
> > > > I'm attempting at moving a custom product from meta-arago (danny) to the
> > > > latest master based on dora.
> 
> > > > However, I'm getting issues when I'm building gcc-cross-initial (we're
> > > > not using an external toolchain).i
> 
> > > > I've seen this on my normal build machine running Ubuntu 12.04, though
> > > > my example below was running a new OpenSuse machine. 
> > > > The choice of MACHINE="am37x-evm" is made to get something resembling
> > > > our real machine.
> 
> > > > When building gcc-cross-initial, libgcc fails to identify the "suffix of
> > > > object files" when the configure-script for libgcc is being run.
> 
> > > > I hope that someone can help me with some ideas/pointers as to how this
> > > > can be resolved. I've got the same issue with both gcc 4.7.2 and
> > > > 4.8.1...
> -- 
> Anders Darander
> ChargeStorm AB / eStorm AB

