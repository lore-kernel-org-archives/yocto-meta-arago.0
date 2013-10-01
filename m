Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id EE8325296F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:40 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00CE2AMZBFN0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3355C271BE; Tue,
	01 Oct 2013 03:11:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:05 -0400
Message-id: <1380611472-23600-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 06/13] qtwebkit: add WebGL on eglfs patches
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Add additional patches to enable WebGL on eglfs from Prabu.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../qt5/qtwebkit/GraphicsContext3DQt.cpp.patch     |  26 ++
 .../qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch   | 270 +++++++++++++++++++++
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch      |  33 +++
 .../recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch  |  24 ++
 .../recipes-qt/qt5/qtwebkit/Target.pri.patch       |  24 ++
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch      |  25 ++
 .../recipes-qt/qt5/qtwebkit/features.prf.patch     |  20 ++
 .../qt5/qtwebkit/qttestbrowser.cpp.patch           |  24 ++
 .../recipes-qt/qt5/qtwebkit_5.1.0.bbappend         |  14 ++
 9 files changed, 460 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
new file mode 100644
index 0000000..aa752bb
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
@@ -0,0 +1,26 @@
+--- qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp.orig	2013-09-07 13:41:19.946858466 +0530
++++ qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp	2013-09-07 17:48:13.958979770 +0530
+@@ -383,21 +383,23 @@ GraphicsContext3D::GraphicsContext3D(Gra
+     , m_boundTexture0(0)
+     , m_multisampleFBO(0)
+     , m_multisampleDepthStencilBuffer(0)
+     , m_multisampleColorBuffer(0)
+     , m_private(adoptPtr(new GraphicsContext3DPrivate(this, hostWindow, renderStyle)))
+ {
+     validateAttributes();
+ 
++#if USE(GLX)
+     if (!m_private->m_surface || !m_private->m_platformContext) {
+         LOG_ERROR("GraphicsContext3D: GL context creation failed.");
+         m_private = nullptr;
+         return;
+     }
++#endif
+ 
+     static bool initialized = false;
+     static bool success = true;
+     if (!initialized) {
+         success = initializeOpenGLShims();
+         initialized = true;
+     }
+     if (!success) {
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
new file mode 100644
index 0000000..46c93f7
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
@@ -0,0 +1,270 @@
+diff -Nurp8 Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL_NoX.cpp
+--- qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp	1970-01-01 05:30:00.000000000 +0530
++++ qtwebkit/Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
+@@ -0,0 +1,266 @@
++/*
++ Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies)
++
++ This library is free software; you can redistribute it and/or
++ modify it under the terms of the GNU Library General Public
++ License as published by the Free Software Foundation; either
++ version 2 of the License, or (at your option) any later version.
++
++ This library is distributed in the hope that it will be useful,
++ but WITHOUT ANY WARRANTY; without even the implied warranty of
++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ Library General Public License for more details.
++
++ You should have received a copy of the GNU Library General Public License
++ along with this library; see the file COPYING.LIB.  If not, write to
++ the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
++ Boston, MA 02110-1301, USA.
++ */
++
++#include "config.h"
++#include "GraphicsSurface.h"
++
++#if USE(GRAPHICS_SURFACE)
++
++#include "NotImplemented.h"
++#include "TextureMapperGL.h"
++
++#if PLATFORM(QT)
++// Qt headers must be included before gl headers.
++#include <QGuiApplication>
++#include <QOpenGLContext>
++#include <qpa/qplatformnativeinterface.h>
++#elif PLATFORM(EFL)
++#include <GL/gl.h>
++#endif
++
++ #include <GLES2/gl2.h>
++
++namespace WebCore {
++
++class OffScreenRootWindow {
++public:
++    OffScreenRootWindow()
++    {
++        ++m_refCount;
++    }
++
++    ~OffScreenRootWindow()
++    {
++        if (--m_refCount)
++            return;
++    }
++
++private:
++    static int m_refCount;
++};
++
++int OffScreenRootWindow::m_refCount = 0;
++
++
++struct GraphicsSurfacePrivate {
++    GraphicsSurfacePrivate(const PlatformGraphicsContext3D shareContext = 0)
++        : m_textureIsYInverted(false)
++        , m_hasAlpha(false)
++        , m_isReceiver(false)
++    {
++
++#if PLATFORM(QT)
++        if (shareContext) {
++#if 0
++            // This code path requires QXcbNativeInterface::nativeResourceForContext() which is not availble in Qt5 on the build bots yet.
++            QPlatformNativeInterface* nativeInterface = QGuiApplication::platformNativeInterface();
++            shareContextObject = static_cast<GLXContext>(nativeInterface->nativeResourceForContext(QByteArrayLiteral("glxcontext"), shareContext));
++            if (!shareContextObject)
++                return;
++#else
++            // This code path should be removed as soon as QXcbNativeInterface::nativeResourceForContext() can provide the GLXContext.
++            QOpenGLContext* previousContext = QOpenGLContext::currentContext();
++            QSurface* previousSurface = previousContext->surface();
++            QSurface* currentSurface = shareContext->surface();
++            shareContext->makeCurrent(currentSurface);
++
++
++            previousContext->makeCurrent(previousSurface);
++#endif
++        }
++#else
++        UNUSED_PARAM(shareContext);
++#endif
++
++
++    }
++
++    GraphicsSurfacePrivate(uint32_t winId)
++        : m_textureIsYInverted(false)
++        , m_hasAlpha(false)
++        , m_isReceiver(true)
++    { }
++
++    ~GraphicsSurfacePrivate()
++    {
++    }
++
++    uint32_t createSurface(const IntSize& size)
++    {
++        return 0;
++    }
++
++    void createPixmap(uint32_t winId)
++    {
++    }
++
++    bool textureIsYInverted()
++    {
++        return m_textureIsYInverted;
++    }
++
++    void makeCurrent()
++    {
++    }
++
++    void doneCurrent()
++    {
++    }
++
++    void swapBuffers()
++    {
++    }
++
++    void copyFromTexture(uint32_t texture, const IntRect& sourceRect)
++    {
++        makeCurrent();
++
++        swapBuffers();
++        doneCurrent();
++    }
++
++    void* display() const { return 0; }
++
++    IntSize size() const
++    {
++        return IntSize(0, 0);
++    }
++
++private:
++    OffScreenRootWindow m_offScreenWindow;
++    IntSize m_size;
++    bool m_textureIsYInverted;
++    bool m_hasAlpha;
++    bool m_isReceiver;
++};
++
++static bool resolveGLMethods()
++{
++    return true;
++}
++
++GraphicsSurfaceToken GraphicsSurface::platformExport()
++{
++    return GraphicsSurfaceToken();
++}
++
++uint32_t GraphicsSurface::platformGetTextureID()
++{
++    return 0;
++}
++
++void GraphicsSurface::platformCopyToGLTexture(uint32_t /*target*/, uint32_t /*id*/, const IntRect& /*targetRect*/, const IntPoint& /*offset*/)
++{
++    // This is not supported by NoX
++}
++
++void GraphicsSurface::platformCopyFromTexture(uint32_t texture, const IntRect& sourceRect)
++{
++    m_private->copyFromTexture(texture, sourceRect);
++}
++
++
++void GraphicsSurface::platformPaintToTextureMapper(TextureMapper* textureMapper, const FloatRect& targetRect, const TransformationMatrix& transform, float opacity, BitmapTexture* mask)
++{
++    TextureMapperGL* texMapGL = static_cast<TextureMapperGL*>(textureMapper);
++    TransformationMatrix adjustedTransform = transform;
++    adjustedTransform.multiply(TransformationMatrix::rectToRect(FloatRect(FloatPoint::zero(), m_private->size()), targetRect));
++    TextureMapperGL::Flags flags = m_private->textureIsYInverted() ? TextureMapperGL::ShouldFlipTexture : 0;
++    flags |= TextureMapperGL::SupportsBlending;
++    texMapGL->drawTexture(platformGetTextureID(), flags, m_private->size(), targetRect, adjustedTransform, opacity, mask);
++}
++
++uint32_t GraphicsSurface::platformFrontBuffer() const
++{
++    return 0;
++}
++
++uint32_t GraphicsSurface::platformSwapBuffers()
++{
++    m_private->swapBuffers();
++    return 0;
++}
++
++IntSize GraphicsSurface::platformSize() const
++{
++    return m_private->size();
++}
++
++PassRefPtr<GraphicsSurface> GraphicsSurface::platformCreate(const IntSize& size, Flags flags, const PlatformGraphicsContext3D shareContext)
++{
++    if (flags & SupportsCopyToTexture || flags & SupportsSingleBuffered)
++        return PassRefPtr<GraphicsSurface>();
++
++    RefPtr<GraphicsSurface> surface = adoptRef(new GraphicsSurface(size, flags));
++
++    surface->m_private = new GraphicsSurfacePrivate(shareContext);
++    if (!resolveGLMethods())
++        return PassRefPtr<GraphicsSurface>();
++
++    surface->m_platformSurface = surface->m_private->createSurface(size);
++
++    return surface;
++}
++
++PassRefPtr<GraphicsSurface> GraphicsSurface::platformImport(const IntSize& size, Flags flags, const GraphicsSurfaceToken& token)
++{
++    if (flags & SupportsCopyToTexture || flags & SupportsSingleBuffered)
++        return PassRefPtr<GraphicsSurface>();
++
++    RefPtr<GraphicsSurface> surface = adoptRef(new GraphicsSurface(size, flags));
++    surface->m_platformSurface = token.frontBufferHandle;
++
++    surface->m_private = new GraphicsSurfacePrivate(surface->m_platformSurface);
++    if (!resolveGLMethods())
++        return PassRefPtr<GraphicsSurface>();
++
++    return surface;
++}
++
++char* GraphicsSurface::platformLock(const IntRect&, int* /*outputStride*/, LockOptions)
++{
++    // GraphicsSurface is currently only being used for WebGL, which does not require this locking mechanism.
++    return 0;
++}
++
++void GraphicsSurface::platformUnlock()
++{
++    // GraphicsSurface is currently only being used for WebGL, which does not require this locking mechanism.
++}
++
++void GraphicsSurface::platformDestroy()
++{
++    m_private = 0;
++}
++
++#if !PLATFORM(QT)
++PassOwnPtr<GraphicsContext> GraphicsSurface::platformBeginPaint(const IntSize&, char*, int)
++{
++    notImplemented();
++    return nullptr;
++}
++
++PassRefPtr<Image> GraphicsSurface::createReadOnlyImage(const IntRect&)
++{
++    notImplemented();
++    return 0;
++}
++#endif
++}
++#endif
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
new file mode 100644
index 0000000..722df39
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
@@ -0,0 +1,33 @@
+--- qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h.orig	2013-09-07 13:44:47.906849335 +0530
++++ qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h	2013-09-07 13:46:12.554845618 +0530
+@@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
+     {
+         return frontBufferHandle != rhs.frontBufferHandle;
+     }
+ 
+     bool isValid() const
+     {
+         return frontBufferHandle;
+     }
++#elif PLATFORM(QT)
++    GraphicsSurfaceToken(uint32_t windowID = 0)
++         : frontBufferHandle(windowID)
++    { }
++
++     bool operator!=(const GraphicsSurfaceToken &rhs) const
++     {
++         return frontBufferHandle != rhs.frontBufferHandle;
++     }
+ 
++     bool isValid() const
++     {
++         return frontBufferHandle;
++     }
+ #endif
+ 
+ #if OS(DARWIN) || OS(WINDOWS)
+     GraphicsSurfaceToken(BufferHandle frontBuffer = 0, BufferHandle backBuffer = 0)
+         : frontBufferHandle(frontBuffer)
+         , backBufferHandle(backBuffer)
+     { }
+ 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
new file mode 100644
index 0000000..9261bed
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
@@ -0,0 +1,24 @@
+--- qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp.orig	2013-09-07 13:46:41.614844342 +0530
++++ qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp	2013-09-07 13:47:39.602841796 +0530
+@@ -35,17 +35,20 @@ OpenGLFunctionTable* openGLFunctionTable
+ {
+     static OpenGLFunctionTable table;
+     return &table;
+ }
+ 
+ #if PLATFORM(QT)
+ static void* getProcAddress(const char* procName)
+ {
+-    return reinterpret_cast<void*>(QOpenGLContext::currentContext()->getProcAddress(procName));
++    if(QOpenGLContext::currentContext())
++        return reinterpret_cast<void*>(QOpenGLContext::currentContext()->getProcAddress(procName));
++    else
++        return NULL;
+ }
+ #else
+ typedef void* (*glGetProcAddressType) (const char* procName);
+ static void* getProcAddress(const char* procName)
+ {
+     static bool initialized = false;
+     static glGetProcAddressType getProcAddressFunction = 0;
+ 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
new file mode 100644
index 0000000..fcd7658
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
@@ -0,0 +1,24 @@
+--- qtwebkit/Source/WebCore/Target.pri.orig	2013-09-07 13:48:04.030840724 +0530
++++ qtwebkit/Source/WebCore/Target.pri	2013-09-07 13:49:01.714838191 +0530
+@@ -4095,16 +4095,21 @@ use?(GRAPHICS_SURFACE) {
+         INCLUDEPATH += /System/Library/Frameworks/CoreFoundation.framework/Headers
+     }
+     win32 {
+         SOURCES += platform/graphics/surfaces/win/GraphicsSurfaceWin.cpp
+     }
+     have?(XCOMPOSITE) {
+         SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
+     }
++    contains(QT_CONFIG, opengles2) {
++        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
++        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
++    }
++
+ }
+ 
+ build?(qttestsupport) {
+     HEADERS += platform/qt/QtTestSupport.h
+     SOURCES += platform/qt/QtTestSupport.cpp
+ }
+ 
+ ALL_IN_ONE_SOURCES += \
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
new file mode 100644
index 0000000..050d301
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
@@ -0,0 +1,25 @@
+--- qtwebkit/Source/WebCore/WebCore.pri.orig	2013-09-08 14:18:22.315635577 +0530
++++ qtwebkit/Source/WebCore/WebCore.pri	2013-09-08 14:18:44.271634981 +0530
+@@ -213,18 +213,20 @@ use?(3D_GRAPHICS) {
+     } else {
+         contains(QT_CONFIG, opengles2): CONFIG += egl
+     }
+ }
+ 
+ use?(GRAPHICS_SURFACE) {
+     mac: LIBS += -framework IOSurface -framework CoreFoundation
+     linux-*: {
+-        LIBS += -lXcomposite -lXrender
+-        CONFIG *= x11
++        xlibAvailable() {
++            LIBS += -lXcomposite -lXrender
++            CONFIG *= x11
++	}
+     }
+ }
+ 
+ have?(sqlite3) {
+     mac {
+         LIBS += -lsqlite3
+     } else {
+         PKGCONFIG += sqlite3
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
new file mode 100644
index 0000000..288f116
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
@@ -0,0 +1,20 @@
+--- qtwebkit/Tools/qmake/mkspecs/features/features.prf.orig	2013-09-07 13:49:38.210836589 +0530
++++ qtwebkit/Tools/qmake/mkspecs/features/features.prf	2013-09-07 13:50:13.574835036 +0530
+@@ -127,16 +127,17 @@ defineTest(detectFeatures) {
+     packagesExist(libudev): WEBKIT_CONFIG += gamepad
+ 
+     # Support for Graphics Surface
+     # GraphicsSurface requires GraphicsContext3D and hence use_3d_graphics
+     use?(3d_graphics) {
+         mac: WEBKIT_CONFIG += use_graphics_surface
+         win32:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG += use_graphics_surface
+         linux-*:contains(WEBKIT_CONFIG, have_glx):contains(WEBKIT_CONFIG, have_xcomposite):contains(WEBKIT_CONFIG, have_xrender): WEBKIT_CONFIG += use_graphics_surface
++        linux-*:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG += use_graphics_surface
+     }
+ 
+     # Slider Touch is sensible to use when compiling WebKit2
+     enable?(touch_events): WEBKIT_CONFIG += touch_slider
+ 
+ 
+     # Minibrowser must be able to query for QtTestSupport
+     build?(qttestsupport): WEBKIT_CONFIG += have_qttestsupport
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
new file mode 100644
index 0000000..9a57be2
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
@@ -0,0 +1,24 @@
+--- qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp.orig	2013-09-08 17:28:48.633593482 +0530
++++ qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp	2013-09-08 17:29:07.713592964 +0530
+@@ -235,19 +235,20 @@ void LauncherApplication::handleUserOpti
+     }
+ 
+     if (args.contains("-webgl")) {
+         requiresGraphicsView("-webgl");
+         windowOptions.useWebGL = true;
+     }
+ #endif
+ 
++#if 0
+     if (args.contains("-use-test-fonts"))
+         WebKit::QtTestSupport::initializeTestFonts();
+-
++#endif
+     if (args.contains("-print-loaded-urls"))
+         windowOptions.printLoadedUrls = true;
+ 
+     QString inspectorUrlArg("-inspector-url");
+     int inspectorUrlIndex = args.indexOf(inspectorUrlArg);
+     if (inspectorUrlIndex != -1)
+        windowOptions.inspectorUrl = takeOptionValue(&args, inspectorUrlIndex);
+ 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend
new file mode 100644
index 0000000..aed6b51
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	file://features.prf.patch \
+	file://GraphicsContext3DQt.cpp.patch \
+	file://GraphicsSurfaceGL_NoX.cpp.patch \
+	file://GraphicsSurfaceToken.h.patch \
+	file://OpenGLShims.cpp.patch \
+	file://qttestbrowser.cpp.patch \
+	file://Target.pri.patch \
+	file://WebCore.pri.patch \
+"
+
+PR_append = "-arago0"
-- 
1.8.3.2


