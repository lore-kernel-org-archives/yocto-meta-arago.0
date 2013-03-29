Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2C05D52991
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 17:25:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2THPQN8001403
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:25:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2THPQP9017418
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:25:26 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 29 Mar 2013 12:25:26 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 29 Mar 2013 12:25:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] omapconf: add omapconf utility to
	assist testing and debug
Thread-Index: AQHOLJ8NbnkHK8iFkkODctpF3dPwoJi85iwAgABVUgD//64A8IAAVWsA//+sRuA=
Date: Fri, 29 Mar 2013 17:25:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B03AC@DLEE11.ent.ti.com>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
	<20130329170127.GM23022@edge>
	<7D46E86EC0A8354091174257B2FED101594B026A@DLEE11.ent.ti.com>
	<20130329171132.GN23022@edge>
	<7D46E86EC0A8354091174257B2FED101594B0310@DLEE11.ent.ti.com>
	<20130329172346.GO23022@edge>
In-Reply-To: <20130329172346.GO23022@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/4] omapconf: add omapconf utility to assist testing and debug
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
X-List-Received-Date: Fri, 29 Mar 2013 17:25:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 29, 2013 12:24 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> utility to assist testing and debug
>=20
> On Fri, Mar 29, 2013 at 01:18:46PM -0400, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, March 29, 2013 12:12 PM
> > > To: Maupin, Chase
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> > > utility to assist testing and debug
> > >
> > > On Fri, Mar 29, 2013 at 01:06:57PM -0400, Maupin, Chase
> wrote:
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Friday, March 29, 2013 12:01 PM
> > > > > To: Maupin, Chase
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add
> omapconf
> > > > > utility to assist testing and debug
> > > > >
> > > > > On Fri, Mar 29, 2013 at 08:50:30AM -0500, Chase Maupin
> wrote:
> > > > > > * The omapconf utility gives useful information about
> the
> > > > > >   state of the OMAP device and can be used in debug and
> > > > > testing.
> > > > > >
> > > > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > > > ---
> > > > > >  .../recipes-devtools/omapconf/omapconf_git.bb      |
> 25
> > > > > ++++++++++++++++++++
> > > > > >  1 files changed, 25 insertions(+), 0 deletions(-)
> > > > > >  create mode 100644 meta-arago-extras/recipes-
> > > > > devtools/omapconf/omapconf_git.bb
> > > > > >
> > > > > > diff --git a/meta-arago-extras/recipes-
> > > > > devtools/omapconf/omapconf_git.bb b/meta-arago-
> > > extras/recipes-
> > > > > devtools/omapconf/omapconf_git.bb
> > > > > > new file mode 100644
> > > > > > index 0000000..9fcd88d
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arago-extras/recipes-
> > > > > devtools/omapconf/omapconf_git.bb
> > > > > > @@ -0,0 +1,25 @@
> > > > > > +DESCRIPTION =3D "Diagnostic tool for TI OMAP processors"
> > > > > > +HOMEPAGE =3D "https://github.com/omapconf/omapconf"
> > > > > > +
> > > > > > +LICENSE =3D "GPLv2 BSD"
> > > > > > +LIC_FILES_CHKSUM =3D
> > > > > "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e914"
> > > > > > +
> > > > > > +PV =3D "1.66"
> > > > > > +PR =3D "r0"
> > > > > > +
> > > > > > +COMPATIBLE_MACHINE =3D "omap-a15"
> > > > >
> > > > > Is it compatible with omap4? I guess not omap3 though :)
> > > >
> > > > Correct.  Since it supports OMAP4 as well I went ahead and
> left
> > > it at
> > > > omap-a15.  OMAP3 wasn't listed as I recall.
> > >
> > > I'm confused. Shouldn't it be omap-a15|omap4?
> >
> > I didn't notice the pandaboard so I thought there wasn't an
> existing omap4.
> > My logic was that when/if omap4 was added it would go into the
> omap-a15
> > SOC_FAMILY.  I'll send an update.
>=20
> Why would pandaboard go into omap-a15 SOC_FAMILY? It's not
> Cortex-A15 and it
> has it's own SOC_FAMILY.
>=20

Because I had a highly complex condition called a brain fart and completely=
 mixed up that OMAP4 used a Cortex-A9 instead of A15 :)

> Moreover, we had pandaboard in meta-ti for ages, the support is
> reasonably
> up-to-date and it is part of my nightly builds of distro-less
> config...

I just missed it.  I was looking for omap4-evm or something similar.  See a=
bove :)

>=20
>=20
> > > > > > +
> > > > > > +BRANCH ?=3D "master"
> > > > > > +SRCREV =3D "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> > > > > > +
> > > > > > +SRC_URI =3D
> > > > >
> > >
> "git://github.com/omapconf/omapconf.git;protocol=3Dgit;branch=3D${BRA
> > > > > NCH}"
> > > > > > +
> > > > > > +S =3D "${WORKDIR}/git"
> > > > > > +
> > > > > > +do_compile () {
> > > > > > +    oe_runmake CROSS_COMPILE=3D${TARGET_PREFIX} install
> > > > > > +}
> > > > > > +
> > > > > > +do_install () {
> > > > > > +    oe_runmake DESTDIR=3D${D}${bindir} install
> > > > > > +}
> > > > > > --
> > > > > > 1.7.0.4
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> > > arago

