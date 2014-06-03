Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5C60E529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 14:47:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53ElcHp020849;
	Tue, 3 Jun 2014 09:47:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53Elcun013814;
	Tue, 3 Jun 2014 09:47:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 3 Jun 2014 09:47:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53Elbpc023139;
	Tue, 3 Jun 2014 09:47:37 -0500
Date: Tue, 3 Jun 2014 10:47:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140603144736.GB21819@edge>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-3-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6C227D@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6C227D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 03 Jun 2014 14:47:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 03, 2014 at 02:39:44PM +0000, Cooper Jr., Franklin wrote:
> It would be nice if we can drop the Qt 5 specific patches and simply allow 
> the "clean" sources to work for both Qt 4 and Qt 5.
> 
>  http://www.kdab.com/automated-porting-from-qt-4-to-qt-5/
> http://stackoverflow.com/questions/18663331/how-to-check-the-selected-version-of-qt-in-a-pro-file

The .pro file should be easy, but the sources are rather involved. It's up to 
you if you want to use the method to pre-process the sources to work with qt4 
and qt5...


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, June 02, 2014 9:30 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Use qt-provider to build it against Qt4 or Qt5
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  ...een.pro-add-widgets-module-to-the-project.patch | 26
> > ++++++++++++++++++++++  ...place-QtGui-header-with-QtWidgets-for-
> > Qt5.patch | 26 ++++++++++++++++++++++
> >  .../recipes-core/matrix/refresh-screen_2.0.bb      | 17 +++++++++-----
> >  3 files changed, 64 insertions(+), 5 deletions(-)  create mode 100644 meta-
> > arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-
> > widgets-module-to-the-project.patch
> >  create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-
> > screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> > refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-arago-
> > extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-
> > widgets-module-to-the-project.patch
> > new file mode 100644
> > index 0000000..b9a1f80
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-
> > +++ screen.pro-add-widgets-module-to-the-project.patch
> > @@ -0,0 +1,26 @@
> > +From 3969a5b06cfa28e531080cfdb12ea69ada870f36 Mon Sep 17 00:00:00
> > 2001
> > +From: Denys Dmytriyenko <denys@ti.com>
> > +Date: Mon, 12 May 2014 21:07:32 -0400
> > +Subject: [PATCH] refresh-screen.pro: add widgets module to the project
> > +for Qt5
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +---
> > + refresh_screen.pro | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/refresh_screen.pro b/refresh_screen.pro index
> > +afe5c25..a79abd0 100644
> > +--- a/refresh_screen.pro
> > ++++ b/refresh_screen.pro
> > +@@ -4,7 +4,7 @@
> > + #
> > + #-------------------------------------------------
> > +
> > +-QT       += core gui
> > ++QT       += core gui widgets
> > +
> > + TARGET = refresh_screen
> > + TEMPLATE = app
> > +--
> > +1.9.2
> > +
> > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-
> > Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-
> > extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-
> > QtWidgets-for-Qt5.patch
> > new file mode 100644
> > index 0000000..66c002d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-
> > +++ QtGui-header-with-QtWidgets-for-Qt5.patch
> > @@ -0,0 +1,26 @@
> > +From 60a8e6c8ea763ed88442f16509cae99d8e43918e Mon Sep 17 00:00:00
> > 2001
> > +From: Denys Dmytriyenko <denys@ti.com>
> > +Date: Mon, 12 May 2014 21:01:57 -0400
> > +Subject: [PATCH] Replace QtGui header with QtWidgets for Qt5
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +---
> > + main.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/main.cpp b/main.cpp
> > +index c5744d8..5a61904 100644
> > +--- a/main.cpp
> > ++++ b/main.cpp
> > +@@ -36,7 +36,7 @@
> > +  *
> > + */
> > +
> > +-#include <QtGui/QApplication>
> > ++#include <QtWidgets/QApplication>
> > + #include "mainwindow.h"
> > +
> > + int main(int argc, char *argv[])
> > +--
> > +1.9.2
> > +
> > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > index 2696978..fc41f32 100644
> > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > @@ -4,21 +4,28 @@ LICENSE = "BSD"
> >  LIC_FILES_CHKSUM =
> > "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b527
> > 6496"
> >  SECTION = "multimedia"
> > 
> > +inherit qt-provider
> > +
> >  # Make sure that QT font libraries have been installed -RDEPENDS_${PN} +=
> > "qt4-embedded-fonts"
> > +RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
> > 
> > -PR = "r4"
> > +PR = "r5"
> > 
> >  SRCREV = "4dfdf85f17033f950e01f25341665f979edde6c3"
> >  BRANCH ?= "master"
> > 
> >  SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-
> > screen.git;protocol=git;branch=${BRANCH}"
> > 
> > -S = "${WORKDIR}/git"
> > +QT5_DIFF = " \
> > +file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> > +\ file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \ "
> > 
> > -inherit qt4e
> > +SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '',
> > d)}"
> > +
> > +S = "${WORKDIR}/git"
> > 
> >  do_install() {
> >      install -d ${D}/${bindir}
> > -    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
> > +    install -m 0755 ${B}/refresh_screen ${D}/${bindir}
> >  }
> > --
> > 1.9.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

