Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CCD3652A78
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 19:48:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24JmlZI015206
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 13:48:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24Jmkfc010480
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 13:48:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 13:48:45 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24JmjMP001834;	Wed, 4 Mar 2015 13:48:46 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTFHh-0005wp-Kx;
	Wed, 04 Mar 2015 14:48:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 14:48:43 -0500
Message-ID: <1425498523-22829-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] image-gallery: patch Makefile.build to work with Qt5
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
X-List-Received-Date: Wed, 04 Mar 2015 19:48:48 -0000
Content-Type: text/plain

Makefile.build is only used when building from within SDK through a
top-level SDK Makefile.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 ++++++++++++++++++++
 .../recipes-qt/qt-apps/image-gallery_git.bb        |    7 +++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
new file mode 100644
index 0000000..0963797
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
@@ -0,0 +1,31 @@
+From 6b6a4b55c7ec53384fbbb8a9b0ba95350e7118b7 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 4 Mar 2015 11:59:53 -0500
+Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ Makefile.build |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.build b/Makefile.build
+index fc3f14c..0afe5c0 100644
+--- a/Makefile.build
++++ b/Makefile.build
+@@ -9,11 +9,11 @@ all: release
+ .PHONY: qmake
+ qmake : image-gallery.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=release image-gallery.pro
++	qmake CONFIG+=release image-gallery.pro
+ 
+ qmake_debug : image-gallery.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=debug image-gallery.pro
++	qmake CONFIG+=debug image-gallery.pro
+ 
+ debug : qmake_debug
+ 	@. ${ENV_SETUP}; \
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
index 72c9389..ad2dcca 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
@@ -8,12 +8,15 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "master"
 SRCREV = "1f89d5e6c160e87e73a9c06933e50c3981bbf41d"
 
-SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=git;branch=${BRANCH}"
+SRC_URI = " \
+    git://gitorious.org/image-gallery/image-gallery.git;protocol=git;branch=${BRANCH} \
+    file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
+"
 
 S = "${WORKDIR}/git/"
 
-- 
1.7.9.5


