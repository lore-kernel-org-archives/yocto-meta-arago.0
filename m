Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D468A5299E
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 18:20:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALIKowQ013438
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 12:20:50 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALIKoxf031681
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 12:20:50 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Nov 2013 12:20:50 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix location
	for host Qt tools
Thread-Index: AQHO47da7WmYu2K8GkWU0zHcYL/HGJortkyA//+cFNCAAJK3AIADoKIAgADa+wD//6RqoA==
Date: Thu, 21 Nov 2013 18:20:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5BD5F8@DFLE08.ent.ti.com>
References: <1384711613-29582-1-git-send-email-fcooper@ti.com>
	<20131118183244.GH19813@edge>
	<8F29D6B095ED194EA1980491A5E029710C5A7B41@DFLE08.ent.ti.com>
	<20131118212014.GL19813@edge> <20131121044356.GH29952@edge>
	<20131121174742.GQ29952@edge>
In-Reply-To: <20131121174742.GQ29952@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
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
X-List-Received-Date: Thu, 21 Nov 2013 18:20:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 21, 2013 11:48 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix location =
for
> host Qt tools
>=20
> On Wed, Nov 20, 2013 at 11:43:56PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Nov 18, 2013 at 04:20:14PM -0500, Denys Dmytriyenko wrote:
> > > On Mon, Nov 18, 2013 at 01:41:00PM -0500, Cooper Jr., Franklin wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Monday, November 18, 2013 12:33 PM
> > > > > To: Cooper Jr., Franklin
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix
> > > > > location for host Qt tools
> > > > >
> > > > > On Sun, Nov 17, 2013 at 12:06:53PM -0600, Franklin S. Cooper Jr
> wrote:
> > > > > > * By default Qt5 is looking at
> > > > > > cortexa8hf-vfp-neon-oe-linux-gnueabi/bin
> > > > > instead
> > > > > >   of the proper location i686-arago-linux/usr/bin/qt5.
> > > > > > * Update qmake.conf to insure qmake looks at the proper locatio=
n for
> host
> > > > > >   binaries.
> > > > >
> > > > > What is this needed for exactly? I hadn't had any issues using
> > > > > qmake and command-line build with the v3 of the patches. Is it sp=
ecific
> to QtCreator?
> > >
> > > > [Franklin] Building via command line. Some reason qmake thinks moc
> > > > is located at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin which
> > > > resulted in a file not found error. Im not sure when moc is needed
> > > > but when I tried to build the thermostat demo from src I ran into t=
his issue.
> > >
> > > I'm looking into this now and playing with the idea of packaging
> > > qt.conf that gets created during the nativesdk build. Although that o=
ne
> maybe an overkill.
> > > If that doesn't work, I'll push an updated version of this patch...
> >
> > Sorry, took me a bit longer due to some extra testing, but it appears
> > I can't re-use the generated qt.conf in this Canadian
> > cross-compilation when 3 archs are involved - config file for A->B
> > cross is different from B->C. I just sent the updated patch that sets
> > couple host variables in qt.conf inside SDK, that should cover most of =
other
> cases.
>=20
> Franklin,
>=20
> Have you been able to do any tests with the updated patch I sent last nig=
ht?
> If it works for you, I'd like to push it along with the initial Qt5 SDK p=
atches to
> meta-arago/master.
[Franklin] Haven't had a chance yet but I'll test it out by Monday.
>=20
> --
> Denys
>=20
>=20
> > > > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > > > ---
> > > > > >  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 ++++=
+++-
> > > > > >  1 files changed, 7 insertions(+), 1 deletions(-)
> > > > > >
> > > > > > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain=
-
> arago-qte.bb
> > > > > b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > > > > index e3bf80f..6220578 100644
> > > > > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
> qte.bb
> > > > > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
> qte.bb
> > > > > > @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
> > > > > >
> > > > > >  require meta-toolchain-arago.bb
> > > > > >
> > > > > > -PR =3D "r16"
> > > > > > +PR =3D "r17"
> > > > > >
> > > > > >  # There could be qt5, qt4e and qt4x11 providers, but we don't
> support
> > > > > qt4x11 for now
> > > > > >  QT_DIR_NAME =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qt=
5',
> 'qtopia',
> > > > > d)}"
> > > > > > @@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
> > > > > >  	echo 'Libraries =3D $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
> > > > > >  	echo 'Headers =3D $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
> > > > > >
> > > > > > +	if [ "${QT_PROVIDER}" =3D "qt5" ]
> > > > > > +	then
> > > > > > +		echo 'HostBinaries =3D ../${SDK_SYS}/usr/bin/qt5' >>
> $qt_conf
> > > > > > +	fi
> > > > > > +
> > > > > > +
> > > > > >  	# make a symbolic link to mkspecs for compatibility with
> Nokia's SDK
> > > > > >  	# and QTCreator
> > > > > >  	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
> > > > > .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> > > > > > --
> > > > > > 1.7.0.4
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

