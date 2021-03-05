Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 330BF52A1E
	for <meta-arago@arago-project.org>;
	Fri,  5 Mar 2021 02:33:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1252YC6x067102;
	Thu, 4 Mar 2021 20:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614911652;
	bh=iYcvHC3sqcyHdb2qwUHv1eIGYuYA6NgYNRIMjPr/VrQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=G3pggoJ7u0JlPr1XX1b8KM92YAooTBjieTOLCqkGaEiZGr1lx+BRsDk/21dj3fPHL
	AIekyieAAR9BDL76WndMDgl1HcWLf1QLvAIi6yvAb+nTVKpn42bLBDzcPExrj8o3aS
	yTihbzSiAPqSfcW5TZcs0xrvw8Fco5VHA/ZN5X6s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1252YCrK012417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Mar 2021 20:34:12 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 4 Mar 2021 20:34:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 4 Mar 2021 20:34:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1252YCS8026991;
	Thu, 4 Mar 2021 20:34:12 -0600
Date: Thu, 4 Mar 2021 20:34:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210305023412.pmlu4ediu4nkeegk@untaxed>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org> <20210304194836.GK4892@denix.org>
	<20210304231434.qyeopkbutdrvohm7@elliptic>
	<20210305005810.GP4892@denix.org>
	<20210305012411.yyebzvq2qrrjbyti@ambiance>
	<20210305022652.GQ4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210305022652.GQ4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Fri, 05 Mar 2021 02:33:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 21:26-20210304, Denys Dmytriyenko wrote:
> On Thu, Mar 04, 2021 at 07:24:11PM -0600, Nishanth Menon wrote:
> > On 19:58-20210304, Denys Dmytriyenko wrote:
> > > On Thu, Mar 04, 2021 at 05:14:34PM -0600, Nishanth Menon wrote:
> > > > Thank you, actually you bring out a very good point here. While I know
> > > > we can create our own internal private fork of arago for upstream
> > > > component testing, I am starting to wonder if creating either of:
> > > > 
> > > > a) meta-ti-mainline that builds on top of meta-ti
> > > > OR
> > > > b) meta-arago-mainline on top of meta-arago
> > > > 
> > > > is a smarter approach - personally, I prefer (a)? While, I don't want
> > > > to end up creating too many layers, but your point is valid that I
> > > > should also be careful to not mess with folks using the meta-arago in
> > > > production environments having to deal with challenges we are trying
> > > > to flush out by testing the bleeding edge of kernel - and I'd like to
> > > > make sure TI ecosystem is able to leverage/contribute as well (an
> > > > internal fork will not be that useful)..
> > > 
> > > First of all, an internal fork was an unintended consequence. But since we are 
> > > discussing this in a public forum, I won't go into more details. :)
> > 
> > :) understood :)
> > 
> > > 
> > > Creating yet another layer is certainly an option. For mainline purposes (a) 
> > > is definitely a better choice. And I assume that would be public...
> > 
> > yes, that is my thought.
> 
> Good, anything BSP-specific is meta-ti, hence meta-ti-mainline.
> 
> While meta-arago is for anything Apps or Distro-specific. It was also used 
> as a dumping ground for anything un-upstreamable or with non-standard 
> dependencies.
> 
> As meta-ti used to depend on OE-Core only at first, now it's OE-Core plus 
> meta-arm. So, if you have a component that depends on anything else, you can't 
> have it in meta-ti or meta-ti-mainline layers. We can talk about Yocto Project 
> compatibility requirements separately...

Thank you for your guidance here.
> 
> 
> > > On the other hand, if you only need this for couple of recipes, you can do 
> > > this with alternative providers. E.g. instead of altering existing recipes 
> > > with bbappends (e.g. cryptodev), you can have many providers for the same 
> > > package (e.g. linux-ti-staging, linux-ti-mainline, even linux-yocto from 
> > > OE-core all provide the Linux kernel, or virtual/kernel; same with u-boot 
> > > from OE-core and u-boot-ti-staging plus u-boot-ti-mainline provide U-boot 
> > > bootloader, like virtual/bootloaader). Those can be switched with a global 
> > > PREFERRED_PROVIDER_<pkg> variable:
> > > 
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/k3.inc#n13
> > > 
> > > In other words, if cryptodev is the only such case right now, it's less 
> > > involved to create cryptodev-ti-mainline recipes, set those to corresponding 
> > > PROVIDES, as well as PREFERRED_PROVIDER_ in necessary config files. Let me 
> > > know if you need help with that.
> > 
> > 
> > Hmm.. Thanks.. yeah, it is cryptodev today, something else tomorrow,
> > in addition, I need to expand from purely kernel and u-boot upstream
> > components alone to TF-A, linux-firmware upstream and eventually few
> > additional packages etc. Mostly as a forward looking layer to uncover
> > issues ahead of time. My thoughts on this is as follows: While the
> > provider view can easily fit as well, it is a little less distracting
> > or in some cases, un-intended usage to keep a "experimental" and
> > "forward looking" layer away from users of production layer - then the
> > distinction is very clearcut and risks(essentially "you are on your
> > own") associated with the same would be clear as well. Who knows, some
> > day, we might be even be able to delete such a layer since upstream will
> > be rocksolid (touch wood)..
> 
> Ah, that would the most glorious day for sure! :)
> 
> Anyway, if you intend to have cryptodev, atf/tf-a, optee, linux-firmware and 
> such, then sure, a separate mainline-only layer would be the best. BTW, things 
> like SGX and RGX will also fit there nicely.
> 

Thanks for your feedback. I have to take it internally to get all the
blessings I need to make things move forward..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

