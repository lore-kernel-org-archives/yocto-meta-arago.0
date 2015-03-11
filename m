Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 03CFF52A80
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 15:16:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BFG7tZ025276
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 10:16:07 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BFG6dF030763
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 10:16:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 10:16:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BFG5G7028941;
	Wed, 11 Mar 2015 10:16:06 -0500
Date: Wed, 11 Mar 2015 11:16:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150311151603.GA22394@edge>
References: <1426025965-9482-1-git-send-email-fcooper@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581410786D@DFLE09.ent.ti.com>
	<9C95DDB1-DFD2-4E47-B172-93DBCECD5E99@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814107886@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C83F9B8@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C83F9B8@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] refresh-screen: Add commandline parameter	to set background-color to black
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
X-List-Received-Date: Wed, 11 Mar 2015 15:16:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

We just discussed it on the call - I'll be providing feedback for wayland 
patch shortly...


On Wed, Mar 11, 2015 at 03:14:50PM +0000, Cooper Jr., Franklin wrote:
> Yup that is what I did. FYI this patch is pretty much meaningless since it 
> won't do anything. There are additional patches that are required but it 
> depends on the conditional wayland patch set to be committed.
> 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Wednesday, March 11, 2015 10:09 AM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH v2] refresh-screen: Add commandline
> > parameter to set background-color to black
> > 
> > Locally, I was able to switch the git protocol to 'https' and proceed.
> > 
> > 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Wednesday, March 11, 2015 11:00 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v2] refresh-screen: Add commandline
> > parameter to set background-color to black
> > 
> > Yeah I won't be able to test this until gitorious starts working. I forgot to add
> > it to my notes but once it works I'll test it out.
> > 
> > 
> > > On Mar 11, 2015, at 9:35 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> > >
> > > There appears to be fundamental issues with this patch. I tried applying this
> > patch locally and ran into the following issues.
> > >
> > > 1) Patch does not apply.
> > > 2) There are syntax errors in the patched recipe.
> > > 3) License checksum mismatch
> > > 4) Compilation failure of main.cpp
> > >
> > > - Jake
> > >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > > Sent: Tuesday, March 10, 2015 6:19 PM
> > > To: meta-arago@arago-project.org
> > > Cc: Cooper Jr., Franklin
> > > Subject: [meta-arago] [PATCH v2] refresh-screen: Add commandline
> > parameter to set background-color to black
> > >
> > > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> > >
> > > * This is to work around an issue seen when using Qt 5 EGLFS
> > > * Also pull in the changes from the Qt 5 patches into the git repository itself
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > > V2 Changes:
> > > Added the reason why the various patches are being deleted.
> > >
> > > ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 --------------------
> > > ...een.pro-add-widgets-module-to-the-project.patch |   26 ----------------
> > > ...place-QtGui-header-with-QtWidgets-for-Qt5.patch |   26 ----------------
> > > .../recipes-core/matrix/refresh-screen_2.0.bb      |   10 ++-----
> > > 4 files changed, 2 insertions(+), 91 deletions(-)  delete mode 100644 meta-
> > arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-
> > Qt5-use-qmake-available-in-PATH.patch
> > > delete mode 100644 meta-arago-extras/recipes-core/matrix/refresh-
> > screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> > > delete mode 100644 meta-arago-extras/recipes-core/matrix/refresh-
> > screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> > >
> > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> > Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-
> > extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-
> > use-qmake-available-in-PATH.patch
> > > deleted file mode 100644
> > > index 726b9ea..0000000
> > > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> > Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
> > > +++ /dev/null
> > > @@ -1,31 +0,0 @@
> > > -From 394eacf80efaacc719e69179c7c709016d21b707 Mon Sep 17 00:00:00
> > 2001
> > > -From: Denys Dmytriyenko <denys@ti.com>
> > > -Date: Mon, 15 Dec 2014 15:46:08 -0500
> > > -Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
> > > -
> > > -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ----
> > > - Makefile.build |    4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/Makefile.build b/Makefile.build -index a0ceaad..e6cb010
> > 100644
> > > ---- a/Makefile.build
> > > -+++ b/Makefile.build
> > > -@@ -8,11 +8,11 @@ all: release
> > > - .PHONY: qmake
> > > - qmake : refresh_screen.pro
> > > -    @. ${ENV_SETUP}; \
> > > --    qmake2 CONFIG+=release refresh_screen.pro
> > > -+    qmake CONFIG+=release refresh_screen.pro
> > > -
> > > - qmake_debug : refresh_screen.pro
> > > -    @. ${ENV_SETUP}; \
> > > --    qmake2 CONFIG+=debug refresh_screen.pro
> > > -+    qmake CONFIG+=debug refresh_screen.pro
> > > -
> > > - debug : qmake_debug
> > > -    @. ${ENV_SETUP}; \
> > > ---
> > > -1.7.9.5
> > > -
> > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> > refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-
> > arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-
> > add-widgets-module-to-the-project.patch
> > > deleted file mode 100644
> > > index b9a1f80..0000000
> > > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-
> > screen.pro-add-widgets-module-to-the-project.patch
> > > +++ /dev/null
> > > @@ -1,26 +0,0 @@
> > > -From 3969a5b06cfa28e531080cfdb12ea69ada870f36 Mon Sep 17 00:00:00
> > 2001
> > > -From: Denys Dmytriyenko <denys@ti.com>
> > > -Date: Mon, 12 May 2014 21:07:32 -0400
> > > -Subject: [PATCH] refresh-screen.pro: add widgets module to the project
> > for Qt5
> > > -
> > > -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ----
> > > - refresh_screen.pro | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/refresh_screen.pro b/refresh_screen.pro -index
> > afe5c25..a79abd0 100644
> > > ---- a/refresh_screen.pro
> > > -+++ b/refresh_screen.pro
> > > -@@ -4,7 +4,7 @@
> > > - #
> > > - #-------------------------------------------------
> > > -
> > > --QT       += core gui
> > > -+QT       += core gui widgets
> > > -
> > > - TARGET = refresh_screen
> > > - TEMPLATE = app
> > > ---
> > > -1.9.2
> > > -
> > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-
> > Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-
> > extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-
> > with-QtWidgets-for-Qt5.patch
> > > deleted file mode 100644
> > > index 66c002d..0000000
> > > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-
> > Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> > > +++ /dev/null
> > > @@ -1,26 +0,0 @@
> > > -From 60a8e6c8ea763ed88442f16509cae99d8e43918e Mon Sep 17 00:00:00
> > 2001
> > > -From: Denys Dmytriyenko <denys@ti.com>
> > > -Date: Mon, 12 May 2014 21:01:57 -0400
> > > -Subject: [PATCH] Replace QtGui header with QtWidgets for Qt5
> > > -
> > > -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ----
> > > - main.cpp | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/main.cpp b/main.cpp
> > > -index c5744d8..5a61904 100644
> > > ---- a/main.cpp
> > > -+++ b/main.cpp
> > > -@@ -36,7 +36,7 @@
> > > -  *
> > > - */
> > > -
> > > --#include <QtGui/QApplication>
> > > -+#include <QtWidgets/QApplication>
> > > - #include "mainwindow.h"
> > > -
> > > - int main(int argc, char *argv[])
> > > ---
> > > -1.9.2
> > > -
> > > diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > index 6c2c72e..53be987 100644
> > > --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> > > @@ -9,19 +9,13 @@ inherit qt-provider
> > > # Make sure that QT font libraries have been installed  RDEPENDS_${PN} +=
> > "${QT_RDEPENDS_FONTS}"
> > >
> > > -PR = "r7"
> > > +PR = "r8"
> > >
> > > -SRCREV = "ad3835b250c8b2b55ae65ffa19c2b85e412826b0"
> > > +SRCREV = "1c9af693ad91e7449358836fd0382d7b6a04c967"
> > > BRANCH ?= "master"
> > >
> > > SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-
> > screen.git;protocol=git;branch=${BRANCH}"
> > >
> > > -QT5_DIFF = " \
> > > -file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> > \ -file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \ -
> > file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \ -"
> > > -
> > > SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '',
> > d)}"
> > >
> > > S = "${WORKDIR}/git"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

