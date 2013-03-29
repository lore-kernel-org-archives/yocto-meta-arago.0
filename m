Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A0BDA5298C
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 17:06:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TH6xPN027232
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:06:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TH6x9G031074
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 12:06:59 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 29 Mar 2013 12:06:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 29 Mar 2013 12:06:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] omapconf: add omapconf utility to
	assist testing and debug
Thread-Index: AQHOLJ8NbnkHK8iFkkODctpF3dPwoJi85iwA
Date: Fri, 29 Mar 2013 17:06:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B026A@DLEE11.ent.ti.com>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
	<20130329170127.GM23022@edge>
In-Reply-To: <20130329170127.GM23022@edge>
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
X-List-Received-Date: Fri, 29 Mar 2013 17:06:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 29, 2013 12:01 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/4] omapconf: add omapconf
> utility to assist testing and debug
>=20
> On Fri, Mar 29, 2013 at 08:50:30AM -0500, Chase Maupin wrote:
> > * The omapconf utility gives useful information about the
> >   state of the OMAP device and can be used in debug and
> testing.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../recipes-devtools/omapconf/omapconf_git.bb      |   25
> ++++++++++++++++++++
> >  1 files changed, 25 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-
> devtools/omapconf/omapconf_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-
> devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-
> devtools/omapconf/omapconf_git.bb
> > new file mode 100644
> > index 0000000..9fcd88d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-
> devtools/omapconf/omapconf_git.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION =3D "Diagnostic tool for TI OMAP processors"
> > +HOMEPAGE =3D "https://github.com/omapconf/omapconf"
> > +
> > +LICENSE =3D "GPLv2 BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e914"
> > +
> > +PV =3D "1.66"
> > +PR =3D "r0"
> > +
> > +COMPATIBLE_MACHINE =3D "omap-a15"
>=20
> Is it compatible with omap4? I guess not omap3 though :)

Correct.  Since it supports OMAP4 as well I went ahead and left it at omap-=
a15.  OMAP3 wasn't listed as I recall.

>=20
>=20
> > +
> > +BRANCH ?=3D "master"
> > +SRCREV =3D "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
> > +
> > +SRC_URI =3D
> "git://github.com/omapconf/omapconf.git;protocol=3Dgit;branch=3D${BRA
> NCH}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile () {
> > +    oe_runmake CROSS_COMPILE=3D${TARGET_PREFIX} install
> > +}
> > +
> > +do_install () {
> > +    oe_runmake DESTDIR=3D${D}${bindir} install
> > +}
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

