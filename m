Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2AD9452990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:21:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DLW2n025855;
	Tue, 1 Oct 2013 08:21:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DLW8o001441;
	Tue, 1 Oct 2013 08:21:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:21:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 05/13] qtbase: configure and patch Qt5
	qtbase for use with SGX in Arago
Thread-Index: AQHOvnWC7FmG2cgxIkKRKShjcF6KPpnf1V73
Date: Tue, 1 Oct 2013 13:21:31 +0000
Message-ID: <F4EA8038-193E-4836-8DC2-AD31E460058B@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-6-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-6-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 05/13] qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
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
X-List-Received-Date: Tue, 01 Oct 2013 13:21:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Enable gles2/eglfs and icu features
> * Add slightly modified eglfs patches from Prabu
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../qt5/qtbase/0001-qeglfswindow.cpp.patch         | 56 +++++++++++++++++=
+++++
> .../qt5/qtbase/0002-qeglfswindow.cpp.patch         | 34 +++++++++++++
> .../recipes-qt/qt5/qtbase_5.1.0.bbappend           | 10 ++++
> 3 files changed, 100 insertions(+)
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswin=
dow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswin=
dow.cpp.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cp=
p.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.pat=
ch
> new file mode 100644
> index 0000000..b95b98e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
> @@ -0,0 +1,56 @@
> +--- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.orig    2013-08-=
09 23:29:18.253037952 +0530
> ++++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp    2013-08-09 23=
:41:18.509018405 +0530
> +@@ -61,23 +61,32 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> + #endif
> + }
> +=20
> + QEglFSWindow::~QEglFSWindow()
> + {
> +     destroy();
> + }
> +=20
> ++static EGLSurface __singleWindowSurface;
> + void QEglFSWindow::create()
> + {
> +     if (m_window)
> +         return;
> +=20
> +     setWindowState(Qt::WindowFullScreen);
> +=20
> ++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPl=
atformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
> ++    {
> ++        m_surface =3D __singleWindowSurface;
> ++#ifdef QEGL_EXTRA_DEBUG
> ++    qWarning("Surface recreate request, re-using %x\n", m_surface);
> ++#endif
> ++       return;
> ++    }
> +     if (window()->type() =3D=3D Qt::Desktop) {
> +         QRect rect(QPoint(), QEglFSHooks::hooks()->screenSize());
> +         QPlatformWindow::setGeometry(rect);
> +         QWindowSystemInterface::handleGeometryChange(window(), rect);
> +         return;
> +     }
> +=20
> +     EGLDisplay display =3D (static_cast<QEglFSScreen *>(window()->scree=
n()->handle()))->display();
> +@@ -104,16 +113,20 @@ void QEglFSWindow::resetSurface()
> +=20
> +     m_window =3D QEglFSHooks::hooks()->createNativeWindow(QEglFSHooks::=
hooks()->screenSize(), m_format);
> +     m_surface =3D eglCreateWindowSurface(display, m_config, m_window, N=
ULL);
> +     if (m_surface =3D=3D EGL_NO_SURFACE) {
> +         EGLint error =3D eglGetError();
> +         eglTerminate(display);
> +         qFatal("EGL Error : Could not create the egl surface: error =3D=
 0x%x\n", error);
> +     }
> ++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPl=
atformIntegration::Capability::MultipleWindows))
> ++    {
> ++        __singleWindowSurface =3D m_surface;
> ++    }
> + }
> +=20
> + void QEglFSWindow::destroy()
> + {
> +     if (m_surface) {
> +         EGLDisplay display =3D static_cast<QEglFSScreen *>(screen())->d=
isplay();
> +         eglDestroySurface(display, m_surface);
> +         m_surface =3D 0;
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cp=
p.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.pat=
ch
> new file mode 100644
> index 0000000..8d17348
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
> @@ -0,0 +1,34 @@
> +--- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.old    2013-09-0=
9 23:09:24.433774489 +0530
> ++++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp    2013-09-09 23=
:12:22.105766689 +0530
> +@@ -54,30 +54,30 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
> +     , m_surface(0)
> +     , m_window(0)
> + {
> +     static int serialNo =3D 0;
> +     m_winid  =3D ++serialNo;
> + #ifdef QEGL_EXTRA_DEBUG
> +     qWarning("QEglWindow %p: %p 0x%x\n", this, w, uint(m_winid));
> + #endif
> ++    setWindowState(Qt::WindowFullScreen);
> + }
> +=20
> + QEglFSWindow::~QEglFSWindow()
> + {
> +     destroy();
> + }
> +=20
> + static EGLSurface __singleWindowSurface;
> + void QEglFSWindow::create()
> + {
> +     if (m_window)
> +         return;
> +=20
> +-    setWindowState(Qt::WindowFullScreen);
> +=20
> +     if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPl=
atformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
> +     {
> +         m_surface =3D __singleWindowSurface;
> + #ifdef QEGL_EXTRA_DEBUG
> +     qWarning("Surface recreate request, re-using %x\n", m_surface);
> + #endif
> +        return;
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend b/met=
a-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
> new file mode 100644
> index 0000000..8ae7706
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +PACKAGECONFIG_GL =3D "gles2 icu"
> +
> +SRC_URI +=3D " \
> +    file://0001-qeglfswindow.cpp.patch \
> +    file://0002-qeglfswindow.cpp.patch \
> +"
> +
> +PR_append =3D "-arago0"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

