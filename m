Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id A132052A9C
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 20:06:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4PK64De009524
	for <meta-arago@arago-project.org>; Thu, 25 May 2017 15:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1495742764;
	bh=f8PJlwRG17GJ/hwqbcXkP+ZOxpJnNFrUyRtSy39mMik=;
	h=From:To:Subject:Date;
	b=Co4FKFb03hyeBJniHEOsA2KJNWjwNbneP1zXrvmbHi6Ow6U6Do6E7wkGUQcuGWVdp
	PYjYMquvjsAoAebPbANTn4IrpovDBQUvWPeXJjT5028LgmeOyaipUOgEg+4/7obYhX
	wits19Wo0zAb1DDEmzY6PCmvr54Ycc3O7J9+sHmg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4PK5xS8018631
	for <meta-arago@arago-project.org>; Thu, 25 May 2017 15:05:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 25 May 2017 15:05:58 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4PK5uSa003904	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 15:05:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 May 2017 16:05:51 -0400
Message-ID: <1495742751-48563-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] qtwebengine: add patches as workarond of the following three issues
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
X-List-Received-Date: Thu, 25 May 2017 20:06:15 -0000
Content-Type: text/plain

- fix system crash due to mismatched GLES2 library version
- set default logging level back to LOG_FATAL to avoid unnecessary warnings
- disable SECCOMP-BPF Sandbox


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-fix-the-system-crash-due-to-mismatched-G.patch | 66 ++++++++++++++++++++++
 ...-set-default-logging-level-back-to-LOG_FA.patch | 44 +++++++++++++++
 ...-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch | 31 ++++++++++
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  8 +++
 4 files changed, 149 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
