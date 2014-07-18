Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id ACDC5529C8
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X00MDR8F4B4U0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E15DD20087; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:52 -0400
Message-id: <1405709522-404-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 01/11] qt5: update bbappends to match version 5.2.1 in meta-qt5/daisy
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

qtbase patches are not applicable to 5.2.1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../qt5/qtbase/0001-qeglfswindow.cpp.patch         | 56 ----------------------
 .../qt5/qtbase/0002-qeglfswindow.cpp.patch         | 34 -------------
 .../recipes-qt/qt5/qtbase_5.2.0.bbappend           |  8 ----
 ...bkit_5.2.0.bbappend => qtwebkit_5.2.1.bbappend} |  0
 4 files changed, 98 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.2.0.bbappend => qtwebkit_5.2.1.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
deleted file mode 100644
index b95b98e..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qeglfswindow.cpp.patch
+++ /dev/null
@@ -1,56 +0,0 @@
---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.orig	2013-08-09 23:29:18.253037952 +0530
-+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-08-09 23:41:18.509018405 +0530
-@@ -61,23 +61,32 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
- #endif
- }
- 
- QEglFSWindow::~QEglFSWindow()
- {
-     destroy();
- }
- 
-+static EGLSurface __singleWindowSurface;
- void QEglFSWindow::create()
- {
-     if (m_window)
-         return;
- 
-     setWindowState(Qt::WindowFullScreen);
- 
-+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
-+    {
-+        m_surface = __singleWindowSurface;
-+#ifdef QEGL_EXTRA_DEBUG
-+    qWarning("Surface recreate request, re-using %x\n", m_surface);
-+#endif
-+       return;
-+    }
-     if (window()->type() == Qt::Desktop) {
-         QRect rect(QPoint(), QEglFSHooks::hooks()->screenSize());
-         QPlatformWindow::setGeometry(rect);
-         QWindowSystemInterface::handleGeometryChange(window(), rect);
-         return;
-     }
- 
-     EGLDisplay display = (static_cast<QEglFSScreen *>(window()->screen()->handle()))->display();
-@@ -104,16 +113,20 @@ void QEglFSWindow::resetSurface()
- 
-     m_window = QEglFSHooks::hooks()->createNativeWindow(QEglFSHooks::hooks()->screenSize(), m_format);
-     m_surface = eglCreateWindowSurface(display, m_config, m_window, NULL);
-     if (m_surface == EGL_NO_SURFACE) {
-         EGLint error = eglGetError();
-         eglTerminate(display);
-         qFatal("EGL Error : Could not create the egl surface: error = 0x%x\n", error);
-     }
-+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows))
-+    {
-+        __singleWindowSurface = m_surface;
-+    }
- }
- 
- void QEglFSWindow::destroy()
- {
-     if (m_surface) {
-         EGLDisplay display = static_cast<QEglFSScreen *>(screen())->display();
-         eglDestroySurface(display, m_surface);
-         m_surface = 0;
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
deleted file mode 100644
index 8d17348..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-qeglfswindow.cpp.patch
+++ /dev/null
@@ -1,34 +0,0 @@
---- qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp.old	2013-09-09 23:09:24.433774489 +0530
-+++ qtbase/src/plugins/platforms/eglfs/qeglfswindow.cpp	2013-09-09 23:12:22.105766689 +0530
-@@ -54,30 +54,30 @@ QEglFSWindow::QEglFSWindow(QWindow *w)
-     , m_surface(0)
-     , m_window(0)
- {
-     static int serialNo = 0;
-     m_winid  = ++serialNo;
- #ifdef QEGL_EXTRA_DEBUG
-     qWarning("QEglWindow %p: %p 0x%x\n", this, w, uint(m_winid));
- #endif
-+    setWindowState(Qt::WindowFullScreen);
- }
- 
- QEglFSWindow::~QEglFSWindow()
- {
-     destroy();
- }
- 
- static EGLSurface __singleWindowSurface;
- void QEglFSWindow::create()
- {
-     if (m_window)
-         return;
- 
--    setWindowState(Qt::WindowFullScreen);
- 
-     if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::Capability::MultipleWindows) && __singleWindowSurface)
-     {
-         m_surface = __singleWindowSurface;
- #ifdef QEGL_EXTRA_DEBUG
-     qWarning("Surface recreate request, re-using %x\n", m_surface);
- #endif
-        return;
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
deleted file mode 100644
index 2c0a52d..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-	file://0001-qeglfswindow.cpp.patch \
-	file://0002-qeglfswindow.cpp.patch \
-"
-
-PR_append = "-arago1"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
-- 
2.0.0


