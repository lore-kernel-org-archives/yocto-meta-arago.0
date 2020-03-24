Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CB4FF529F9
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2020 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 173F040BFB;
	Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id N5kqZm-wdcCO; Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E5B0A409DE;
	Tue, 24 Mar 2020 15:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 93F031712AC;
	Tue, 24 Mar 2020 11:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 24 Mar 2020 11:46:57 -0400
Message-Id: <1585064820-39907-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/4] qtwayland: drop backported patch for GLES2 decoration blitter fix
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
X-List-Received-Date: Tue, 24 Mar 2020 15:49:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ly-use-OpenGL-ES-2-API-for-decoration-bli.patch | 32 ----------------------
 .../recipes-qt/qt5/qtwayland_git.bbappend          |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch
deleted file mode 100644
index ae6256f..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c0303406ccd38063db46e8cfda5e5089ecf948a9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 26 Nov 2019 09:39:25 +0100
-Subject: [PATCH] Client: really use OpenGL ES 2 API for decoration blitter
-
-Really use (as the comment states) the OpenGL ES 2 API for
-the decoration blitter.
-
-Task-number: QTBUG-80356
-Change-Id: I4c923343e721a824521fb9b2b36be5d2de984325
-Reviewed-by: Pier Luigi Fiorini <pierluigi.fiorini@liri.io>
-Reviewed-by: Johan Helsing <johan.helsing@qt.io>
----
- .../client/wayland-egl/qwaylandglcontext.cpp                    | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp b/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
-index bc1f74af..da147495 100644
---- a/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
-+++ b/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
-@@ -312,7 +312,7 @@ QWaylandGLContext::QWaylandGLContext(EGLDisplay eglDisplay, QWaylandDisplay *dis
- 
-     // Create an EGL context for the decorations blitter. By using a dedicated context we don't need to make sure to not
-     // change the context state and we also use OpenGL ES 2 API independently to what the app is using to draw.
--    QVector<EGLint> eglDecorationsContextAttrs = { EGL_CONTEXT_CLIENT_VERSION, 1, EGL_NONE };
-+    QVector<EGLint> eglDecorationsContextAttrs = { EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE };
-     m_decorationsContext = eglCreateContext(m_eglDisplay, m_config, m_context, eglDecorationsContextAttrs.constData());
-     if (m_decorationsContext == EGL_NO_CONTEXT)
-         qWarning("QWaylandGLContext: Failed to create the decorations EGLContext. Decorations will not be drawn.");
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index 9577e1d..bd529d2 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -3,5 +3,4 @@ PR_append = ".arago1"
 
 SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
-    file://0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch \
 "
-- 
2.7.4