new file mode 100644
index 0000000..4701720
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
@@ -0,0 +1,66 @@
+From 883678cb4444c13ea8fb4763da1917ace8c5c8b3 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 23 Mar 2017 15:30:16 -0400
+Subject: [PATCH 1/3] qtwebengine: fix the system crash due to mismatched GLES2
+ library version
+
+- define QT_LIB_GLES2 as "libGLESv2.so.1"
+- remove the Q_UNREACHABLE() which causes unnecessary system crash at
+  GLSurface::CreateOffscreenGLSurface(
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/core/gl_surface_qt.cpp      |  5 +++--
+ src/core/surface_factory_qt.cpp | 11 +++++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/gl_surface_qt.cpp b/src/core/gl_surface_qt.cpp
+index e7b4536..f020be9 100644
+--- a/src/core/gl_surface_qt.cpp
++++ b/src/core/gl_surface_qt.cpp
+@@ -619,8 +619,9 @@ GLSurface::CreateOffscreenGLSurface(const gfx::Size& size)
+     default:
+         break;
+     }
+-    LOG(ERROR) << "Requested OpenGL platform is not supported.";
+-    Q_UNREACHABLE();
++    LOG(ERROR) << "Requested OpenGL platform is not supported.";
++    // This is no longer an unreachable code. It is OK to return NULL if any prior operation fails
++    // Q_UNREACHABLE();
+     return NULL;
+ }
+ 
+diff --git a/src/core/surface_factory_qt.cpp b/src/core/surface_factory_qt.cpp
+index 48c91bf..134a866 100644
+--- a/src/core/surface_factory_qt.cpp
++++ b/src/core/surface_factory_qt.cpp
+@@ -57,8 +57,13 @@
+ #endif
+ #ifndef QT_LIBDIR_GLES2
+ #define QT_LIBDIR_GLES2 QT_LIBDIR_EGL
++#endif
++
++#ifndef QT_LIB_GLES2
++#define QT_LIB_GLES2 "libGLESv2.so.1"
+ #endif
+ 
++
+ namespace QtWebEngineCore {
+ 
+ base::NativeLibrary LoadLibrary(const base::FilePath& filename) {
+@@ -79,8 +84,10 @@ bool SurfaceFactoryQt::LoadEGLGLES2Bindings(AddGLLibraryCallback add_gl_library,
+     if (!eglLibrary)
+         return false;
+ 
+-    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
+-    libGLES2Path = libGLES2Path.Append("libGLESv2.so.2");
++    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
++    // It does not make sence to expect the version of libGLESv2 to be 2 as libGLESv2.so.2 
++    // It will be better to use another #define for user to reconfigure the library name
++    libGLES2Path = libGLES2Path.Append(QT_LIB_GLES2);
+     base::NativeLibrary gles2Library = LoadLibrary(libGLES2Path);
+     if (!gles2Library)
+         return false;
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
new file mode 100644
index 0000000..f8085d8
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch
@@ -0,0 +1,44 @@
+From 359141b88834bac09ac6bebae7ef09dcf2bd1dc7 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 23 Mar 2017 15:38:22 -0400
+Subject: [PATCH 2/3] qtwebengine: set default logging level back to LOG_FATAL
+
+Suppress info, warning and error messages by default to be consistent
+with QT5.6.2 behavior
+
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/core/content_main_delegate_qt.cpp | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/core/content_main_delegate_qt.cpp b/src/core/content_main_delegate_qt.cpp
+index 8bd07ef..6d8cfb1 100644
+--- a/src/core/content_main_delegate_qt.cpp
++++ b/src/core/content_main_delegate_qt.cpp
+@@ -111,14 +111,21 @@ void ContentMainDelegateQt::PreSandboxStartup()
+     settings.logging_dest = DetermineLogMode(*parsedCommandLine);
+     logging::InitLogging(settings);
+ 
++    // Suppress info, warning and error messages per default.
++    int logLevel = logging::LOG_FATAL;
++
+     if (logging::GetMinLogLevel() >= logging::LOG_INFO) {
+         if (parsedCommandLine->HasSwitch(switches::kLoggingLevel)) {
+             std::string logLevelValue = parsedCommandLine->GetSwitchValueASCII(switches::kLoggingLevel);
+             int level = 0;
+             if (base::StringToInt(logLevelValue, &level) && level >= logging::LOG_INFO && level < logging::LOG_NUM_SEVERITIES)
+-                logging::SetMinLogLevel(level);
++                logLevel = level;
++                //logging::SetMinLogLevel(level);
+         }
+     }
++
++    logging::SetMinLogLevel(logLevel);
++
+ }
+ 
+ content::ContentBrowserClient *ContentMainDelegateQt::CreateContentBrowserClient()
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
new file mode 100644
index 0000000..90fa373
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
@@ -0,0 +1,31 @@
+From 59dcfb9bc325b006097efb75a6c323d10205b90a Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 23 Mar 2017 15:42:43 -0400
+Subject: [PATCH 3/3] qtwebengine: HACK: disable SECCOMP-BPF Sandbox at startup
+
+SECCOMP-BPF Sandbox does not work at kernel 4.9.
+Disable this feature temporarily until those issues are resolved.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/core/web_engine_context.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/core/web_engine_context.cpp b/src/core/web_engine_context.cpp
+index 39e11a9..ae51097 100644
+--- a/src/core/web_engine_context.cpp
++++ b/src/core/web_engine_context.cpp
+@@ -281,7 +281,9 @@ WebEngineContext::WebEngineContext()
+ #if defined(Q_OS_WIN)
+         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
+ #elif defined(Q_OS_LINUX)
+-        parsedCommandLine->AppendSwitch(switches::kDisableSetuidSandbox);
++        parsedCommandLine->AppendSwitch(switches::kDisableSetuidSandbox);
++        // HACK: disable seccomp filter sandbox for now because it does not work
++        parsedCommandLine->AppendSwitch(switches::kDisableSeccompFilterSandbox);
+ #endif
+     } else {
+         parsedCommandLine->AppendSwitch(switches::kNoSandbox);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
new file mode 100644
index 0000000..794459a
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PR_append = ".arago0"
+
+SRC_URI += " \
+    file://0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch \
+    file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
+    file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
+"
-- 
1.9.1


