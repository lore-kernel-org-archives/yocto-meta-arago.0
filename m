Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1918.1645048391804999487
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 13:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AB8540C2A;
	Wed, 16 Feb 2022 21:53:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_qeY1qVDf0T; Wed, 16 Feb 2022 21:53:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4604F40B05;
	Wed, 16 Feb 2022 21:53:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D8C4F17475F; Wed, 16 Feb 2022 16:53:04 -0500 (EST)
Date: Wed, 16 Feb 2022 16:53:04 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Etheridge@denix.org, Darren <detheridge@ti.com>,
	Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>,
	Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
Message-ID: <20220216215304.GR26229@denix.org>
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
 <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
 <16BAA88B2E614BBE.14741@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16BAA88B2E614BBE.14741@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Darren, Ryan,

These 2 patch have never been applied to Dunfell!
https://lists.yoctoproject.org/g/meta-arago/topic/86602755#13358
https://lists.yoctoproject.org/g/meta-arago/message/13356
https://lists.yoctoproject.org/g/meta-arago/message/13357


On Wed, Nov 24, 2021 at 09:18:42PM -0500, Denys Dmytriyenko wrote:
> On Tue, Nov 16, 2021 at 02:53:19PM +0530, Priya N S via lists.yoctoproject.org wrote:
> > Hi Denys,
> > 
> > On Tue, Oct 26, 2021 at 7:12 PM Priya N S via lists.yoctoproject.org
> > <priya.ns=mistralsolutions.com@lists.yoctoproject.org> wrote:
> > >
> > > Hi All,
> > > This series of patches fix the Matrix GUI Issue,
> > >
> > Did you get a chance to review this patch series?
> 
> Patches look reasonable to me. Thanks.
> 
> 
> > Warm Regards,
> > Vigna Raja Priya N S
> > 
> > 
> > > Issue:
> > > After the target board is booted, by default the Matrix GUI Demo is
> > > not getting displayed on the display device connected to the target
> > > board.
> > > The root cause of the Matrix GUI demo issue is that there are two
> > > Weston system services running in the filesystem. Below are the two
> > > services,
> > > 1. Weston systemd service
> > > 2. Weston initscript service
> > > The Matrix GUI demo runs on top of the Weston service. Since there
> > > are two Weston services running, it causes the Matrix GUI demo to not
> > > work properly.
> > >
> > > Fix:
> > > Both Weston services (systemd and initscript) which has the same command
> > > and does the same job. So, remove the weston systemd services from the
> > > filesystem. This fix displays the Matrix GUI in the connected display
> > > device.
> > >
> > > Priya N S (2):
> > >   wayland: weston: Disable weston systemd service
> > >   weston-init: Update initscript for weston-calibration
> > >
> > >  .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
> > >  meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.19.1.windows.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
