Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 3529252CA2
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 16:33:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131GY0a8032835;
	Thu, 1 Apr 2021 11:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617294840;
	bh=c6T0sgDB0IENRGIqeXqtnXPkz7U61yiexSUbyKXoEnc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yXvfBRTysdoz8zgIffidd06D4pxlafVsi+avuo+Oz8rBFwpleNfGuBNwn+30NgNZs
	AsbsoJEaZ1H3AnqRYropSM9DgokExV6M84CSLL4EsmAv9M59HhsRneh6r5r42Zp3p6
	PGF7A9uU8pVQVhlM3g3zwnyNrs+dOeUjLh9AgCA0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131GY0Xh130350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 11:34:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 1 Apr 2021 11:33:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 1 Apr 2021 11:33:59 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131GXxwP122156;
	Thu, 1 Apr 2021 11:33:59 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 131GXsVY015613;
	Thu, 1 Apr 2021 11:33:59 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Thu, 1 Apr 2021 11:33:40 -0500
Message-ID: <20210401163340.12248-4-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401163340.12248-1-g-tammana@ti.com>
References: <20210401163340.12248-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: [dunfell][PATCH 3/3] qtwebkit: Cleanup old patches
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
X-List-Received-Date: Thu, 01 Apr 2021 16:33:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the patches that are no longer needed.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...e-to-use-GL_NoX-version-of-GraphicsS.patch | 29 ----------------
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch | 33 -------------------
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch | 17 ----------
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  6 +---
 4 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
deleted file mode 100644
index 55a4c032..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 90de2ab42bdd51b92dd00f700d6766ca1ffd23c0 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 17 Jul 2014 16:11:46 -0400
-Subject: [PATCH] Target.pri: update to use GL_NoX version of GraphicsSurface
- sources
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Source/WebCore/Target.pri | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
-index e2044bc..cc9bdd4 100644
---- a/Source/WebCore/Target.pri
-+++ b/Source/WebCore/Target.pri
-@@ -4283,6 +4283,10 @@ use?(GRAPHICS_SURFACE) {
-             platform/graphics/surfaces/glx/X11Helper.cpp \
-             platform/graphics/surfaces/glx/GraphicsSurfaceGLX.cpp
-     }
-+    contains(QT_CONFIG, opengles2) {
-+        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
-+        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
-+    }
- }
- 
- build?(qttestsupport) {
--- 
-2.0.0
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
deleted file mode 100644
index 722df392..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h.orig	2013-09-07 13:44:47.906849335 +0530
-+++ qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h	2013-09-07 13:46:12.554845618 +0530
-@@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
-     {
-         return frontBufferHandle != rhs.frontBufferHandle;
-     }
- 
-     bool isValid() const
-     {
-         return frontBufferHandle;
-     }
-+#elif PLATFORM(QT)
-+    GraphicsSurfaceToken(uint32_t windowID = 0)
-+         : frontBufferHandle(windowID)
-+    { }
-+
-+     bool operator!=(const GraphicsSurfaceToken &rhs) const
-+     {
-+         return frontBufferHandle != rhs.frontBufferHandle;
-+     }
- 
-+     bool isValid() const
-+     {
-+         return frontBufferHandle;
-+     }
- #endif
- 
- #if OS(DARWIN) || OS(WINDOWS)
-     GraphicsSurfaceToken(BufferHandle frontBuffer = 0, BufferHandle backBuffer = 0)
-         : frontBufferHandle(frontBuffer)
-         , backBufferHandle(backBuffer)
-     { }
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
deleted file mode 100644
index 276b3cf8..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCore.pri
-index 0189394..00f7090 100644
---- a/Source/WebCore/WebCore.pri
-+++ b/Source/WebCore/WebCore.pri
-@@ -227,8 +227,10 @@ use?(3D_GRAPHICS) {
- use?(GRAPHICS_SURFACE) {
-     mac: LIBS += -framework IOSurface -framework CoreFoundation
-     linux-*: {
--        LIBS += -lXcomposite -lXrender
--        CONFIG *= x11
-+        xlibAvailable() {
-+            LIBS += -lXcomposite -lXrender
-+            CONFIG *= x11
-+        }
-     }
- }
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 308f3f25..5bcef47f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -1,15 +1,11 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-#	file://GraphicsSurfaceToken.h.patch
-#	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
-#	file://WebCore.pri.patch
-
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 	file://0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch \
 "
 
-PR_append = ".arago8"
+PR_append = ".arago9"
 
 EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
 
-- 
2.31.1


