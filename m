Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C2C97529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 16:29:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54GTob8019819
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 11:29:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54GTn5s008760
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 11:29:50 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 11:29:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
Thread-Index: AQHPftPJA8UXA/5I8k2/33EpthgmR5tfdOVwgABWyoCAAaCWAP//ulGQ
Date: Wed, 4 Jun 2014 16:29:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C3452@DFLE08.ent.ti.com>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-3-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6C227D@DFLE08.ent.ti.com>
	<20140603144736.GB21819@edge> <20140604153838.GM21819@edge>
In-Reply-To: <20140604153838.GM21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/5] refresh-screen: convert to Qt5
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
X-List-Received-Date: Wed, 04 Jun 2014 16:29:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Feel free to push your patch now. I'll deal with the sources and bump the S=
RCREV later.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, June 04, 2014 10:39 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
>=20
> On Tue, Jun 03, 2014 at 10:47:37AM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jun 03, 2014 at 02:39:44PM +0000, Cooper Jr., Franklin wrote:
> > > It would be nice if we can drop the Qt 5 specific patches and simply
> > > allow the "clean" sources to work for both Qt 4 and Qt 5.
> > >
> > >  http://www.kdab.com/automated-porting-from-qt-4-to-qt-5/
> > > http://stackoverflow.com/questions/18663331/how-to-check-the-selecte
> > > d-version-of-qt-in-a-pro-file
> >
> > The .pro file should be easy, but the sources are rather involved.
> > It's up to you if you want to use the method to pre-process the
> > sources to work with qt4 and qt5...
>=20
> Franklin,
>=20
> So, how would you like to proceed in this case? You own the source
> repository.
> Do you want me to submit a patch for .pro file change? I don't feel very
> comfortable with the .cpp changes suggested in the first link - looked fi=
nicky
> to me. I'll leave that to you to decide.
>=20
> As of this patch - do you want me to push it as is for now or should I wa=
it for
> the source change?
>=20
> --
> Denys
>=20
>=20
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Monday, June 02, 2014 9:30 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Use qt-provider to build it against Qt4 or Qt5
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  ...een.pro-add-widgets-module-to-the-project.patch | 26
> > > > ++++++++++++++++++++++  ...place-QtGui-header-with-QtWidgets-for-
> > > > Qt5.patch | 26 ++++++++++++++++++++++
> > > >  .../recipes-core/matrix/refresh-screen_2.0.bb      | 17 +++++++++-=
----
> > > >  3 files changed, 64 insertions(+), 5 deletions(-)  create mode 100=
644
> meta-
> > > > arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-
> screen.pro-add-
> > > > widgets-module-to-the-project.patch
> > > >  create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-
> > > > screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> > > >
> > > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0=
001-
> > > > refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-
> arago-
> > > > extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-a=
dd-
> > > > widgets-module-to-the-project.patch
> > > > new file mode 100644
> > > > index 0000000..b9a1f80
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> refresh-
> > > > +++ screen.pro-add-widgets-module-to-the-project.patch
> > > > @@ -0,0 +1,26 @@
> > > > +From 3969a5b06cfa28e531080cfdb12ea69ada870f36 Mon Sep 17
> 00:00:00
> > > > 2001
> > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > +Date: Mon, 12 May 2014 21:07:32 -0400
> > > > +Subject: [PATCH] refresh-screen.pro: add widgets module to the pro=
ject
> > > > +for Qt5
> > > > +
> > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > +---
> > > > + refresh_screen.pro | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/refresh_screen.pro b/refresh_screen.pro index
> > > > +afe5c25..a79abd0 100644
> > > > +--- a/refresh_screen.pro
> > > > ++++ b/refresh_screen.pro
> > > > +@@ -4,7 +4,7 @@
> > > > + #
> > > > + #-------------------------------------------------
> > > > +
> > > > +-QT       +=3D core gui
> > > > ++QT       +=3D core gui widgets
> > > > +
> > > > + TARGET =3D refresh_screen
> > > > + TEMPLATE =3D app
> > > > +--
> > > > +1.9.2
> > > > +
> > > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0=
002-
> > > > Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-
> > > > extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header=
-
> with-
> > > > QtWidgets-for-Qt5.patch
> > > > new file mode 100644
> > > > index 0000000..66c002d
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-
> Replace-
> > > > +++ QtGui-header-with-QtWidgets-for-Qt5.patch
> > > > @@ -0,0 +1,26 @@
> > > > +From 60a8e6c8ea763ed88442f16509cae99d8e43918e Mon Sep 17
> 00:00:00
> > > > 2001
> > > > +From: Denys Dmytriyenko <denys@ti.com>
> > > > +Date: Mon, 12 May 2014 21:01:57 -0400
> > > > +Subject: [PATCH] Replace QtGui header with QtWidgets for Qt5
> > > > +
> > > > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > +---
> > > > + main.cpp | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/main.cpp b/main.cpp
> > > > +index c5744d8..5a61904 100644
> > > > +--- a/main.cpp
> > > > ++++ b/main.cpp
> > > > +@@ -36,7 +36,7 @@
> > > > +  *
> > > > + */
> > > > +
> > > > +-#include <QtGui/QApplication>
> > > > ++#include <QtWidgets/QApplication>
> > > > + #include "mainwindow.h"
> > > > +
> > > > + int main(int argc, char *argv[])
> > > > +--
> > > > +1.9.2
> > > > +
> > > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2=
.0.bb
> > > > b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > > index 2696978..fc41f32 100644
> > > > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > > @@ -4,21 +4,28 @@ LICENSE =3D "BSD"
> > > >  LIC_FILES_CHKSUM =3D
> > > >
> "file://main.cpp;beginline=3D9;endline=3D37;md5=3D884b90f5bf0d711fe32c4f0=
4b527
> > > > 6496"
> > > >  SECTION =3D "multimedia"
> > > >
> > > > +inherit qt-provider
> > > > +
> > > >  # Make sure that QT font libraries have been installed -RDEPENDS_$=
{PN}
> +=3D
> > > > "qt4-embedded-fonts"
> > > > +RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
> > > >
> > > > -PR =3D "r4"
> > > > +PR =3D "r5"
> > > >
> > > >  SRCREV =3D "4dfdf85f17033f950e01f25341665f979edde6c3"
> > > >  BRANCH ?=3D "master"
> > > >
> > > >  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> > > > screen.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > >
> > > > -S =3D "${WORKDIR}/git"
> > > > +QT5_DIFF =3D " \
> > > > +file://0001-refresh-screen.pro-add-widgets-module-to-the-project.p=
atch
> > > > +\ file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \ =
"
> > > >
> > > > -inherit qt4e
> > > > +SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIF=
F}",
> '',
> > > > d)}"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > >
> > > >  do_install() {
> > > >      install -d ${D}/${bindir}
> > > > -    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
> > > > +    install -m 0755 ${B}/refresh_screen ${D}/${bindir}
> > > >  }
> > > > --
> > > > 1.9.2
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

