Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EEB9752090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD9A9208E3;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ymJAScKgx7lZ; Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A9CF20B58;
	Mon, 27 Mar 2017 02:10:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A73EE162423;
	Sun, 26 Mar 2017 22:10:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Mar 2017 22:10:46 -0400
Message-Id: <1490580653-40192-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/8] glsdk-example-apps: fix library linking issues
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
X-List-Received-Date: Mon, 27 Mar 2017 02:10:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Makefile-fix-library-linking-issues.patch | 60 ++++++++++++++++++++++
 .../glsdk-example-apps/glsdk-example-apps.bb       |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch b/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch
new file mode 100644
index 0000000..b7e8971
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/files/0001-Makefile-fix-library-linking-issues.patch
@@ -0,0 +1,60 @@
+From ecba95bde41a91d72aecf569c853a766a6ffd2aa Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 26 Mar 2017 13:39:47 -0400
+Subject: [PATCH] Makefile: fix library linking issues
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ cpuload-plugins/Makefile.am | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/cpuload-plugins/Makefile.am b/cpuload-plugins/Makefile.am
+index 9c0bc1a..3df7b22 100644
+--- a/cpuload-plugins/Makefile.am
++++ b/cpuload-plugins/Makefile.am
+@@ -6,13 +6,12 @@ mpuload_CFLAGS = \
+ mpuload_SOURCES = mpuload.c
+ 
+ rprocinfo_CFLAGS = -O0 -g @DRM_CFLAGS@ @DCE_CFLAGS@
+-rprocinfo_LDFLAGS = @DCE_LIBS@ -lpthread
++rprocinfo_LDADD = @DCE_LIBS@ -lpthread
+ rprocinfo_SOURCES = rprocinfo.c
+ 
+-pvrscope_CXXFLAGS = -I. -lrt -lm -lpthread -ldl
++pvrscope_CXXFLAGS = -I.
++pvrscope_LDADD = $(top_srcdir)/cpuload-plugins/libPVRScopeDeveloper.a -lrt -lm -lpthread -ldl
+ pvrscope_SOURCES = pvrscope.cpp
+-LIBS = $(top_srcdir)/cpuload-plugins/libPVRScopeDeveloper.a
+-
+ 
+ # Specify any libraries that need to be built here.  Follow the convention
+ # libxxx.a otherwise autotools will complain about non-canonical names.
+@@ -26,17 +25,15 @@ include_HEADERS=
+ ##
+ 
+ read32k_driver_SOURCES= read32k_driver.c
+-read32k_driver_LDADD = libread32k.a
++read32k_driver_LDADD = libread32k.a -lm
+ read32k_driver_CFLAGS = -I.
+-read32k_driver_LDFLAGS= -lm
+ 
+ readproc_SOURCES = readproc.c
+-readproc_LDFLAGS = -lm
++readproc_LDADD = -lm
+ 
+ waitforweston_SOURCES = waitforweston.c
+-waitforweston_LDADD = libread32k.a
++waitforweston_LDADD = libread32k.a -lm @DRM_LIBS@ -lpthread -lrt @WAYLAND_LIBS@ @UDEV_LIBS@
+ waitforweston_CFLAGS = -I. @DRM_CFLAGS@
+-waitforweston_LDFLAGS = @DRM_LIBS@ -lpthread -lrt -lm @WAYLAND_LIBS@ @UDEV_LIBS@
+ 
+ ##
+ # Libraries
+@@ -45,4 +42,3 @@ waitforweston_LDFLAGS = @DRM_LIBS@ -lpthread -lrt -lm @WAYLAND_LIBS@ @UDEV_LIBS@
+ libread32k_a_SOURCES = read32k.c
+ libread32k_a_CFLAGS = -I.
+ include_HEADERS+=./read32k.h
+-
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 3d3e155..81a6c3f 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -12,7 +12,8 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
-	 "
+	file://0001-Makefile-fix-library-linking-issues.patch \
+"
 
 SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
 
-- 
2.7.4


