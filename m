Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C60D352A32
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 12:38:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99CcPeF025577
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 07:38:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99CcPCd015021
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 07:38:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 07:38:25 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99CcPhl017306;
	Fri, 9 Oct 2015 07:38:25 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkWwK-00034P-Uk; Fri, 09 Oct 2015 08:38:25 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 08:38:22 -0400
Message-ID: <1444394302-11767-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-browser: Upstream QT5-specific patches
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
X-List-Received-Date: Fri, 09 Oct 2015 12:38:27 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch | 31 ----------------------
 .../matrix-gui-browser/qt5-gui-widgets-move.patch  | 12 ---------
 .../matrix/matrix-gui-browser/qt5-webkit.patch     | 12 ---------
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  | 15 ++++-------
 4 files changed, 5 insertions(+), 65 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
 delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
 delete mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
deleted file mode 100644
index 42cfc23..0000000
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 155da553d7a5d4d84babb94fb0ecac073680c1cd Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 15 Dec 2014 15:51:59 -0500
-Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Makefile.build |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.build b/Makefile.build
-index 192c6f6..79b55f5 100644
---- a/Makefile.build
-+++ b/Makefile.build
-@@ -8,11 +8,11 @@ all: release
- .PHONY: qmake
- qmake : matrix_browser.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=release matrix_browser.pro
-+	qmake CONFIG+=release matrix_browser.pro
- 
- qmake_debug : matrix_browser.pro
- 	@. ${ENV_SETUP}; \
--	qmake2 CONFIG+=debug matrix_browser.pro
-+	qmake CONFIG+=debug matrix_browser.pro
- 
- debug : qmake_debug
- 	@. ${ENV_SETUP}; \
--- 
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
deleted file mode 100644
index 82e2728..0000000
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr git-orig/main.cpp git/main.cpp
---- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
-+++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
-@@ -36,7 +36,7 @@
-  *
- */
- 
--#include <QtGui>
-+#include <QtWidgets>
- #include <QWebView>
- #include <QGraphicsWebView>
- #include <iostream> 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch
deleted file mode 100644
index abbbcc8..0000000
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr git-orig/matrix_browser.pro git/matrix_browser.pro
---- git-orig/matrix_browser.pro	2013-09-29 18:43:16.000000000 -0400
-+++ git/matrix_browser.pro	2013-09-29 19:00:24.182913775 -0400
-@@ -6,7 +6,7 @@
- TARGET = matrix_browser
- DEPENDPATH += .
- INCLUDEPATH += .
--QT       +=   webkit
-+QT       +=   webkitwidgets
- # Input
- SOURCES += main.cpp
- 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index dfc2bbb..65c607f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,21 +11,16 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r11"
+PR = "r12"
 
-SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
+QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
+QT5_SRCREV = "5ab1350db5892f1fec9995b53670f27977c69f8d"
+
+SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
 
-QT5_DIFF = " \
-	file://qt5-webkit.patch \
-	file://qt5-gui-widgets-move.patch \
-	file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
-"
-
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
-
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
1.9.1


