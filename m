Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4517C52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 19:32:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HJW6qe008216
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:32:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HJW5sY010393
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:32:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 14:32:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 7/7][RFC] packagegroup-*-tisdk-addons:
	enable compiler and build essentials on omap-a15
Thread-Index: AQHQYDvs4ofpuMQ4yESOs95OyuFJuZ0hWVeA//+vL5CAAFlNgP//ryGA
Date: Tue, 17 Mar 2015 19:32:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C8495AF@DFLE08.ent.ti.com>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
	<1426546322-25230-8-git-send-email-denis@denix.org>
	<20150317184845.GA9813@edge>
	<8F29D6B095ED194EA1980491A5E029710C84948A@DFLE08.ent.ti.com>
	<55087E2B.108@ti.com>
In-Reply-To: <55087E2B.108@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 7/7][RFC] packagegroup-*-tisdk-addons: enable compiler and build essentials on omap-a15
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
X-List-Received-Date: Tue, 17 Mar 2015 19:32:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Hernandez, Carlos
> Sent: Tuesday, March 17, 2015 2:19 PM
> To: Cooper Jr., Franklin; Dmytriyenko, Denys; meta-arago@arago-project.or=
g
> Subject: Re: [meta-arago] [PATCH 7/7][RFC] packagegroup-*-tisdk-addons:
> enable compiler and build essentials on omap-a15
>=20
> On 03/17/2015 03:03 PM, Cooper Jr., Franklin wrote:
> >> I marked this as RFC to solicit feedback. As explained in the 0/7
> >> cover letter
> >> >for the series, there are several methods to pull in gcc and build
> >> >tools to the rootfs. This patch uses the least invasive one and
> >> >enables minimal set of dev tools and only for omap-a15 SOC platforms
> >> >(need to repeat it for keystone SOC). That covers Cortex-A15, but I
> >> >know in the future we'd need target gcc also on am3/4 platforms - wou=
ld
> you have any preferences to enable this?
> > [Franklin] My understanding was the only reason this was needed is to
> > enable developers to be able to compile dsp code and opencl code on the
> target for some reason especially since those are very powerful processor=
s
> with a lot of memory.
> >
> > Unless something change this wasn't something we cared to enabled on
> 335x and 437x. No big deal doing it as long as the file system is bloated=
 but I
> have no idea who really was going to use this/test this for those platfor=
ms.
>=20
> Some Linaro tests does use make in the target. e.g.
> https://git.linaro.org/?p=3Dtools/pm-qa.git;a=3Dsummary
>=20
[Franklin] Well if we need it for testing then I don't have a problem with =
it

