Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A471552A1E
	for <meta-arago@arago-project.org>;
	Fri,  5 Mar 2021 02:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4186640BEC;
	Fri,  5 Mar 2021 02:26:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5hsvZFs19urR; Fri,  5 Mar 2021 02:26:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E654407E5;
	Fri,  5 Mar 2021 02:26:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E3B4174524; Thu,  4 Mar 2021 21:26:52 -0500 (EST)
Date: Thu, 4 Mar 2021 21:26:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210305022652.GQ4892@denix.org>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org> <20210304194836.GK4892@denix.org>
	<20210304231434.qyeopkbutdrvohm7@elliptic>
	<20210305005810.GP4892@denix.org>
	<20210305012411.yyebzvq2qrrjbyti@ambiance>
MIME-Version: 1.0
In-Reply-To: <20210305012411.yyebzvq2qrrjbyti@ambiance>
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
X-List-Received-Date: Fri, 05 Mar 2021 02:26:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 07:24:11PM -0600, Nishanth Menon wrote:
> On 19:58-20210304, Denys Dmytriyenko wrote:
> > On Thu, Mar 04, 2021 at 05:14:34PM -0600, Nishanth Menon wrote:
> > > Thank you, actually you bring out a very good point here. While I know
> > > we can create our own internal private fork of arago for upstream
> > > component testing, I am starting to wonder if creating either of:
> > > 
> > > a) meta-ti-mainline that builds on top of meta-ti
> > > OR
> > > b) meta-arago-mainline on top of meta-arago
> > > 
> > > is a smarter approach - personally, I prefer (a)? While, I don't want
> > > to end up creating too many layers, but your point is valid that I
> > > should also be careful to not mess with folks using the meta-arago in
> > > production environments having to deal with challenges we are trying
> > > to flush out by testing the bleeding edge of kernel - and I'd like to
> > > make sure TI ecosystem is able to leverage/contribute as well (an
> > > internal fork will not be that useful)..
> > 
> > First of all, an internal fork was an unintended consequence. But since we are 
> > discussing this in a public forum, I won't go into more details. :)
> 
> :) understood :)
> 
> > 
> > Creating yet another layer is certainly an option. For mainline purposes (a) 
> > is definitely a better choice. And I assume that would be public...
> 
> yes, that is my thought.

Good, anything BSP-specific is meta-ti, hence meta-ti-mainline.

While meta-arago is for anything Apps or Distro-specific. It was also used 
as a dumping ground for anything un-upstreamable or with non-standard 
dependencies.

As meta-ti used to depend on OE-Core only at first, now it's OE-Core plus 
meta-arm. So, if you have a component that depends on anything else, you can't 
have it in meta-ti or meta-ti-mainline layers. We can talk about Yocto Project 
compatibility requirements separately...


> > On the other hand, if you only need this for couple of recipes, you can do 
> > this with alternative providers. E.g. instead of altering existing recipes 
> > with bbappends (e.g. cryptodev), you can have many providers for the same 
> > package (e.g. linux-ti-staging, linux-ti-mainline, even linux-yocto from 
> > OE-core all provide the Linux kernel, or virtual/kernel; same with u-boot 
> > from OE-core and u-boot-ti-staging plus u-boot-ti-mainline provide U-boot 
> > bootloader, like virtual/bootloaader). Those can be switched with a global 
> > PREFERRED_PROVIDER_<pkg> variable:
> > 
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/k3.inc#n13
> > 
> > In other words, if cryptodev is the only such case right now, it's less 
> > involved to create cryptodev-ti-mainline recipes, set those to corresponding 
> > PROVIDES, as well as PREFERRED_PROVIDER_ in necessary config files. Let me 
> > know if you need help with that.
> 
> 
> Hmm.. Thanks.. yeah, it is cryptodev today, something else tomorrow,
> in addition, I need to expand from purely kernel and u-boot upstream
> components alone to TF-A, linux-firmware upstream and eventually few
> additional packages etc. Mostly as a forward looking layer to uncover
> issues ahead of time. My thoughts on this is as follows: While the
> provider view can easily fit as well, it is a little less distracting
> or in some cases, un-intended usage to keep a "experimental" and
> "forward looking" layer away from users of production layer - then the
> distinction is very clearcut and risks(essentially "you are on your
> own") associated with the same would be clear as well. Who knows, some
> day, we might be even be able to delete such a layer since upstream will
> be rocksolid (touch wood)..

Ah, that would the most glorious day for sure! :)

Anyway, if you intend to have cryptodev, atf/tf-a, optee, linux-firmware and 
such, then sure, a separate mainline-only layer would be the best. BTW, things 
like SGX and RGX will also fit there nicely.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

