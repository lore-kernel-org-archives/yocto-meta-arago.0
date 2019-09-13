Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2BD82529A5
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 03:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 00A3440C07;
	Fri, 13 Sep 2019 03:11:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lezcflpAUyFR; Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF59A40C0C;
	Fri, 13 Sep 2019 03:11:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 99DF417422C;
	Thu, 12 Sep 2019 23:11:29 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 23:11:25 -0400
Message-Id: <1568344286-30548-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568344286-30548-1-git-send-email-denys@ti.com>
References: <1568344286-30548-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 5/6] HACK: qtbase: mangle local eglfs_kms patch to apply on 5.13
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
X-List-Received-Date: Fri, 13 Sep 2019 03:12:39 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ins-platforms-eglfs_kms-fix-compiler-erro.patch | 28 ----------------------
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend |  3 ++-
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
index cbedfc0..16006aa 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
@@ -15,18 +15,6 @@ diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgb
 index 4023381..eb24175 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-@@ -61,11 +61,6 @@ QEglFSKmsGbmIntegration::QEglFSKmsGbmIntegration()
-     qCDebug(qLcEglfsKmsDebug, "New DRM/KMS via GBM integration created");
- }
- 
--#ifndef EGL_EXT_platform_base
--typedef EGLDisplay (EGLAPIENTRYP PFNEGLGETPLATFORMDISPLAYEXTPROC) (EGLenum platform, void *native_display, const EGLint *attrib_list);
--typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
--#endif
--
- #ifndef EGL_PLATFORM_GBM_KHR
- #define EGL_PLATFORM_GBM_KHR 0x31D7
- #endif
 @@ -83,7 +78,7 @@ EGLDisplay QEglFSKmsGbmIntegration::createDisplay(EGLNativeDisplayType nativeDis
      }
  
@@ -36,22 +24,6 @@ index 4023381..eb24175 100644
      } else {
          qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM, falling back to eglGetDisplay");
          display = eglGetDisplay(nativeDisplay);
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-index 71f232a..6467a21 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-@@ -48,6 +48,11 @@
- 
- QT_BEGIN_NAMESPACE
- 
-+#ifndef EGL_EXT_platform_base
-+typedef EGLDisplay (EGLAPIENTRYP PFNEGLGETPLATFORMDISPLAYEXTPROC) (EGLenum platform, void *native_display, const EGLint *attrib_list);
-+typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
-+#endif
-+
- class QEglFSKmsDevice;
- 
- class QEglFSKmsGbmIntegration : public QEglFSKmsIntegration
 -- 
 1.9.1
 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 6056b9e..88fea3b 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -14,10 +14,11 @@ QT_EGLFS_PATCHES = "\
     file://quit.png \
 "
 
+#    file://0002-deform-disable-opengl-button.patch
+
 SRC_URI += "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
-    file://0002-deform-disable-opengl-button.patch \
     file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch \
 "
 
-- 
2.7.4


