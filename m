Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 847A552A4D
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 17:34:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15HYuYb028889
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:34:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15HYtUv019203
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:34:55 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 11:34:55 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] busybox/defconfig: Enable options
	required by LAVA
Thread-Index: AQHQQVZgG7uq5DFCQkK5ZINXYCEKKpziM1uLgABmBYD//51fdIAAclOA//+mr7A=
Date: Thu, 5 Feb 2015 17:34:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F9353@DFLE08.ent.ti.com>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>
	<20150205151353.GC9943@edge>
	<D03ED281-CA31-45D5-8623-3B6CDAD42EC8@ti.com>
	<20150205155225.GH9943@edge>
	<3F32BBC6-B86C-4BF0-9F1C-F3CBD996E665@ti.com>
	<20150205164835.GI9943@edge>
In-Reply-To: <20150205164835.GI9943@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Thu, 05 Feb 2015 17:34:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 05, 2015 10:49 AM
> To: Cooper Jr., Franklin
> Cc: Hernandez, Carlos; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] busybox/defconfig: Enable options requi=
red
> by LAVA
>=20
> On Thu, Feb 05, 2015 at 10:59:24AM -0500, Cooper Jr., Franklin wrote:
> > > On Feb 5, 2015, at 9:52 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
> > >> On Thu, Feb 05, 2015 at 10:47:16AM -0500, Cooper Jr., Franklin wrote=
:
> > >>>> On Feb 5, 2015, at 9:14 AM, Dmytriyenko, Denys <denys@ti.com>
> wrote:
> > >>>>
> > >>>> On Thu, Feb 05, 2015 at 10:02:33AM -0500, Carlos Hernandez wrote:
> > >>>> Linaro's Test Framework (LAVA) requires httpd and other options
> > >>>> enabled in busybox. Enable them so LAVA tests can be run on Arago
> > >>>> images.
> > >>>
> > >>> Looks good. The only concern I have is below.
> > >>
> > >> Carlos,
> > >> Do we really need another web server?
> > >> We have lighttpd and thttpd already. Can either of those be reused
> > >> especially thttpd since it's already a light weight web server.
> > >
> > > I guess this question would need to be directed to LAVA guys. Not
> > > sure if their build includes any of those other http servers, hence
> > > they enabled the simplest one.
> > >
> > > We do indeed already have 2 http servers, and yes it would be nice
> > > to re-use one of them instead of enabling 3rd one. But the question
> > > is - who will validate and, if needed, update corresponding LAVA piec=
es to
> work with thttpd?
>=20
> > Let me check how we currently use thttpd. I wouldn't mind replacing it
> > with httpd if possible instead of adding a third web server.
>=20
> I don't believe we actively use thttpd any more. It was added way back to
> Classic Arago to support DVSDK and running cgi scripts as root:
>=20
> http://arago-
> project.org/git/?p=3Darago.git;a=3Dcommit;h=3Df8bf614c85f435f53a78a0151b2=
39341
> 643f6a13
>=20
> I'd vote to kill it.
[Franklin] I've wanted to kill it for a while but I was told that customers=
 frequently asked for a very lightweight web server so we kept it there to =
show it off.
Other than documentation I don't think we refer to thttpd in our sdk.
>=20
>=20
> > >>>> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> > >>>> ---
> > >>>> meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12
> > >>>> ++++++------
> > >>>> 1 file changed, 6 insertions(+), 6 deletions(-)
> > >>>>
> > >>>> -# CONFIG_HTTPD is not set
> > >>>> +CONFIG_HTTPD=3Dy
> > >>>> # CONFIG_FEATURE_HTTPD_RANGES is not set #
> > >>>> CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set #
> > >>>> CONFIG_FEATURE_HTTPD_SETUID is not set @@ -845,7 +845,7 @@
> > >>>> CONFIG_UDHCP_DEBUG=3D0 # CONFIG_FEATURE_UDHCP_8021Q is not
> set
> > >>>> CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"/usr/share/udhcpc/default.script"
> > >>>> CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
> > >>>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
> > >>>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -b"
> > >>>
> > >>> This supposedly changes udhcp behavior to go into background when
> > >>> waiting for an IP address, if not received right away, instead of e=
xiting
> with an error.
> > >>> I personally don't have an issue with this, but will it affect SDK
> > >>> OOB experience in any way? Guys?
> > >
> > >> I'll double check but why instead of changing the default behavior
> > >> simply add &? I'm assuming you will get the same result but won't
> > >> have to worry about breaking anything.
> > >
> > > That's still not the same - with -n flag udhcp will time out soon if
> > > not received IP address, while with -b it will go into background
> > > and will wait for IP address there. So, if you add & at the end of
> > > command with -n it will go into background, but exit soon after, whic=
h is not
> the same.
> > >
> > So it sits indefinitely and assigns ip's whenever it can? If so I
> > would actual prefer that. I still need to check.
>=20
> Yes, it is my understanding that it will keep on pinging the server with =
request-
> IP periodically in the background, until it gets one.
>=20
> The current behaviour is it tries 3 times and if it can't get an IP, it e=
xits with
> error.
>=20
> In both cases, once the IP is acquired, the client has to stay in the bac=
kground
> for renewing the lease. The difference is the initial acquision.
[Franklin] This change will cause problems for one of our scripts. Since we=
 are extremely close to our release I would prefer if we hold off on making=
 this change. Wed of next week would be prefect if yall don't mind waiting.=
 I'll update the scripts at that point to reflect this change.

I don't see a command to manually change this behavior to mimic how it curr=
ently works once this change is made. So if such a command/option does exis=
t then I probably can fix the scripts real quick to make that change.
>=20
> --
> Denys

