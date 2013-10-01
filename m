Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 64793529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:24:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DObEr026177;
	Tue, 1 Oct 2013 08:24:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DObIW005488;
	Tue, 1 Oct 2013 08:24:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:24:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 12/13] matrix-gui-browser: update recipe
	to be Qt4 and Qt5 compatible
Thread-Index: AQHOvnWBkhinpwYgFEiQukYaIEIinZnf1jt1
Date: Tue, 1 Oct 2013 13:24:36 +0000
Message-ID: <71061AE8-5AAD-440E-BF86-4A36FE890EB1@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-13-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-13-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 12/13] matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
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
X-List-Received-Date: Tue, 01 Oct 2013 13:24:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Uses qt-provider class to build against either Qt4 or Qt5 depending on gl=
obal
> distro variable QT_PROVIDER.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../matrix/matrix-gui-browser/qt5-gui-widgets-move.patch     | 12 +++++++=
+++++
> .../recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch  | 12 +++++++=
+++++
> .../recipes-core/matrix/matrix-gui-browser_2.0.bb            | 12 +++++++=
+----
> 3 files changed, 32 insertions(+), 4 deletions(-)
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-brows=
er/qt5-gui-widgets-move.patch
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-brows=
er/qt5-webkit.patch
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5=
-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-=
browser/qt5-gui-widgets-move.patch
> new file mode 100644
> index 0000000..e725004
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-wi=
dgets-move.patch
> @@ -0,0 +1,12 @@
> +diff -uNr git-orig/main.cpp git/main.cpp
> +--- git-orig/main.cpp    2013-09-29 20:06:36.000000000 -0400
> ++++ git/main.cpp    2013-09-29 20:11:52.762449142 -0400
> +@@ -36,7 +36,7 @@
> +  *
> + */
> +=20
> +-#include <QtGui>
> ++#include <QtWidgets>
> + #include <QWebView>
> + #include <QGraphicsWebView>
> + #include <iostream>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5=
-webkit.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt=
5-webkit.patch
> new file mode 100644
> index 0000000..abbbcc8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit=
.patch
> @@ -0,0 +1,12 @@
> +diff -uNr git-orig/matrix_browser.pro git/matrix_browser.pro
> +--- git-orig/matrix_browser.pro    2013-09-29 18:43:16.000000000 -0400
> ++++ git/matrix_browser.pro    2013-09-29 19:00:24.182913775 -0400
> +@@ -6,7 +6,7 @@
> + TARGET =3D matrix_browser
> + DEPENDPATH +=3D .
> + INCLUDEPATH +=3D .
> +-QT       +=3D   webkit
> ++QT       +=3D   webkitwidgets
> + # Input
> + SOURCES +=3D main.cpp
> +=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 0e508a0..329b65a 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -4,19 +4,23 @@ LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D88=
4b90f5bf0d711fe32c4f04b5276496"
> SECTION =3D "multimedia"
>=20
> +inherit qt-provider
> +
> # Make sure that QT font libraries have been installed
> -RDEPENDS_${PN} +=3D "qt4-embedded-fonts"
> +RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
> +
> +DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRCREV =3D "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
> BRANCH ?=3D "master"
>=20
> SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
>=20
> -S =3D "${WORKDIR}/git"
> +SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5', 'file://qt5-webk=
it.patch file://qt5-gui-widgets-move.patch', '', d)}"
>=20
> -inherit qt4e
> +S =3D "${WORKDIR}/git"
>=20
> do_install() {
>    install -d ${D}/${bindir}
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

