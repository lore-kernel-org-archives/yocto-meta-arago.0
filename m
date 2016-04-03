Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 2252852978
	for <meta-arago@arago-project.org>;
	Sun,  3 Apr 2016 03:45:27 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5100BV3H31J830@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 02 Apr 2016 22:45:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=QyXUC8HyAAAA:8 a=D31QgfloAAAA:8
	a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8	a=e5mUnYsNAAAA:8 a=MQQvbd3fAAAA:8
	a=hD80L64hAAAA:8 a=gvl4HP8tAAAA:8	a=nGNDkJnHaiBZubi4r3MA:9
	a=lBjsu5jEGN2xr0Aa:21 a=ddhfeUUeP2AR7-AP:21
Received: by 100.15.86.14 with SMTP id 7c6624ca; Sun, 03 Apr 2016 03:45:14 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8299F161F77;	Sat,
	2 Apr 2016 23:45:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Apr 2016 23:44:59 -0400
Message-id: <1459655099-10980-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] wayland/weston: 1.9 upstreamed to oe-core, drop locally
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
X-List-Received-Date: Sun, 03 Apr 2016 03:45:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |   2 +-
 ...ics-need-to-fake-new-touches-on-TRIPLETAP.patch |  72 --------------
 .../recipes-graphics/wayland/libinput_1.1.4.bb     |  23 -----
 .../recipes-graphics/wayland/wayland_1.9.0.bb      |  41 --------
 .../recipes-graphics/wayland/weston-init.bb        |  28 ------
 .../recipes-graphics/wayland/weston-init/init      |  60 ------------
 .../wayland/weston-init/weston.service             |  15 ---
 .../wayland/weston/0001-make-error-portable.patch  |  80 ----------------
 .../weston/explicit-enable-disable-systemd.patch   |  70 --------------
 .../wayland/weston/libsystemd.patch                |  53 -----------
 .../weston/make-lcms-explicitly-configurable.patch |  43 ---------
 .../make-libwebp-explicitly-configurable.patch     |  37 --------
 .../recipes-graphics/wayland/weston/weston.desktop |   9 --
 .../recipes-graphics/wayland/weston/weston.png     | Bin 2383 -> 0 bytes
 .../recipes-graphics/wayland/weston_1.9.0.bb       | 103 ---------------------
 15 files changed, 1 insertion(+), 635 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init.bb
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/init
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.desktop
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/weston.png
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index df90133..4816598 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -33,7 +33,7 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
 DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
 
 # Set additional distro features
-DISTRO_FEATURES += "pam wayland"
+DISTRO_FEATURES += "pam wayland opengl"
 
 # Set preferred gstreamer version (0.10 vs 1.0)
 GST_PROVIDER ?= "1.0"
diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch b/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
deleted file mode 100644
index 97c63bd..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-This is a workaround upstream suggests for use with kernel 4.1.
-
-Upstream-Status: Inappropriate [temporary work-around]
-Signed-Off-By: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Mon Aug 3 18:23:12 PDT 2015
-Subject: [PATCH v3 libinput] touchpad: serial synaptics need to fake new touches on TRIPLETAP
-
-On the 4.1 kernels synaptics pretends to have 3 slots (the serial fw only does
-2). This was added to avoid cursor jumps but has since been reverted for 4.2
-(kernel commit dbf3c37086, 4.1.3 is still buggy). In some cases a TRIPLETAP
-may be triggered without slot 2 ever activating.
-
-While there are still those kernels out there, work around this bug by opening
-a new touch point where none exists if the fake finger count exceeds the slot
-count.
-
-Reported-by: Jan Alexander Steffens <jan.steffens at gmail.com>
-Signed-off-by: Peter Hutterer <peter.hutterer at who-t.net>
-Tested-by: Jan Alexander Steffens <jan.steffens at gmail.com>
-Reviewed-by: Hans de Goede <hdegoede at redhat.com>
----
-Changes to v2:
-- split out the handling instead of having a tmp state variable, see Hans'
-  comments from v2
-
-Mainly sending this to the list again so I have a link to point people to.
-If you're on 4.1.x add this patch to your distribution package.
-
- src/evdev-mt-touchpad.c | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/src/evdev-mt-touchpad.c b/src/evdev-mt-touchpad.c
-index a683d9a..5ef03d5 100644
---- a/src/evdev-mt-touchpad.c
-+++ b/src/evdev-mt-touchpad.c
-@@ -369,13 +369,23 @@ tp_restore_synaptics_touches(struct tp_dispatch *tp,
- 	for (i = 0; i < tp->num_slots; i++) {
- 		struct tp_touch *t = tp_get_touch(tp, i);
- 
--		if (t->state != TOUCH_END)
-+		switch(t->state) {
-+		case TOUCH_HOVERING:
-+		case TOUCH_BEGIN:
-+		case TOUCH_UPDATE:
- 			continue;
--
--		/* new touch, move it through begin to update immediately */
--		tp_new_touch(tp, t, time);
--		tp_begin_touch(tp, t, time);
--		t->state = TOUCH_UPDATE;
-+		case TOUCH_NONE:
-+			/* new touch, move it through to begin immediately */
-+			tp_new_touch(tp, t, time);
-+			tp_begin_touch(tp, t, time);
-+			break;
-+		case TOUCH_END:
-+			/* touch just ended ,we need need to restore it to update */
-+			tp_new_touch(tp, t, time);
-+			tp_begin_touch(tp, t, time);
-+			t->state = TOUCH_UPDATE;
-+			break;
-+		}
- 	}
- }
- 
--- 
-2.4.3
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb
deleted file mode 100644
index 635b36a..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Library to handle input devices in Wayland compositors"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
-
-DEPENDS = "libevdev udev mtdev"
-
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
-"
-SRC_URI[md5sum] = "0945318141c1a9f52857bbf65d175f32"
-SRC_URI[sha256sum] = "302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
-
-FILES_${PN} += "${libdir}/udev/"
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
deleted file mode 100644
index d12ac18..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Wayland, a protocol between a compositor and clients"
-DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
-as well as a C library implementation of that protocol. The compositor can be \
-a standalone display server running on Linux kernel modesetting and evdev \
-input devices, an X application, or a wayland client itself. The clients can \
-be traditional applications, X servers (rootless or fullscreen) or other \
-display servers."
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
-                    file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5e141b3f2a7005d6c89d6f233c87c317"
-SRC_URI[sha256sum] = "9c8770720aa0034479735f58a4dc4ca9b172ecfede28f5134312e135b7301efa"
-
-EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
-
-DEPENDS = "expat libffi wayland-native"
-
-EXTRA_OECONF = "--disable-documentation --with-host-scanner"
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
-	rm ${SYSROOT_DESTDIR}/${datadir}/aclocal/wayland-scanner.m4
-	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
-}
-
-FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init.bb b/meta-arago-extras/recipes-graphics/wayland/weston-init.bb
deleted file mode 100644
index a40f4b2..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston-init.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-
-SRC_URI = "file://init \
-           file://weston.service"
-
-S = "${WORKDIR}"
-
-do_install() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
-}
-
-inherit allarch update-rc.d distro_features_check systemd
-
-# rdepends on weston which depends on virtual/egl
-#REQUIRED_DISTRO_FEATURES = "opengl"
-
-RDEPENDS_${PN} = "weston kbd"
-
-INITSCRIPT_NAME = "weston"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
-
-SYSTEMD_SERVICE_${PN} = "weston.service"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/init b/meta-arago-extras/recipes-graphics/wayland/weston-init/init
deleted file mode 100644
index 2e938f4..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston-init/init
+++ /dev/null
@@ -1,60 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: weston
-# Required-Start: $local_fs $remote_fs
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-### END INIT INFO
-
-if test -e /etc/default/weston ; then
-        . /etc/default/weston
-fi
-
-killproc() {
-        pid=`/bin/pidof $1`
-        [ "$pid" != "" ] && kill $pid
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        weston=false)
-		echo "Weston disabled"
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-        . /etc/profile
-
-        # This is all a nasty hack
-        if test -z "$XDG_RUNTIME_DIR"; then
-                export XDG_RUNTIME_DIR=/run/user/root
-                mkdir --parents $XDG_RUNTIME_DIR
-                chmod 0700 $XDG_RUNTIME_DIR
-        fi
-
-        openvt -s weston -- $OPTARGS
-  ;;
-
-  stop)
-        echo "Stopping Weston"
-        killproc weston
-  ;;
-
-  restart)
-	$0 stop
-        sleep 1
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service b/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
deleted file mode 100644
index 4f1f7ff..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=Weston Wayland compositor startup
-RequiresMountsFor=/run
-
-[Service]
-User=root
-EnvironmentFile=-/etc/default/weston
-Environment="XDG_RUNTIME_DIR=/run/user/root"
-ExecStartPre=/bin/mkdir -p /run/user/root
-ExecStartPre=/bin/chmod 0700 /run/user/root
-ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
deleted file mode 100644
index 148848d..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From c22e90365d89346258394833cbcad03ff32b2e27 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 May 2015 20:56:00 -0700
-Subject: [PATCH weston] make error() portable
-
-error() is not posix but gnu extension so may not be available on all
-kind of systemsi e.g. musl.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- configure.ac        |  2 ++
- src/weston-error.h  | 20 ++++++++++++++++++++
- src/weston-launch.c |  2 +-
- 3 files changed, 23 insertions(+), 1 deletion(-)
- create mode 100644 src/weston-error.h
-
-diff --git a/configure.ac b/configure.ac
-index 263fc22..f52cd62 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
- 	      [[#include <time.h>]])
- AC_CHECK_HEADERS([execinfo.h])
- 
-+AC_CHECK_HEADERS([error.h])
-+
- AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
- 
- COMPOSITOR_MODULES="wayland-server >= 1.7.93 pixman-1 >= 0.25.2"
-diff --git a/src/weston-error.h b/src/weston-error.h
-new file mode 100644
-index 0000000..2089d02
---- /dev/null
-+++ b/src/weston-error.h
-@@ -0,0 +1,20 @@
-+#ifndef _WESTON_ERROR_H
-+#define _WESTON_ERROR_H
-+
-+#if defined(HAVE_ERROR_H)
-+#include <error.h>
-+#else
-+#include <err.h>
-+#include <string.h>
-+#define _weston_error(S, E, F, ...) do { \
-+	if (E) \
-+		err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
-+	else \
-+		err(S, F, ##__VA_ARGS__); \
-+} while(0)
-+
-+#define error _weston_error
-+#endif
-+
-+#endif
-+
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index 10c66de..3e6d30a 100644
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
-@@ -30,7 +30,6 @@
- #include <poll.h>
- #include <errno.h>
- 
--#include <error.h>
- #include <getopt.h>
- 
- #include <sys/types.h>
-@@ -56,6 +55,7 @@
- #endif
- 
- #include "weston-launch.h"
-+#include "weston-error.h"
- 
- #define DRM_MAJOR 226
- 
--- 
-2.1.4
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch b/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
deleted file mode 100644
index a40eaf1..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 8e1efcd40b3bad81c83744e2e120d70c2b567ef2 Mon Sep 17 00:00:00 2001
-From: Frederico Cadete <frederico@cadete.eu>
-Date: Mon, 28 Sep 2015 00:30:10 +0200
-Subject: configure.ac: add explicit enable/disable for systemd-login support
-
-Otherwise, auto-enable depending on whether the system has the necessary
-libraries.
-
-[Updated help text as per pq suggestion -- bwh]
-
-Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-Tested-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-
-Upstream-Status: Backport
-Backported from Weston git:
-http://cgit.freedesktop.org/wayland/weston/commit/?id=8e1efc
-
-Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
-
-diff --git a/configure.ac b/configure.ac
-index a9cd429..67e80d0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -380,18 +380,30 @@ AC_ARG_ENABLE(resize-optimization,
- AS_IF([test "x$enable_resize_optimization" = "xyes"],
-       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
- 
--PKG_CHECK_MODULES(SYSTEMD_LOGIN,
--                  [libsystemd >= 209],
--                  [have_systemd_login_209=yes;have_systemd_login=yes],
--                  [have_systemd_login_209=no;have_systemd_login=no])
--
--# Older versions of systemd package systemd-login separately. Fall back on that
--AS_IF([test x$have_systemd_login != xyes],[
--      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
--                        [libsystemd-login >= 198],
--                        [have_systemd_login=yes],
--                        [have_systemd_login=no])
--      ])
-+AC_ARG_ENABLE(systemd-login,
-+              AS_HELP_STRING([--enable-systemd-login],
-+                             [Enable logind support]),,
-+              enable_systemd_login=auto)
-+if test x$enable_systemd_login != xno; then
-+  PKG_CHECK_MODULES(SYSTEMD_LOGIN,
-+                    [libsystemd >= 209],
-+                    [have_systemd_login_209=yes;have_systemd_login=yes],
-+                    [have_systemd_login_209=no;have_systemd_login=no])
-+
-+  # Older versions of systemd package systemd-login separately. Fall back on that
-+  AS_IF([test x$have_systemd_login != xyes],[
-+        PKG_CHECK_MODULES(SYSTEMD_LOGIN,
-+                          [libsystemd-login >= 198],
-+                          [have_systemd_login=yes],
-+                          [have_systemd_login=no])
-+        ])
-+else
-+  have_systemd_login=no
-+fi
-+
-+if test "x$have_systemd_login" = "xno" -a "x$enable_systemd_login" = "xyes"; then
-+  AC_MSG_ERROR([systemd-login support explicitly enabled, but can't find libsystemd>=209 or libsystemd-login])
-+fi
- 
- AS_IF([test "x$have_systemd_login" = "xyes"],
-       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
--- 
-cgit v0.10.2
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch b/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
deleted file mode 100644
index 2d28d56..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/libsystemd.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 5eb025a867b42f8bc7bc73279eac8de58e51a13e Mon Sep 17 00:00:00 2001
-From: Frederico Cadete <frederico@cadete.eu>
-Date: Mon, 28 Sep 2015 00:30:09 +0200
-Subject: configure.ac: add support for new versions of systemd
-
-Starting from systemd version 209, a single libsystemd.pc is provided.
-For previous versions, fall back on libsystemd-login.pc.
-
-Signed-off-by: Frederico Cadete <frederico@cadete.eu>
-Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
-Reviewed-by: Derek Foreman <derekf@osg.samsung.com>
-
-Upstream-Status: Backport
-Backported from Weston git:
-http://cgit.freedesktop.org/wayland/weston/commit/?id=5eb025
-
-Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
-
-diff --git a/configure.ac b/configure.ac
-index 045291c..a9cd429 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -380,14 +380,23 @@ AC_ARG_ENABLE(resize-optimization,
- AS_IF([test "x$enable_resize_optimization" = "xyes"],
-       [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
- 
--PKG_CHECK_MODULES(SYSTEMD_LOGIN, [libsystemd-login >= 198],
--                  [have_systemd_login=yes], [have_systemd_login=no])
-+PKG_CHECK_MODULES(SYSTEMD_LOGIN,
-+                  [libsystemd >= 209],
-+                  [have_systemd_login_209=yes;have_systemd_login=yes],
-+                  [have_systemd_login_209=no;have_systemd_login=no])
-+
-+# Older versions of systemd package systemd-login separately. Fall back on that
-+AS_IF([test x$have_systemd_login != xyes],[
-+      PKG_CHECK_MODULES(SYSTEMD_LOGIN,
-+                        [libsystemd-login >= 198],
-+                        [have_systemd_login=yes],
-+                        [have_systemd_login=no])
-+      ])
-+
- AS_IF([test "x$have_systemd_login" = "xyes"],
-       [AC_DEFINE([HAVE_SYSTEMD_LOGIN], [1], [Have systemd-login])])
- AM_CONDITIONAL(HAVE_SYSTEMD_LOGIN, test "x$have_systemd_login" = "xyes")
- 
--PKG_CHECK_MODULES(SYSTEMD_LOGIN_209, [libsystemd-login >= 209],
--                  [have_systemd_login_209=yes], [have_systemd_login_209=no])
- AS_IF([test "x$have_systemd_login_209" = "xyes"],
-       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
- 
--- 
-cgit v0.10.2
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
deleted file mode 100644
index 35e6d6f..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-weston-1.5.0/configure.ac: make lcms explicitly configurable
-
-The lcms package is outside of openembedded-core, so make it
-explicitly configurable. Make it deterministic, so that if lcms
-dependencies are missing, autoconf throws a fatal error. Follow
-upstream style to make it more likely to be merged.
-
-Upstream-Status: Pending
-
-Index: weston-1.5.0/configure.ac
-===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -491,12 +491,24 @@ AC_ARG_ENABLE(demo-clients-install,
- 			     enable_demo_clients_install=no)
- AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
- 
--PKG_CHECK_MODULES(LCMS, lcms2,
--                  [have_lcms=yes], [have_lcms=no])
--if test "x$have_lcms" = xyes; then
--       AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
-+AC_ARG_ENABLE(lcms,
-+              AS_HELP_STRING([--disable-lcms],
-+                             [Disable lcms support]),,
-+              enable_lcms=auto)
-+AM_CONDITIONAL(HAVE_LCMS, [test "x$enable_lcms" = xyes])
-+if test "x$enable_lcms" != "xno"; then
-+        PKG_CHECK_MODULES(LCMS, 
-+                         lcms2,
-+                         [have_lcms=yes],
-+                         [have_lcms=no])
-+        if test "x$have_lcms" = "xno" -a "x$enable_lcms" = "xyes"; then
-+          AC_MSG_ERROR([lcms support explicitly requested, but lcms couldn't be found])
-+        fi
-+        if test "x$have_lcms" = "xyes"; then
-+                enable_lcms=yes
-+                AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
-+        fi
- fi
--AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
- 
- AC_PATH_PROG([wayland_scanner], [wayland-scanner])
- if test x$wayland_scanner = x; then
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch b/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
deleted file mode 100644
index ad07d4f..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-
-The libwebp package is outside of openembedded-core, so make it
-explicitly configurable. Make it deterministic, so that if libwebp 
-dependencies are missing, autoconf throws a fatal error.
-
-Upstream-Status: Pending
-
-Index: weston-1.5.0/configure.ac
-===================================================================
---- weston-1.5.0.orig/configure.ac
-+++ weston-1.5.0/configure.ac
-@@ -268,9 +268,22 @@ fi
- 
- PKG_CHECK_MODULES(PIXMAN, [pixman-1])
- PKG_CHECK_MODULES(PNG, [libpng])
--PKG_CHECK_MODULES(WEBP, [libwebp], [have_webp=yes], [have_webp=no])
--AS_IF([test "x$have_webp" = "xyes"],
--      [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
-+AC_ARG_ENABLE(webp,
-+              AS_HELP_STRING([--disable-webp],
-+                             [Disable libwebp support]),,
-+              enable_webp=auto)
-+AM_CONDITIONAL(HAVE_WEBP, [test "x$enable_webp" = xyes])
-+AS_IF([test "x$enable_webp" != "xno"],
-+    PKG_CHECK_MODULES(WEBP,
-+                     [libwebp],
-+                     [have_webp=yes],
-+                     [have_webp=no])
-+    AS_IF([test "x$have_webp" = "xno" -a "x$enable_webp" = "xyes"],
-+        AC_MSG_ERROR([libwebp support explicitly request, but lipwebp could not be found]))
-+    AS_IF([test "x$have_webp" = "xyes"],
-+        [enable_webp=yes]
-+        [AC_DEFINE([HAVE_WEBP], [1], [Have webp])])
-+)
- 
- AC_ARG_ENABLE(vaapi-recorder, [  --enable-vaapi-recorder],,
- 	      enable_vaapi_recorder=auto)
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

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
deleted file mode 100644
index 439b279..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "Weston, a Wayland compositor"
-DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://weston.png \
-           file://weston.desktop \
-           file://make-lcms-explicitly-configurable.patch \
-           file://make-libwebp-explicitly-configurable.patch \
-           file://0001-make-error-portable.patch \
-           file://libsystemd.patch \
-           file://explicit-enable-disable-systemd.patch \
-"
-SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
-SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
-
-inherit autotools pkgconfig useradd distro_features_check
-# depends on virtual/egl
-#REQUIRED_DISTRO_FEATURES = "opengl"
-
-DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland libinput virtual/egl pango"
-
-EXTRA_OECONF = "--enable-setuid-install \
-                --enable-simple-clients \
-                --enable-clients \
-                --enable-demo-clients-install \
-                --disable-rpi-compositor \
-                --disable-rdp-compositor \
-                "
-
-EXTRA_OECONF_append_qemux86 = "\
-		WESTON_NATIVE_BACKEND=fbdev-backend.so \
-		"
-EXTRA_OECONF_append_qemux86-64 = "\
-		WESTON_NATIVE_BACKEND=fbdev-backend.so \
-		"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
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
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
-# weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
-# VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
-# Weston with EGL support
-PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
-# Weston with cairo glesv2 support
-PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
-# Weston with lcms support
-PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
-# Weston with webp support
-PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
-# Weston with unwinding support
-PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
-# Weston with systemd-login support
-PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
-# Weston with Xwayland support
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
-# colord CMS support
-PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
-
-do_install_append() {
-	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
-
-	# If X11, ship a desktop file to launch it
-	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
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
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
-FILES_${PN}-examples = "${bindir}/*"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "liberation-fonts"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
2.2.0


