Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BB9B2529AF
	for <meta-arago@arago-project.org>;
	Tue,  8 Oct 2013 14:11:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r98EBh8p014603;
	Tue, 8 Oct 2013 09:11:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r98EBhrK028523;
	Tue, 8 Oct 2013 09:11:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 8 Oct 2013 09:11:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 00/12] Add Qt5 support and update
	matrix-browser to use either Qt4 or Qt5
Thread-Index: AQHOw4+SgXFfydZa30mN8bj45AOavZnq2WWA
Date: Tue, 8 Oct 2013 14:11:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159791129@DLEE11.ent.ti.com>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
In-Reply-To: <1381172427-18302-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 00/12] Add Qt5 support and update matrix-browser to use either Qt4 or Qt5
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
X-List-Received-Date: Tue, 08 Oct 2013 14:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This series is OK with me:

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, October 07, 2013 2:00 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 00/12] Add Qt5 support and update
>matrix-browser to use either Qt4 or Qt5
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>This patchset adds Qt5 integration with easy switching between Qt4
>and Qt5,
>as well as updates matrix-gui-browser to be built against one or
>another
>version of Qt. Additional apps will be updated soon to build with
>Qt4/Qt5 and
>utilize provided classes.
>
>It is version 2 of the patchset with one patch that set Qt5 as
>default dropped
>completely and patches #2, 3, 6, 12 addressing comments from the
>first set -
>they are marked with [PATCHv2] prefix.
>
>The goal is to get the base integration of Qt5 into meta-
>arago/master ASAP to
>enable further development and updating recipes and packagegroups
>to use Qt5.
>
>Denys Dmytriyenko (11):
>  matrix-gui-browser: replace ${S} with ${B} in do_install()
>  icu: overlay the latest version from oe-core/master
>  icu: disable LDFLAGSICUDT that prevents loading libicudata.so
>  qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
>  qtwebkit: add WebGL on eglfs patches
>  webkit-examples: enable building and packaging of examples
>  qt5.bbclass: add new class similar to existing qt4e for
>configuring
>    recipes
>  qt-provider.bbclass: class to allow seamless switching between
>Qt4 and
>    Qt5
>  arago-prefs: load up Qt5 preferred versions
>  matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
>  arago-qt5-test-image: add test minimal image for testing Qt5
>migration
>
> meta-arago-distro/classes/qt-provider.bbclass      |  19 ++
> meta-arago-distro/classes/qt5.bbclass              |  20 ++
> .../conf/distro/include/arago-prefs.inc            |   3 +
> .../recipes-core/images/arago-qt5-test-image.bb    |  16 ++
> .../qt5/qtbase/0001-qeglfswindow.cpp.patch         |  56 +++++
> .../qt5/qtbase/0002-qeglfswindow.cpp.patch         |  34 +++
> .../recipes-qt/qt5/qtbase_5.1.0.bbappend           |  10 +
> .../qt5/qtwebkit-examples/examples-build.patch     |   9 +
> .../qt5/qtwebkit-examples_5.1.0.bbappend           |   5 +
> .../qt5/qtwebkit/GraphicsContext3DQt.cpp.patch     |  26 ++
> .../qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch   | 270
>+++++++++++++++++++++
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
> 26 files changed, 777 insertions(+), 7 deletions(-)
> create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
> create mode 100644 meta-arago-distro/classes/qt5.bbclass
> create mode 100644 meta-arago-distro/recipes-core/images/arago-
>qt5-test-image.bb
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-
>qeglfswindow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-
>qeglfswindow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtbase_5.1.0.bbappend
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples/examples-build.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples_5.1.0.bbappend
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/OpenGLShims.cpp.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/Target.pri.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/WebCore.pri.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/features.prf.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit/qttestbrowser.cpp.patch
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtwebkit_5.1.0.bbappend
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-
>51.2/disable-ldflagsicudt.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-
>51.2/icu-pkgdata-large-cmd.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
> create mode 100644 meta-arago-distro/recipes-
>support/icu/icu_51.2.bb
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
>gui-browser/qt5-gui-widgets-move.patch
> create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
>gui-browser/qt5-webkit.patch
>
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

