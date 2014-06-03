Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 3C6DE52AB4
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00H4IMXPLPB0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:05 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9A29C201CF; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:38 -0400
Message-id: <1401762581-31370-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1401762581-31370-1-git-send-email-denis@denix.org>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] refresh-screen: convert to Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Use qt-provider to build it against Qt4 or Qt5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...een.pro-add-widgets-module-to-the-project.patch | 26 ++++++++++++++++++++++
 ...place-QtGui-header-with-QtWidgets-for-Qt5.patch | 26 ++++++++++++++++++++++
 .../recipes-core/matrix/refresh-screen_2.0.bb      | 17 +++++++++-----
 3 files changed, 64 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
 create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch

diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
new file mode 100644
index 0000000..b9a1f80
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
@@ -0,0 +1,26 @@
+From 3969a5b06cfa28e531080cfdb12ea69ada870f36 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 12 May 2014 21:07:32 -0400
+Subject: [PATCH] refresh-screen.pro: add widgets module to the project for Qt5
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ refresh_screen.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/refresh_screen.pro b/refresh_screen.pro
+index afe5c25..a79abd0 100644
+--- a/refresh_screen.pro
++++ b/refresh_screen.pro
+@@ -4,7 +4,7 @@
+ #
+ #-------------------------------------------------
+ 
+-QT       += core gui
++QT       += core gui widgets
+ 
+ TARGET = refresh_screen
+ TEMPLATE = app
+-- 
+1.9.2
+
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
new file mode 100644
index 0000000..66c002d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
@@ -0,0 +1,26 @@
+From 60a8e6c8ea763ed88442f16509cae99d8e43918e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 12 May 2014 21:01:57 -0400
+Subject: [PATCH] Replace QtGui header with QtWidgets for Qt5
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main.cpp b/main.cpp
+index c5744d8..5a61904 100644
+--- a/main.cpp
++++ b/main.cpp
+@@ -36,7 +36,7 @@
+  *
+ */
+ 
+-#include <QtGui/QApplication>
++#include <QtWidgets/QApplication>
+ #include "mainwindow.h"
+ 
+ int main(int argc, char *argv[])
+-- 
+1.9.2
+
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 2696978..fc41f32 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -4,21 +4,28 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
 SECTION = "multimedia"
 
+inherit qt-provider
+
 # Make sure that QT font libraries have been installed
-RDEPENDS_${PN} += "qt4-embedded-fonts"
+RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-PR = "r4"
+PR = "r5"
 
 SRCREV = "4dfdf85f17033f950e01f25341665f979edde6c3"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
+QT5_DIFF = " \
+file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch \
+file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \
+"
 
-inherit qt4e
+SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
+
+S = "${WORKDIR}/git"
 
 do_install() {
     install -d ${D}/${bindir}
-    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
+    install -m 0755 ${B}/refresh_screen ${D}/${bindir}
 }
-- 
1.9.2


