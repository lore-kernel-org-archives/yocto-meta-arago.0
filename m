Return-Path: <anandb@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 47455529B5
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 16:27:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RGQwwA008467
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 10:26:58 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RGQwWN021730
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 10:26:58 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 10:26:58 -0600
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RGQuw1001479;	Wed, 27 Jan 2016 10:26:57 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 21:56:53 +0530
Message-ID: <1453912013-17710-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] omapdrmtest: disable viddectest on kmscube
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
X-List-Received-Date: Wed, 27 Jan 2016 16:27:02 -0000
Content-Type: text/plain

display-kmscube uses proprietary EGL extension EGL_RAW_VIDEO_TI_DMABUF. The
right way to incorporate this feature is using the standard EGL extension
EXT_image_dma_buf_import.

Disable viddec3test on kmscube until the correct EGL extension is available.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../0001-configure-disable-kmscube.patch           |   35 ++++++++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |    3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch
new file mode 100644
index 0000000..231dc75
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch
@@ -0,0 +1,35 @@
+From f56d36a2323f04bb4936a106efdcf8c4754e2233 Mon Sep 17 00:00:00 2001
+From: Anand Balagopalakrishnan <anandb@ti.com>
+Date: Sun, 24 Jan 2016 14:16:10 +0530
+Subject: [PATCH 1/1] configure: disable kmscube
+
+kmscube support requires proprietary EGL extensions EGL_RAW_VIDEO_TI_DMABUF
+which is not supported in DDK 1.14.
+
+Future versions of DDK will support the standard EGL extension
+EXT_image_dma_buf_import which is ratified by Khronos. This will require
+corresponding changes to the application.
+
+Till then, disable kmscube in omapdrmtest.
+
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c026733..05180a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,7 +51,7 @@ AM_CONDITIONAL(ENABLE_V4L2_DMABUF, [test "x$HAVE_V4L2_DMABUF" = xyes])
+ 
+ # Check optional KMSCUBE:
+ AC_ARG_ENABLE([kmscube], AS_HELP_STRING([--disable-kmscube], [disable kmscube display support]))
+-AS_IF([test "x$enable_kmscube" != "xno"], [PKG_CHECK_EXISTS(gbm egl glesv2, [HAVE_KMSCUBE=yes], [HAVE_KMSCUBE=no])])
++HAVE_KMSCUBE="no"
+ if test "x$HAVE_KMSCUBE" = "xyes"; then
+ 	AC_DEFINE(HAVE_KMSCUBE, 1, [Have KMSCUBE support])
+ 	PKG_CHECK_MODULES(GBM, gbm)
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index ac45da3..f5880b4 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,11 +6,12 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
 
 inherit autotools pkgconfig
 
-PR = "r8"
+PR = "r9"
 SRCREV = "152713c45d7972ed08f506255c43ce7ff634a9f5"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 	file://0001-util-demux-update-use-of-deprecated-API.patch \
+	file://0001-configure-disable-kmscube.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


