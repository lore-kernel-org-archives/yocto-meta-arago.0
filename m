Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A3CCC52B00
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 21:01:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LL1YFe063227
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 16:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534885294;
	bh=SKHRuSu3tGFdcTeCy/10jn1pVZih4GUMkjiNwZw/n3k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LauRzH8zGlAY5UDX4A0zu2TS36o/uBbT0xHLfUtzdu2/V7gRDCbRazEXQeUWHn3pX
	vFBGLQpD5r+q5msyvJfTBS0fwk8PyRH4z/VAzpR2s7fCQSxDEy8gh2jWaqvn+X1X8V
	NLnOL/yToUf3b220cXgY0uq9Z+SvEGDIwulrh3j8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LL1XkG009280
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 16:01:33 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 16:01:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 16:01:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LL1WUG008782;
	Tue, 21 Aug 2018 16:01:32 -0500
Date: Tue, 21 Aug 2018 17:00:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <20180821210036.GS29422@beryl>
References: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
	<1534879768-59124-2-git-send-email-e-ruei1@ti.com>
	<20180821194838.GQ29422@beryl>
	<88d0259e-498e-b5bb-dd06-2f330c1a2f9d@ti.com>
MIME-Version: 1.0
In-Reply-To: <88d0259e-498e-b5bb-dd06-2f330c1a2f9d@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] gtk+3: update wayland dependency and add patches
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
X-List-Received-Date: Tue, 21 Aug 2018 21:01:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 04:38:08PM -0400, Ruei, Eric wrote:
> On 8/21/2018 3:48 PM, Denys Dmytriyenko wrote:
> >On Tue, Aug 21, 2018 at 03:29:25PM -0400, Eric Ruei wrote:
> >>- replace wayland dependency mesa with virtual/egl
> >
> >In the past we were using libgbm instead of virtual/egl
> >http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend;hb=HEAD
> >http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-gnome/gtk%2B/gtk%2B3_%25.bbappend;hb=HEAD
> >
> >
> Denys: It does not make sense, virtual/egl replaces virtual/mesa, GTK will
> be a wayland-client and uses wayland-egl which does not depends on libgbm.
> The drm-backend of Weston compositor does depend on libgbm.

Well, drm-backend of Weston also originally depended on virtual/mesa:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/wayland/weston_2.0.0.bb?h=rocko

And we replace it with libgbm, not virtual/egl.

But if you say gtk+ really needs entire virtual/egl dependency to work with 
wayland-egl, then I'm fine.


> >>- patch to fix egl API calls for GLES2
> >>
> >>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>---
> >>  ...t-wayland.c-cleanup-the-parameters-of-egl.patch | 61 ++++++++++++++++++++++
> >>  .../recipes-gnome/gtk+/gtk+3_%.bbappend            | 10 ++++
> >>  2 files changed, 71 insertions(+)
> >>  create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
> >>  create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
> >>
> >>diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch b/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
> >>new file mode 100644
> >>index 0000000..174dbdd
> >>--- /dev/null
> >>+++ b/meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
> >>@@ -0,0 +1,61 @@
> >>+From d4c8511b845de02271b6dcf57a6edbf01f3f1905 Mon Sep 17 00:00:00 2001
> >>+From: Eric Ruei <e-ruei1@ti.com>
> >>+Date: Tue, 21 Aug 2018 11:07:13 -0400
> >>+Subject: [PATCH] gdkglcontext-wayland.c: cleanup the parameters of egl API
> >>+ calls when GLES is used
> >>+
> >>+eglBindAPI: use EGL_OPENGL_ES_API instead of EGL_OPENGL_API
> >>+eglChooseConfig: need to specify EGL_OPENGL_ES2_BIT as EGL_RENDERABLE_TYPE
> >>+
> >>+Upstream-Status: Pending
> >>+
> >>+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>+---
> >>+ gdk/wayland/gdkglcontext-wayland.c | 10 +++++++++-
> >>+ 1 file changed, 9 insertions(+), 1 deletion(-)
> >>+
> >>+diff --git a/gdk/wayland/gdkglcontext-wayland.c b/gdk/wayland/gdkglcontext-wayland.c
> >>+index 254900d..3361eb3 100644
> >>+--- a/gdk/wayland/gdkglcontext-wayland.c
> >>++++ b/gdk/wayland/gdkglcontext-wayland.c
> >>+@@ -314,6 +314,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
> >>+   GdkWaylandDisplay *display_wayland = GDK_WAYLAND_DISPLAY (display);
> >>+   EGLint major, minor;
> >>+   EGLDisplay dpy;
> >>++  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
> >>+
> >>+   if (display_wayland->have_egl)
> >>+     return TRUE;
> >>+@@ -326,7 +327,7 @@ gdk_wayland_display_init_gl (GdkDisplay *display)
> >>+   if (!eglInitialize (dpy, &major, &minor))
> >>+     return FALSE;
> >>+
> >>+-  if (!eglBindAPI (EGL_OPENGL_API))
> >>++  if (!eglBindAPI (use_es?EGL_OPENGL_ES_API:EGL_OPENGL_API))
> >>+     return FALSE;
> >>+
> >>+   display_wayland->egl_display = dpy;
> >>+@@ -379,6 +380,7 @@ find_eglconfig_for_window (GdkWindow  *window,
> >>+   EGLint count;
> >>+   EGLConfig *configs, chosen_config;
> >>+   gboolean use_rgba;
> >>++  gboolean use_es = (_gdk_gl_flags & GDK_GL_GLES) != 0 ;
> >>+
> >>+   int i = 0;
> >>+
> >>+@@ -395,6 +397,12 @@ find_eglconfig_for_window (GdkWindow  *window,
> >>+   attrs[i++] = EGL_BLUE_SIZE;
> >>+   attrs[i++] = 1;
> >>+
> >>++  if (use_es)
> >>++    {
> >>++      attrs[i++] = EGL_RENDERABLE_TYPE;
> >>++      attrs[i++] = EGL_OPENGL_ES2_BIT;
> >>++    }
> >>++
> >>+   use_rgba = (visual == gdk_screen_get_rgba_visual (gdk_display_get_default_screen (display)));
> >>+
> >>+   if (use_rgba)
> >>+--
> >>+1.9.1
> >>+
> >>diff --git a/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend b/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
> >>new file mode 100644
> >>index 0000000..d3fe505
> >>--- /dev/null
> >>+++ b/meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend
> >>@@ -0,0 +1,10 @@
> >>+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>+
> >>+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl wayland-native"
> >>+GTKGLIBC_RRECOMMENDS = "${GTKBASE_RRECOMMENDS}"
> >>+
> >>+PR_append = ".arago0"
> >>+
> >>+SRC_URI += "\
> >>+    file://0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch \
> >>+"
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

