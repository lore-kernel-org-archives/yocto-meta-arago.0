Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 6991652AB3
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00CMDAN6PNN0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05086273BC; Tue,
	01 Oct 2013 03:11:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:11 -0400
Message-id: <1380611472-23600-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 12/13] matrix-gui-browser: update recipe to be Qt4 and Qt5 compatible
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Uses qt-provider class to build against either Qt4 or Qt5 depending on global
distro variable QT_PROVIDER.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../matrix/matrix-gui-browser/qt5-gui-widgets-move.patch     | 12 ++++++++++++
 .../recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch  | 12 ++++++++++++
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb            | 12 ++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
new file mode 100644
index 0000000..e725004
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
@@ -0,0 +1,12 @@
+diff -uNr git-orig/main.cpp git/main.cpp
+--- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
++++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
+@@ -36,7 +36,7 @@
+  *
+ */
+ 
+-#include <QtGui>
++#include <QtWidgets>
+ #include <QWebView>
+ #include <QGraphicsWebView>
+ #include <iostream> 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch
new file mode 100644
index 0000000..abbbcc8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-webkit.patch
@@ -0,0 +1,12 @@
+diff -uNr git-orig/matrix_browser.pro git/matrix_browser.pro
+--- git-orig/matrix_browser.pro	2013-09-29 18:43:16.000000000 -0400
++++ git/matrix_browser.pro	2013-09-29 19:00:24.182913775 -0400
+@@ -6,7 +6,7 @@
+ TARGET = matrix_browser
+ DEPENDPATH += .
+ INCLUDEPATH += .
+-QT       +=   webkit
++QT       +=   webkitwidgets
+ # Input
+ SOURCES += main.cpp
+ 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 0e508a0..329b65a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -4,19 +4,23 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
 SECTION = "multimedia"
 
+inherit qt-provider
+
 # Make sure that QT font libraries have been installed
-RDEPENDS_${PN} += "qt4-embedded-fonts"
+RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
+
+DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r2"
+PR = "r3"
 
 SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
+SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://qt5-webkit.patch file://qt5-gui-widgets-move.patch', '', d)}"
 
-inherit qt4e
+S = "${WORKDIR}/git"
 
 do_install() {
 	install -d ${D}/${bindir}
-- 
1.8.3.2


