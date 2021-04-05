Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 8093E52BB4
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:39:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KdXAl094695;
	Mon, 5 Apr 2021 15:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617655173;
	bh=Nvsv6WDr9xAVR+OlPr8Ek3kFFYXeLeIkQ8wImD/QWHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HlcFynLTcMSE4bBQASqs8nXXhfmPaugrb0nv3A65Zu30FcIZBnbToJhfT1mU6r+Vt
	XoH7Ip2fvUBEC/H0dGkOAJGS72X86eY5weNXVw4NKJT+5FIUEofm0trtS3uQImzwXX
	nXY3el9cNDNMikkn2xdRuW93odFPbBWJtW9O3lew=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KdXxk030636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:39:33 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:39:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 5 Apr 2021 15:39:33 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135KdXpJ031459;
	Mon, 5 Apr 2021 15:39:33 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	135KdV3p031788; Mon, 5 Apr 2021 15:39:32 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Mon, 5 Apr 2021 15:39:27 -0500
Message-ID: <20210405203928.7783-3-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405203928.7783-1-g-tammana@ti.com>
References: <20210405203928.7783-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Krunal Bhargav <k-bhargav@ti.com>
Subject: [dunfell][PATCH v2 2/3] qtwebkit: Fix no X11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 20:39:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qtwebkit build is failing to set EGL_NO_X11 on platforms with no x11
support causing below failure.

```{.package=qtwebkit .version=dunfell}
In file included from
tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/egl.h:39,
                from tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES.cpp:36:
tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such file or directory
  134 | #include <X11/Xlib.h>
      |          ^~~~~~~~~~~~
compilation terminated.
```

Setting up the flag EGL_NO_X11 when X11 target is disabled.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...re-PlatformQt.cmake-Fix-no-x11-build.patch | 46 +++++++++++++++++++
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
new file mode 100644
index 00000000..c70b3dc0
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch
@@ -0,0 +1,46 @@
+From 82b7ec12b768ba9de4b7a4ae71500a3de6574bfd Mon Sep 17 00:00:00 2001
+From: Gowtham Tammana <g-tammana@ti.com>
+Date: Thu, 1 Apr 2021 10:45:13 -0500
+Subject: [PATCH] WebCore/PlatformQt.cmake: Fix no x11 build
+
+For platforms with no x11 support, egl package config sets up EGL_NO_X11
+flag. However the build is not picking up this flag at the moment
+causing below build failure.
+
+```{.package=qtwebkit .version=dunfell}
+In file included from
+tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/egl.h:39,
+                from tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/git/Source/WebCore/platform/graphics/opengl/Extensions3DOpenGLES.cpp:36:
+tisdk/build/arago-tmp-external-arm-glibc/work/aarch64-linux/qtwebkit/5.14.2+gitAUTOINC+ab1bd15209-r0.arago7/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such file or directory
+  134 | #include <X11/Xlib.h>
+      |          ^~~~~~~~~~~~
+compilation terminated.
+```
+
+Set this flag explicitly when there is no X11 target enable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ Source/WebCore/PlatformQt.cmake | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WebCore/PlatformQt.cmake b/Source/WebCore/PlatformQt.cmake
+index 99c625dc3..375d28a47 100644
+--- a/Source/WebCore/PlatformQt.cmake
++++ b/Source/WebCore/PlatformQt.cmake
+@@ -350,6 +350,10 @@ if (ENABLE_OPENGL)
+             ${Qt5Gui_EGL_LIBRARIES}
+             ${Qt5Gui_OPENGL_LIBRARIES}
+         )
++        if (NOT ENABLE_X11_TARGET)
++            # EGL definitions are not getting detected. Add the EGL_NO_X11 flag.
++            add_definitions("-DEGL_NO_X11")
++        endif ()
+     else ()
+         list(APPEND WebCore_SOURCES
+             platform/graphics/opengl/Extensions3DOpenGL.cpp
+-- 
+2.31.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 75213487..308f3f25 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -6,9 +6,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
+	file://0001-WebCore-PlatformQt.cmake-Fix-no-x11-build.patch \
 "
 
-PR_append = ".arago7"
+PR_append = ".arago8"
 
 EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
 
-- 
2.31.1


