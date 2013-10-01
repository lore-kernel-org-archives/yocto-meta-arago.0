Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 3D9D752099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:46 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00FI1AMR7X00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 13F612004C; Tue,
	01 Oct 2013 03:11:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:10:59 -0400
Message-id: <1380611472-23600-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 00/13] RFC: Add Qt5 support and update matrix-browser to use either Qt4 or Qt5
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patchset adds Qt5 integration with easy switching between Qt4 and Qt5,
as well as updates matrix-gui-browser to be built against one or another
version of Qt.

Denys Dmytriyenko (12):
  matrix-gui-browser: replace ${S} with ${B} in do_install()
  icu: overlay the latest version from oe-core/master
  icu: disable LDFLAGSICUDT that prevents loading libicudata.so
  qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
  qtwebkit: add WebGL on eglfs patches
  webkit-examples: enable building and packaging of examples
  qt5.bbclass: add new class similar to existing qt4e for configuring
    recipes
  qt-provider.bbclass: class to allow seamless switching between Qt4 and
    Qt5
  arago-prefs: load up Qt5 preferred versions
  arago.conf: set QT_PROVIDER to Qt5, bump distro version
  matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
  arago-qt5-image: add test minimal image for testing Qt5 migration

 meta-arago-distro/classes/qt-provider.bbclass      |  19 ++
 meta-arago-distro/classes/qt5.bbclass              |  20 ++
 meta-arago-distro/conf/distro/arago.conf           |   4 +-
 .../conf/distro/include/arago-prefs.inc            |   3 +
 .../recipes-core/images/arago-qt5-image.bb         |  18 ++
 .../qt5/qtbase/0001-qeglfswindow.cpp.patch         |  56 +++++
 .../qt5/qtbase/0002-qeglfswindow.cpp.patch         |  34 +++
 .../recipes-qt/qt5/qtbase_5.1.0.bbappend           |  10 +
 .../qt5/qtwebkit-examples/examples-build.patch     |   9 +
 .../qt5/qtwebkit-examples_5.1.0.bbappend           |   5 +
 .../qt5/qtwebkit/GraphicsContext3DQt.cpp.patch     |  26 ++
 .../qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch   | 270 +++++++++++++++++++++
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch      |  33 +++
 .../recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch  |  24 ++
 .../recipes-qt/qt5/qtwebkit/Target.pri.patch       |  24 ++
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch      |  25 ++
 .../recipes-qt/qt5/qtwebkit/features.prf.patch     |  20 ++
 .../qt5/qtwebkit/qttestbrowser.cpp.patch           |  24 ++
 .../recipes-qt/qt5/qtwebkit_5.1.0.bbappend         |  14 ++
 .../icu/icu-51.2/disable-ldflagsicudt.patch        |  12 +
 .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       |  29 +++
 meta-arago-distro/recipes-support/icu/icu.inc      |  55 +++++
 meta-arago-distro/recipes-support/icu/icu_51.2.bb  |  14 ++
 .../matrix-gui-browser/qt5-gui-widgets-move.patch  |  12 +
 .../matrix/matrix-gui-browser/qt5-webkit.patch     |  12 +
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |  14 +-
 26 files changed, 780 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
 create mode 100644 meta-arago-distro/classes/qt5.bbclass
 create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.bb
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend
 create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch
 create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
 create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
 create mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bb
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch

-- 
1.8.3.2


