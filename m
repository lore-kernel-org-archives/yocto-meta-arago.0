Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B6B52529CB
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 18:24:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AIOPxs017800
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:24:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIOOe7017017
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:24:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 13:24:24 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIOOsx025347;
	Fri, 10 Apr 2015 13:24:24 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgdbL-0005v3-Ne;
	Fri, 10 Apr 2015 14:24:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 14:24:20 -0400
Message-ID: <1428690260-22723-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] image-gallery: Update SRCREV to fix compilation warning.
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
X-List-Received-Date: Fri, 10 Apr 2015 18:24:26 -0000
Content-Type: text/plain

* Along with this update, the patch is no longer required.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 --------------------
 .../recipes-qt/qt-apps/image-gallery_git.bb        |   10 ++-----
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
deleted file mode 100644
index 0963797..0000000
--- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6b6a4b55c7ec53384fbbb8a9b0ba95350e7118b7 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 4 Mar 2015 11:59:53 -0500
-Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- Makefile.build |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.build b/Makefile.build
-index fc3f14c..0afe5c0 100644
---- a/Makefile.build
-+++ b/Makefile.build
-@@ -9,11 +9,11 @@ all: release
- .PHONY: qmake
- qmake : image-gallery.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=release image-gallery.pro
-+	qmake CONFIG+=release image-gallery.pro
- 
- qmake_debug : image-gallery.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=debug image-gallery.pro
-+	qmake CONFIG+=debug image-gallery.pro
- 
- debug : qmake_debug
- 	@. ${ENV_SETUP}; \
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
index f6c615e..ec8f56e 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/image-gallery_git.bb
@@ -8,19 +8,13 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "master"
-SRCREV = "1f89d5e6c160e87e73a9c06933e50c3981bbf41d"
+SRCREV = "47a13167061e6e8bb44842104bd8bfbc230cf476"
 
 SRC_URI = "git://gitorious.org/image-gallery/image-gallery.git;protocol=http;branch=${BRANCH}"
 
-QT5_DIFF = " \
-    file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
-"
-
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
-
 S = "${WORKDIR}/git/"
 
 do_install() {
-- 
1.7.9.5


