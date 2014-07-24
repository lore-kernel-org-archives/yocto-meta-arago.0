Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9DF6452994
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:18:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIIbqC013174;
	Thu, 24 Jul 2014 13:18:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIIbG0030095;
	Thu, 24 Jul 2014 13:18:37 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Jul 2014 13:18:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIIb2k027709;
	Thu, 24 Jul 2014 13:18:37 -0500
Date: Thu, 24 Jul 2014 14:18:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140724181836.GQ15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6E9A60@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E9A60@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 01/11] qt5: update bbappends to match version 5.2.1 in meta-qt5/daisy
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
X-List-Received-Date: Thu, 24 Jul 2014 18:18:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

It actually means both - they no longer apply and by checking the sources I 
see the functionality is pretty much there, although sometimes it's not 
implemented the same exact way as in the patches.


On Thu, Jul 24, 2014 at 04:56:41PM +0000, Cooper Jr., Franklin wrote:
> Some reason I thought I asked this before but does not applicable mean not 
> needed or does applicable simply mean it doesn't apply?
> 
> Since we are using Wayland/Weston do we still need eglfs? 
> 
> ACK on the patch since it doesn't make a difference but it would be nice to 
> know if we still have gap or not.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, July 18, 2014 2:52 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 01/11] qt5: update bbappends to match version
> > 5.2.1 in meta-qt5/daisy
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > qtbase patches are not applicable to 5.2.1
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../qt5/qtbase/0001-qeglfswindow.cpp.patch         | 56 ----------------------
> >  .../qt5/qtbase/0002-qeglfswindow.cpp.patch         | 34 -------------
> >  .../recipes-qt/qt5/qtbase_5.2.0.bbappend           |  8 ----
> >  ...bkit_5.2.0.bbappend => qtwebkit_5.2.1.bbappend} |  0
> >  4 files changed, 98 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> > qeglfswindow.cpp.patch
> >  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> > qeglfswindow.cpp.patch
> >  delete mode 100644 meta-arago-distro/recipes-
> > qt/qt5/qtbase_5.2.0.bbappend
> >  rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.2.0.bbappend =>
> > qtwebkit_5.2.1.bbappend} (100%)
> > 
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> > qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> > qeglfswindow.cpp.patch
> > deleted file mode 100644
> > index b95b98e..0000000
> > --- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
> > +++ /dev/null
> > @@ -1,56 +0,0 @@
> > ---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.orig	2013-08-09
> > 23:29:18.253037952 +0530
> > -+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-08-09
> > 23:41:18.509018405 +0530
> > -@@ -61,23 +61,32 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> > - #endif
> > - }
> > -
> > - QEglFSWindow::~QEglFSWindow()
> > - {
> > -     destroy();
> > - }
> > -
> > -+static EGLSurface __singleWindowSurface;
> > - void QEglFSWindow::create()
> > - {
> > -     if (m_window)
> > -         return;
> > -
> > -     setWindowState(Qt::WindowFullScreen);
> > -
> > -+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> > >hasCapability(QPlatformIntegration::Capability::MultipleWindows) &&
> > __singleWindowSurface)
> > -+    {
> > -+        m_surface = __singleWindowSurface; #ifdef QEGL_EXTRA_DEBUG
> > -+    qWarning("Surface recreate request, re-using %x\n", m_surface);
> > -+#endif
> > -+       return;
> > -+    }
> > -     if (window()->type() == Qt::Desktop) {
> > -         QRect rect(QPoint(), QEglFSHooks::hooks()->screenSize());
> > -         QPlatformWindow::setGeometry(rect);
> > -         QWindowSystemInterface::handleGeometryChange(window(), rect);
> > -         return;
> > -     }
> > -
> > -     EGLDisplay display = (static_cast<QEglFSScreen *>(window()->screen()-
> > >handle()))->display();
> > -@@ -104,16 +113,20 @@ void QEglFSWindow::resetSurface()
> > -
> > -     m_window = QEglFSHooks::hooks()-
> > >createNativeWindow(QEglFSHooks::hooks()->screenSize(), m_format);
> > -     m_surface = eglCreateWindowSurface(display, m_config, m_window,
> > NULL);
> > -     if (m_surface == EGL_NO_SURFACE) {
> > -         EGLint error = eglGetError();
> > -         eglTerminate(display);
> > -         qFatal("EGL Error : Could not create the egl surface: error = 0x%x\n",
> > error);
> > -     }
> > -+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> > >hasCapability(QPlatformIntegration::Capability::MultipleWindows))
> > -+    {
> > -+        __singleWindowSurface = m_surface;
> > -+    }
> > - }
> > -
> > - void QEglFSWindow::destroy()
> > - {
> > -     if (m_surface) {
> > -         EGLDisplay display = static_cast<QEglFSScreen *>(screen())->display();
> > -         eglDestroySurface(display, m_surface);
> > -         m_surface = 0;
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> > qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> > qeglfswindow.cpp.patch
> > deleted file mode 100644
> > index 8d17348..0000000
> > --- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > ---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.old	2013-09-09
> > 23:09:24.433774489 +0530
> > -+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-09-09
> > 23:12:22.105766689 +0530
> > -@@ -54,30 +54,30 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> > -     , m_surface(0)
> > -     , m_window(0)
> > - {
> > -     static int serialNo = 0;
> > -     m_winid  = ++serialNo;
> > - #ifdef QEGL_EXTRA_DEBUG
> > -     qWarning("QEglWindow %p: %p 0x%x\n", this, w, uint(m_winid));
> > - #endif
> > -+    setWindowState(Qt::WindowFullScreen);
> > - }
> > -
> > - QEglFSWindow::~QEglFSWindow()
> > - {
> > -     destroy();
> > - }
> > -
> > - static EGLSurface __singleWindowSurface;
> > - void QEglFSWindow::create()
> > - {
> > -     if (m_window)
> > -         return;
> > -
> > --    setWindowState(Qt::WindowFullScreen);
> > -
> > -     if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> > >hasCapability(QPlatformIntegration::Capability::MultipleWindows) &&
> > __singleWindowSurface)
> > -     {
> > -         m_surface = __singleWindowSurface;
> > - #ifdef QEGL_EXTRA_DEBUG
> > -     qWarning("Surface recreate request, re-using %x\n", m_surface);
> > - #endif
> > -        return;
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend b/meta-
> > arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> > deleted file mode 100644
> > index 2c0a52d..0000000
> > --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > -
> > -SRC_URI += " \
> > -	file://0001-qeglfswindow.cpp.patch \
> > -	file://0002-qeglfswindow.cpp.patch \
> > -"
> > -
> > -PR_append = "-arago1"
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
> > b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> > similarity index 100%
> > rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
> > rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> > --
> > 2.0.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

