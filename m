Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B256E52972
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 20:31:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CKVaFx004903
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 14:31:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CKVaq9012382
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 14:31:36 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 12 Feb 2014 14:31:35 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] qt applications: Fix issue with SDK
	makefile.
Thread-Index: AQHPKCaa/qA+2hj0eECLRqz+jrzR7pqyaRCA//+cF+A=
Date: Wed, 12 Feb 2014 20:31:34 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C624681@DFLE08.ent.ti.com>
References: <1392232442-27754-1-git-send-email-fcooper@ti.com>
	<20140212194115.GP4346@edge>
In-Reply-To: <20140212194115.GP4346@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/4] qt applications: Fix issue with SDK makefile.
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
X-List-Received-Date: Wed, 12 Feb 2014 20:31:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All these patches can be pushed into master.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 12, 2014 1:41 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/4] qt applications: Fix issue with SDK
> makefile.
>=20
> Franklin,
>=20
> Do you need these changes to make into our 2013.12.01 release this week?
> They should be fine for master though...
>=20
>=20
> On Wed, Feb 12, 2014 at 01:13:59PM -0600, Franklin S. Cooper Jr wrote:
> > * Makefiles have been updated to insure that qmake is called as part of=
 the
> make
> >   clean target.
> > * This insures that the App-Makefile always exist and will be able to c=
lean the
> >   sources.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 ++--
> >  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
> >  .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
> >  .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2=
.0.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > index 4d41b73..1e54444 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> > @@ -11,9 +11,9 @@ RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
> >
> >  DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
> >
> > -PR =3D "r4"
> > +PR =3D "r5"
> >
> > -SRCREV =3D "d962b18b628f0006642491c2250ef01557591e66"
> > +SRCREV =3D "ac2338295ccb4c6c2ffa58b5ad48659a5430"
> >  BRANCH ?=3D "master"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-
> v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
> > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.b=
b
> b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > index f409c1e..2696978 100644
> > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > @@ -7,9 +7,9 @@ SECTION =3D "multimedia"
> >  # Make sure that QT font libraries have been installed
> >  RDEPENDS_${PN} +=3D "qt4-embedded-fonts"
> >
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> > -SRCREV =3D "e652edf9403fe9329e1bcd14b79503045a53705c"
> > +SRCREV =3D "4dfdf85f17033f950e01f25341665f979edde6c3"
> >  BRANCH ?=3D "master"
> >
> >  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> > diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual=
-
> camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-
> demo/dual-camera-demo_1.0.bb
> > index 4e33d9d..ba3cc57 100644
> > --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera=
-
> demo_1.0.bb
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-
> camera-demo_1.0.bb
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> "file://main.cpp;beginline=3D1;endline=3D18;md5=3D1e0116b09fc3d8f88
> >
> >  require recipes-core/matrix/matrix-gui-paths.inc
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> >  BRANCH =3D "master"
> > -SRCREV =3D "ee954e04b3efe160b3fabf5a8d640740ce1a7e85"
> > +SRCREV =3D "e8412769dfe650afd528dc2eb791ddf96143771e"
> >
> >  SRC_URI =3D "git://gitorious.org/dual-camera-demo/dual-camera-
> demo.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/met=
a-
> arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > index 6704354..d0a9f7a 100644
> > --- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > +++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> > @@ -12,12 +12,12 @@ require recipes-core/matrix/matrix-gui-paths.inc
> >
> >  inherit qt-provider
> >
> > -PR =3D "r6"
> > +PR =3D "r7"
> >
> >  DEPENDS +=3D "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
> >
> >  BRANCH ?=3D "master"
> > -SRCREV =3D "e6225f9e485675e4390dcc7575810e9f63501692"
> > +SRCREV =3D "2960431fd38239cc089c8738776f3ff9dcfe7f1c"
> >
> >  SRC_URI =3D " \
> >  	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=3Dgi=
t
> \
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

