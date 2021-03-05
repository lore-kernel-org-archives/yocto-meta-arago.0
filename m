Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A451C529B6
	for <meta-arago@arago-project.org>;
	Fri,  5 Mar 2021 00:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 580B540BEC;
	Fri,  5 Mar 2021 00:58:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id num1w-oYaaJP; Fri,  5 Mar 2021 00:58:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 39CCE406B7;
	Fri,  5 Mar 2021 00:58:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EFE49174524; Thu,  4 Mar 2021 19:58:10 -0500 (EST)
Date: Thu, 4 Mar 2021 19:58:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210305005810.GP4892@denix.org>
References: <20210304065200.15811-1-nm@ti.com>
	<20210304184811.GF4892@denix.org> <20210304194836.GK4892@denix.org>
	<20210304231434.qyeopkbutdrvohm7@elliptic>
MIME-Version: 1.0
In-Reply-To: <20210304231434.qyeopkbutdrvohm7@elliptic>
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
X-List-Received-Date: Fri, 05 Mar 2021 00:57:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 05:14:34PM -0600, Nishanth Menon wrote:
> On 14:48-20210304, Denys Dmytriyenko wrote:
> > BTW, you'd need to ensure updating cryptodev from 1.10 to 1.12 does not affect 
> > current 5.4-based builds and/or releases. I'm sure it will build fine against 
> > this older kernel (most of Makefile changes), but concerned about any run-time 
> > regressions (the actual code changes).
> 
> Thank you, actually you bring out a very good point here. While I know
> we can create our own internal private fork of arago for upstream
> component testing, I am starting to wonder if creating either of:
> 
> a) meta-ti-mainline that builds on top of meta-ti
> OR
> b) meta-arago-mainline on top of meta-arago
> 
> is a smarter approach - personally, I prefer (a)? While, I don't want
> to end up creating too many layers, but your point is valid that I
> should also be careful to not mess with folks using the meta-arago in
> production environments having to deal with challenges we are trying
> to flush out by testing the bleeding edge of kernel - and I'd like to
> make sure TI ecosystem is able to leverage/contribute as well (an
> internal fork will not be that useful)..

First of all, an internal fork was an unintended consequence. But since we are 
discussing this in a public forum, I won't go into more details. :)

Creating yet another layer is certainly an option. For mainline purposes (a) 
is definitely a better choice. And I assume that would be public...

On the other hand, if you only need this for couple of recipes, you can do 
this with alternative providers. E.g. instead of altering existing recipes 
with bbappends (e.g. cryptodev), you can have many providers for the same 
package (e.g. linux-ti-staging, linux-ti-mainline, even linux-yocto from 
OE-core all provide the Linux kernel, or virtual/kernel; same with u-boot 
from OE-core and u-boot-ti-staging plus u-boot-ti-mainline provide U-boot 
bootloader, like virtual/bootloaader). Those can be switched with a global 
PREFERRED_PROVIDER_<pkg> variable:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/k3.inc#n13

In other words, if cryptodev is the only such case right now, it's less 
involved to create cryptodev-ti-mainline recipes, set those to corresponding 
PROVIDES, as well as PREFERRED_PROVIDER_ in necessary config files. Let me 
know if you need help with that.


> Any thoughts?
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

