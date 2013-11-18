Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 77F6F5299D
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2013 18:41:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAIIf2m6006364
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:41:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIIf18J011535
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:41:02 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 18 Nov 2013 12:41:01 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix location
	for host Qt tools
Thread-Index: AQHO47da7WmYu2K8GkWU0zHcYL/HGJortkyA//+cFNA=
Date: Mon, 18 Nov 2013 18:41:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5A7B41@DFLE08.ent.ti.com>
References: <1384711613-29582-1-git-send-email-fcooper@ti.com>
	<20131118183244.GH19813@edge>
In-Reply-To: <20131118183244.GH19813@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Mon, 18 Nov 2013 18:41:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 18, 2013 12:33 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix location =
for
> host Qt tools
>=20
> On Sun, Nov 17, 2013 at 12:06:53PM -0600, Franklin S. Cooper Jr wrote:
> > * By default Qt5 is looking at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin
> instead
> >   of the proper location i686-arago-linux/usr/bin/qt5.
> > * Update qmake.conf to insure qmake looks at the proper location for ho=
st
> >   binaries.
>=20
> What is this needed for exactly? I hadn't had any issues using qmake and
> command-line build with the v3 of the patches. Is it specific to QtCreato=
r?
[Franklin] Building via command line. Some reason qmake thinks moc is locat=
ed at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin which resulted in a file not=
 found error. Im not sure when moc is needed but when I tried to build the =
thermostat demo from src I ran into this issue.

>=20
> --
> Denys
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-q=
te.bb
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > index e3bf80f..6220578 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
> >
> >  require meta-toolchain-arago.bb
> >
> > -PR =3D "r16"
> > +PR =3D "r17"
> >
> >  # There could be qt5, qt4e and qt4x11 providers, but we don't support
> qt4x11 for now
> >  QT_DIR_NAME =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qto=
pia',
> d)}"
> > @@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
> >  	echo 'Libraries =3D $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
> >  	echo 'Headers =3D $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
> >
> > +	if [ "${QT_PROVIDER}" =3D "qt5" ]
> > +	then
> > +		echo 'HostBinaries =3D ../${SDK_SYS}/usr/bin/qt5' >> $qt_conf
> > +	fi
> > +
> > +
> >  	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
> >  	# and QTCreator
> >  	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
> .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

