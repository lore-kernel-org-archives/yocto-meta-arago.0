Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6485D52004
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 14:13:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4HED5RL004881
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 09:13:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HED4uW003004
	for <meta-arago@arago-project.org>; Tue, 17 May 2016 09:13:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 May 2016 09:13:04 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HED38l014186;
	Tue, 17 May 2016 09:13:04 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 May 2016 19:42:48 +0530
Message-ID: <1463494368-2401-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] omapdrmtest: recipe cleanup and fixes for krogoth dependencies
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
X-List-Received-Date: Tue, 17 May 2016 14:13:05 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../0001-configure-disable-kmscube.patch           | 35 -------------------
 ...1-util-demux-update-use-of-deprecated-API.patch | 40 ----------------------
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |  6 ++--
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch
deleted file mode 100644
index 231dc75..0000000
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-configure-disable-kmscube.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f56d36a2323f04bb4936a106efdcf8c4754e2233 Mon Sep 17 00:00:00 2001
-From: Anand Balagopalakrishnan <anandb@ti.com>
-Date: Sun, 24 Jan 2016 14:16:10 +0530
-Subject: [PATCH 1/1] configure: disable kmscube
-
-kmscube support requires proprietary EGL extensions EGL_RAW_VIDEO_TI_DMABUF
-which is not supported in DDK 1.14.
-
-Future versions of DDK will support the standard EGL extension
-EXT_image_dma_buf_import which is ratified by Khronos. This will require
-corresponding changes to the application.
-
-Till then, disable kmscube in omapdrmtest.
-
-Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c026733..05180a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -51,7 +51,7 @@ AM_CONDITIONAL(ENABLE_V4L2_DMABUF, [test "x$HAVE_V4L2_DMABUF" = xyes])
- 
- # Check optional KMSCUBE:
- AC_ARG_ENABLE([kmscube], AS_HELP_STRING([--disable-kmscube], [disable kmscube display support]))
--AS_IF([test "x$enable_kmscube" != "xno"], [PKG_CHECK_EXISTS(gbm egl glesv2, [HAVE_KMSCUBE=yes], [HAVE_KMSCUBE=no])])
-+HAVE_KMSCUBE="no"
- if test "x$HAVE_KMSCUBE" = "xyes"; then
- 	AC_DEFINE(HAVE_KMSCUBE, 1, [Have KMSCUBE support])
- 	PKG_CHECK_MODULES(GBM, gbm)
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
deleted file mode 100644
index 387568e..0000000
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 50a533a969a0efd9c4c7713ad571b8f853b1b7e5 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 11 Sep 2015 12:57:56 -0400
-Subject: [PATCH] util/demux: update use of deprecated API
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- util/demux.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/util/demux.c b/util/demux.c
-index d739519..e932ac4 100644
---- a/util/demux.c
-+++ b/util/demux.c
-@@ -44,18 +44,18 @@ int get_esds_offset(const char *filename, struct demux *demux);
- static AVFormatContext *
- open_file(const char *filename)
- {
--	AVFormatContext *afc;
--	int err = av_open_input_file(&afc, filename, NULL, 0, NULL);
-+	static AVFormatContext *afc = NULL;
-+	int err = avformat_open_input(&afc, filename, NULL, NULL);
- 
- 	if (!err)
--		err = av_find_stream_info(afc);
-+		err = avformat_find_stream_info(afc, NULL);
- 
- 	if (err < 0) {
- 		ERROR("%s: lavf error %d", filename, err);
- 		exit(1);
- 	}
- 
--	dump_format(afc, 0, filename, 0);
-+	av_dump_format(afc, 0, filename, 0);
- 
- 	return afc;
- }
--- 
-2.2.0
-
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 1d22511..18bcdd6 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,12 +6,10 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r9"
-SRCREV = "152713c45d7972ed08f506255c43ce7ff634a9f5"
+PR = "r13"
+SRCREV = "a1df4a987abcb2f868f0ebe759926bf0ea19b58c"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
-	file://0001-util-demux-update-use-of-deprecated-API.patch \
-	file://0001-configure-disable-kmscube.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


