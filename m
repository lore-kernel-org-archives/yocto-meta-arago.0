Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 0628C52A98
	for <meta-arago@arago-project.org>;
	Wed, 20 Jan 2016 02:36:34 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O180026SCKCL481@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Jan 2016 20:36:18 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=pGLkceISAAAA:8 a=MQQvbd3fAAAA:8	a=hD80L64hAAAA:8 a=gvl4HP8tAAAA:8
	a=e5mUnYsNAAAA:8 a=FpMKTI_weO-G4vS7dJMA:9	a=fJOQ9ch9damFqVMu:21
	a=lOtv2s_ZUi0YkZbs:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7C62F161E04;	Tue,
	19 Jan 2016 21:36:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Jan 2016 21:36:10 -0500
Message-id: <1453257370-3024-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1453257370-3024-1-git-send-email-denis@denix.org>
References: <1453257370-3024-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] weston: update to 1.9.0
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
X-List-Received-Date: Wed, 20 Jan 2016 02:36:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/weston/0001-make-error-portable.patch  | 80 ++++++++++++++++++++++
 .../weston/disable-wayland-scanner-pkg-check.patch | 13 ----
 .../weston/explicit-enable-disable-systemd.patch   | 70 +++++++++++++++++++
 .../wayland/weston/libsystemd.patch                | 53 ++++++++++++++
 .../wayland/{weston_1.6.0.bb => weston_1.9.0.bb}   | 40 +++++++----
 5 files changed, 230 insertions(+), 26 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
 rename meta-arago-extras/recipes-graphics/wayland/{weston_1.6.0.bb => weston_1.9.0.bb} (70%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
new file mode 100644
index 0000000..148848d
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -0,0 +1,80 @@
+From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 May 2015 20:56:00 -0700
+Subject: [PATCH weston] make error() portable
+
+error() is not posix but gnu extension so may not be available on all
+kind of systemsi e.g. musl.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure.ac        |  2 ++
+ src/weston-error.h  | 20 ++++++++++++++++++++
+ src/weston-launch.c |  2 +-
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+ create mode 100644 src/weston-error.h
+
+diff --git a/configure.ac b/configure.ac
+index 263fc22..f52cd62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [[#include <time.h>]])
+ AC_CHECK_HEADERS([execinfo.h])
+ 
++AC_CHECK_HEADERS([error.h])
++
+ AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
+ 
+ COMPOSITOR_MODULES="wayland-server >= 1.7.93 pixman-1 >= 0.25.2"
+diff --git a/src/weston-error.h b/src/weston-error.h
+new file mode 100644
+index 0000000..2089d02
+--- /dev/null
++++ b/src/weston-error.h
+@@ -0,0 +1,20 @@
++#ifndef _WESTON_ERROR_H
++#define _WESTON_ERROR_H
++
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <err.h>
++#include <string.h>
++#define _weston_error(S, E, F, ...) do { \
++	if (E) \
++		err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
++	else \
++		err(S, F, ##__VA_ARGS__); \
++} while(0)
++
++#define error _weston_error
++#endif
++
++#endif
++
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index 10c66de..3e6d30a 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
+@@ -30,7 +30,6 @@
+ #include <poll.h>
+ #include <errno.h>
+ 
+-#include <error.h>
+ #include <getopt.h>
+ 
+ #include <sys/types.h>
+@@ -56,6 +55,7 @@
+ #endif
+ 
+ #include "weston-launch.h"
++#include "weston-error.h"
+ 
+ #define DRM_MAJOR 226
+ 
+-- 
+2.1.4
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch b/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
deleted file mode 100644
index 062da5c..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: weston-1.5.0/configure.ac
-===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -503,7 +503,7 @@ if test x$wayland_scanner = x; then
- 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
- fi
- 
--PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
-+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
- 
- AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
- 
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch b/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
new file mode 100644
index 0000000..a40eaf1
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
@@ -0,0 +1,70 @@
+From 8e1efcd40b3bad81c83744e2e120d70c2b567ef2 Mon Sep 17 00:00:00 2001
+From: Frederico Cadete <frederico@cadete.eu>
+Date: Mon, 28 Sep 2015 00:30:10 +0200
+Subject: configure.ac: add explicit enable/disable for systemd-login support
+
+Otherwise, auto-enable depending on whether the system has the necessary
+libraries.
+
+[Updated help text as per pq suggestion -- bwh]
+
+Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+Tested-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
+
+Upstream-Status: Backport
+Backported from Weston git:
+http://cgit.freedesktop.org/wayland/weston/commit/?id=8e1efc
+
+Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index a9cd429..67e80d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,18 +380,30 @@ AC_ARG_ENABLE(resize-optimization,
+ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN,
+-                  [libsystemd >= 209],
+-                  [have_systemd_login_209=yes;have_systemd_login=yes],
+-                  [have_systemd_login_209=no;have_systemd_login=no])
+-
+-# Older versions of systemd package systemd-login separately. Fall back on that
+-AS_IF([test x$have_systemd_login != xyes],[
+-      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
+-                        [libsystemd-login >= 198],
+-                        [have_systemd_login=yes],
+-                        [have_systemd_login=no])
+-      ])
++AC_ARG_ENABLE(systemd-login,
++              AS_HELP_STRING([--enable-systemd-login],
++                             [Enable logind support]),,
++              enable_systemd_login=auto)
++if test x$enable_systemd_login != xno; then
++  PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                    [libsystemd >= 209],
++                    [have_systemd_login_209=yes;have_systemd_login=yes],
++                    [have_systemd_login_209=no;have_systemd_login=no])
++
++  # Older versions of systemd package systemd-login separately. Fall back on that
++  AS_IF([test x$have_systemd_login != xyes],[
++        PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                          [libsystemd-login >= 198],
++                          [have_systemd_login=yes],
++                          [have_systemd_login=no])
++        ])
++else
++  have_systemd_login=no
++fi
++
++if test "x$have_systemd_login" = "xno" -a "x$enable_systemd_login" = "xyes"; then
++  AC_MSG_ERROR([systemd-login support explicitly enabled, but can't find libsystemd>=209 or libsystemd-login])
++fi
+ 
+ AS_IF([test "x$have_systemd_login" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
+-- 
+cgit v0.10.2
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch b/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
new file mode 100644
index 0000000..2d28d56
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
@@ -0,0 +1,53 @@
+From 5eb025a867b42f8bc7bc73279eac8de58e51a13e Mon Sep 17 00:00:00 2001
+From: Frederico Cadete <frederico@cadete.eu>
+Date: Mon, 28 Sep 2015 00:30:09 +0200
+Subject: configure.ac: add support for new versions of systemd
+
+Starting from systemd version 209, a single libsystemd.pc is provided.
+For previous versions, fall back on libsystemd-login.pc.
+
+Signed-off-by: Frederico Cadete <frederico@cadete.eu>
+Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
+Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
+
+Upstream-Status: Backport
+Backported from Weston git:
+http://cgit.freedesktop.org/wayland/weston/commit/?id=5eb025
+
+Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
+
+diff --git a/configure.ac b/configure.ac
+index 045291c..a9cd429 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -380,14 +380,23 @@ AC_ARG_ENABLE(resize-optimization,
+ AS_IF([test "x$enable_resize_optimization" = "xyes"],
+       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login >= 198],
+-                  [have_systemd_login=yes], [have_systemd_login=no])
++PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                  [libsystemd >= 209],
++                  [have_systemd_login_209=yes;have_systemd_login=yes],
++                  [have_systemd_login_209=no;have_systemd_login=no])
++
++# Older versions of systemd package systemd-login separately. Fall back on that
++AS_IF([test x$have_systemd_login != xyes],[
++      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
++                        [libsystemd-login >= 198],
++                        [have_systemd_login=yes],
++                        [have_systemd_login=no])
++      ])
++
+ AS_IF([test "x$have_systemd_login" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
+ AM_CONDITIONAL(HAVE_SYSTEMD_LOGIN, test "x$have_systemd_login" = "xyes")
+ 
+-PKG_CHECK_MODULES(SYSTEMD_LOGIN_209, [libsystemd-login >= 209],
+-                  [have_systemd_login_209=yes], [have_systemd_login_209=no])
+ AS_IF([test "x$have_systemd_login_209" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
+ 
+-- 
+cgit v0.10.2
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
similarity index 70%
rename from meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
rename to meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
index efbbbe0..e14ea9d 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
@@ -2,38 +2,46 @@ SUMMARY = "Weston, a Wayland compositor"
 DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
+                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
+           file://0001-make-error-portable.patch \
+           file://libsystemd.patch \
+           file://explicit-enable-disable-systemd.patch \
 "
-SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
-SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
+SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
+SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
 
-inherit autotools pkgconfig useradd
+inherit autotools pkgconfig useradd distro_features_check
+# depends on virtual/egl
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/egl pango"
+DEPENDS += "wayland libinput virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
-                --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 "
 
-
+EXTRA_OECONF_append_qemux86 = "\
+		WESTON_NATIVE_BACKEND=fbdev-backend.so \
+		"
+EXTRA_OECONF_append_qemux86-64 = "\
+		WESTON_NATIVE_BACKEND=fbdev-backend.so \
+		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
 # Compositor choices
@@ -60,8 +68,14 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
-# Weston with libinput backend
-PACKAGECONFIG[libinput] = "--enable-libinput-backend,--disable-libinput-backend,libinput"
+# Weston with unwinding support
+PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+# Weston with systemd-login support
+PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
+# Weston with Xwayland support
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
+# colord CMS support
+PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
@@ -79,7 +93,7 @@ do_install_append() {
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
2.2.0


