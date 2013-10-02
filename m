Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B98595296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:56:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92CuvOW025143;
	Wed, 2 Oct 2013 07:56:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92CuvZ6017147;
	Wed, 2 Oct 2013 07:56:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:56:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/13] qtwebkit: add WebGL on eglfs patches
Thread-Index: AQHOvnWBgWYKtSxvQEahICV5AIeDHpnhYMGQ
Date: Wed, 2 Oct 2013 12:56:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A589@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-7-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-7-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 06/13] qtwebkit: add WebGL on eglfs patches
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
X-List-Received-Date: Wed, 02 Oct 2013 12:56:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

With Franklins feedback addressed

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 06/13] qtwebkit: add WebGL on eglfs
>patches
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* Add additional patches to enable WebGL on eglfs from Prabu.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
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
> 9 files changed, 460 insertions(+)
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
>
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch b/meta-arago-
>distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
>new file mode 100644
>index 0000000..aa752bb
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
>@@ -0,0 +1,26 @@
>+---
>qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.c
>pp.orig	2013-09-07 13:41:19.946858466 +0530
>++++
>qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.c
>pp	2013-09-07 17:48:13.958979770 +0530
>+@@ -383,21 +383,23 @@ GraphicsContext3D::GraphicsContext3D(Gra
>+     , m_boundTexture0(0)
>+     , m_multisampleFBO(0)
>+     , m_multisampleDepthStencilBuffer(0)
>+     , m_multisampleColorBuffer(0)
>+     , m_private(adoptPtr(new GraphicsContext3DPrivate(this,
>hostWindow, renderStyle)))
>+ {
>+     validateAttributes();
>+
>++#if USE(GLX)
>+     if (!m_private->m_surface || !m_private->m_platformContext)
>{
>+         LOG_ERROR("GraphicsContext3D: GL context creation
>failed.");
>+         m_private =3D nullptr;
>+         return;
>+     }
>++#endif
>+
>+     static bool initialized =3D false;
>+     static bool success =3D true;
>+     if (!initialized) {
>+         success =3D initializeOpenGLShims();
>+         initialized =3D true;
>+     }
>+     if (!success) {
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch b/meta-arago-
>distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
>new file mode 100644
>index 0000000..46c93f7
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
>@@ -0,0 +1,270 @@
>+diff -Nurp8
>Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX
>.cpp
>Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL
>_NoX.cpp
>+---
>qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurf
>aceGL_NoX.cpp	1970-01-01 05:30:00.000000000 +0530
>++++
>qtwebkit/Source/WebCore/platform/graphics/surfaces/qt_new/Graphics
>SurfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
>+@@ -0,0 +1,266 @@
>++/*
>++ Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-
>ies)
>++
>++ This library is free software; you can redistribute it and/or
>++ modify it under the terms of the GNU Library General Public
>++ License as published by the Free Software Foundation; either
>++ version 2 of the License, or (at your option) any later
>version.
>++
>++ This library is distributed in the hope that it will be useful,
>++ but WITHOUT ANY WARRANTY; without even the implied warranty of
>++ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>GNU
>++ Library General Public License for more details.
>++
>++ You should have received a copy of the GNU Library General
>Public License
>++ along with this library; see the file COPYING.LIB.  If not,
>write to
>++ the Free Software Foundation, Inc., 51 Franklin Street, Fifth
>Floor,
>++ Boston, MA 02110-1301, USA.
>++ */
>++
>++#include "config.h"
>++#include "GraphicsSurface.h"
>++
>++#if USE(GRAPHICS_SURFACE)
>++
>++#include "NotImplemented.h"
>++#include "TextureMapperGL.h"
>++
>++#if PLATFORM(QT)
>++// Qt headers must be included before gl headers.
>++#include <QGuiApplication>
>++#include <QOpenGLContext>
>++#include <qpa/qplatformnativeinterface.h>
>++#elif PLATFORM(EFL)
>++#include <GL/gl.h>
>++#endif
>++
>++ #include <GLES2/gl2.h>
>++
>++namespace WebCore {
>++
>++class OffScreenRootWindow {
>++public:
>++    OffScreenRootWindow()
>++    {
>++        ++m_refCount;
>++    }
>++
>++    ~OffScreenRootWindow()
>++    {
>++        if (--m_refCount)
>++            return;
>++    }
>++
>++private:
>++    static int m_refCount;
>++};
>++
>++int OffScreenRootWindow::m_refCount =3D 0;
>++
>++
>++struct GraphicsSurfacePrivate {
>++    GraphicsSurfacePrivate(const PlatformGraphicsContext3D
>shareContext =3D 0)
>++        : m_textureIsYInverted(false)
>++        , m_hasAlpha(false)
>++        , m_isReceiver(false)
>++    {
>++
>++#if PLATFORM(QT)
>++        if (shareContext) {
>++#if 0
>++            // This code path requires
>QXcbNativeInterface::nativeResourceForContext() which is not
>availble in Qt5 on the build bots yet.
>++            QPlatformNativeInterface* nativeInterface =3D
>QGuiApplication::platformNativeInterface();
>++            shareContextObject =3D
>static_cast<GLXContext>(nativeInterface-
>>nativeResourceForContext(QByteArrayLiteral("glxcontext"),
>shareContext));
>++            if (!shareContextObject)
>++                return;
>++#else
>++            // This code path should be removed as soon as
>QXcbNativeInterface::nativeResourceForContext() can provide the
>GLXContext.
>++            QOpenGLContext* previousContext =3D
>QOpenGLContext::currentContext();
>++            QSurface* previousSurface =3D previousContext-
>>surface();
>++            QSurface* currentSurface =3D shareContext->surface();
>++            shareContext->makeCurrent(currentSurface);
>++
>++
>++            previousContext->makeCurrent(previousSurface);
>++#endif
>++        }
>++#else
>++        UNUSED_PARAM(shareContext);
>++#endif
>++
>++
>++    }
>++
>++    GraphicsSurfacePrivate(uint32_t winId)
>++        : m_textureIsYInverted(false)
>++        , m_hasAlpha(false)
>++        , m_isReceiver(true)
>++    { }
>++
>++    ~GraphicsSurfacePrivate()
>++    {
>++    }
>++
>++    uint32_t createSurface(const IntSize& size)
>++    {
>++        return 0;
>++    }
>++
>++    void createPixmap(uint32_t winId)
>++    {
>++    }
>++
>++    bool textureIsYInverted()
>++    {
>++        return m_textureIsYInverted;
>++    }
>++
>++    void makeCurrent()
>++    {
>++    }
>++
>++    void doneCurrent()
>++    {
>++    }
>++
>++    void swapBuffers()
>++    {
>++    }
>++
>++    void copyFromTexture(uint32_t texture, const IntRect&
>sourceRect)
>++    {
>++        makeCurrent();
>++
>++        swapBuffers();
>++        doneCurrent();
>++    }
>++
>++    void* display() const { return 0; }
>++
>++    IntSize size() const
>++    {
>++        return IntSize(0, 0);
>++    }
>++
>++private:
>++    OffScreenRootWindow m_offScreenWindow;
>++    IntSize m_size;
>++    bool m_textureIsYInverted;
>++    bool m_hasAlpha;
>++    bool m_isReceiver;
>++};
>++
>++static bool resolveGLMethods()
>++{
>++    return true;
>++}
>++
>++GraphicsSurfaceToken GraphicsSurface::platformExport()
>++{
>++    return GraphicsSurfaceToken();
>++}
>++
>++uint32_t GraphicsSurface::platformGetTextureID()
>++{
>++    return 0;
>++}
>++
>++void GraphicsSurface::platformCopyToGLTexture(uint32_t
>/*target*/, uint32_t /*id*/, const IntRect& /*targetRect*/, const
>IntPoint& /*offset*/)
>++{
>++    // This is not supported by NoX
>++}
>++
>++void GraphicsSurface::platformCopyFromTexture(uint32_t texture,
>const IntRect& sourceRect)
>++{
>++    m_private->copyFromTexture(texture, sourceRect);
>++}
>++
>++
>++void
>GraphicsSurface::platformPaintToTextureMapper(TextureMapper*
>textureMapper, const FloatRect& targetRect, const
>TransformationMatrix& transform, float opacity, BitmapTexture*
>mask)
>++{
>++    TextureMapperGL* texMapGL =3D
>static_cast<TextureMapperGL*>(textureMapper);
>++    TransformationMatrix adjustedTransform =3D transform;
>++
>adjustedTransform.multiply(TransformationMatrix::rectToRect(FloatR
>ect(FloatPoint::zero(), m_private->size()), targetRect));
>++    TextureMapperGL::Flags flags =3D m_private-
>>textureIsYInverted() ? TextureMapperGL::ShouldFlipTexture : 0;
>++    flags |=3D TextureMapperGL::SupportsBlending;
>++    texMapGL->drawTexture(platformGetTextureID(), flags,
>m_private->size(), targetRect, adjustedTransform, opacity, mask);
>++}
>++
>++uint32_t GraphicsSurface::platformFrontBuffer() const
>++{
>++    return 0;
>++}
>++
>++uint32_t GraphicsSurface::platformSwapBuffers()
>++{
>++    m_private->swapBuffers();
>++    return 0;
>++}
>++
>++IntSize GraphicsSurface::platformSize() const
>++{
>++    return m_private->size();
>++}
>++
>++PassRefPtr<GraphicsSurface>
>GraphicsSurface::platformCreate(const IntSize& size, Flags flags,
>const PlatformGraphicsContext3D shareContext)
>++{
>++    if (flags & SupportsCopyToTexture || flags &
>SupportsSingleBuffered)
>++        return PassRefPtr<GraphicsSurface>();
>++
>++    RefPtr<GraphicsSurface> surface =3D adoptRef(new
>GraphicsSurface(size, flags));
>++
>++    surface->m_private =3D new
>GraphicsSurfacePrivate(shareContext);
>++    if (!resolveGLMethods())
>++        return PassRefPtr<GraphicsSurface>();
>++
>++    surface->m_platformSurface =3D surface->m_private-
>>createSurface(size);
>++
>++    return surface;
>++}
>++
>++PassRefPtr<GraphicsSurface>
>GraphicsSurface::platformImport(const IntSize& size, Flags flags,
>const GraphicsSurfaceToken& token)
>++{
>++    if (flags & SupportsCopyToTexture || flags &
>SupportsSingleBuffered)
>++        return PassRefPtr<GraphicsSurface>();
>++
>++    RefPtr<GraphicsSurface> surface =3D adoptRef(new
>GraphicsSurface(size, flags));
>++    surface->m_platformSurface =3D token.frontBufferHandle;
>++
>++    surface->m_private =3D new GraphicsSurfacePrivate(surface-
>>m_platformSurface);
>++    if (!resolveGLMethods())
>++        return PassRefPtr<GraphicsSurface>();
>++
>++    return surface;
>++}
>++
>++char* GraphicsSurface::platformLock(const IntRect&, int*
>/*outputStride*/, LockOptions)
>++{
>++    // GraphicsSurface is currently only being used for WebGL,
>which does not require this locking mechanism.
>++    return 0;
>++}
>++
>++void GraphicsSurface::platformUnlock()
>++{
>++    // GraphicsSurface is currently only being used for WebGL,
>which does not require this locking mechanism.
>++}
>++
>++void GraphicsSurface::platformDestroy()
>++{
>++    m_private =3D 0;
>++}
>++
>++#if !PLATFORM(QT)
>++PassOwnPtr<GraphicsContext>
>GraphicsSurface::platformBeginPaint(const IntSize&, char*, int)
>++{
>++    notImplemented();
>++    return nullptr;
>++}
>++
>++PassRefPtr<Image> GraphicsSurface::createReadOnlyImage(const
>IntRect&)
>++{
>++    notImplemented();
>++    return 0;
>++}
>++#endif
>++}
>++#endif
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch b/meta-arago-
>distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
>new file mode 100644
>index 0000000..722df39
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
>@@ -0,0 +1,33 @@
>+---
>qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurface
>Token.h.orig	2013-09-07 13:44:47.906849335 +0530
>++++
>qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurface
>Token.h	2013-09-07 13:46:12.554845618 +0530
>+@@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
>+     {
>+         return frontBufferHandle !=3D rhs.frontBufferHandle;
>+     }
>+
>+     bool isValid() const
>+     {
>+         return frontBufferHandle;
>+     }
>++#elif PLATFORM(QT)
>++    GraphicsSurfaceToken(uint32_t windowID =3D 0)
>++         : frontBufferHandle(windowID)
>++    { }
>++
>++     bool operator!=3D(const GraphicsSurfaceToken &rhs) const
>++     {
>++         return frontBufferHandle !=3D rhs.frontBufferHandle;
>++     }
>+
>++     bool isValid() const
>++     {
>++         return frontBufferHandle;
>++     }
>+ #endif
>+
>+ #if OS(DARWIN) || OS(WINDOWS)
>+     GraphicsSurfaceToken(BufferHandle frontBuffer =3D 0,
>BufferHandle backBuffer =3D 0)
>+         : frontBufferHandle(frontBuffer)
>+         , backBufferHandle(backBuffer)
>+     { }
>+
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/OpenGLShims.cpp.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/OpenGLShims.cpp.patch
>new file mode 100644
>index 0000000..9261bed
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/OpenGLShims.cpp.patch
>@@ -0,0 +1,24 @@
>+---
>qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp.orig
>	2013-09-07 13:46:41.614844342 +0530
>++++ qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp
>	2013-09-07 13:47:39.602841796 +0530
>+@@ -35,17 +35,20 @@ OpenGLFunctionTable* openGLFunctionTable
>+ {
>+     static OpenGLFunctionTable table;
>+     return &table;
>+ }
>+
>+ #if PLATFORM(QT)
>+ static void* getProcAddress(const char* procName)
>+ {
>+-    return
>reinterpret_cast<void*>(QOpenGLContext::currentContext()-
>>getProcAddress(procName));
>++    if(QOpenGLContext::currentContext())
>++        return
>reinterpret_cast<void*>(QOpenGLContext::currentContext()-
>>getProcAddress(procName));
>++    else
>++        return NULL;
>+ }
>+ #else
>+ typedef void* (*glGetProcAddressType) (const char* procName);
>+ static void* getProcAddress(const char* procName)
>+ {
>+     static bool initialized =3D false;
>+     static glGetProcAddressType getProcAddressFunction =3D 0;
>+
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/Target.pri.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/Target.pri.patch
>new file mode 100644
>index 0000000..fcd7658
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
>@@ -0,0 +1,24 @@
>+--- qtwebkit/Source/WebCore/Target.pri.orig	2013-09-07
>13:48:04.030840724 +0530
>++++ qtwebkit/Source/WebCore/Target.pri	2013-09-07
>13:49:01.714838191 +0530
>+@@ -4095,16 +4095,21 @@ use?(GRAPHICS_SURFACE) {
>+         INCLUDEPATH +=3D
>/System/Library/Frameworks/CoreFoundation.framework/Headers
>+     }
>+     win32 {
>+         SOURCES +=3D
>platform/graphics/surfaces/win/GraphicsSurfaceWin.cpp
>+     }
>+     have?(XCOMPOSITE) {
>+         SOURCES +=3D
>platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
>+     }
>++    contains(QT_CONFIG, opengles2) {
>++        SOURCES -=3D
>platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
>++        SOURCES +=3D
>platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
>++    }
>++
>+ }
>+
>+ build?(qttestsupport) {
>+     HEADERS +=3D platform/qt/QtTestSupport.h
>+     SOURCES +=3D platform/qt/QtTestSupport.cpp
>+ }
>+
>+ ALL_IN_ONE_SOURCES +=3D \
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/WebCore.pri.patch
>new file mode 100644
>index 0000000..050d301
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
>@@ -0,0 +1,25 @@
>+--- qtwebkit/Source/WebCore/WebCore.pri.orig	2013-09-08
>14:18:22.315635577 +0530
>++++ qtwebkit/Source/WebCore/WebCore.pri	2013-09-08
>14:18:44.271634981 +0530
>+@@ -213,18 +213,20 @@ use?(3D_GRAPHICS) {
>+     } else {
>+         contains(QT_CONFIG, opengles2): CONFIG +=3D egl
>+     }
>+ }
>+
>+ use?(GRAPHICS_SURFACE) {
>+     mac: LIBS +=3D -framework IOSurface -framework CoreFoundation
>+     linux-*: {
>+-        LIBS +=3D -lXcomposite -lXrender
>+-        CONFIG *=3D x11
>++        xlibAvailable() {
>++            LIBS +=3D -lXcomposite -lXrender
>++            CONFIG *=3D x11
>++	}
>+     }
>+ }
>+
>+ have?(sqlite3) {
>+     mac {
>+         LIBS +=3D -lsqlite3
>+     } else {
>+         PKGCONFIG +=3D sqlite3
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/features.prf.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/features.prf.patch
>new file mode 100644
>index 0000000..288f116
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
>@@ -0,0 +1,20 @@
>+--- qtwebkit/Tools/qmake/mkspecs/features/features.prf.orig
>	2013-09-07 13:49:38.210836589 +0530
>++++ qtwebkit/Tools/qmake/mkspecs/features/features.prf	2013-
>09-07 13:50:13.574835036 +0530
>+@@ -127,16 +127,17 @@ defineTest(detectFeatures) {
>+     packagesExist(libudev): WEBKIT_CONFIG +=3D gamepad
>+
>+     # Support for Graphics Surface
>+     # GraphicsSurface requires GraphicsContext3D and hence
>use_3d_graphics
>+     use?(3d_graphics) {
>+         mac: WEBKIT_CONFIG +=3D use_graphics_surface
>+         win32:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG +=3D
>use_graphics_surface
>+         linux-*:contains(WEBKIT_CONFIG,
>have_glx):contains(WEBKIT_CONFIG,
>have_xcomposite):contains(WEBKIT_CONFIG, have_xrender):
>WEBKIT_CONFIG +=3D use_graphics_surface
>++        linux-*:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG +=3D
>use_graphics_surface
>+     }
>+
>+     # Slider Touch is sensible to use when compiling WebKit2
>+     enable?(touch_events): WEBKIT_CONFIG +=3D touch_slider
>+
>+
>+     # Minibrowser must be able to query for QtTestSupport
>+     build?(qttestsupport): WEBKIT_CONFIG +=3D have_qttestsupport
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/qttestbrowser.cpp.patch b/meta-arago-
>distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
>new file mode 100644
>index 0000000..9a57be2
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit/qttestbrowser.cpp.patch
>@@ -0,0 +1,24 @@
>+--- qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp.orig	2013-
>09-08 17:28:48.633593482 +0530
>++++ qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp	2013-09-08
>17:29:07.713592964 +0530
>+@@ -235,19 +235,20 @@ void LauncherApplication::handleUserOpti
>+     }
>+
>+     if (args.contains("-webgl")) {
>+         requiresGraphicsView("-webgl");
>+         windowOptions.useWebGL =3D true;
>+     }
>+ #endif
>+
>++#if 0
>+     if (args.contains("-use-test-fonts"))
>+         WebKit::QtTestSupport::initializeTestFonts();
>+-
>++#endif
>+     if (args.contains("-print-loaded-urls"))
>+         windowOptions.printLoadedUrls =3D true;
>+
>+     QString inspectorUrlArg("-inspector-url");
>+     int inspectorUrlIndex =3D args.indexOf(inspectorUrlArg);
>+     if (inspectorUrlIndex !=3D -1)
>+        windowOptions.inspectorUrl =3D takeOptionValue(&args,
>inspectorUrlIndex);
>+
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtwebkit_5.1.0.bbappend b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit_5.1.0.bbappend
>new file mode 100644
>index 0000000..aed6b51
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.0.bbappend
>@@ -0,0 +1,14 @@
>+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>+
>+SRC_URI +=3D " \
>+	file://features.prf.patch \
>+	file://GraphicsContext3DQt.cpp.patch \
>+	file://GraphicsSurfaceGL_NoX.cpp.patch \
>+	file://GraphicsSurfaceToken.h.patch \
>+	file://OpenGLShims.cpp.patch \
>+	file://qttestbrowser.cpp.patch \
>+	file://Target.pri.patch \
>+	file://WebCore.pri.patch \
>+"
>+
>+PR_append =3D "-arago0"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

