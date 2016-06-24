Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 8115452A71
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 18:17:02 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9A00C4CG3ZYI70@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jun 2016 13:16:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=pGLkceISAAAA:8 a=xq3W2uTSAAAA:8
	a=QTUh65IjiRifRMwz51YA:9
Received: by 100.15.86.14 with SMTP id 4808e8d4; Fri, 24 Jun 2016 18:16:47 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CAFEA162069;	Fri,
	24 Jun 2016 14:16:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jun 2016 14:16:46 -0400
Message-id: <20160624181646.18828-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] v4l-utils: update to 1.10.1 version
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
X-List-Received-Date: Fri, 24 Jun 2016 18:17:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Uses version 1.6.2 from meta-oe as a base.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...a-ctl-Don-t-install-libmediactl-and-libv4.patch | 41 ++++++++++++++++++++
 .../v4l-utils/export-mediactl-headers.patch        | 15 ++++++++
 .../v4l2apps/v4l-utils/mediactl-pkgconfig.patch    | 12 ++++++
 .../v4l2apps/v4l-utils_1.10.1.bb                   | 45 ++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
new file mode 100644
index 0000000..4b3de3c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -0,0 +1,41 @@
+From 4ee15a8a69b84526ece1180a288a37db077bcd9b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Feb 2015 21:55:36 +0000
+Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
+ libv4l2subdev"
+
+This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Conflicts:
+	utils/media-ctl/Makefile.am
+---
+ utils/media-ctl/Makefile.am | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
+index a3931fb..fe1fea5 100644
+--- a/utils/media-ctl/Makefile.am
++++ b/utils/media-ctl/Makefile.am
+@@ -1,14 +1,9 @@
+-noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
+-
++lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
+ libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
+-libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
+-libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
+-
++libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
++libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+ libv4l2subdev_la_SOURCES = libv4l2subdev.c
+ libv4l2subdev_la_LIBADD = libmediactl.la
+-libv4l2subdev_la_CFLAGS = -static
+-libv4l2subdev_la_LDFLAGS = -static
+-
+ mediactl_includedir=$(includedir)/mediactl
+ noinst_HEADERS = mediactl.h v4l2subdev.h
+ 
+-- 
+2.1.4
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
new file mode 100644
index 0000000..c610e7e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
@@ -0,0 +1,15 @@
+Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+===================================================================
+--- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
++++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+@@ -4,8 +4,8 @@ libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS
+ libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+ libv4l2subdev_la_SOURCES = libv4l2subdev.c
+ libv4l2subdev_la_LIBADD = libmediactl.la
+-mediactl_includedir=$(includedir)/mediactl
+-noinst_HEADERS = mediactl.h v4l2subdev.h
++otherincludedir = $(includedir)/mediactl
++otherinclude_HEADERS = mediactl.h v4l2subdev.h
+ 
+ pkgconfig_DATA = libmediactl.pc
+ bin_PROGRAMS = media-ctl
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
new file mode 100644
index 0000000..34fb3cf
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
@@ -0,0 +1,12 @@
+Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+===================================================================
+--- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
++++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
+@@ -7,6 +7,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
+ mediactl_includedir=$(includedir)/mediactl
+ noinst_HEADERS = mediactl.h v4l2subdev.h
+ 
++pkgconfig_DATA = libmediactl.pc
+ bin_PROGRAMS = media-ctl
+ media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
+ media_ctl_LDADD = libmediactl.la libv4l2subdev.la
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
new file mode 100644
index 0000000..6148695
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
@@ -0,0 +1,45 @@
+SUMMARY = "v4l2 and IR applications"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+PROVIDES = "libv4l media-ctl"
+
+DEPENDS = "jpeg \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+
+inherit autotools gettext pkgconfig
+
+PACKAGECONFIG ??= "media-ctl"
+PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
+
+SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
+           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
+           file://mediactl-pkgconfig.patch \
+           file://export-mediactl-headers.patch \
+          "
+SRC_URI[md5sum] = "936c9c58343840e91294e4dcec7dc05f"
+SRC_URI[sha256sum] = "6147ccc29fe7dd3c5c3994d613c4f2a099bac8b44694a96e5cf4d7caca8336c0"
+
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
+
+VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
+
+PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dbg libv4l-dev"
+
+FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
+
+FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
+RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
+
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+
+FILES_${PN} = "${bindir} ${sbindir}"
+
+FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
+                 ${libdir}/libdvbv5*${SOLIBS} \
+                 ${libdir}/libv4l/*-decomp"
+
+FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
+FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
+                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
+                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.9.0


