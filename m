Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 22A1252A66
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 12C7440CA4;
	Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5YfBEIDQ6t1f; Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B717540C7F;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8CB24174581;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:24 -0400
Message-Id: <1617408644-2675-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 09/29] gstreamer1.0-plugins-good: upgrade 1.16 -> 1.18
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:56 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Drop previously backported patch.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...ix-build-on-EGL-platform-without-X11-head.patch | 36 ----------------------
 ...d => gstreamer1.0-plugins-good_1.18.%.bbappend} |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.%.bbappend => gstreamer1.0-plugins-good_1.18.%.bbappend} (84%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
deleted file mode 100644
index 79db0e2..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 85229adbddcd8e7cacd5ebd9467c834352a882d0 Mon Sep 17 00:00:00 2001
-From: Philipp Zabel <p.zabel@pengutronix.de>
-Date: Tue, 3 Dec 2019 11:36:07 +0100
-Subject: [PATCH] qmlglsink: fix build on EGL platform without X11 headers
-
-If Mesa is built without X11 headers, building against Mesa EGL headers
-requires a dependency on egl.pc, to define MESA_EGL_NO_X11_HEADERS.
-This fixes a build error when compiling ext/qt/gstqtglutility.cc:
-
-  In file included from /usr/include/EGL/egl.h:39,
-                   from /usr/include/gstreamer-1.0/gst/gl/egl/gstegl.h:44,
-                   from ../gst-plugins-good-1.16.1/ext/qt/gstqtglutility.cc:43:
-  /usr/include/EGL/eglplatform.h:124:10: fatal error: X11/Xlib.h: No such file or directory
-
-Upstream-Status: Backport [c47a585052fba6830a2cddd8caa18e2305596ed0]
-
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- ext/qt/meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ext/qt/meson.build b/ext/qt/meson.build
-index 5f040c844..43ddc6092 100644
---- a/ext/qt/meson.build
-+++ b/ext/qt/meson.build
-@@ -89,6 +89,8 @@ if have_cxx and build_gstgl
-     if gst_gl_have_platform_egl
-       # Embedded linux (e.g. i.MX6) with or without windowing support
-       qt_defines += ['-DHAVE_QT_EGLFS']
-+      egl_dep = dependency('egl', required : false)
-+      optional_deps += egl_dep
-       have_qt_windowing = true
-       if have_qpa_include
-         # Wayland windowing
---
-2.17.1
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
similarity index 84%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
index e2ddbc2..4864f4b 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
@@ -7,7 +7,6 @@ SRC_URI += " \
     file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
     file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
-    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
 "
 
 PR_append = ".arago3"
-- 
2.7.4


