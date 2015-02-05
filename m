Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 08AB352A4D
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 17:50:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15Ho3VW030171
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:50:03 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15Ho1xC000940
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:50:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 11:50:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15Ho0M9031931;
	Thu, 5 Feb 2015 11:50:01 -0600
Date: Thu, 5 Feb 2015 12:49:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150205174958.GN9943@edge>
References: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F91C3@DFLE08.ent.ti.com>
	<20150205165237.GJ9943@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F926D@DFLE08.ent.ti.com>
	<20150205171423.GL9943@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F92B2@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7F92B2@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sysvinit: Changing default setting to add HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 17:50:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 12:19:30PM -0500, Cooper Jr., Franklin wrote:
> > On Thu, Feb 05, 2015 at 12:08:09PM -0500, Cooper Jr., Franklin wrote:
> > > > On Thu, Feb 05, 2015 at 04:45:43PM +0000, Cooper Jr., Franklin wrote:
> > > > > I see references to several boards that have enabled rtc in its
> > > > > dts file. I didn't check all the boards we support in meta-ti but
> > > > > additional boards may use it. So we shouldn't disable it for these boards.
> > > >
> > > > Exactly, so the proposal was to disable it by default and enable
> > > > through machine overrides for those boards that have it.
> > 
> > > [Franklin] I'm assuming there was some conversation in the background
> > > regarding this patch
> > 
> > Well, not about the patch, but about the problem this patch is trying to fix :)
> > 
> > 
> > > I wasn't aware of since the above two points weren't clear. But no
> > > problem doing with what you suggested as long as enabling it for the
> > > right boards is being done as part of a patch series with this one.
> > 
> > Do we have a list of boards that have RTC? Just glancing over what I have I
> > don't see any...
> [Franklin] am437x sk, am437x gp evm and am57x based on looking at the dt.

Hmm, I don't see any batteries on am437x sk. But x15 does have a battery next 
to Eth port.


> > As an alternative, we can keep it enabled by default and disable it just for
> > Keystone to make Sam happy. But I've seen that error on pretty much every
> > platform lately.

> [Franklin] I would prefer that approach instead. And true about the error 
> but it could be a bug or error that needs to be fixed so I rather not hide 
> it especially since I haven't received any questions regarding it before.

Ok

