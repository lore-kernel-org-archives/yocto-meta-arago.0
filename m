Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AE33552993
	for <meta-arago@arago-project.org>;
	Wed, 11 Jul 2018 21:21:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BLLTdk111694
	for <meta-arago@arago-project.org>; Wed, 11 Jul 2018 16:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531344089;
	bh=mCH++7497U7YK4BU2sxQ8UgLhVSqorvctzHE/31o5tc=;
	h=From:To:Subject:Date;
	b=NWSKZFVUMEZlw0j/P96ToDa+yAnp6Mrnagpw9W5uqBEhXzmCxiaOfM3FboMuuxuvT
	p20zCT81aADI08ApkjmtBLyx/GNgAvC7vg4m0v36FaVxDNLDv0M3oes+uRB6ieRBrk
	p81AOme+q2BhstEKd3q8w6jWvQiES4WVLuxntddw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BLLTTk005713
	for <meta-arago@arago-project.org>; Wed, 11 Jul 2018 16:21:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 16:21:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 16:21:28 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BLLSYN005986
	for <meta-arago@arago-project.org>; Wed, 11 Jul 2018 16:21:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Jul 2018 17:21:21 -0400
Message-ID: <1531344081-55807-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/ti2018.01][PATCH] qtbase: fix qwindow-compositor dispaly issue of NPOT textures
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
X-List-Received-Date: Wed, 11 Jul 2018 21:21:37 -0000
Content-Type: text/plain

Add a qtbase patch to fix the qwindow-compositor display issue of NTOP
(Non-Power-Of-Two) textures for GPU which does not spport GL_REPEAT wrap mode.
The same patch is included at QT5.11.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...ure-Set-wrap-mode-if-NPOT-textures-are-no.patch | 65 ++++++++++++++++++++++
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend |  3 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
new file mode 100644
index 0000000..84a0195
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch
@@ -0,0 +1,65 @@
+From fbb9c0461c14196ac7100c90088c15263d0cccbb Mon Sep 17 00:00:00 2001
+From: Johan Klokkhammer Helsing <johan.helsing@qt.io>
+Date: Tue, 3 Apr 2018 14:42:15 +0200
+Subject: [PATCH] QOpenGLTexture: Set wrap mode if NPOT textures are not fully
+ supported
+
+The OpenGL wrap mode defaults to GL_REPEAT although it is not supported for
+non-power-of-two textures on hardware that only has limited support.
+
+I.e. the following would create a texture with an invalid wrap mode:
+
+    auto *t = new QOpenGLTexture(QOpenGLTexture::Target2D);
+    t.setSize(123, 456);
+
+This patch adds a check in QOpenGLWindow::setSize to see if it's called with a
+non-power-of-two size on hardware without full support, and if so sets wrapMode
+to ClampToEdge (which should work on devices with limited support).
+
+Task-number: QTBUG-67418
+Change-Id: I56e9f4383dbf5430c2bc5e4e9e585712b3603c13
+Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
+---
+ src/gui/opengl/qopengltexture.cpp | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/gui/opengl/qopengltexture.cpp b/src/gui/opengl/qopengltexture.cpp
+index b825b56..cea4b51 100644
+--- a/src/gui/opengl/qopengltexture.cpp
++++ b/src/gui/opengl/qopengltexture.cpp
+@@ -2800,6 +2800,11 @@ QOpenGLTexture::TextureFormat QOpenGLTexture::format() const
+     return d->format;
+ }
+ 
++static bool isNpot(int width, int height = 1, int depth = 1)
++{
++    return width & (width-1) || height & (height-1) || depth & (depth-1);
++}
++
+ /*!
+     Sets the dimensions of this texture object to \a width,
+     \a height, and \a depth. The default for each dimension is 1.
+@@ -2807,6 +2812,10 @@ QOpenGLTexture::TextureFormat QOpenGLTexture::format() const
+     implementation. Allocating storage for a texture less than the
+     maximum size can still fail if your system is low on resources.
+ 
++    If a non-power-of-two \a width, \a height or \a depth is provided and your
++    OpenGL implementation doesn't have support for repeating non-power-of-two
++    textures, then the wrap mode is automatically set to ClampToEdge.
++
+     \sa width(), height(), depth()
+ */
+ void QOpenGLTexture::setSize(int width, int height, int depth)
+@@ -2819,6 +2828,9 @@ void QOpenGLTexture::setSize(int width, int height, int depth)
+         return;
+     }
+ 
++    if (isNpot(width, height, depth) && !hasFeature(Feature::NPOTTextureRepeat) && d->target != Target::TargetRectangle)
++        d->setWrapMode(WrapMode::ClampToEdge);
++
+     switch (d->target) {
+     case QOpenGLTexture::Target1D:
+     case QOpenGLTexture::Target1DArray:
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 62f49e4..571261e 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,7 +4,7 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = ".arago12"
+PR_append = ".arago13"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -18,6 +18,7 @@ SRC_URI += "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0002-deform-disable-opengl-button.patch \
+    file://0001-QOpenGLTexture-Set-wrap-mode-if-NPOT-textures-are-no.patch \
 "
 
 python do_patch_append() {
-- 
1.9.1


