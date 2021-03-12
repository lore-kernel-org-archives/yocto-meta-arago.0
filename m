Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7F65552AA8
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 22:26:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CMQuqa107560
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 16:26:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615588016;
	bh=jvxcC6J1fvAQlmUVtOgxWwj7XIg6w1737nEItvOiLnw=;
	h=From:To:CC:Subject:Date;
	b=UseSRG32vKJG/n2hr2oVcErITw66SbysqmPfjuvYL0lwVnKGnZAqzEtgupZOcLvz/
	gf6K6jTGH0mXXkXg+tIbxN0G+M8NinLcluzueEz/ZmFavfmvPXezPd1z8qc+MizKHf
	E7QiOr1beVoav6MFJ/rLqVl/Z6qQ5e3uK6oChQZE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CMQuqH076976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 16:26:56 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 16:26:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 16:26:56 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CMQufu091625;
	Fri, 12 Mar 2021 16:26:56 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	12CMQulZ034056; Fri, 12 Mar 2021 16:26:56 -0600
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Mar 2021 16:26:52 -0600
Message-ID: <20210312222652.14023-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] gstreamer1.0-plugins-good: backport qmlglsink EGL build fix
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
X-List-Received-Date: Fri, 12 Mar 2021 22:26:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport qmlglsink build fix for EGL platform with no X11 headers.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...ild-on-EGL-platform-without-X11-head.patch | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
new file mode 100644
index 00000000..79db0e27
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
@@ -0,0 +1,36 @@
+From 85229adbddcd8e7cacd5ebd9467c834352a882d0 Mon Sep 17 00:00:00 2001
+From: Philipp Zabel <p.zabel@pengutronix.de>
+Date: Tue, 3 Dec 2019 11:36:07 +0100
+Subject: [PATCH] qmlglsink: fix build on EGL platform without X11 headers
+
+If Mesa is built without X11 headers, building against Mesa EGL headers
+requires a dependency on egl.pc, to define MESA_EGL_NO_X11_HEADERS.
+This fixes a build error when compiling ext/qt/gstqtglutility.cc:
+
+  In file included from /usr/include/EGL/egl.h:39,
+                   from /usr/include/gstreamer-1.0/gst/gl/egl/gstegl.h:44,
+                   from ../gst-plugins-good-1.16.1/ext/qt/gstqtglutility.cc:43:
+  /usr/include/EGL/eglplatform.h:124:10: fatal error: X11/Xlib.h: No such file or directory
+
+Upstream-Status: Backport [c47a585052fba6830a2cddd8caa18e2305596ed0]
+
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ ext/qt/meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ext/qt/meson.build b/ext/qt/meson.build
+index 5f040c844..43ddc6092 100644
+--- a/ext/qt/meson.build
++++ b/ext/qt/meson.build
+@@ -89,6 +89,8 @@ if have_cxx and build_gstgl
+     if gst_gl_have_platform_egl
+       # Embedded linux (e.g. i.MX6) with or without windowing support
+       qt_defines += ['-DHAVE_QT_EGLFS']
++      egl_dep = dependency('egl', required : false)
++      optional_deps += egl_dep
+       have_qt_windowing = true
+       if have_qpa_include
+         # Wayland windowing
+--
+2.17.1
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
index 004a9968..e2ddbc27 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -7,6 +7,7 @@ SRC_URI += " \
     file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
     file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
+    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
 "
 
-PR_append = ".arago2"
+PR_append = ".arago3"
-- 
2.29.0


