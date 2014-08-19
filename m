Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5F76752A75
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk1KO016417
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:01 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGk11B029862
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:46:01 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGk0Lo029755;	Tue, 19 Aug 2014 11:46:00 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqJ017239;	Tue, 19 Aug 2014 22:15:58 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:48 -0500
Message-ID: <1408466752-4458-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/8] wayland: Pull in wayland 1.5.0 from oe-core master
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:02 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...disable-macro-checks-not-used-for-scanner.patch |   50 ++++++++++++++++++++
 .../recipes-graphics/wayland/wayland_1.5.0.bb      |   41 ++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
new file mode 100644
index 0000000..cd8bc55
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
@@ -0,0 +1,50 @@
+disable macro checks not used for scanner
+
+We only build wayland-native for the scanner, so disable the bits we don't
+actually need. This avoid build issue on older distro such as Centos 5.x:
+| error: 'O_CLOEXEC' undeclared (first use in this function)
+| error: sys/timerfd.h: No such file or directory
+| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
+| error: 'TFD_CLOEXEC' undeclared (first use in this function)
+| error: 'SFD_CLOEXEC' undeclared (first use in this function)
+
+Upstream-Status: Pending
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
+ 
+ AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate])
+ 
+-AC_CHECK_DECL(SFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/signalfd.h>]])
+-AC_CHECK_DECL(TFD_CLOEXEC,[],
+-	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
+-	      [[#include <sys/timerfd.h>]])
+-AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+-	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
+-	      [[#include <time.h>]])
+-AC_CHECK_HEADERS([execinfo.h])
++##AC_CHECK_DECL(SFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/signalfd.h>]])
++#AC_CHECK_DECL(TFD_CLOEXEC,[],
++#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
++#	      [[#include <sys/timerfd.h>]])
++#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
++#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
++#	      [[#include <time.h>]])
++#AC_CHECK_HEADERS([execinfo.h])
+ 
+ AC_ARG_ENABLE([scanner],
+               [AC_HELP_STRING([--disable-scanner],
+-- 
+1.8.3.2
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
new file mode 100644
index 0000000..b1ae59e
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "1d882776b27329b91d2d500b6d66dd1d"
+SRC_URI[sha256sum] = "0069e1e9af888b3e05384380ad8cc6c976ea3e81d08ba19b7675ce1d693a41b5"
+SRC_URI_append_class-native = " \
+    file://disable-macro-checks-not-used-for-scanner.patch \
+    "
+EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_class-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
+
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use, which uses the target
+# pkg-config to find files.  Replace pkg-config with pkg-config-native.
+do_install_append_class-native() {
+  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
+      -e 's,$PKG_CONFIG,pkg-config-native,g' \
+      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
+}
+
+sysroot_stage_all_append_class-target () {
+	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
+}
-- 
1.7.9.5


