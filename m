Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5ECB4529DD
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 14:39:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s53EdiGH017753;
	Tue, 3 Jun 2014 09:39:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s53EdibZ028992;
	Tue, 3 Jun 2014 09:39:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 3 Jun 2014 09:39:44 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
Thread-Index: AQHPftPJA8UXA/5I8k2/33EpthgmR5tfdOVw
Date: Tue, 3 Jun 2014 14:39:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6C227D@DFLE08.ent.ti.com>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
	<1401762581-31370-3-git-send-email-denis@denix.org>
In-Reply-To: <1401762581-31370-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 03 Jun 2014 14:39:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It would be nice if we can drop the Qt 5 specific patches and simply allow =
the "clean" sources to work for both Qt 4 and Qt 5.

 http://www.kdab.com/automated-porting-from-qt-4-to-qt-5/
http://stackoverflow.com/questions/18663331/how-to-check-the-selected-versi=
on-of-qt-in-a-pro-file

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, June 02, 2014 9:30 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/5] refresh-screen: convert to Qt5
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Use qt-provider to build it against Qt4 or Qt5
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...een.pro-add-widgets-module-to-the-project.patch | 26
> ++++++++++++++++++++++  ...place-QtGui-header-with-QtWidgets-for-
> Qt5.patch | 26 ++++++++++++++++++++++
>  .../recipes-core/matrix/refresh-screen_2.0.bb      | 17 +++++++++-----
>  3 files changed, 64 insertions(+), 5 deletions(-)  create mode 100644 me=
ta-
> arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-a=
dd-
> widgets-module-to-the-project.patch
>  create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-
> screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-
> refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-arago-
> extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-
> widgets-module-to-the-project.patch
> new file mode 100644
> index 0000000..b9a1f80
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-
> +++ screen.pro-add-widgets-module-to-the-project.patch
> @@ -0,0 +1,26 @@
> +From 3969a5b06cfa28e531080cfdb12ea69ada870f36 Mon Sep 17 00:00:00
> 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 12 May 2014 21:07:32 -0400
> +Subject: [PATCH] refresh-screen.pro: add widgets module to the project
> +for Qt5
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + refresh_screen.pro | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/refresh_screen.pro b/refresh_screen.pro index
> +afe5c25..a79abd0 100644
> +--- a/refresh_screen.pro
> ++++ b/refresh_screen.pro
> +@@ -4,7 +4,7 @@
> + #
> + #-------------------------------------------------
> +
> +-QT       +=3D core gui
> ++QT       +=3D core gui widgets
> +
> + TARGET =3D refresh_screen
> + TEMPLATE =3D app
> +--
> +1.9.2
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-
> Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-
> extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-
> QtWidgets-for-Qt5.patch
> new file mode 100644
> index 0000000..66c002d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-
> +++ QtGui-header-with-QtWidgets-for-Qt5.patch
> @@ -0,0 +1,26 @@
> +From 60a8e6c8ea763ed88442f16509cae99d8e43918e Mon Sep 17 00:00:00
> 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Mon, 12 May 2014 21:01:57 -0400
> +Subject: [PATCH] Replace QtGui header with QtWidgets for Qt5
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + main.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/main.cpp b/main.cpp
> +index c5744d8..5a61904 100644
> +--- a/main.cpp
> ++++ b/main.cpp
> +@@ -36,7 +36,7 @@
> +  *
> + */
> +
> +-#include <QtGui/QApplication>
> ++#include <QtWidgets/QApplication>
> + #include "mainwindow.h"
> +
> + int main(int argc, char *argv[])
> +--
> +1.9.2
> +
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> index 2696978..fc41f32 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -4,21 +4,28 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://main.cpp;beginline=3D9;endline=3D37;md5=3D884b90f5bf0d711fe32c4f0=
4b527
> 6496"
>  SECTION =3D "multimedia"
>=20
> +inherit qt-provider
> +
>  # Make sure that QT font libraries have been installed -RDEPENDS_${PN} +=
=3D
> "qt4-embedded-fonts"
> +RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
>=20
> -PR =3D "r4"
> +PR =3D "r5"
>=20
>  SRCREV =3D "4dfdf85f17033f950e01f25341665f979edde6c3"
>  BRANCH ?=3D "master"
>=20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/refresh-
> screen.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> -S =3D "${WORKDIR}/git"
> +QT5_DIFF =3D " \
> +file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> +\ file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \ "
>=20
> -inherit qt4e
> +SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '=
',
> d)}"
> +
> +S =3D "${WORKDIR}/git"
>=20
>  do_install() {
>      install -d ${D}/${bindir}
> -    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
> +    install -m 0755 ${B}/refresh_screen ${D}/${bindir}
>  }
> --
> 1.9.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

