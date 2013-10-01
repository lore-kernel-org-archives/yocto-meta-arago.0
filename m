Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E213652099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 12:42:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91CguNo013424;
	Tue, 1 Oct 2013 07:42:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91CguwS008581;
	Tue, 1 Oct 2013 07:42:56 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 07:42:56 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 00/13] RFC: Add Qt5 support and update
	matrix-browser to use either Qt4 or Qt5
Thread-Index: AQHOvnWCWUFWKbJQq0qwCZz64SSyJZnfypU3
Date: Tue, 1 Oct 2013 12:42:54 +0000
Message-ID: <32C95964-D2C3-474E-AE7F-3C9034384D0A@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 00/13] RFC: Add Qt5 support and update matrix-browser to use either Qt4 or Qt5
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
X-List-Received-Date: Tue, 01 Oct 2013 12:42:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we place these patches in a temp master-qt5 branch while we work throug=
h some issues?

I am assuming we still need to evaluate the other Qt applications since I o=
nly see patches for the Matrix app.

I'm also assuming tweaks also need to be done for the toolchain SDK.

I thought Qt 5.1.1 was the first version that could be ran without SGX supp=
ort. Any way we can bump the version especially with the latest kernel for =
335x not currently having SGX support.



> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> This patchset adds Qt5 integration with easy switching between Qt4 and Qt=
5,
> as well as updates matrix-gui-browser to be built against one or another
> version of Qt.
>=20
> Denys Dmytriyenko (12):
>  matrix-gui-browser: replace ${S} with ${B} in do_install()
>  icu: overlay the latest version from oe-core/master
>  icu: disable LDFLAGSICUDT that prevents loading libicudata.so
>  qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
>  qtwebkit: add WebGL on eglfs patches
>  webkit-examples: enable building and packaging of examples
>  qt5.bbclass: add new class similar to existing qt4e for configuring
>    recipes
>  qt-provider.bbclass: class to allow seamless switching between Qt4 and
>    Qt5
>  arago-prefs: load up Qt5 preferred versions
>  arago.conf: set QT_PROVIDER to Qt5, bump distro version
>  matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
>  arago-qt5-image: add test minimal image for testing Qt5 migration
>=20
> meta-arago-distro/classes/qt-provider.bbclass      |  19 ++
> meta-arago-distro/classes/qt5.bbclass              |  20 ++
> meta-arago-distro/conf/distro/arago.conf           |   4 +-
> .../conf/distro/include/arago-prefs.inc            |   3 +
> .../recipes-core/images/arago-qt5-image.bb         |  18 ++
> .../qt5/qtbase/0001-qeglfswindow.cpp.patch         |  56 +++++
> .../qt5/qtbase/0002-qeglfswindow.cpp.patch         |  34 +++
> .../recipes-qt/qt5/qtbase_5.1.0.bbappend           |  10 +
> .../qt5/qtwebkit-examples/examples-build.patch     |   9 +
> .../qt5/qtwebkit-examples_5.1.0.bbappend           |   5 +
> .../qt5/qtwebkit/GraphicsContext3DQt.cpp.patch     |  26 ++
> .../qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch   | 270 ++++++++++++++++=
+++++
> .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch      |  33 +++
> .../recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch  |  24 ++
> .../recipes-qt/qt5/qtwebkit/Target.pri.patch       |  24 ++
> .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch      |  25 ++
> .../recipes-qt/qt5/qtwebkit/features.prf.patch     |  20 ++
> .../qt5/qtwebkit/qttestbrowser.cpp.patch           |  24 ++
> .../recipes-qt/qt5/qtwebkit_5.1.0.bbappend         |  14 ++
> .../icu/icu-51.2/disable-ldflagsicudt.patch        |  12 +
> .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       |  29 +++
> meta-arago-distro/recipes-support/icu/icu.inc      |  55 +++++
> meta-arago-distro/recipes-support/icu/icu_51.2.bb  |  14 ++
> .../matrix-gui-browser/qt5-gui-widgets-move.patch  |  12 +
> .../matrix/matrix-gui-browser/qt5-webkit.patch     |  12 +
> .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |  14 +-
> 26 files changed, 780 insertions(+), 6 deletions(-)
> create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
> create mode 100644 meta-arago-distro/classes/qt5.bbclass
> create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.=
bb
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswin=
dow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswin=
dow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/exa=
mples-build.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1=
.0.bbappend
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsCont=
ext3DQt.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurf=
aceGL_NoX.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurf=
aceToken.h.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.=
cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.p=
atch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.=
patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf=
.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowse=
r.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappe=
nd
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/disable=
-ldflagsicudt.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkg=
data-large-cmd.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
> create mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bb
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-brows=
er/qt5-gui-widgets-move.patch
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-brows=
er/qt5-webkit.patch
>=20
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

