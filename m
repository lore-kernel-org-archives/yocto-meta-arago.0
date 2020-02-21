Return-Path: <afd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 22717529B5
	for <meta-arago@arago-project.org>;
	Fri, 21 Feb 2020 15:48:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LFkQXO094389
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2020 09:46:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582299986;
	bh=kpFKZvk3MZgvdjAszO/GxOn5qquTPlWxtgBWMo+Mbhs=;
	h=From:To:CC:Subject:Date;
	b=It27KLrAq47aHWepes48tJZ4WQSb4Cxfb+Gyz9eSLbUdmkn2jOY03hGIPS4tU1/nj
	izcUDkLdeJuOLATXaSigHMNxtG8tfHmBrf9fQDkupBrCrkMMdzPHQZhjZNZ1iFyzDv
	5NxmMFoBiL4WkXnB7cw2TR4tGdbGLNqPJ988O21k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LFkQhn091510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2020 09:46:26 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 21 Feb 2020 09:46:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 21 Feb 2020 09:46:26 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LFkQTC071212;
	Fri, 21 Feb 2020 09:46:26 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 21 Feb 2020 10:46:26 -0500
Message-ID: <20200221154626.10751-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] qtwayland: backport decoration blitter fix for GLES2 selection
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
X-List-Received-Date: Fri, 21 Feb 2020 15:48:26 -0000
Content-Type: text/plain

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 ...e-OpenGL-ES-2-API-for-decoration-bli.patch | 32 +++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend     |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch
new file mode 100644
index 00000000..ae6256f0
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch
@@ -0,0 +1,32 @@
+From c0303406ccd38063db46e8cfda5e5089ecf948a9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 26 Nov 2019 09:39:25 +0100
+Subject: [PATCH] Client: really use OpenGL ES 2 API for decoration blitter
+
+Really use (as the comment states) the OpenGL ES 2 API for
+the decoration blitter.
+
+Task-number: QTBUG-80356
+Change-Id: I4c923343e721a824521fb9b2b36be5d2de984325
+Reviewed-by: Pier Luigi Fiorini <pierluigi.fiorini@liri.io>
+Reviewed-by: Johan Helsing <johan.helsing@qt.io>
+---
+ .../client/wayland-egl/qwaylandglcontext.cpp                    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp b/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
+index bc1f74af..da147495 100644
+--- a/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
++++ b/src/hardwareintegration/client/wayland-egl/qwaylandglcontext.cpp
+@@ -312,7 +312,7 @@ QWaylandGLContext::QWaylandGLContext(EGLDisplay eglDisplay, QWaylandDisplay *dis
+ 
+     // Create an EGL context for the decorations blitter. By using a dedicated context we don't need to make sure to not
+     // change the context state and we also use OpenGL ES 2 API independently to what the app is using to draw.
+-    QVector<EGLint> eglDecorationsContextAttrs = { EGL_CONTEXT_CLIENT_VERSION, 1, EGL_NONE };
++    QVector<EGLint> eglDecorationsContextAttrs = { EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE };
+     m_decorationsContext = eglCreateContext(m_eglDisplay, m_config, m_context, eglDecorationsContextAttrs.constData());
+     if (m_decorationsContext == EGL_NO_CONTEXT)
+         qWarning("QWaylandGLContext: Failed to create the decorations EGLContext. Decorations will not be drawn.");
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index 82d98e50..9577e1d2 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
+    file://0001-Client-really-use-OpenGL-ES-2-API-for-decoration-bli.patch \
 "
-- 
2.17.1


