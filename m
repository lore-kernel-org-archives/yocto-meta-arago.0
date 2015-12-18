Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 72F8D529C9
	for <meta-arago@arago-project.org>;
	Fri, 18 Dec 2015 13:09:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBID9VoS015222;
	Fri, 18 Dec 2015 07:09:31 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBID9VPF018759;
	Fri, 18 Dec 2015 07:09:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Dec 2015 07:09:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBID9VIe014850;
	Fri, 18 Dec 2015 07:09:31 -0600
Date: Fri, 18 Dec 2015 08:09:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20151218130915.GR27464@edge>
References: <CADnUhn2v6yOE8JBsoLxpCZaGkO_GZMWme-K2d7SDUbHF-D-Ouw@mail.gmail.com>
	<CADnUhn0tvXObVAai0r9W3Ywr6jmfryBbHSSe2kjPehTPGekKCQ@mail.gmail.com>
	<CADnUhn3iEzEq9wuo86eciPpAfp+KrEhFob8dhPCTYikEaqt7sA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3iEzEq9wuo86eciPpAfp+KrEhFob8dhPCTYikEaqt7sA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: "broken dt data from edma" message while booting linux-ti-staging-rt-4.1
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
X-List-Received-Date: Fri, 18 Dec 2015 13:09:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 18, 2015 at 11:27:18AM +0200, matti kaasinen wrote:
> Problem was device tree.
> 4.1 seems to be more accurate with dtb parsing.
> Status = okay  definitions were missing in Ethernet structures.

Matti,

Thank you for the update! Glad you were able to track it down.

-- 
Denys


> 2015-12-16 18:05 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:
> 
> > Those " broken dt data" lines are not the problem. They seem to exist also
> > in normal 3.14 boot without problems. Two clear differences are: there is
> > no nand flash memory mapping and that there is that SIOCGIFFLAGS.
> >
> > Perhaps I try normal 4.1 kernel also. I used to get it running before.
> >
> > - Matti
> >
> > 2015-12-16 14:48 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:
> >
> >> Hi!
> >>
> >> I have seen nightly builds of fido RT passing quite consistently.
> >> However, I got nasty error messages while my am335x booted
> >> linux-ti-staging-rt-4.1 as follows:
> >>
> >> [    0.146612] omap_hwmod: tptc0 using broken dt data from edma
> >> [    0.146751] omap_hwmod: tptc1 using broken dt data from edma
> >> [    0.146868] omap_hwmod: tptc2 using broken dt data from edma
> >> [    0.151906] omap_hwmod: debugss: _wait_target_disable failed
> >>
> >> Perhaps for this reason I also get:
> >> Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
> >>
> >> and
> >>
> >> Failed to get index for interface name 'eth0': No such device
> >>
> >> - so I don't get Ethernet up and running.
> >>
> >> I have used Yocto version of meta-ti (fido).
> >>
> >> I found
> >> https://www.mail-archive.com/linux-omap@vger.kernel.org/msg116472.html
> >> discussing this problem, but I did not these changes made in am33xx.dtsi.
> >>
> >> What patches should I need to get rt-4.1 running properly?
> >>
> >> Thanks,
> >> Matti
> >>
> >
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


