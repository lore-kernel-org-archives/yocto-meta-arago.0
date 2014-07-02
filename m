Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9401952A83
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 19:18:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62JI4uf022130;
	Wed, 2 Jul 2014 14:18:04 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62JI3SC016456;
	Wed, 2 Jul 2014 14:18:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 14:18:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62JI3HF009199;
	Wed, 2 Jul 2014 14:18:04 -0500
Date: Wed, 2 Jul 2014 15:18:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ulf Samuelsson <meta-arago@emagii.com>
Message-ID: <20140702191802.GB15788@edge>
References: <53B44965.5050502@emagii.com> <53B449D5.30600@emagii.com>
	<20140702181315.GA15788@edge> <53B459CC.20805@emagii.com>
MIME-Version: 1.0
In-Reply-To: <53B459CC.20805@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-ti] Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase.
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
X-List-Received-Date: Wed, 02 Jul 2014 19:18:05 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 02, 2014 at 09:13:16PM +0200, Ulf Samuelsson wrote:
> 2014-07-02 20:13, Denys Dmytriyenko skrev:
> >On Wed, Jul 02, 2014 at 08:05:09PM +0200, Ulf Samuelsson wrote:
> >>-------- Ursprungligt meddelande -------
> >>Ämne: 	Re: [meta-ti] Build of qtbase fails due to no OpenGL
> >>libraries, but completes after cleaning qtbase.
> >>Datum: 	Wed, 2 Jul 2014 09:32:27 -0400
> >>Från: 	Denys Dmytriyenko <denys@ti.com>
> >>Till: 	Ulf Samuelsson <meta-ti@emagii.com>
> >>Kopia: 	<meta-ti@yoctoproject.org>
> >>
> >>
> >>
> >>On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> >>>When I build an image with QT5 using meta-arago, qtbase fails with a
> >>>lot of error messages.
> >>>This is the wrong mailing list - meta-ti has nothing to do with qtbase.
> >>>Moreover, why are you still using 5.1.1? There were many fixes in Qt5 5.2.x
> >>>and 5.3.x. Also, it depends on your setup and what layers and features you
> >>>configure. Either way, it's a discussion for a distro layer, you can use
> >>>meta-arago mailing list for that...
> >>
> >>I looked through meta-arago and meta-qt5 about a month ago for compatability.
> >>
> >>I checked again today:
> >>
> >>meta-qt5/master	= 5.3.0
> >>meta-qt5/daisy	= 5.2.1
> >>meta-qt5/dora	= 5.1.1
> >>
> >>meta-arago/master = 5.2.0
> >>meta-arago/dora   = 5.2.0 (used to be 5.1.1)
> >>There is no meta-arago/daisy branch.
> >>
> >>The only revision I could find which was available in both was 5.1.1.
> >>and that is why I used it.
> >>
> >>It would make sense if the qt5 related recipes in meta-arago matched those in meta-qt5.
> >>
> >>Now meta-arago is using 5.2.0 which is not present in any branch of meta-qt5
> >>(did not check old branches, only dora and daisy).
> >>
> >>I dont understand why the meta-arago:dora recipes for qt5 has been updated from 5.1.1 to 5.2.0,
> >>thus making it incompatible with meta-qt5:dora. Isn't this a mistake.
> >meta-qt5 for long time only had master, moreover, due to some requirements, we
> >needed latest 5.2 version of qt5, which was only available from master and
> >not from Dora, while meta-arago was generally Dora based. Since then meta-qt5
> >was updated to 5.2.1, and meta-arago has recently switched to Daisy - some
> >cleanup is still going on...
> >
> I think in order to clean up:
> 1) meta-arago:dora should switch back to 5.1.1
> 2) a daisy branch should be added to meta-arago (or daisy-devel) using 5.2.1
> 3) meta-arago:master should be 5.3.0
> 
> 5.2.0 recipes should be deleted, or moved to an intermediate branch
> (daisy-rc1?)

No.


> >>>Some errors:
> >>>
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:52:1:
> >>>error: expected class-name before '{' token
> >>>linking part1
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> >>>In destructor 'virtual OpenGLWindow::~OpenGLWindow()':
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> >>>warning: possible problem detected in invocation of delete operator:
> >>>[enabled by default]
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> >>>warning: invalid use of incomplete type 'class QOpenGLPaintDevice'
> >>>[enabled by default]
> >>>In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> >>>warning: forward declaration of 'class QOpenGLPaintDevice' [enabled
> >>>by default]
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> >>>note: neither the destructor nor the class-specific operator delete
> >>>will be called, even if they are declared when the class is defined
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> >>>In member function 'virtual void OpenGLWindow::render()':
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:78:24:
> >>>error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> >>>In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> >>>error: forward declaration of 'class QOpenGLPaintDevice'
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:13:
> >>>error: 'GL_COLOR_BUFFER_BIT' was not declared in this scope
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:35:
> >>>error: 'GL_DEPTH_BUFFER_BIT' was not declared in this scope
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:57:
> >>>error: 'GL_STENCIL_BUFFER_BIT' was not declared in this scope
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:78:
> >>>error: 'glClear' was not declared in this scope
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:82:13:
> >>>error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> >>>In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> >>>error: forward declaration of 'class QOpenGLPaintDevice'
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> >>>error: no matching function for call to
> >>>'QPainter::QPainter(QOpenGLPaintDevice*&)'
> >>>$TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> >>>note: candidates are:
> >>>In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/qpainter.h:1:0,
> >>>                 from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/QPainter:1,
> >>>                 from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:47:
> >>>
> >>>Googling indicates that this is because:
> >>>
> >>>   "If -no-opengl is specified and OpenGL development files are
> >>>installed, the error does occur."
> >>>
> >>>If I clean out qtbase, and then continue build, it will complete.
> >>>$ bitbase -c cleansstate qtbase
> >>>$ bitbake <image>
> >>>
> >>>My guess is that during configuration, OpenGL cannot be found, but
> >>>it is there during compile.
> >>>There seems to be a dependency error (libgles-omap3?).
> >>>
> >>>
> >>>
> >>>
> >>>BR
> >>>Ulf Samuelsson
> >>>--
> >>>_______________________________________________
> >>>meta-ti mailing list
> >>>meta-ti@yoctoproject.org
> >>>https://lists.yoctoproject.org/listinfo/meta-ti
> >>
> >>
> >>
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

