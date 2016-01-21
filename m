Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id BC8CD529A5
	for <meta-arago@arago-project.org>;
	Thu, 21 Jan 2016 22:04:35 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1B0046ZPAZOW30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 21 Jan 2016 16:04:12 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8	a=e5mUnYsNAAAA:8
	a=HPtoqTigU4XusegAvmkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C3E6161DFD;	Thu,
	21 Jan 2016 17:04:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 21 Jan 2016 17:04:09 -0500
Message-id: <1453413851-27029-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] libdrm: add version 2.4.66
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
X-List-Received-Date: Thu, 21 Jan 2016 22:04:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Overlay locally latest version needed for DDK 1.14 work.
Taken from oe-core/master verbatim and can be dropped once migrated there.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...tests-kms-steal-crtc-Include-sys-select.h.patch | 33 ++++++++++++++++
 .../recipes-graphics/drm/libdrm/installtests.patch | 15 ++++++++
 .../recipes-graphics/drm/libdrm_2.4.66.bb          | 45 ++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 create mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
 create mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb

diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch b/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
new file mode 100644
index 0000000..c18228e
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
@@ -0,0 +1,33 @@
+From 46fb5516fb0ab17bcf46a0306a11e8966bb36e14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Dec 2015 22:17:21 +0000
+Subject: [PATCH] tests/kms-steal-crtc: Include sys/select.h
+
+Fixes errors e.g.
+
+error: implicit declaration of function 'select'
+
+and missing definitions of FD_* defines
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ tests/kms/kms-steal-crtc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
+index 2f7f327..24d70ab 100644
+--- a/tests/kms/kms-steal-crtc.c
++++ b/tests/kms/kms-steal-crtc.c
+@@ -31,6 +31,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <sys/select.h>
+ 
+ #include <drm_fourcc.h>
+ 
+-- 
+2.6.4
+
diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch b/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
new file mode 100644
index 0000000..30e0a61
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
@@ -0,0 +1,15 @@
+tests: also install tests app
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+Index: libdrm-2.4.66/tests/Makefile.am
+===================================================================
+--- libdrm-2.4.66.orig/tests/Makefile.am
++++ libdrm-2.4.66/tests/Makefile.am
+@@ -73,3 +73,4 @@ TESTS +=					\
+ endif
+ 
+ check_PROGRAMS += $(TESTS)
++bin_PROGRAMS = $(check_PROGRAMS)
diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb b/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb
new file mode 100644
index 0000000..028db4a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Userspace interface to the kernel DRM services"
+DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
+stands for \"Direct Rendering Manager\", which is the kernel portion of the \
+\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
+accelerated OpenGL drivers."
+HOMEPAGE = "http://dri.freedesktop.org"
+SECTION = "x11/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs udev libpciaccess"
+
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
+           file://installtests.patch \
+           file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
+          "
+
+SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
+SRC_URI[sha256sum] = "79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-cairo-tests \
+                 --enable-omap-experimental-api \
+                 --enable-install-test-programs \
+                 --disable-manpages \
+                 --disable-valgrind \
+                "
+
+ALLOW_EMPTY_${PN}-drivers = "1"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
+             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu"
+
+RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                             ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu"
+
+FILES_${PN}-tests = "${bindir}/*"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
+FILES_${PN}-kms = "${libdir}/libkms*.so.*"
+FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
+FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
-- 
2.2.0


