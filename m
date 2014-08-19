Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2E59552A75
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk0DZ029753
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGjx0s001595
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:45:59 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGjwUe002821;	Tue, 19 Aug 2014 11:45:59 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqI017239;	Tue, 19 Aug 2014 22:15:57 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:47 -0500
Message-ID: <1408466752-4458-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/8] weston: Pull in Weston 1.5.0 from oe-core master
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:01 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* This version is required to fix a Qt 5 issue.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../weston/disable-wayland-scanner-pkg-check.patch |   13 +++
 .../weston/make-lcms-explicitly-configurable.patch |   43 ++++++++++
 .../make-libwebp-explicitly-configurable.patch     |   37 +++++++++
 .../recipes-graphics/wayland/weston/weston.desktop |    9 ++
 .../recipes-graphics/wayland/weston/weston.png     |  Bin 0 -> 2383 bytes
 .../recipes-graphics/wayland/weston_1.5.0.bb       |   87 ++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.png
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch b/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
new file mode 100644
index 0000000..062da5c
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
@@ -0,0 +1,13 @@
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -503,7 +503,7 @@ if test x$wayland_scanner = x; then
+ 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
+ fi
+ 
+-PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
++#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
+ 
+ AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
+ 
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
new file mode 100644
index 0000000..35e6d6f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
@@ -0,0 +1,43 @@
+weston-1.5.0/configure.ac: make lcms explicitly configurable
+
+The lcms package is outside of openembedded-core, so make it
+explicitly configurable. Make it deterministic, so that if lcms
+dependencies are missing, autoconf throws a fatal error. Follow
+upstream style to make it more likely to be merged.
+
+Upstream-Status: Pending
+
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -491,12 +491,24 @@ AC_ARG_ENABLE(demo-clients-install,
+ 			     enable_demo_clients_install=no)
+ AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
+ 
+-PKG_CHECK_MODULES(LCMS, lcms2,
+-                  [have_lcms=yes], [have_lcms=no])
+-if test "x$have_lcms" = xyes; then
+-       AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
++AC_ARG_ENABLE(lcms,
++              AS_HELP_STRING([--disable-lcms],
++                             [Disable lcms support]),,
++              enable_lcms=auto)
++AM_CONDITIONAL(HAVE_LCMS, [test "x$enable_lcms" = xyes])
++if test "x$enable_lcms" != "xno"; then
++        PKG_CHECK_MODULES(LCMS, 
++                         lcms2,
++                         [have_lcms=yes],
++                         [have_lcms=no])
++        if test "x$have_lcms" = "xno" -a "x$enable_lcms" = "xyes"; then
++          AC_MSG_ERROR([lcms support explicitly requested, but lcms couldn't be found])
++        fi
++        if test "x$have_lcms" = "xyes"; then
++                enable_lcms=yes
++                AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
++        fi
+ fi
+-AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
+ 
+ AC_PATH_PROG([wayland_scanner], [wayland-scanner])
+ if test x$wayland_scanner = x; then
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
new file mode 100644
index 0000000..ad07d4f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
@@ -0,0 +1,37 @@
+
+The libwebp package is outside of openembedded-core, so make it
+explicitly configurable. Make it deterministic, so that if libwebp 
+dependencies are missing, autoconf throws a fatal error.
+
+Upstream-Status: Pending
+
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -268,9 +268,22 @@ fi
+ 
+ PKG_CHECK_MODULES(PIXMAN, [pixman-1])
+ PKG_CHECK_MODULES(PNG, [libpng])
+-PKG_CHECK_MODULES(WEBP, [libwebp], [have_webp=yes], [have_webp=no])
+-AS_IF([test "x$have_webp" = "xyes"],
+-      [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
++AC_ARG_ENABLE(webp,
++              AS_HELP_STRING([--disable-webp],
++                             [Disable libwebp support]),,
++              enable_webp=auto)
++AM_CONDITIONAL(HAVE_WEBP, [test "x$enable_webp" = xyes])
++AS_IF([test "x$enable_webp" != "xno"],
++    PKG_CHECK_MODULES(WEBP,
++                     [libwebp],
++                     [have_webp=yes],
++                     [have_webp=no])
++    AS_IF([test "x$have_webp" = "xno" -a "x$enable_webp" = "xyes"],
++        AC_MSG_ERROR([libwebp support explicitly request, but lipwebp could not be found]))
++    AS_IF([test "x$have_webp" = "xyes"],
++        [enable_webp=yes]
++        [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
++)
+ 
+ AC_ARG_ENABLE(vaapi-recorder, [  --enable-vaapi-recorder],,
+ 	      enable_vaapi_recorder=auto)
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop b/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
new file mode 100644
index 0000000..1086ae8
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Encoding=UTF-8
+Type=Application
+Name=Weston
+Comment=Wayland Compostitor
+Exec=weston
+Icon=weston
+Terminal=false
+Categories=Utility;
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.png b/meta-arago-extras/recipes-graphics/wayland/weston/weston.png
new file mode 100644
index 0000000000000000000000000000000000000000..ea8b7e0e233c86301a88e5bc925f09b3de2f9dec
GIT binary patch
literal 2383
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
BD_j5o

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
new file mode 100644
index 0000000..4a8584f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
@@ -0,0 +1,87 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://weston.png \
+           file://weston.desktop \
+           file://disable-wayland-scanner-pkg-check.patch \
+           file://make-lcms-explicitly-configurable.patch \
+           file://make-libwebp-explicitly-configurable.patch \
+"
+SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
+SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
+
+inherit autotools pkgconfig useradd
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland virtual/egl pango"
+
+EXTRA_OECONF = "--enable-setuid-install \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --enable-demo-clients-install \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor \
+                "
+
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                  "
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+# weston-launch
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
+# VA-API desktop recorder
+PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+# Weston with EGL support
+PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
+# Weston with cairo glesv2 support
+PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
+# Weston with lcms support
+PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
+# Weston with webp support
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/weston/*.la
+
+	# If X11, ship a desktop file to launch it
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
+		install -d ${D}${datadir}/applications
+		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+		install -d ${D}${datadir}/icons/hicolor/48x48/apps
+		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+        fi
+}
+
+PACKAGES += "${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
1.7.9.5


