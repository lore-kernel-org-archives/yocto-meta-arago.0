Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 47C67529D0
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 17:44:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KHiEdp004535
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 12:44:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KHiE3I018052
	for <meta-arago@arago-project.org>; Tue, 20 Aug 2013 12:44:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 12:44:14 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KHiEKS018585;
	Tue, 20 Aug 2013 12:44:14 -0500
Date: Tue, 20 Aug 2013 13:44:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130820174413.GF8481@edge>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
	<20130819213613.GF32524@denix.org>
	<FC0CCC2B-AE0D-4AA7-B553-3379ED7A62F0@ti.com>
	<20130820162339.GB8481@edge>
	<8F29D6B095ED194EA1980491A5E029710C5264FB@DFLE08.ent.ti.com>
	<20130820172108.GE8481@edge>
	<4044911E-C108-4FC2-8B32-6992C7AC06AD@ti.com>
MIME-Version: 1.0
In-Reply-To: <4044911E-C108-4FC2-8B32-6992C7AC06AD@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master & danny][PATCH 1/7] linux-libc-headers: Add linux-libc-headers version 2.6.33
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
X-List-Received-Date: Tue, 20 Aug 2013 17:44:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 20, 2013 at 01:38:28PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> On Aug 20, 2013, at 12:21 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> 
> > On Tue, Aug 20, 2013 at 12:54:11PM -0400, Cooper Jr., Franklin wrote:
> >> 
> >> 
> >>> -----Original Message-----
> >>> From: Dmytriyenko, Denys
> >>> Sent: Tuesday, August 20, 2013 11:24 AM
> >>> To: Cooper Jr., Franklin
> >>> Cc: meta-arago@arago-project.org
> >>> Subject: Re: [meta-arago] [master & danny][PATCH 1/7] linux-libc-headers: Add
> >>> linux-libc-headers version 2.6.33
> >>> 
> >>> On Mon, Aug 19, 2013 at 10:30:20PM -0400, Cooper Jr., Franklin wrote:
> >>>> 
> >>>> 
> >>>> On Aug 19, 2013, at 4:36 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
> >>>> 
> >>>>> On Wed, Jul 31, 2013 at 07:31:46PM -0500, Franklin S. Cooper Jr wrote:
> >>>>>> * This is the version that was originally being using in
> >>>>>> arago/oe-classic based  SDK.
> >>>>> 
> >>>>> Why do we need 2.6.33? All our old kernels are at least 2.6.37 now
> >>>>> and there is corresponding linux-libc-headers available...
> >>> 
> >>>> It's been awhile but I believe am18x still didn't like the 2.6.37
> >>>> headers for some crazy reason.
> >>> 
> >>> Do you have any more details? I'm testing it right now and it seems to be
> >>> building fine so far against 2.6.37.2...
> >> 
> >> [Franklin] I believe it's a runtime issue with tslib. The am18 kernel 
> >> conflicted with the 2.6.33 version of linux-libc-headers that was used to 
> >> build tslib.
> > 
> > But otherwise libnl-3.2.21 doesn't seem to build against 2.6.33 headers...
> > 
> I need to submit patches to enable wilink 6 for am18 and am37 anyway by 
> adding older versions of various recipes which would fix this problem.

Ok, then, let's leave 2.6.33 headers out until that time - I'll pick the other 
4 patches from this series today. Thanks.

-- 
Denys

