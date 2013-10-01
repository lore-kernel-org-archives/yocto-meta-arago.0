Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 045B152990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:21:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DLhXG029569
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:21:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DLhh1001724
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 08:21:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 08:21:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DLhDp029710;
	Tue, 1 Oct 2013 08:21:43 -0500
Date: Tue, 1 Oct 2013 09:21:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131001132142.GC26572@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<32C95964-D2C3-474E-AE7F-3C9034384D0A@ti.com>
MIME-Version: 1.0
In-Reply-To: <32C95964-D2C3-474E-AE7F-3C9034384D0A@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 01 Oct 2013 13:21:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Don't expect this to be a final product upfront. This is not! This is just a 
proof of concept of integrating Qt5 into our distro (and later SDK). This is 
to provide people with early access to the framework, let them play with it, 
test the concept and start migrating their apps.


On Tue, Oct 01, 2013 at 12:42:54PM +0000, Cooper Jr., Franklin wrote:
> Can we place these patches in a temp master-qt5 branch while we work through 
> some issues?

While creating a separate branch should be fine, I don't see much need for 
it. It is designed to be transparent to the existing apps and works as is when 
defaults to Qt4. We can drop patch #11 that sets Qt5 as default and stick to 
Qt4 as the default for some time. But keeping it in master should enable 
people to start easily play with it and port apps.


> I am assuming we still need to evaluate the other Qt applications since I 
> only see patches for the Matrix app.

Correct.


> I'm also assuming tweaks also need to be done for the toolchain SDK.

Yes, could be. And as you noticed, it comes with a new test image just for 
Qt5 - I left existing images and packagegroups untouched. There are too many 
Qt4 dependencies hard coded there already...


> I thought Qt 5.1.1 was the first version that could be ran without SGX 
> support. Any way we can bump the version especially with the latest kernel 
> for 335x not currently having SGX support.

I used meta-qt5 master instead of dylan to be able to access 5.1.0 version. We 
can bump it further to 5.1.1, if upstream won't do it themselves any time 
soon. Right now I was concentrating on integrating everthing into Arago and 
picking up Prabu's patches to make eglfs work with SGX. Although, can't test 
it fully anyway...

-- 
Denys


> > On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > This patchset adds Qt5 integration with easy switching between Qt4 and Qt5,
> > as well as updates matrix-gui-browser to be built against one or another
> > version of Qt.
> > 
> > Denys Dmytriyenko (12):
> >  matrix-gui-browser: replace ${S} with ${B} in do_install()
> >  icu: overlay the latest version from oe-core/master
> >  icu: disable LDFLAGSICUDT that prevents loading libicudata.so
> >  qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
> >  qtwebkit: add WebGL on eglfs patches
> >  webkit-examples: enable building and packaging of examples
> >  qt5.bbclass: add new class similar to existing qt4e for configuring
> >    recipes
> >  qt-provider.bbclass: class to allow seamless switching between Qt4 and
> >    Qt5
> >  arago-prefs: load up Qt5 preferred versions
> >  arago.conf: set QT_PROVIDER to Qt5, bump distro version
> >  matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
> >  arago-qt5-image: add test minimal image for testing Qt5 migration
> > 
> > meta-arago-distro/classes/qt-provider.bbclass      |  19 ++
> > meta-arago-distro/classes/qt5.bbclass              |  20 ++
> > meta-arago-distro/conf/distro/arago.conf           |   4 +-
> > .../conf/distro/include/arago-prefs.inc            |   3 +
> > .../recipes-core/images/arago-qt5-image.bb         |  18 ++
> > .../qt5/qtbase/0001-qeglfswindow.cpp.patch         |  56 +++++
> > .../qt5/qtbase/0002-qeglfswindow.cpp.patch         |  34 +++
> > .../recipes-qt/qt5/qtbase_5.1.0.bbappend           |  10 +
> > .../qt5/qtwebkit-examples/examples-build.patch     |   9 +
> > .../qt5/qtwebkit-examples_5.1.0.bbappend           |   5 +
> > .../qt5/qtwebkit/GraphicsContext3DQt.cpp.patch     |  26 ++
> > .../qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch   | 270 +++++++++++++++++++++
> > .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch      |  33 +++
> > .../recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch  |  24 ++
> > .../recipes-qt/qt5/qtwebkit/Target.pri.patch       |  24 ++
> > .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch      |  25 ++
> > .../recipes-qt/qt5/qtwebkit/features.prf.patch     |  20 ++
> > .../qt5/qtwebkit/qttestbrowser.cpp.patch           |  24 ++
> > .../recipes-qt/qt5/qtwebkit_5.1.0.bbappend         |  14 ++
> > .../icu/icu-51.2/disable-ldflagsicudt.patch        |  12 +
> > .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       |  29 +++
> > meta-arago-distro/recipes-support/icu/icu.inc      |  55 +++++
> > meta-arago-distro/recipes-support/icu/icu_51.2.bb  |  14 ++
> > .../matrix-gui-browser/qt5-gui-widgets-move.patch  |  12 +
> > .../matrix/matrix-gui-browser/qt5-webkit.patch     |  12 +
> > .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |  14 +-
> > 26 files changed, 780 insertions(+), 6 deletions(-)
> > create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
> > create mode 100644 meta-arago-distro/classes/qt5.bbclass
> > create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.bb
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend
> > create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch
> > create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
> > create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
> > create mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bb
> > create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
> > create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch
> > 
> > -- 
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

