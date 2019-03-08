Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E045052987
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:02:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28N2Dh8069503
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552086134;
	bh=/ZnRY1mHOpAXSROIk4HDUj/Ss5bn1CiQ5hy6Hd28Jng=;
	h=From:To:Subject:Date;
	b=XXwTNqJQ77aED9Jpy0yjSovOZRA+QJchr1GYFjVzebv8pxVBWMycLulnDCcEybyUb
	HIX2XBC96Efwx0v77US9SECdOjwoJlNySWZTAT20T0r/6lnV0Maz7VqTnk0NjX5jw5
	sR2e4SXrPSfPEsvwA48N46Ghub24DJGkhUEocyYM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28N2DbD007096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:13 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:02:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 17:02:13 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28N2D1F026555
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:13 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Mar 2019 18:02:06 -0500
Message-ID: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/2] qtbase: enable gbm/kms and fix compiling error
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
X-List-Received-Date: Fri, 08 Mar 2019 23:02:22 -0000
Content-Type: text/plain

- enable gbm/kms for eglfs_kms
- fix compiling error at platform/eglfs_kms
- remove unused patch which has been upstreamed

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...ure-Set-wrap-mode-if-NPOT-textures-are-no.patch | 65 ----------------------
 ...ins-platforms-eglfs_kms-fix-compiler-erro.patch | 57 +++++++++++++++++++
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 12 +++-
 3 files changed, 66 insertions(+), 68 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
deleted file mode 100644
index 84a0195..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From fbb9c0461c14196ac7100c90088c15263d0cccbb Mon Sep 17 00:00:00 2001
-From: Johan Klokkhammer Helsing <johan.helsing@qt.io>
-Date: Tue, 3 Apr 2018 14:42:15 +0200
-Subject: [PATCH] QOpenGLTexture: Set wrap mode if NPOT textures are not fully
- supported
-
-The OpenGL wrap mode defaults to GL_REPEAT although it is not supported for
-non-power-of-two textures on hardware that only has limited support.
-
-I.e. the following would create a texture with an invalid wrap mode:
-
-    auto *t = new QOpenGLTexture(QOpenGLTexture::Target2D);
-    t.setSize(123, 456);
-
-This patch adds a check in QOpenGLWindow::setSize to see if it's called with a
-non-power-of-two size on hardware without full support, and if so sets wrapMode
-to ClampToEdge (which should work on devices with limited support).
-
-Task-number: QTBUG-67418
-Change-Id: I56e9f4383dbf5430c2bc5e4e9e585712b3603c13
-Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
----
- src/gui/opengl/qopengltexture.cpp | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/gui/opengl/qopengltexture.cpp b/src/gui/opengl/qopengltexture.cpp
-index b825b56..cea4b51 100644
---- a/src/gui/opengl/qopengltexture.cpp
-+++ b/src/gui/opengl/qopengltexture.cpp
-@@ -2800,6 +2800,11 @@ QOpenGLTexture::TextureFormat QOpenGLTexture::format() const
-     return d->format;
- }
- 
-+static bool isNpot(int width, int height = 1, int depth = 1)
-+{
-+    return width & (width-1) || height & (height-1) || depth & (depth-1);
-+}
-+
- /*!
-     Sets the dimensions of this texture object to \a width,
-     \a height, and \a depth. The default for each dimension is 1.
-@@ -2807,6 +2812,10 @@ QOpenGLTexture::TextureFormat QOpenGLTexture::format() const
-     implementation. Allocating storage for a texture less than the
-     maximum size can still fail if your system is low on resources.
- 
-+    If a non-power-of-two \a width, \a height or \a depth is provided and your
-+    OpenGL implementation doesn't have support for repeating non-power-of-two
-+    textures, then the wrap mode is automatically set to ClampToEdge.
-+
-     \sa width(), height(), depth()
- */
- void QOpenGLTexture::setSize(int width, int height, int depth)
-@@ -2819,6 +2828,9 @@ void QOpenGLTexture::setSize(int width, int height, int depth)
-         return;
-     }
- 
-+    if (isNpot(width, height, depth) && !hasFeature(Feature::NPOTTextureRepeat) && d->target != Target::TargetRectangle)
-+        d->setWrapMode(WrapMode::ClampToEdge);
-+
-     switch (d->target) {
-     case QOpenGLTexture::Target1D:
-     case QOpenGLTexture::Target1DArray:
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
new file mode 100644
index 0000000..cbedfc0
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
@@ -0,0 +1,57 @@
+From 7e1d01d4dc022f4da117f87a993d03b084134018 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 8 Mar 2019 17:02:38 -0500
+Subject: [PATCH] qtbase: plugins: platforms: eglfs_kms: fix compiler error
+
+Upstream_Status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ .../eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp  | 7 +------
+ .../eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h    | 5 +++++
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+index 4023381..eb24175 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+@@ -61,11 +61,6 @@ QEglFSKmsGbmIntegration::QEglFSKmsGbmIntegration()
+     qCDebug(qLcEglfsKmsDebug, "New DRM/KMS via GBM integration created");
+ }
+ 
+-#ifndef EGL_EXT_platform_base
+-typedef EGLDisplay (EGLAPIENTRYP PFNEGLGETPLATFORMDISPLAYEXTPROC) (EGLenum platform, void *native_display, const EGLint *attrib_list);
+-typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
+-#endif
+-
+ #ifndef EGL_PLATFORM_GBM_KHR
+ #define EGL_PLATFORM_GBM_KHR 0x31D7
+ #endif
+@@ -83,7 +78,7 @@ EGLDisplay QEglFSKmsGbmIntegration::createDisplay(EGLNativeDisplayType nativeDis
+     }
+ 
+     if (getPlatformDisplay) {
+-        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
++        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, (void *)nativeDisplay, nullptr);
+     } else {
+         qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM, falling back to eglGetDisplay");
+         display = eglGetDisplay(nativeDisplay);
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
+index 71f232a..6467a21 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
+@@ -48,6 +48,11 @@
+ 
+ QT_BEGIN_NAMESPACE
+ 
++#ifndef EGL_EXT_platform_base
++typedef EGLDisplay (EGLAPIENTRYP PFNEGLGETPLATFORMDISPLAYEXTPROC) (EGLenum platform, void *native_display, const EGLint *attrib_list);
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
++#endif
++
+ class QEglFSKmsDevice;
+ 
+ class QEglFSKmsGbmIntegration : public QEglFSKmsIntegration
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 4cb8f9c..1570e1f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,7 +4,14 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = ".arago13"
+# the orginal gbm packageconfig requires virtual/libgbm
+# Implement the patch here
+
+PACKAGECONFIG[gbm] = "-gbm,-no-gbm,drm virtual/egl"
+PACKAGECONFIG += "gbm"
+PACKAGECONFIG += "kms"
+
+PR_append = ".arago14"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -14,12 +21,11 @@ QT_EGLFS_PATCHES = "\
     file://quit.png \
 "
 
-#    file://0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
-
 SRC_URI += "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0002-deform-disable-opengl-button.patch \
+    file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch \
 "
 
 python do_patch_append() {
-- 
1.9.1


