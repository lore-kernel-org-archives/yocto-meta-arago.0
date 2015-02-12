Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3397D5297F
	for <meta-arago@arago-project.org>;
	Thu, 12 Feb 2015 15:44:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1CFiGKU020966
	for <meta-arago@arago-project.org>; Thu, 12 Feb 2015 09:44:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1CFiFLL016874
	for <meta-arago@arago-project.org>; Thu, 12 Feb 2015 09:44:15 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 12 Feb 2015 09:44:15 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] busybox/defconfig: Enable options
	required by LAVA
Thread-Index: AQHQQVZgG7uq5DFCQkK5ZINXYCEKKpziM1uLgABmBYD//51fdIAAclOA//+mr7CAAGzYgIAK2fAA//+cMWA=
Date: Thu, 12 Feb 2015 15:44:13 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C800A37@DFLE08.ent.ti.com>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>
	<20150205151353.GC9943@edge>
	<D03ED281-CA31-45D5-8623-3B6CDAD42EC8@ti.com>
	<20150205155225.GH9943@edge>
	<3F32BBC6-B86C-4BF0-9F1C-F3CBD996E665@ti.com>
	<20150205164835.GI9943@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F9353@DFLE08.ent.ti.com>
	<20150205175828.GO9943@edge> <20150212154105.GC18673@edge>
In-Reply-To: <20150212154105.GC18673@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] busybox/defconfig: Enable options required by LAVA
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
X-List-Received-Date: Thu, 12 Feb 2015 15:44:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 12, 2015 9:41 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] busybox/defconfig: Enable options requi=
red
> by LAVA
>=20
> On Thu, Feb 05, 2015 at 12:58:29PM -0500, Denys Dmytriyenko wrote:
> > On Thu, Feb 05, 2015 at 12:34:54PM -0500, Cooper Jr., Franklin wrote:
> > > > I don't believe we actively use thttpd any more. It was added way
> > > > back to Classic Arago to support DVSDK and running cgi scripts as r=
oot:
> > > >
> > > > http://arago-
> > > > project.org/git/?p=3Darago.git;a=3Dcommit;h=3Df8bf614c85f435f53a78a=
0151b
> > > > 239341
> > > > 643f6a13
> > > >
> > > > I'd vote to kill it.
> >
> > > [Franklin] I've wanted to kill it for a while but I was told that
> > > customers frequently asked for a very lightweight web server so we
> > > kept it there to show it off. Other than documentation I don't think
> > > we refer to thttpd in our sdk.
> >
> > So, to summarize - we'll kill separate thttpd and enable httpd in busyb=
ox.
> > Also, lighthttpd will stay, as it's used by matrix and is more
> > feature-full
>=20
> Any comments?
[Franklin] Above is fine
>=20
>=20
> > > > > >>>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
> > > > > >>>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -b"
> > > > > >>>
> > > > > > That's still not the same - with -n flag udhcp will time out
> > > > > > soon if not received IP address, while with -b it will go into
> > > > > > background and will wait for IP address there. So, if you add
> > > > > > & at the end of command with -n it will go into background,
> > > > > > but exit soon after, which is not
> > > > the same.
> > > > > >
> > > > > So it sits indefinitely and assigns ip's whenever it can? If so
> > > > > I would actual prefer that. I still need to check.
> > > >
> > > > Yes, it is my understanding that it will keep on pinging the
> > > > server with request- IP periodically in the background, until it ge=
ts one.
> > > >
> > > > The current behaviour is it tries 3 times and if it can't get an
> > > > IP, it exits with error.
> > > >
> > > > In both cases, once the IP is acquired, the client has to stay in
> > > > the background for renewing the lease. The difference is the initia=
l
> acquision.
> >
> > > [Franklin] This change will cause problems for one of our scripts.
> > > Since we are extremely close to our release I would prefer if we
> > > hold off on making this change. Wed of next week would be prefect if =
yall
> don't mind waiting.
> > > I'll update the scripts at that point to reflect this change.
> > >
> > > I don't see a command to manually change this behavior to mimic how
> > > it currently works once this change is made. So if such a
> > > command/option does exist then I probably can fix the scripts real qu=
ick to
> make that change.
> >
> > udhcpc should take those flags on the command line as well:
> > http://git.busybox.net/busybox/tree/networking/udhcp/dhcpc.c#n1147
>=20
> Franklin, please confirm we can proceed with this change - did you get a
> chance to test your scripts?
[Franklin] My release is out so feel free to make the change.
>=20
> --
> Denys

