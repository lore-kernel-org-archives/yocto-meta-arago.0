Return-Path: <afd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 888D7529A5
	for <meta-arago@arago-project.org>;
	Wed, 19 Feb 2020 22:55:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JMrelT033996
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2020 16:53:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582152820;
	bh=QOZVySFBZ0LGLS3w8SVvms3yaGcSGgybgMkLm11bfSE=;
	h=From:To:CC:Subject:Date;
	b=x0fApsCTGpzrDB8iAB91cdL8MvQgWYdENqx5murD0P9PLHCakQx3ctde0gGwlQbI6
	gSMmzNkpZVGCkmHH30he921rCCRlyvgyOrGOaFBQiPVH7ohPJv3CbfgBU2Bno9NxFw
	5t+tQZhhCAmPwSBSYcHeD/NU1Dv4/+EPPgoO8Ah4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JMreI4106327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2020 16:53:40 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 19 Feb 2020 16:53:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 19 Feb 2020 16:53:40 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JMrehe121325;
	Wed, 19 Feb 2020 16:53:40 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
Date: Wed, 19 Feb 2020 17:53:39 -0500
Message-ID: <20200219225339.9953-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] gtk+3: Remove no longer needed GTK3+ GLES/EGL fix
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
X-List-Received-Date: Wed, 19 Feb 2020 22:55:40 -0000
Content-Type: text/plain

We will exit this function at ->has_egl, so this patch is not
needed. Remove it and the bbappends that adds it.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 ...land.c-cleanup-the-parameters-of-egl.patch | 61 -------------------
 .../recipes-gnome/gtk+/gtk+3_%.bbappend       | 10 ---
 2 files changed, 71 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
 delete mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend

diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch b/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
deleted file mode 100644
index 174dbdda..00000000
--- a/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From d4c8511b845de02271b6dcf57a6edbf01f3f1905 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 21 Aug 2018 11:07:13 -0400
-Subject: [PATCH] gdkglcontext-wayland.c: cleanup the parameters of egl API
- calls when GLES is used
-
-eglBindAPI: use EGL_OPENGL_ES_API instead of EGL_OPENGL_API
-eglChooseConfig: need to specify EGL_OPENGL_ES2_BIT as EGL_RENDERABLE_TYPE
-
-Upstream-Status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- gdk/wayland/gdkglcontext-wayland.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/gdk/wayland/gdkglcontext-wayland.c b/gdk/wayland/gdkglcontext-wayland.c
-index 254900d..3361eb3 100644
---- a/gdk/wayland/gdkglcontext-wayland.c
-+++ b/gdk/wayland/gdkglcontext-wayland.c
-@@ -314,6 +314,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
-   GdkWaylandDisplay *display_wayland = GDK_WAYLAND_DISPLAY (display);
-   EGLint major, minor;
-   EGLDisplay dpy;
-+  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
- 
-   if (display_wayland->have_egl)
-     return TRUE;
-@@ -326,7 +327,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
-   if (!eglInitialize (dpy, &major, &minor))
-     return FALSE;
- 
--  if (!eglBindAPI (EGL_OPENGL_API))
-+  if (!eglBindAPI (use_es?EGL_OPENGL_ES_API:EGL_OPENGL_API))
-     return FALSE;
- 
-   display_wayland->egl_display = dpy;
-@@ -379,6 +380,7 @@ find_eglconfig_for_window (GdkWindow  *window,
-   EGLint count;
-   EGLConfig *configs, chosen_config;
-   gboolean use_rgba;
-+  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
- 
-   int i = 0;
- 
-@@ -395,6 +397,12 @@ find_eglconfig_for_window (GdkWindow  *window,
-   attrs[i++] = EGL_BLUE_SIZE;
-   attrs[i++] = 1;
- 
-+  if (use_es)
-+    {
-+      attrs[i++] = EGL_RENDERABLE_TYPE;
-+      attrs[i++] = EGL_OPENGL_ES2_BIT;
-+    }
-+
-   use_rgba = (visual == gdk_screen_get_rgba_visual (gdk_display_get_default_screen (display)));
- 
-   if (use_rgba)
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend b/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
deleted file mode 100644
index d3fe5051..00000000
--- a/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl wayland-native"
-GTKGLIBC_RRECOMMENDS = "${GTKBASE_RRECOMMENDS}"
-
-PR_append = ".arago0"
-
-SRC_URI += "\
-    file://0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch \
-"
-- 
2.17.1


