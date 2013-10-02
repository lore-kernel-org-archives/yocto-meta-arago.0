Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 21F2052A1B
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:03:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92D3ntc020360;
	Wed, 2 Oct 2013 08:03:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92D3nuh027469;
	Wed, 2 Oct 2013 08:03:49 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 08:03:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 12/13] matrix-gui-browser: update recipe
	to be Qt4 and Qt5 compatible
Thread-Index: AQHOvnWC88uWBtarzky1k4VptLCtcJnhYrqg
Date: Wed, 2 Oct 2013 13:03:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A721@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-13-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-13-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 02 Oct 2013 13:03:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 12/13] matrix-gui-browser: update
>recipe to be Qt4 and Qt5 compatible
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Uses qt-provider class to build against either Qt4 or Qt5
>depending on global
>distro variable QT_PROVIDER.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../matrix/matrix-gui-browser/qt5-gui-widgets-move.patch     | 12
>++++++++++++
> .../recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch  | 12
>++++++++++++
> .../recipes-core/matrix/matrix-gui-browser_2.0.bb            | 12
>++++++++----
> 3 files changed, 32 insertions(+), 4 deletions(-)
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
>gui-browser/qt5-gui-widgets-move.patch
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
>gui-browser/qt5-webkit.patch
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser/qt5-gui-widgets-move.patch b/meta-arago-extras/recipes-
>core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
>new file mode 100644
>index 0000000..e725004
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser/qt5-gui-widgets-move.patch
>@@ -0,0 +1,12 @@
>+diff -uNr git-orig/main.cpp git/main.cpp
>+--- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
>++++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
>+@@ -36,7 +36,7 @@
>+  *
>+ */
>+
>+-#include <QtGui>
>++#include <QtWidgets>
>+ #include <QWebView>
>+ #include <QGraphicsWebView>
>+ #include <iostream>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser/qt5-webkit.patch b/meta-arago-extras/recipes-
>core/matrix/matrix-gui-browser/qt5-webkit.patch
>new file mode 100644
>index 0000000..abbbcc8
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser/qt5-webkit.patch
>@@ -0,0 +1,12 @@
>+diff -uNr git-orig/matrix_browser.pro git/matrix_browser.pro
>+--- git-orig/matrix_browser.pro	2013-09-29 18:43:16.000000000
>-0400
>++++ git/matrix_browser.pro	2013-09-29 19:00:24.182913775 -0400
>+@@ -6,7 +6,7 @@
>+ TARGET =3D matrix_browser
>+ DEPENDPATH +=3D .
>+ INCLUDEPATH +=3D .
>+-QT       +=3D   webkit
>++QT       +=3D   webkitwidgets
>+ # Input
>+ SOURCES +=3D main.cpp
>+
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>index 0e508a0..329b65a 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>browser_2.0.bb
>@@ -4,19 +4,23 @@ LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D
>"file://main.cpp;beginline=3D9;endline=3D37;md5=3D884b90f5bf0d711fe32c4f
>04b5276496"
> SECTION =3D "multimedia"
>
>+inherit qt-provider
>+
> # Make sure that QT font libraries have been installed
>-RDEPENDS_${PN} +=3D "qt4-embedded-fonts"
>+RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
>+
>+DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
>
>-PR =3D "r2"
>+PR =3D "r3"
>
> SRCREV =3D "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
> BRANCH ?=3D "master"
>
> SRC_URI =3D "git://gitorious.org/matrix-gui-
>v2/matrix_browser.git;protocol=3Dgit;branch=3D${BRANCH}"
>
>-S =3D "${WORKDIR}/git"
>+SRC_URI +=3D "${@base_conditional('QT_PROVIDER', 'qt5',
>'file://qt5-webkit.patch file://qt5-gui-widgets-move.patch', '',
>d)}"
>
>-inherit qt4e
>+S =3D "${WORKDIR}/git"
>
> do_install() {
> 	install -d ${D}/${bindir}
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

