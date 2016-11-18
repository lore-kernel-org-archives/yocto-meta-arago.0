Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C9E765299E
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 23:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAE722084E;
	Fri, 18 Nov 2016 23:17:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MQ7_7p7XK_J9; Fri, 18 Nov 2016 23:17:25 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB1ED201BD;
	Fri, 18 Nov 2016 23:17:24 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 6717816219D;
	Fri, 18 Nov 2016 18:17:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 18:17:23 -0500
Message-Id: <1479511043-10877-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] omapdrmtest: pass CC var, update for ffmpeg and libavcodec linking
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
X-List-Received-Date: Fri, 18 Nov 2016 23:17:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...gure.ac-also-check-for-libavcodec-library.patch | 28 ++++++++++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               | 14 ++++++-----
 2 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch
new file mode 100644
index 0000000..5b7d3f4
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch
@@ -0,0 +1,28 @@
+From e74fe2b030a841387e026cb7d37e8fb0c411075f Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 16 Nov 2016 19:52:36 -0500
+Subject: [PATCH] configure.ac: also check for libavcodec library
+
+Required for av_bitstream_filter_close and such.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 31762f5..649c97a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,7 +75,7 @@ fi
+ AM_CONDITIONAL(ENABLE_WAYLAND, [test "x$HAVE_WAYLAND" = xyes])
+ 
+ # Check for libdce and libav..
+-PKG_CHECK_MODULES(DCE, libdce libavformat libavutil, [HAVE_DCE=yes], [HAVE_DCE=no])
++PKG_CHECK_MODULES(DCE, libdce libavformat libavcodec libavutil, [HAVE_DCE=yes], [HAVE_DCE=no])
+ if test "x$HAVE_DCE" = "xyes"; then
+ 	AC_DEFINE(HAVE_DCE, 1, [Have DCE support])
+ 	AC_MSG_NOTICE([Detected libdce and libavformat, building video codec tests])
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index e219170..db389cd 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -1,17 +1,19 @@
-DESCRIPTION = "Test applications for OMAP DRM interface"
+SUMMARY = "Test applications for OMAP DRM interface"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
-DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
+
+DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r18"
+PR = "r19"
 SRCREV = "e4a2932a836c54f4a20b4be9d541d11d3a246a31"
 
+EXTRA_OEMAKE = "CC="${CC}""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
-"
+           file://0001-configure.ac-also-check-for-libavcodec-library.patch"
 
 S = "${WORKDIR}/git"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.7.4


