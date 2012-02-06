Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8200252079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 12:50:29 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16CoSDl027159;
	Mon, 6 Feb 2012 06:50:28 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16CoS0R000973;
	Mon, 6 Feb 2012 06:50:28 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 6 Feb 2012 06:50:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 2/4] refresh-screen: add package from old
	arago overlay
Thread-Index: AQHM5IXvmp6f084yzUOF8NjPZs8WapYv0otw
Date: Mon, 6 Feb 2012 12:50:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012765D136@DLEE12.ent.ti.com>
References: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
	<1328040714-29036-3-git-send-email-Chase.Maupin@ti.com>
	<20120206041510.GA11841@denix.org>
In-Reply-To: <20120206041510.GA11841@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] refresh-screen: add package from old arago overlay
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
X-List-Received-Date: Mon, 06 Feb 2012 12:50:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Sunday, February 05, 2012 10:15 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/4] refresh-screen: add package
> from old arago overlay
>=20
> On Tue, Jan 31, 2012 at 02:11:52PM -0600, Chase Maupin wrote:
> > * This package adds a utility to force a screen refresh after
> >   graphics applications are executed.  This is to prevent left
> >   over graphics artifacts from being displayed in matrix.
> > * Ported from old arago overlay
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../recipes-core/matrix/refresh-screen_2.0.bb      |   25
> ++++++++++++++++++++
> >  1 files changed, 25 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-
> core/matrix/refresh-screen_2.0.bb
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-
> screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-
> screen_2.0.bb
> > new file mode 100644
> > index 0000000..3a3ad5e
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION =3D "Simple Application to force a screen refresh"
> > +HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/refresh-screen"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://main.cpp;beginline=3D9;endline=3D37;md5=3D884b90f5bf0d711fe32c4f0
> 4b5276496"
> > +SECTION =3D "multimedia"
> > +PRIORITY =3D "optional"
>=20
> There is no PRIORITY field any more, please remove.

Will do.  I really thought I had already done this but somehow I slipped it=
 back in.  I'll resend.

>=20
> --
> Denys
>=20
> > +# Make sure that QT font libraries have been installed
> > +RDEPENDS +=3D "qt4-embedded-fonts"
> > +
> > +PR =3D "r0"
> > +
> > +SRCREV =3D "ba27273f0d61dd71589db380f785f091b7ad3efe"
> > +BRANCH ?=3D "master"
> > +
> > +SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit qt4e
> > +
> > +do_install() {
> > +    install -d ${D}/${bindir}
> > +    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
> > +}
> > --
> > 1.7.0.4

