Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 5DD0C529DD
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 23:39:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9W00KPUSDBH9A0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 06 Aug 2014 18:39:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8AAC6202A1; Wed,
	06 Aug 2014 19:39:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 06 Aug 2014 19:39:08 -0400
Message-id: <1407368348-10763-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH v2 3/4] wayland: remove overlayed recipes, use bbappend for weston instead
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
X-List-Received-Date: Wed, 06 Aug 2014 23:39:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Latest versions 1.4.0 of wayland and weston are now in oe-core/daisy, while
they weren't in dora. Remove the overlayed complete recipes and replace with
simple bbappend for weston to set the default compositor.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - fix typos in description

 .../wayland/wayland/just-scanner.patch             |  49 -------------
 .../recipes-graphics/wayland/wayland_1.4.0.bb      |  40 -----------
 ...emove-dependence-on-wayland-scanner-flags.patch |  30 --------
 .../recipes-graphics/wayland/weston/weston.desktop |   9 ---
 .../recipes-graphics/wayland/weston/weston.png     | Bin 2383 -> 0 bytes
 .../recipes-graphics/wayland/weston_1.4.0.bb       |  80 ---------------------
 .../recipes-graphics/wayland/weston_1.4.0.bbappend |   4 ++
 7 files changed, 4 insertions(+), 208 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.4.0.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.png
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
deleted file mode 100644
index ae9935e..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f674544d4f6f5f763e449207da77a561b22eff97 Mon Sep 17 00:00:00 2001
-From: Valentin Popa <valentin.popa@intel.com>
-Date: Fri, 7 Feb 2014 16:36:47 +0200
-Subject: [PATCH] just scanner
-
-We only build wayland-native for the scanner, so disable the bits we don't
-actually need.  This gives us a small speed up but importantly should allow
-wayland-native to compile on older hosts such as CentOS 5 which currently fails:
-
-| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
-| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Valentin Popa <valentin.popa@intel.com>
----
- Makefile.am     | 2 +-
- src/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 99607b0..ecce1f1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,7 @@ if BUILD_DOCS
- doc_subdir = doc
- endif
- 
--SUBDIRS = protocol src $(doc_subdir) tests cursor
-+SUBDIRS = protocol src $(doc_subdir)
- 
- ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 15f44a5..b938d17 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,4 +1,4 @@
--lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
-+#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
- noinst_LTLIBRARIES = libwayland-util.la
- 
- include_HEADERS =				\
--- 
-1.8.3.2
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.4.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.4.0.bb
deleted file mode 100644
index 604b7f4..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.4.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Wayland, a protocol between a compositor and clients"
-DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
-as well as a C library implementation of that protocol. The compositor can be \
-a standalone display server running on Linux kernel modesetting and evdev \
-input devices, an X application, or a wayland client itself. The clients can \
-be traditional applications, X servers (rootless or fullscreen) or other \
-display servers."
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
-                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "332cf9191837be12638a29265ed7cf46"
-SRC_URI[sha256sum] = "18f33b9f15b4c8b662fb1968e7636e7926b419dfc48de8a164b3a3d7095c5a58"
-
-SRC_URI_append_class-native = " file://just-scanner.patch"
-EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
-
-inherit autotools pkgconfig
-
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
-
-DEPENDS_class-native = "expat-native libffi-native"
-DEPENDS = "expat libffi wayland-native"
-
-EXTRA_OECONF = "--disable-documentation --disable-scanner"
-
-# Wayland installs a M4 macro for other projects to use, which uses the target
-# pkg-config to find files.  Replace pkg-config with pkg-config-native.
-do_install_append_class-native() {
-  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
-      -e 's,$PKG_CONFIG,pkg-config-native,g' \
-      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
-}
-
-sysroot_stage_all_append_class-target () {
-	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
-}
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
deleted file mode 100644
index 14606c8..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a0335393ddde2228c84eda1081b5d7b175f78a94 Mon Sep 17 00:00:00 2001
-From: Valentin Popa <valentin.popa@intel.com>
-Date: Fri, 7 Feb 2014 16:59:58 +0200
-Subject: [PATCH] remove dependence on wayland-scanner flags
-
-weston doesn't make use of wayland-scanner flags,
-it only uses the -native- wayland-scanner for protocol.
-
-Upstream-Status: Pending
-Signed-off-by: Valentin Popa <valentin.popa@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cce1850..8775eb9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -482,7 +482,7 @@ if test x$wayland_scanner = x; then
- 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
- fi
- 
--PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
-+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
- AC_PATH_PROG(XMLLINT, xmllint)
- AC_ARG_WITH([dtddir],
- 	    AS_HELP_STRING([--with-dtddir],
--- 
-1.8.3.2
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop b/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
deleted file mode 100644
index 1086ae8..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
+++ /dev/null
@@ -1,9 +0,0 @@
-[Desktop Entry]
-Encoding=UTF-8
-Type=Application
-Name=Weston
-Comment=Wayland Compostitor
-Exec=weston
-Icon=weston
-Terminal=false
-Categories=Utility;
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/weston.png b/meta-arago-extras/recipes-graphics/wayland/weston/weston.png
deleted file mode 100644
index ea8b7e0e233c86301a88e5bc925f09b3de2f9dec..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2383
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
BD_j5o

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
deleted file mode 100644
index 7a3d2ae..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
+++ /dev/null
@@ -1,80 +0,0 @@
-SUMMARY = "Weston, a Wayland compositor"
-DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
-                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://weston.png \
-           file://weston.desktop \
-           file://0001-remove-dependence-on-wayland-scanner-flags.patch"
-SRC_URI[md5sum] = "4438d2b1f3c9ba9a4a2b10d89fac6fd0"
-SRC_URI[sha256sum] = "74a2319d98e9cdb1acf24659699719aa89ac268cf549759271e326edc5f9ed64"
-
-
-inherit autotools pkgconfig useradd
-
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/egl pango"
-
-EXTRA_OECONF = "--enable-setuid-install \
-                --disable-xwayland \
-                --enable-simple-clients \
-                --enable-clients \
-                --enable-demo-clients-install \
-                --disable-libunwind \
-                --disable-rpi-compositor \
-                --disable-rdp-compositor"
-
-
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
-                  "
-#
-# Compositor choices
-#
-# Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
-# Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
-# Weston on X11
-PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
-# Headless Weston
-PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
-# Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-# weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
-# VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
-# Weston with EGL support
-PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
-# Weston with cairo glesv2 support
-PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
-
-do_install_append() {
-	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
-
-	# If X11, ship a desktop file to launch it
-	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
-		install -d ${D}${datadir}/applications
-		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
-
-		install -d ${D}${datadir}/icons/hicolor/48x48/apps
-		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
-        fi
-}
-
-PACKAGES += "${PN}-examples"
-
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${datadir}"
-FILES_${PN}-examples = "${bindir}/*"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "liberation-fonts"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system weston-launch"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
new file mode 100644
index 0000000..d9e6108
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
@@ -0,0 +1,4 @@
+# When configured for fbdev compositor, make it the default
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
+
+PR_append = "-arago0"
-- 
2.0.4


