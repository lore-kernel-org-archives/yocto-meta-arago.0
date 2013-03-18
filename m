Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8351252A21
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 17:50:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IHomSZ009252
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 12:50:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IHomBN028535
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 12:50:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Mar 2013 12:50:48 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2IHom5j027729;
	Mon, 18 Mar 2013 12:50:48 -0500
Date: Mon, 18 Mar 2013 13:50:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130318175047.GJ32759@edge>
References: <1363613762-6537-1-git-send-email-eyalr@ti.com>
	<1363613762-6537-4-git-send-email-eyalr@ti.com>
	<7D46E86EC0A8354091174257B2FED10159480F8A@DLEE11.ent.ti.com>
	<20130318155913.GD14761@denix.org>
	<8665E2433BC68541A24DFFCA87B70F5B17C50682@DNCE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C3E8E34@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C3E8E34@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/9] wpa-supplicant-wl18xx: build ti 2.0-devel version for wilink8
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
X-List-Received-Date: Mon, 18 Mar 2013 17:50:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 18, 2013 at 01:46:52PM -0400, Cooper Jr., Franklin wrote:

[snip]

> > > If it's not in the main meta-arago tree or oe-core, then you would need
> > > to add
> > > it to the patch series. If the file is pending submission from
> > > Franklin, then
> > > you need to specify the dependency. If this series is meant for
> > > Franklin's
> > > tree only, then we need to have a serious discussion... :)
> > >
> > >
> > 
> > Yes I guess it is dependent on a set of patches Franklin is about to send As it did
> > use his branch.
> > I was not aware it was not submitted yet.
> > Franklin, Are you sending this patch set soon?
> 
> I can send those patches. Its 17 patches total that includes all of the 
> changes. Those patches depended on the 4 patches I sent earlier today.
> 
> Denys,
> 
> If you can commit those patches today I'll send my next patch set that 
> Eyal's patches depend on.

Ok, fair enough.

Speaking of patches - how soon will you be submitting the patch to make 
linux-libc-headers machine-specific, as we are now seeing weird issues with 
different machines using different kernel versions and ltp-ddt trying to 
support them all... Thanks.

-- 
Denys

