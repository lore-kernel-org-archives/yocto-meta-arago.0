Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 513A252A31
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 16:56:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OGugLE012282;
	Thu, 24 Jul 2014 11:56:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OGugWj001126;
	Thu, 24 Jul 2014 11:56:42 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 11:56:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/11] qt5: update bbappends to match
	version 5.2.1 in meta-qt5/daisy
Thread-Index: AQHPorlzF2R1po43X0KRJKKENuYO/JuveeHQ
Date: Thu, 24 Jul 2014 16:56:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9A60@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
In-Reply-To: <1405709522-404-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 24 Jul 2014 16:56:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Some reason I thought I asked this before but does not applicable mean not =
needed or does applicable simply mean it doesn't apply?

Since we are using Wayland/Weston do we still need eglfs?=20

ACK on the patch since it doesn't make a difference but it would be nice to=
 know if we still have gap or not.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 2:52 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 01/11] qt5: update bbappends to match versio=
n
> 5.2.1 in meta-qt5/daisy
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> qtbase patches are not applicable to 5.2.1
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../qt5/qtbase/0001-qeglfswindow.cpp.patch         | 56 ----------------=
------
>  .../qt5/qtbase/0002-qeglfswindow.cpp.patch         | 34 -------------
>  .../recipes-qt/qt5/qtbase_5.2.0.bbappend           |  8 ----
>  ...bkit_5.2.0.bbappend =3D> qtwebkit_5.2.1.bbappend} |  0
>  4 files changed, 98 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> qeglfswindow.cpp.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> qeglfswindow.cpp.patch
>  delete mode 100644 meta-arago-distro/recipes-
> qt/qt5/qtbase_5.2.0.bbappend
>  rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.2.0.bbappend =3D>
> qtwebkit_5.2.1.bbappend} (100%)
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-
> qeglfswindow.cpp.patch
> deleted file mode 100644
> index b95b98e..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> ---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.orig	2013-08-09
> 23:29:18.253037952 +0530
> -+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-08-09
> 23:41:18.509018405 +0530
> -@@ -61,23 +61,32 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> - #endif
> - }
> -
> - QEglFSWindow::~QEglFSWindow()
> - {
> -     destroy();
> - }
> -
> -+static EGLSurface __singleWindowSurface;
> - void QEglFSWindow::create()
> - {
> -     if (m_window)
> -         return;
> -
> -     setWindowState(Qt::WindowFullScreen);
> -
> -+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> >hasCapability(QPlatformIntegration::Capability::MultipleWindows) &&
> __singleWindowSurface)
> -+    {
> -+        m_surface =3D __singleWindowSurface; #ifdef QEGL_EXTRA_DEBUG
> -+    qWarning("Surface recreate request, re-using %x\n", m_surface);
> -+#endif
> -+       return;
> -+    }
> -     if (window()->type() =3D=3D Qt::Desktop) {
> -         QRect rect(QPoint(), QEglFSHooks::hooks()->screenSize());
> -         QPlatformWindow::setGeometry(rect);
> -         QWindowSystemInterface::handleGeometryChange(window(), rect);
> -         return;
> -     }
> -
> -     EGLDisplay display =3D (static_cast<QEglFSScreen *>(window()->scree=
n()-
> >handle()))->display();
> -@@ -104,16 +113,20 @@ void QEglFSWindow::resetSurface()
> -
> -     m_window =3D QEglFSHooks::hooks()-
> >createNativeWindow(QEglFSHooks::hooks()->screenSize(), m_format);
> -     m_surface =3D eglCreateWindowSurface(display, m_config, m_window,
> NULL);
> -     if (m_surface =3D=3D EGL_NO_SURFACE) {
> -         EGLint error =3D eglGetError();
> -         eglTerminate(display);
> -         qFatal("EGL Error : Could not create the egl surface: error =3D=
 0x%x\n",
> error);
> -     }
> -+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> >hasCapability(QPlatformIntegration::Capability::MultipleWindows))
> -+    {
> -+        __singleWindowSurface =3D m_surface;
> -+    }
> - }
> -
> - void QEglFSWindow::destroy()
> - {
> -     if (m_surface) {
> -         EGLDisplay display =3D static_cast<QEglFSScreen *>(screen())->d=
isplay();
> -         eglDestroySurface(display, m_surface);
> -         m_surface =3D 0;
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-
> qeglfswindow.cpp.patch
> deleted file mode 100644
> index 8d17348..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> ---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.old	2013-09-09
> 23:09:24.433774489 +0530
> -+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-09-09
> 23:12:22.105766689 +0530
> -@@ -54,30 +54,30 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> -     , m_surface(0)
> -     , m_window(0)
> - {
> -     static int serialNo =3D 0;
> -     m_winid  =3D ++serialNo;
> - #ifdef QEGL_EXTRA_DEBUG
> -     qWarning("QEglWindow %p: %p 0x%x\n", this, w, uint(m_winid));
> - #endif
> -+    setWindowState(Qt::WindowFullScreen);
> - }
> -
> - QEglFSWindow::~QEglFSWindow()
> - {
> -     destroy();
> - }
> -
> - static EGLSurface __singleWindowSurface;
> - void QEglFSWindow::create()
> - {
> -     if (m_window)
> -         return;
> -
> --    setWindowState(Qt::WindowFullScreen);
> -
> -     if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()-
> >hasCapability(QPlatformIntegration::Capability::MultipleWindows) &&
> __singleWindowSurface)
> -     {
> -         m_surface =3D __singleWindowSurface;
> - #ifdef QEGL_EXTRA_DEBUG
> -     qWarning("Surface recreate request, re-using %x\n", m_surface);
> - #endif
> -        return;
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend b/met=
a-
> arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> deleted file mode 100644
> index 2c0a52d..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -SRC_URI +=3D " \
> -	file://0001-qeglfswindow.cpp.patch \
> -	file://0002-qeglfswindow.cpp.patch \
> -"
> -
> -PR_append =3D "-arago1"
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
> b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> similarity index 100%
> rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
> rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

