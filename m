Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CA94952A31
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 16:57:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OGvi2J012456;
	Thu, 24 Jul 2014 11:57:44 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OGviPN003074;
	Thu, 24 Jul 2014 11:57:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 11:57:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 02/11] qtwebkit: update patches applied to
	5.2.1 version
Thread-Index: AQHPorl3YolLRMHrs0K6hyQG5uiWPZuvezmg
Date: Thu, 24 Jul 2014 16:57:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9A71@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-2-git-send-email-denis@denix.org>
In-Reply-To: <1405709522-404-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 02/11] qtwebkit: update patches applied to	5.2.1 version
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
X-List-Received-Date: Thu, 24 Jul 2014 16:57:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, July 18, 2014 2:52 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 02/11] qtwebkit: update patches applied to
> 5.2.1 version
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...update-to-use-GL_NoX-version-of-GraphicsS.patch | 29
> ++++++++++++++++++++++  .../recipes-
> qt/qt5/qtwebkit/OpenGLShims.cpp.patch  | 24 ------------------
>  .../recipes-qt/qt5/qtwebkit/Target.pri.patch       | 24 ----------------=
--
>  .../recipes-qt/qt5/qtwebkit/features.prf.patch     | 20 ---------------
>  .../recipes-qt/qt5/qtwebkit_5.2.1.bbappend         |  6 ++---
>  5 files changed, 31 insertions(+), 72 deletions(-)  create mode 100644 m=
eta-
> arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX=
-
> version-of-GraphicsS.patch
>  delete mode 100644 meta-arago-distro/recipes-
> qt/qt5/qtwebkit/OpenGLShims.cpp.patch
>  delete mode 100644 meta-arago-distro/recipes-
> qt/qt5/qtwebkit/Target.pri.patch
>  delete mode 100644 meta-arago-distro/recipes-
> qt/qt5/qtwebkit/features.prf.patch
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-up=
date-
> to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-
> qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-
> GraphicsS.patch
> new file mode 100644
> index 0000000..55a4c03
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-t
> +++ o-use-GL_NoX-version-of-GraphicsS.patch
> @@ -0,0 +1,29 @@
> +From 90de2ab42bdd51b92dd00f700d6766ca1ffd23c0 Mon Sep 17 00:00:00
> 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Thu, 17 Jul 2014 16:11:46 -0400
> +Subject: [PATCH] Target.pri: update to use GL_NoX version of
> +GraphicsSurface  sources
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + Source/WebCore/Target.pri | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
> +index e2044bc..cc9bdd4 100644
> +--- a/Source/WebCore/Target.pri
> ++++ b/Source/WebCore/Target.pri
> +@@ -4283,6 +4283,10 @@ use?(GRAPHICS_SURFACE) {
> +             platform/graphics/surfaces/glx/X11Helper.cpp \
> +             platform/graphics/surfaces/glx/GraphicsSurfaceGLX.cpp
> +     }
> ++    contains(QT_CONFIG, opengles2) {
> ++        SOURCES -=3D platform/graphics/surfaces/qt/GraphicsSurfaceGLX.c=
pp
> ++        SOURCES +=3D
> platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
> ++    }
> + }
> +
> + build?(qttestsupport) {
> +--
> +2.0.0
> +
> diff --git a/meta-arago-distro/recipes-
> qt/qt5/qtwebkit/OpenGLShims.cpp.patch b/meta-arago-distro/recipes-
> qt/qt5/qtwebkit/OpenGLShims.cpp.patch
> deleted file mode 100644
> index 9261bed..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> ---- qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp.orig
> 	2013-09-07 13:46:41.614844342 +0530
> -+++ qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp	2013-
> 09-07 13:47:39.602841796 +0530
> -@@ -35,17 +35,20 @@ OpenGLFunctionTable* openGLFunctionTable
> - {
> -     static OpenGLFunctionTable table;
> -     return &table;
> - }
> -
> - #if PLATFORM(QT)
> - static void* getProcAddress(const char* procName)
> - {
> --    return reinterpret_cast<void*>(QOpenGLContext::currentContext()-
> >getProcAddress(procName));
> -+    if(QOpenGLContext::currentContext())
> -+        return reinterpret_cast<void*>(QOpenGLContext::currentContext()=
-
> >getProcAddress(procName));
> -+    else
> -+        return NULL;
> - }
> - #else
> - typedef void* (*glGetProcAddressType) (const char* procName);
> - static void* getProcAddress(const char* procName)
> - {
> -     static bool initialized =3D false;
> -     static glGetProcAddressType getProcAddressFunction =3D 0;
> -
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
> deleted file mode 100644
> index fcd7658..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> ---- qtwebkit/Source/WebCore/Target.pri.orig	2013-09-07
> 13:48:04.030840724 +0530
> -+++ qtwebkit/Source/WebCore/Target.pri	2013-09-07
> 13:49:01.714838191 +0530
> -@@ -4095,16 +4095,21 @@ use?(GRAPHICS_SURFACE) {
> -         INCLUDEPATH +=3D
> /System/Library/Frameworks/CoreFoundation.framework/Headers
> -     }
> -     win32 {
> -         SOURCES +=3D platform/graphics/surfaces/win/GraphicsSurfaceWin.=
cpp
> -     }
> -     have?(XCOMPOSITE) {
> -         SOURCES +=3D platform/graphics/surfaces/qt/GraphicsSurfaceGLX.c=
pp
> -     }
> -+    contains(QT_CONFIG, opengles2) {
> -+        SOURCES -=3D platform/graphics/surfaces/qt/GraphicsSurfaceGLX.c=
pp
> -+        SOURCES +=3D platform/graphics/surfaces/qt/GraphicsSurfaceGL_No=
X.cpp
> -+    }
> -+
> - }
> -
> - build?(qttestsupport) {
> -     HEADERS +=3D platform/qt/QtTestSupport.h
> -     SOURCES +=3D platform/qt/QtTestSupport.cpp
> - }
> -
> - ALL_IN_ONE_SOURCES +=3D \
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
> b/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
> deleted file mode 100644
> index 288f116..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> ---- qtwebkit/Tools/qmake/mkspecs/features/features.prf.orig	2013-09-07
> 13:49:38.210836589 +0530
> -+++ qtwebkit/Tools/qmake/mkspecs/features/features.prf	2013-09-07
> 13:50:13.574835036 +0530
> -@@ -127,16 +127,17 @@ defineTest(detectFeatures) {
> -     packagesExist(libudev): WEBKIT_CONFIG +=3D gamepad
> -
> -     # Support for Graphics Surface
> -     # GraphicsSurface requires GraphicsContext3D and hence use_3d_graph=
ics
> -     use?(3d_graphics) {
> -         mac: WEBKIT_CONFIG +=3D use_graphics_surface
> -         win32:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG +=3D
> use_graphics_surface
> -         linux-*:contains(WEBKIT_CONFIG, have_glx):contains(WEBKIT_CONFI=
G,
> have_xcomposite):contains(WEBKIT_CONFIG, have_xrender): WEBKIT_CONFIG
> +=3D use_graphics_surface
> -+        linux-*:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG +=3D
> -+ use_graphics_surface
> -     }
> -
> -     # Slider Touch is sensible to use when compiling WebKit2
> -     enable?(touch_events): WEBKIT_CONFIG +=3D touch_slider
> -
> -
> -     # Minibrowser must be able to query for QtTestSupport
> -     build?(qttestsupport): WEBKIT_CONFIG +=3D have_qttestsupport
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> index e86c8a2..63461f5 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
> @@ -1,14 +1,12 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
>  SRC_URI +=3D " \
> -	file://features.prf.patch \
>  	file://GraphicsContext3DQt.cpp.patch \
>  	file://GraphicsSurfaceGL_NoX.cpp.patch \
>  	file://GraphicsSurfaceToken.h.patch \
> -	file://OpenGLShims.cpp.patch \
>  	file://qttestbrowser.cpp.patch \
> -	file://Target.pri.patch \
> +	file://0001-Target.pri-update-to-use-GL_NoX-version-of-
> GraphicsS.patch
> +\
>  	file://WebCore.pri.patch \
>  "
>=20
> -PR_append =3D "-arago1"
> +PR_append =3D "-arago2"
> --
> 2.0.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

