Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3E59652991
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 17:18:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2THIkDd001211
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:18:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2THIkBV010403
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:18:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 29 Mar 2013 12:18:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] omapconf: add omapconf utility to
	assist testing and debug
Thread-Index: AQHOLJ8NbnkHK8iFkkODctpF3dPwoJi85iwAgABVUgD//64A8A==
Date: Fri, 29 Mar 2013 17:18:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B0310@DLEE11.ent.ti.com>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
	<20130329170127.GM23022@edge>
	<7D46E86EC0A8354091174257B2FED101594B026A@DLEE11.ent.ti.com>
	<20130329171132.GN23022@edge>
In-Reply-To: <20130329171132.GN23022@edge>
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
X-List-Received-Date: Fri, 29 Mar 2013 17:18:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 29, 2013 12:12 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> utility to assist testing and debug
>=20
> On Fri, Mar 29, 2013 at 01:06:57PM -0400, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, March 29, 2013 12:01 PM
> > > To: Maupin, Chase
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> > > utility to assist testing and debug
> > >
> > > On Fri, Mar 29, 2013 at 08:50:30AM -0500, Chase Maupin wrote:
> > > > * The omapconf utility gives useful information about the
> > > >   state of the OMAP device and can be used in debug and
> > > testing.
> > > >
> > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > ---
> > > >  .../recipes-devtools/omapconf/omapconf_git.bb      |   25
> > > ++++++++++++++++++++
> > > >  1 files changed, 25 insertions(+), 0 deletions(-)
> > > >  create mode 100644 meta-arago-extras/recipes-
> > > devtools/omapconf/omapconf_git.bb
> > > >
> > > > diff --git a/meta-arago-extras/recipes-
> > > devtools/omapconf/omapconf_git.bb b/meta-arago-
> extras/recipes-
> > > devtools/omapconf/omapconf_git.bb
> > > > new file mode 100644
> > > > index 0000000..9fcd88d
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-
> > > devtools/omapconf/omapconf_git.bb
> > > > @@ -0,0 +1,25 @@
> > > > +DESCRIPTION =3D "Diagnostic tool for TI OMAP processors"
> > > > +HOMEPAGE =3D "https://github.com/omapconf/omapconf"
> > > > +
> > > > +LICENSE =3D "GPLv2 BSD"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e914"
> > > > +
> > > > +PV =3D "1.66"
> > > > +PR =3D "r0"
> > > > +
> > > > +COMPATIBLE_MACHINE =3D "omap-a15"
> > >
> > > Is it compatible with omap4? I guess not omap3 though :)
> >
> > Correct.  Since it supports OMAP4 as well I went ahead and left
> it at
> > omap-a15.  OMAP3 wasn't listed as I recall.
>=20
> I'm confused. Shouldn't it be omap-a15|omap4?

I didn't notice the pandaboard so I thought there wasn't an existing omap4.=
  My logic was that when/if omap4 was added it would go into the omap-a15 S=
OC_FAMILY.  I'll send an update.

>=20
>=20
> > > > +
> > > > +BRANCH ?=3D "master"
> > > > +SRCREV =3D "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> > > > +
> > > > +SRC_URI =3D
> > >
> "git://github.com/omapconf/omapconf.git;protocol=3Dgit;branch=3D${BRA
> > > NCH}"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +do_compile () {
> > > > +    oe_runmake CROSS_COMPILE=3D${TARGET_PREFIX} install
> > > > +}
> > > > +
> > > > +do_install () {
> > > > +    oe_runmake DESTDIR=3D${D}${bindir} install
> > > > +}
> > > > --
> > > > 1.7.0.4
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
> arago

