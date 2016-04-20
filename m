Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 6AB30529E7
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 18:34:19 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y002W83KP7B20@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 13:34:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
	a=e5mUnYsNAAAA:8 a=2aRmkuw2QRcxxFdhTX0A:9
Received: by 100.15.86.14 with SMTP id 5f210923; Wed, 20 Apr 2016 18:34:02 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8FA02161FAF;	Wed,
	20 Apr 2016 14:34:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 14:34:00 -0400
Message-id: <1461177241-21326-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] libdrm: drop local 2.4.66 as oe-core now has latest
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
X-List-Received-Date: Wed, 20 Apr 2016 18:34:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...tests-kms-steal-crtc-Include-sys-select.h.patch | 33 ----------------
 .../recipes-graphics/drm/libdrm/installtests.patch | 15 --------
 .../recipes-graphics/drm/libdrm_2.4.66.bb          | 45 ----------------------
 3 files changed, 93 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb

diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch b/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
deleted file mode 100644
index c18228e..0000000
--- a/meta-arago-extras/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 46fb5516fb0ab17bcf46a0306a11e8966bb36e14 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Dec 2015 22:17:21 +0000
-Subject: [PATCH] tests/kms-steal-crtc: Include sys/select.h
-
-Fixes errors e.g.
-
-error: implicit declaration of function 'select'
-
-and missing definitions of FD_* defines
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- tests/kms/kms-steal-crtc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
-index 2f7f327..24d70ab 100644
---- a/tests/kms/kms-steal-crtc.c
-+++ b/tests/kms/kms-steal-crtc.c
-@@ -31,6 +31,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
-+#include <sys/select.h>
- 
- #include <drm_fourcc.h>
- 
--- 
-2.6.4
-
diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch b/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
deleted file mode 100644
index 30e0a61..0000000
--- a/meta-arago-extras/recipes-graphics/drm/libdrm/installtests.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-tests: also install tests app
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-Index: libdrm-2.4.66/tests/Makefile.am
-===================================================================
---- libdrm-2.4.66.orig/tests/Makefile.am
-+++ libdrm-2.4.66/tests/Makefile.am
-@@ -73,3 +73,4 @@ TESTS +=					\
- endif
- 
- check_PROGRAMS += $(TESTS)
-+bin_PROGRAMS = $(check_PROGRAMS)
diff --git a/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb b/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb
deleted file mode 100644
index 028db4a..0000000
--- a/meta-arago-extras/recipes-graphics/drm/libdrm_2.4.66.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Userspace interface to the kernel DRM services"
-DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
-stands for \"Direct Rendering Manager\", which is the kernel portion of the \
-\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
-accelerated OpenGL drivers."
-HOMEPAGE = "http://dri.freedesktop.org"
-SECTION = "x11/base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
-PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev libpciaccess"
-
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://installtests.patch \
-           file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
-          "
-
-SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
-SRC_URI[sha256sum] = "79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --enable-omap-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-manpages \
-                 --disable-valgrind \
-                "
-
-ALLOW_EMPTY_${PN}-drivers = "1"
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}-amdgpu"
-
-RRECOMMENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
-                             ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu"
-
-FILES_${PN}-tests = "${bindir}/*"
-FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
-FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
-FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
-FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
-FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
-FILES_${PN}-kms = "${libdir}/libkms*.so.*"
-FILES_${PN}-freedreno = "${libdir}/libdrm_freedreno.so.*"
-FILES_${PN}-amdgpu = "${libdir}/libdrm_amdgpu.so.*"
-- 
2.2.0


