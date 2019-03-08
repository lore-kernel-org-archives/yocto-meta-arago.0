Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A0C00529A4
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:30:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28NUMq2076298
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:30:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552087822;
	bh=sirsUGRBfGZBxsLaESeYeFGzWeMTBTj6c4wLwAl1kO4=;
	h=From:To:Subject:Date;
	b=DveU8yxOc1tYKpbxT2aUMK37nwn99lX2WlCKLVebPoJ6EmQhmJ09RqTJNT9XlgCCX
	xDkGxjomhLnhFWnKXAKim9rtF1Il8rElk43hKmMfWMyJGMvZNfcmPKpXJoO+sbTddi
	H527mbuFYFrXA360Z4swlfj0SqJlwfFhgLKCMZVo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28NUMLC110122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:30:22 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:30:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 17:30:22 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28NUL50008924
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:30:22 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Mar 2019 18:30:19 -0500
Message-ID: <1552087819-7645-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] qtwebengine: rebase and remove patches
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
X-List-Received-Date: Fri, 08 Mar 2019 23:30:31 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-fix-the-system-crash-due-to-mismatched-G.patch | 71 ----------------------
 ...-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch | 18 +++---
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  6 +-
 3 files changed, 10 insertions(+), 85 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
deleted file mode 100644
index 4de2257..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From e42a0566079a86c3b637b058ac6a5ad3b3ee6f5b Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 25 May 2017 16:44:51 -0400
-Subject: [PATCH 1/3] qtwebengine: fix the system crash due to mismatched GLES2
-  library version
-
-- define QT_LIB_GLES2 as "libGLESv2.so.1"
-- remove the Q_UNREACHABLE() which causes unnecessary system crash at
-  GLSurface::CreateOffscreenGLSurface(
-
-Upstream-Status: Inappropriate
-This patch is for TI only because the libGLESv2.so.1 is provided by IMG DDK 1.14.
-The issue is expected to be resolved by DDK 1.15 or DDK 1.16 when MESA-style
-libraries are provided.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- src/core/gl_surface_qt.cpp      |  5 +++--
- src/core/surface_factory_qt.cpp | 11 +++++++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/gl_surface_qt.cpp b/src/core/gl_surface_qt.cpp
-index e7b4536..f020be9 100644
---- a/src/core/gl_surface_qt.cpp
-+++ b/src/core/gl_surface_qt.cpp
-@@ -619,8 +619,9 @@ GLSurface::CreateOffscreenGLSurface(const gfx::Size& size)
-     default:
-         break;
-     }
--    LOG(ERROR) << "Requested OpenGL platform is not supported.";
--    Q_UNREACHABLE();
-+    LOG(ERROR) << "Requested OpenGL platform is not supported.";
-+    // This is no longer an unreachable code. It is OK to return NULL if any prior operation fails
-+    // Q_UNREACHABLE();
-     return NULL;
- }
- 
-diff --git a/src/core/surface_factory_qt.cpp b/src/core/surface_factory_qt.cpp
-index 48c91bf..134a866 100644
---- a/src/core/surface_factory_qt.cpp
-+++ b/src/core/surface_factory_qt.cpp
-@@ -57,8 +57,13 @@
- #endif
- #ifndef QT_LIBDIR_GLES2
- #define QT_LIBDIR_GLES2 QT_LIBDIR_EGL
-+#endif
-+
-+#ifndef QT_LIB_GLES2
-+#define QT_LIB_GLES2 "libGLESv2.so.1"
- #endif
- 
-+
- namespace QtWebEngineCore {
- 
- base::NativeLibrary LoadLibrary(const base::FilePath& filename) {
-@@ -79,8 +84,10 @@ bool SurfaceFactoryQt::LoadEGLGLES2Bindings(AddGLLibraryCallback add_gl_library,
-     if (!eglLibrary)
-         return false;
- 
--    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
--    libGLES2Path = libGLES2Path.Append("libGLESv2.so.2");
-+    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
-+    // It does not make sence to expect the version of libGLESv2 to be 2 as libGLESv2.so.2 
-+    // It will be better to use another #define for user to reconfigure the library name
-+    libGLES2Path = libGLES2Path.Append(QT_LIB_GLES2);
-     base::NativeLibrary gles2Library = LoadLibrary(libGLES2Path);
-     if (!gles2Library)
-         return false;
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
index 443abce..09f1870 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
@@ -1,6 +1,6 @@
-From 5e4eef86271cbb83d9a37e889485dc0fde9b8798 Mon Sep 17 00:00:00 2001
+From 77fc6e4391562a1f84d82b58319a73de08242797 Mon Sep 17 00:00:00 2001
 From: Eric Ruei <e-ruei1@ti.com>
-Date: Thu, 25 May 2017 17:00:43 -0400
+Date: Fri, 8 Mar 2019 18:17:06 -0500
 Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
 
 SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
@@ -11,21 +11,19 @@ Upstream-Status: Inappropriate [HACK]
 
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- src/core/web_engine_context.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ src/core/web_engine_context.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
-index 39e11a9..ae51097 100644
+index 48e5bc4..9ba3fa4 100644
 --- a/src/core/web_engine_context.cpp
 +++ b/src/core/web_engine_context.cpp
-@@ -281,7 +281,9 @@ WebEngineContext::WebEngineContext()
- #if defined(Q_OS_WIN)
+@@ -347,6 +347,8 @@ WebEngineContext::WebEngineContext()
          parsedCommandLine->AppendSwitch(switches::kNoSandbox);
  #elif defined(Q_OS_LINUX)
--        parsedCommandLine->AppendSwitch(switches::kDisableSetuidSandbox);
-+        parsedCommandLine->AppendSwitch(switches::kDisableSetuidSandbox);
+         parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSetuidSandbox);
 +        // HACK: disable seccomp filter sandbox for now because it does not work
-+        parsedCommandLine->AppendSwitch(switches::kDisableSeccompFilterSandbox);
++        parsedCommandLine->AppendSwitch(service_manager::switches::kDisableSeccompFilterSandbox);
  #endif
      } else {
          parsedCommandLine->AppendSwitch(switches::kNoSandbox);
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 0e0c6d2..28ff601 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,11 +1,9 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago0"
-
-#    file://0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
-#    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
+PR_append = ".arago1"
 
 SRC_URI += " \
     file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
+    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
 "
 
 DEPENDS += "bison-native"
-- 
1.9.1


