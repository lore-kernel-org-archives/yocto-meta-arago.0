Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 1E73852993
	for <meta-arago@arago-project.org>;
	Wed, 20 Jan 2016 02:36:29 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O18009V1CKCI530@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Jan 2016 20:36:13 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=6ohNodAXAAAA:8 a=e5mUnYsNAAAA:8	a=YqXzbucIgG76Zt7k2NQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 71E3D161E02;	Tue,
	19 Jan 2016 21:36:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Jan 2016 21:36:09 -0500
Message-id: <1453257370-3024-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1453257370-3024-1-git-send-email-denis@denix.org>
References: <1453257370-3024-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] wayland: update to 1.9.0
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
X-List-Received-Date: Wed, 20 Jan 2016 02:36:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...disable-macro-checks-not-used-for-scanner.patch | 50 ----------------------
 .../wayland/{wayland_1.6.0.bb => wayland_1.9.0.bb} | 24 +++++------
 2 files changed, 12 insertions(+), 62 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
 rename meta-arago-extras/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.9.0.bb} (62%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
deleted file mode 100644
index cd8bc55..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-disable macro checks not used for scanner
-
-We only build wayland-native for the scanner, so disable the bits we don't
-actually need. This avoid build issue on older distro such as Centos 5.x:
-| error: 'O_CLOEXEC' undeclared (first use in this function)
-| error: sys/timerfd.h: No such file or directory
-| error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
-| error: 'TFD_CLOEXEC' undeclared (first use in this function)
-| error: 'SFD_CLOEXEC' undeclared (first use in this function)
-
-Upstream-Status: Pending
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
- 
- AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate])
- 
--AC_CHECK_DECL(SFD_CLOEXEC,[],
--	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
--	      [[#include <sys/signalfd.h>]])
--AC_CHECK_DECL(TFD_CLOEXEC,[],
--	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
--	      [[#include <sys/timerfd.h>]])
--AC_CHECK_DECL(CLOCK_MONOTONIC,[],
--	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
--	      [[#include <time.h>]])
--AC_CHECK_HEADERS([execinfo.h])
-+##AC_CHECK_DECL(SFD_CLOEXEC,[],
-+#	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
-+#	      [[#include <sys/signalfd.h>]])
-+#AC_CHECK_DECL(TFD_CLOEXEC,[],
-+#	      [AC_MSG_ERROR("TFD_CLOEXEC is needed to compile wayland")],
-+#	      [[#include <sys/timerfd.h>]])
-+#AC_CHECK_DECL(CLOCK_MONOTONIC,[],
-+#	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile wayland")],
-+#	      [[#include <time.h>]])
-+#AC_CHECK_HEADERS([execinfo.h])
- 
- AC_ARG_ENABLE([scanner],
-               [AC_HELP_STRING([--disable-scanner],
--- 
-1.8.3.2
-
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
similarity index 62%
rename from meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb
rename to meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
index cf3c094..d12ac18 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.9.0.bb
@@ -7,26 +7,22 @@ be traditional applications, X servers (rootless or fullscreen) or other \
 display servers."
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
-                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
+                    file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
-SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
-SRC_URI_append_class-native = " \
-    file://disable-macro-checks-not-used-for-scanner.patch \
-    "
-EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
+SRC_URI[md5sum] = "5e141b3f2a7005d6c89d6f233c87c317"
+SRC_URI[sha256sum] = "9c8770720aa0034479735f58a4dc4ca9b172ecfede28f5134312e135b7301efa"
+
+EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
 inherit autotools pkgconfig
 
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS_class-native = "expat-native libffi-native"
 DEPENDS = "expat libffi wayland-native"
 
-EXTRA_OECONF = "--disable-documentation --disable-scanner"
+EXTRA_OECONF = "--disable-documentation --with-host-scanner"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
@@ -37,5 +33,9 @@ do_install_append_class-native() {
 }
 
 sysroot_stage_all_append_class-target () {
+	rm ${SYSROOT_DESTDIR}/${datadir}/aclocal/wayland-scanner.m4
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
+
+FILES_${PN} = "${libdir}/*${SOLIBS}"
+FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
-- 
2.2.0


