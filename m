Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C0CC85299D
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 11:45:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VBjXKv020946
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501501533;
	bh=HKFvdcADZtFrkeuadILECyXJufnM22cPvdmFWsYvG+4=;
	h=From:To:CC:Subject:Date;
	b=SGinnbcJycWE0cwF3tUBdX7ikV/aFth22BJY+7M81bKgK5AkQsRITNk0hWjnhQ7h7
	u9eKXqTN3BEXjMw2aE59I5JPk4OVumuvKK0swsfzPBk+5fUG6T4+sQFj5CDsaQcJvq
	+hrMdR6V82wxuPD7pRgjXlqRjyz1/5GjPvmJxfG8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBjSQT024141
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 06:45:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 06:45:27 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VBjQNu026879;
	Mon, 31 Jul 2017 06:45:27 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 17:15:25 +0530
Message-ID: <1501501525-2023-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] glsdk-example-apps: Update SRCREV
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
X-List-Received-Date: Mon, 31 Jul 2017 11:45:44 -0000
Content-Type: text/plain

This patch brings in the following changes:
 * vpe: Rename testcase to v4l2-m2m
 * Add support for DSS WB device
 * Makefile changes to fix library linking issues

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../0001-Makefile-fix-library-linking-issues.patch | 60 ----------------------
 .../glsdk-example-apps/glsdk-example-apps.bb       |  5 +-
 2 files changed, 2 insertions(+), 63 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch b/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch
deleted file mode 100644
index b7e8971..0000000
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From ecba95bde41a91d72aecf569c853a766a6ffd2aa Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 26 Mar 2017 13:39:47 -0400
-Subject: [PATCH] Makefile: fix library linking issues
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- cpuload-plugins/Makefile.am | 16 ++++++----------
- 1 file changed, 6 insertions(+), 10 deletions(-)
-
-diff --git a/cpuload-plugins/Makefile.am b/cpuload-plugins/Makefile.am
-index 9c0bc1a..3df7b22 100644
---- a/cpuload-plugins/Makefile.am
-+++ b/cpuload-plugins/Makefile.am
-@@ -6,13 +6,12 @@ mpuload_CFLAGS = \
- mpuload_SOURCES = mpuload.c
- 
- rprocinfo_CFLAGS = -O0 -g @DRM_CFLAGS@ @DCE_CFLAGS@
--rprocinfo_LDFLAGS = @DCE_LIBS@ -lpthread
-+rprocinfo_LDADD = @DCE_LIBS@ -lpthread
- rprocinfo_SOURCES = rprocinfo.c
- 
--pvrscope_CXXFLAGS = -I. -lrt -lm -lpthread -ldl
-+pvrscope_CXXFLAGS = -I.
-+pvrscope_LDADD = $(top_srcdir)/cpuload-plugins/libPVRScopeDeveloper.a -lrt -lm -lpthread -ldl
- pvrscope_SOURCES = pvrscope.cpp
--LIBS = $(top_srcdir)/cpuload-plugins/libPVRScopeDeveloper.a
--
- 
- # Specify any libraries that need to be built here.  Follow the convention
- # libxxx.a otherwise autotools will complain about non-canonical names.
-@@ -26,17 +25,15 @@ include_HEADERS=
- ##
- 
- read32k_driver_SOURCES= read32k_driver.c
--read32k_driver_LDADD = libread32k.a
-+read32k_driver_LDADD = libread32k.a -lm
- read32k_driver_CFLAGS = -I.
--read32k_driver_LDFLAGS= -lm
- 
- readproc_SOURCES = readproc.c
--readproc_LDFLAGS = -lm
-+readproc_LDADD = -lm
- 
- waitforweston_SOURCES = waitforweston.c
--waitforweston_LDADD = libread32k.a
-+waitforweston_LDADD = libread32k.a -lm @DRM_LIBS@ -lpthread -lrt @WAYLAND_LIBS@ @UDEV_LIBS@
- waitforweston_CFLAGS = -I. @DRM_CFLAGS@
--waitforweston_LDFLAGS = @DRM_LIBS@ -lpthread -lrt -lm @WAYLAND_LIBS@ @UDEV_LIBS@
- 
- ##
- # Libraries
-@@ -45,4 +42,3 @@ waitforweston_LDFLAGS = @DRM_LIBS@ -lpthread -lrt -lm @WAYLAND_LIBS@ @UDEV_LIBS@
- libread32k_a_SOURCES = read32k.c
- libread32k_a_CFLAGS = -I.
- include_HEADERS+=./read32k.h
--
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 81a6c3f..3ce8a76 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -12,12 +12,11 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
-	file://0001-Makefile-fix-library-linking-issues.patch \
 "
 
-SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
+SRCREV="491b3129a5c5267d72aba8878b50731f27356d3a"
 
-PR = "r49"
+PR = "r50"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.9.1


