Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0FBC852093
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2015 18:16:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3SIGh5U000373
	for <meta-arago@arago-project.org>; Tue, 28 Apr 2015 13:16:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3SIGgoG020547
	for <meta-arago@arago-project.org>; Tue, 28 Apr 2015 13:16:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 13:16:42 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3SIGfwc013798;	Tue, 28 Apr 2015 13:16:42 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YnA3k-0002sZ-Su;
	Tue, 28 Apr 2015 14:16:40 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Apr 2015 14:16:36 -0400
Message-ID: <1430244996-11036-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-bad: Fix compilation on non DRM devices.
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
X-List-Received-Date: Tue, 28 Apr 2015 18:16:44 -0000
Content-Type: text/plain

* Conditionally build libgstdrm based on whether both libdrm and
  libdce are available.
* Add libdrm/libdce dependency on dra7xx platforms.
* Only include wayland packageconfig if wayland is a distro feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../0006-GstDRMBufferPool-support-fix.patch        |   36 ++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   13 +++++--
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
new file mode 100644
index 0000000..0af1323
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-GstDRMBufferPool-support-fix.patch
@@ -0,0 +1,36 @@
+From 9e4d46611c4d4600a5abac81b619ae1489d4b8c1 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Mon, 27 Apr 2015 08:27:59 -0400
+Subject: [PATCH 6/6] GstDRMBufferPool support fix:
+
+Conditionally build drm library based on if kmssink dependencies are
+by pkgconfig found.
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ gst-libs/gst/Makefile.am |    8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am
+index b915d07..52ff331 100644
+--- a/gst-libs/gst/Makefile.am
++++ b/gst-libs/gst/Makefile.am
+@@ -2,9 +2,13 @@ if HAVE_EGL
+ EGL_DIR = egl
+ endif
+ 
+-SUBDIRS = interfaces basecamerabinsrc codecparsers drm \
++if USE_KMS
++DRM_DIR = drm
++endif
++
++SUBDIRS = interfaces basecamerabinsrc codecparsers $(DRM_DIR) \
+ 	 insertbin uridownloader mpegts $(EGL_DIR)
+ 
+ noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h
+-DIST_SUBDIRS = interfaces egl basecamerabinsrc codecparsers \
++DIST_SUBDIRS = interfaces egl basecamerabinsrc codecparsers drm \
+ 	insertbin uridownloader mpegts
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
index b1cacac..d49da02 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -1,12 +1,19 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG = "faad wayland"
+PACKAGECONFIG = "faad ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+
+DEPENDS_append_dra7xx = " \
+    libdce \
+    libdrm \
+"
 
 SRC_URI_append = " \
         file://0001-Added-GstDRMBufferPool-support.patch \
         file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
         file://0003-Added-KMSsink-support.patch \
         file://0004-waylandsink-Removed-dependency-on-dri2.patch \
-        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
+        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
+        file://0006-GstDRMBufferPool-support-fix.patch \
+"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.7.9.5


