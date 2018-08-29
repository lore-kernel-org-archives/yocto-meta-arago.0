Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2323A52A7C
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 00:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F5FB20C65;
	Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FJiIHQEtE9Fd; Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 096B520C6E;
	Wed, 29 Aug 2018 00:14:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8DD141635E2;
	Tue, 28 Aug 2018 20:14:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Aug 2018 20:13:58 -0400
Message-Id: <1535501640-23640-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501640-23640-1-git-send-email-denys@ti.com>
References: <1535501640-23640-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 5/7] v4l-utils: remove old local version as meta-oe provides newer one
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
X-List-Received-Date: Wed, 29 Aug 2018 00:14:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...a-ctl-Don-t-install-libmediactl-and-libv4.patch | 41 --------------------
 .../v4l-utils/export-mediactl-headers.patch        | 15 --------
 .../v4l2apps/v4l-utils/mediactl-pkgconfig.patch    | 12 ------
 .../v4l2apps/v4l-utils_1.10.1.bb                   | 45 ----------------------
 4 files changed, 113 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
deleted file mode 100644
index 4b3de3c..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4ee15a8a69b84526ece1180a288a37db077bcd9b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Feb 2015 21:55:36 +0000
-Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
- libv4l2subdev"
-
-This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Conflicts:
-	utils/media-ctl/Makefile.am
----
- utils/media-ctl/Makefile.am | 11 +++--------
- 1 file changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
-index a3931fb..fe1fea5 100644
---- a/utils/media-ctl/Makefile.am
-+++ b/utils/media-ctl/Makefile.am
-@@ -1,14 +1,9 @@
--noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
--
-+lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
- libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
--libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
--libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
--
-+libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
-+libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
- libv4l2subdev_la_SOURCES = libv4l2subdev.c
- libv4l2subdev_la_LIBADD = libmediactl.la
--libv4l2subdev_la_CFLAGS = -static
--libv4l2subdev_la_LDFLAGS = -static
--
- mediactl_includedir=$(includedir)/mediactl
- noinst_HEADERS = mediactl.h v4l2subdev.h
- 
--- 
-2.1.4
-
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
deleted file mode 100644
index c610e7e..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-===================================================================
---- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
-+++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-@@ -4,8 +4,8 @@ libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS
- libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
- libv4l2subdev_la_SOURCES = libv4l2subdev.c
- libv4l2subdev_la_LIBADD = libmediactl.la
--mediactl_includedir=$(includedir)/mediactl
--noinst_HEADERS = mediactl.h v4l2subdev.h
-+otherincludedir = $(includedir)/mediactl
-+otherinclude_HEADERS = mediactl.h v4l2subdev.h
- 
- pkgconfig_DATA = libmediactl.pc
- bin_PROGRAMS = media-ctl
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
deleted file mode 100644
index 34fb3cf..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-===================================================================
---- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
-+++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-@@ -7,6 +7,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
- mediactl_includedir=$(includedir)/mediactl
- noinst_HEADERS = mediactl.h v4l2subdev.h
- 
-+pkgconfig_DATA = libmediactl.pc
- bin_PROGRAMS = media-ctl
- media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
- media_ctl_LDADD = libmediactl.la libv4l2subdev.la
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
deleted file mode 100644
index 6148695..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "v4l2 and IR applications"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
-PROVIDES = "libv4l media-ctl"
-
-DEPENDS = "jpeg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
-
-inherit autotools gettext pkgconfig
-
-PACKAGECONFIG ??= "media-ctl"
-PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
-
-SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
-           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-           file://mediactl-pkgconfig.patch \
-           file://export-mediactl-headers.patch \
-          "
-SRC_URI[md5sum] = "936c9c58343840e91294e4dcec7dc05f"
-SRC_URI[sha256sum] = "6147ccc29fe7dd3c5c3994d613c4f2a099bac8b44694a96e5cf4d7caca8336c0"
-
-EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
-
-VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
-
-PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dbg libv4l-dev"
-
-FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
-
-FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
-RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
-
-FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-
-FILES_${PN} = "${bindir} ${sbindir}"
-
-FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
-                 ${libdir}/libdvbv5*${SOLIBS} \
-                 ${libdir}/libv4l/*-decomp"
-
-FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
-FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
-                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
-                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.7.4


