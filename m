Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id B44B352AC7
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X001CQ8F4WI10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:29 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E5E862008D; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:53 -0400
Message-id: <1405709522-404-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/11] qtwebkit: update patches applied to 5.2.1 version
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...update-to-use-GL_NoX-version-of-GraphicsS.patch | 29 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch  | 24 ------------------
 .../recipes-qt/qt5/qtwebkit/Target.pri.patch       | 24 ------------------
 .../recipes-qt/qt5/qtwebkit/features.prf.patch     | 20 ---------------
 .../recipes-qt/qt5/qtwebkit_5.2.1.bbappend         |  6 ++---
 5 files changed, 31 insertions(+), 72 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
new file mode 100644
index 0000000..55a4c03
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
@@ -0,0 +1,29 @@
+From 90de2ab42bdd51b92dd00f700d6766ca1ffd23c0 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 17 Jul 2014 16:11:46 -0400
+Subject: [PATCH] Target.pri: update to use GL_NoX version of GraphicsSurface
+ sources
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Source/WebCore/Target.pri | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
+index e2044bc..cc9bdd4 100644
+--- a/Source/WebCore/Target.pri
++++ b/Source/WebCore/Target.pri
+@@ -4283,6 +4283,10 @@ use?(GRAPHICS_SURFACE) {
+             platform/graphics/surfaces/glx/X11Helper.cpp \
+             platform/graphics/surfaces/glx/GraphicsSurfaceGLX.cpp
+     }
++    contains(QT_CONFIG, opengles2) {
++        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
++        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
++    }
+ }
+ 
+ build?(qttestsupport) {
+-- 
+2.0.0
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
deleted file mode 100644
index 9261bed..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/OpenGLShims.cpp.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp.orig	2013-09-07 13:46:41.614844342 +0530
-+++ qtwebkit/Source/WebCore/platform/graphics/OpenGLShims.cpp	2013-09-07 13:47:39.602841796 +0530
-@@ -35,17 +35,20 @@ OpenGLFunctionTable* openGLFunctionTable
- {
-     static OpenGLFunctionTable table;
-     return &table;
- }
- 
- #if PLATFORM(QT)
- static void* getProcAddress(const char* procName)
- {
--    return reinterpret_cast<void*>(QOpenGLContext::currentContext()->getProcAddress(procName));
-+    if(QOpenGLContext::currentContext())
-+        return reinterpret_cast<void*>(QOpenGLContext::currentContext()->getProcAddress(procName));
-+    else
-+        return NULL;
- }
- #else
- typedef void* (*glGetProcAddressType) (const char* procName);
- static void* getProcAddress(const char* procName)
- {
-     static bool initialized = false;
-     static glGetProcAddressType getProcAddressFunction = 0;
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
deleted file mode 100644
index fcd7658..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/Target.pri.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- qtwebkit/Source/WebCore/Target.pri.orig	2013-09-07 13:48:04.030840724 +0530
-+++ qtwebkit/Source/WebCore/Target.pri	2013-09-07 13:49:01.714838191 +0530
-@@ -4095,16 +4095,21 @@ use?(GRAPHICS_SURFACE) {
-         INCLUDEPATH += /System/Library/Frameworks/CoreFoundation.framework/Headers
-     }
-     win32 {
-         SOURCES += platform/graphics/surfaces/win/GraphicsSurfaceWin.cpp
-     }
-     have?(XCOMPOSITE) {
-         SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
-     }
-+    contains(QT_CONFIG, opengles2) {
-+        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
-+        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
-+    }
-+
- }
- 
- build?(qttestsupport) {
-     HEADERS += platform/qt/QtTestSupport.h
-     SOURCES += platform/qt/QtTestSupport.cpp
- }
- 
- ALL_IN_ONE_SOURCES += \
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
deleted file mode 100644
index 288f116..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/features.prf.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- qtwebkit/Tools/qmake/mkspecs/features/features.prf.orig	2013-09-07 13:49:38.210836589 +0530
-+++ qtwebkit/Tools/qmake/mkspecs/features/features.prf	2013-09-07 13:50:13.574835036 +0530
-@@ -127,16 +127,17 @@ defineTest(detectFeatures) {
-     packagesExist(libudev): WEBKIT_CONFIG += gamepad
- 
-     # Support for Graphics Surface
-     # GraphicsSurface requires GraphicsContext3D and hence use_3d_graphics
-     use?(3d_graphics) {
-         mac: WEBKIT_CONFIG += use_graphics_surface
-         win32:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG += use_graphics_surface
-         linux-*:contains(WEBKIT_CONFIG, have_glx):contains(WEBKIT_CONFIG, have_xcomposite):contains(WEBKIT_CONFIG, have_xrender): WEBKIT_CONFIG += use_graphics_surface
-+        linux-*:contains(QT_CONFIG, opengles2): WEBKIT_CONFIG += use_graphics_surface
-     }
- 
-     # Slider Touch is sensible to use when compiling WebKit2
-     enable?(touch_events): WEBKIT_CONFIG += touch_slider
- 
- 
-     # Minibrowser must be able to query for QtTestSupport
-     build?(qttestsupport): WEBKIT_CONFIG += have_qttestsupport
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
index e86c8a2..63461f5 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
@@ -1,14 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
-	file://features.prf.patch \
 	file://GraphicsContext3DQt.cpp.patch \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 	file://GraphicsSurfaceToken.h.patch \
-	file://OpenGLShims.cpp.patch \
 	file://qttestbrowser.cpp.patch \
-	file://Target.pri.patch \
+	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch \
 	file://WebCore.pri.patch \
 "
 
-PR_append = "-arago1"
+PR_append = "-arago2"
-- 
2.0.0


