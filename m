Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 4753652A67
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2013 19:01:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB006WIBH3P0F1@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Oct 2013 14:00:49 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DF2E6201B5; Mon,
	07 Oct 2013 15:00:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Oct 2013 15:00:20 -0400
Message-id: <1381172427-18302-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381172427-18302-1-git-send-email-denis@denix.org>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
Subject: [PATCH 05/12] qtbase: configure and patch Qt5 qtbase for use with SGX in Arago
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
X-List-Received-Date: Mon, 07 Oct 2013 19:01:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Enable gles2/eglfs and icu features
* Add slightly modified eglfs patches from Prabu

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin S. Cooper Jr <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
---
 .../qt5/qtbase/0001-qeglfswindow.cpp.patch         | 56 ++++++++++++++++++++++
 .../qt5/qtbase/0002-qeglfswindow.cpp.patch         | 34 +++++++++++++
 .../recipes-qt/qt5/qtbase_5.1.0.bbappend           | 10 ++++
 3 files changed, 100 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
new file mode 100644
index 0000000..b95b98e
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
@@ -0,0 +1,56 @@
+--- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.orig	2013-08-09 23:29:18.253037952 +0530
++++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-08-09 23:41:18.509018405 +0530
+@@ -61,23 +61,32 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
+ #endif
+ }
+ 
+ QEglFSWindow::~QEglFSWindow()
+ {
+     destroy();
+ }
+ 
++static EGLSurface __singleWindowSurface;
+ void QEglFSWindow::create()
+ {
+     if (m_window)
+         return;
+ 
+     setWindowState(Qt::WindowFullScreen);
+ 
++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
++    {
++        m_surface = __singleWindowSurface;
++#ifdef QEGL_EXTRA_DEBUG
++    qWarning("Surface recreate request, re-using %x\n", m_surface);
++#endif
++       return;
++    }
+     if (window()->type() == Qt::Desktop) {
+         QRect rect(QPoint(), QEglFSHooks::hooks()->screenSize());
+         QPlatformWindow::setGeometry(rect);
+         QWindowSystemInterface::handleGeometryChange(window(), rect);
+         return;
+     }
+ 
+     EGLDisplay display = (static_cast<QEglFSScreen *>(window()->screen()->handle()))->display();
+@@ -104,16 +113,20 @@ void QEglFSWindow::resetSurface()
+ 
+     m_window = QEglFSHooks::hooks()->createNativeWindow(QEglFSHooks::hooks()->screenSize(), m_format);
+     m_surface = eglCreateWindowSurface(display, m_config, m_window, NULL);
+     if (m_surface == EGL_NO_SURFACE) {
+         EGLint error = eglGetError();
+         eglTerminate(display);
+         qFatal("EGL Error : Could not create the egl surface: error = 0x%x\n", error);
+     }
++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows))
++    {
++        __singleWindowSurface = m_surface;
++    }
+ }
+ 
+ void QEglFSWindow::destroy()
+ {
+     if (m_surface) {
+         EGLDisplay display = static_cast<QEglFSScreen *>(screen())->display();
+         eglDestroySurface(display, m_surface);
+         m_surface = 0;
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
new file mode 100644
index 0000000..8d17348
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
@@ -0,0 +1,34 @@
+--- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.old	2013-09-09 23:09:24.433774489 +0530
++++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-09-09 23:12:22.105766689 +0530
+@@ -54,30 +54,30 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
+     , m_surface(0)
+     , m_window(0)
+ {
+     static int serialNo = 0;
+     m_winid  = ++serialNo;
+ #ifdef QEGL_EXTRA_DEBUG
+     qWarning("QEglWindow %p: %p 0x%x\n", this, w, uint(m_winid));
+ #endif
++    setWindowState(Qt::WindowFullScreen);
+ }
+ 
+ QEglFSWindow::~QEglFSWindow()
+ {
+     destroy();
+ }
+ 
+ static EGLSurface __singleWindowSurface;
+ void QEglFSWindow::create()
+ {
+     if (m_window)
+         return;
+ 
+-    setWindowState(Qt::WindowFullScreen);
+ 
+     if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
+     {
+         m_surface = __singleWindowSurface;
+ #ifdef QEGL_EXTRA_DEBUG
+     qWarning("Surface recreate request, re-using %x\n", m_surface);
+ #endif
+        return;
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
new file mode 100644
index 0000000..8ae7706
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.0.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG_GL = "gles2 icu"
+
+SRC_URI += " \
+	file://0001-qeglfswindow.cpp.patch \
+	file://0002-qeglfswindow.cpp.patch \
+"
+
+PR_append = "-arago0"
-- 
1.8.3.2


