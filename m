Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7C2AD52AFF
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:29:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJTWJg043343
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879772;
	bh=gWGk7N9vhmSSg8PE4liromlml0SIPKM4Dugap5VSHHA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=farwMmjsDnxdeNxS+ITC3reKqrnwhZDU7X/RN+TiY7oN31k8PY9nSHs51tf1Lp2rT
	UxdAzKzmCnzhWOcH+o7XsVva/jEIjH/XM3ZGDj28miDUmtQdUs3FzE0v8gxeykKCQE
	FjXs/KB9++hRDgdWphKO8nJvAVZ6PJmEBRx28OCU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJTWSb023900
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:29:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:29:32 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJTV8Q012810
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:32 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:29:25 -0400
Message-ID: <1534879768-59124-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
References: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/4] gtk+3: update wayland dependency and add patches
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
X-List-Received-Date: Tue, 21 Aug 2018 19:29:41 -0000
Content-Type: text/plain

- replace wayland dependency mesa with virtual/egl
- patch to fix egl API calls for GLES2

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...t-wayland.c-cleanup-the-parameters-of-egl.patch | 61 ++++++++++++++++++++++
 .../recipes-gnome/gtk+/gtk+3_%.bbappend            | 10 ++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
 create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend

diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch b/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
new file mode 100644
index 0000000..174dbdd
--- /dev/null
+++ b/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
@@ -0,0 +1,61 @@
+From d4c8511b845de02271b6dcf57a6edbf01f3f1905 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 21 Aug 2018 11:07:13 -0400
+Subject: [PATCH] gdkglcontext-wayland.c: cleanup the parameters of egl API
+ calls when GLES is used
+
+eglBindAPI: use EGL_OPENGL_ES_API instead of EGL_OPENGL_API
+eglChooseConfig: need to specify EGL_OPENGL_ES2_BIT as EGL_RENDERABLE_TYPE
+
+Upstream-Status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ gdk/wayland/gdkglcontext-wayland.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/gdk/wayland/gdkglcontext-wayland.c b/gdk/wayland/gdkglcontext-wayland.c
+index 254900d..3361eb3 100644
+--- a/gdk/wayland/gdkglcontext-wayland.c
++++ b/gdk/wayland/gdkglcontext-wayland.c
+@@ -314,6 +314,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
+   GdkWaylandDisplay *display_wayland = GDK_WAYLAND_DISPLAY (display);
+   EGLint major, minor;
+   EGLDisplay dpy;
++  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
+ 
+   if (display_wayland->have_egl)
+     return TRUE;
+@@ -326,7 +327,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
+   if (!eglInitialize (dpy, &major, &minor))
+     return FALSE;
+ 
+-  if (!eglBindAPI (EGL_OPENGL_API))
++  if (!eglBindAPI (use_es?EGL_OPENGL_ES_API:EGL_OPENGL_API))
+     return FALSE;
+ 
+   display_wayland->egl_display = dpy;
+@@ -379,6 +380,7 @@ find_eglconfig_for_window (GdkWindow  *window,
+   EGLint count;
+   EGLConfig *configs, chosen_config;
+   gboolean use_rgba;
++  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
+ 
+   int i = 0;
+ 
+@@ -395,6 +397,12 @@ find_eglconfig_for_window (GdkWindow  *window,
+   attrs[i++] = EGL_BLUE_SIZE;
+   attrs[i++] = 1;
+ 
++  if (use_es)
++    {
++      attrs[i++] = EGL_RENDERABLE_TYPE;
++      attrs[i++] = EGL_OPENGL_ES2_BIT;
++    }
++
+   use_rgba = (visual == gdk_screen_get_rgba_visual (gdk_display_get_default_screen (display)));
+ 
+   if (use_rgba)
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend b/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
new file mode 100644
index 0000000..d3fe505
--- /dev/null
+++ b/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl wayland-native"
+GTKGLIBC_RRECOMMENDS = "${GTKBASE_RRECOMMENDS}"
+
+PR_append = ".arago0"
+
+SRC_URI += "\
+    file://0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch \
+"
-- 
1.9.1


