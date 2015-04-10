Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7EE66529CB
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 18:21:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AIL6XA017487
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:21:06 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIL5du014222
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:21:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 13:21:05 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIL25T020068;
	Fri, 10 Apr 2015 13:21:04 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YgdY4-0005qz-PU;
	Fri, 10 Apr 2015 14:21:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 14:20:56 -0400
Message-ID: <1428690056-22471-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-browser: Update SRCREV to fix compilation warnings.
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
X-List-Received-Date: Fri, 10 Apr 2015 18:21:07 -0000
Content-Type: text/plain

* Changes also includes removal of DOS line endings in sources.
* Thus update source file patch and license checksum.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../matrix-gui-browser/qt5-gui-widgets-move.patch  |   23 ++++++++++----------
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    6 ++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
index e725004..20a98d9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
@@ -1,12 +1,13 @@
-diff -uNr git-orig/main.cpp git/main.cpp
---- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
-+++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
+diff --git a/main.cpp b/main.cpp
+index fe27aab..51f9550 100644
+--- a/main.cpp
++++ b/main.cpp
 @@ -36,7 +36,7 @@
-  *
- */
- 
--#include <QtGui>
-+#include <QtWidgets>
- #include <QWebView>
- #include <QGraphicsWebView>
- #include <iostream> 
+  *
+ */
+ 
+-#include <QtGui>
++#include <QtWidgets>
+ #include <QWebView>
+ #include <QGraphicsWebView>
+ #include <iostream> 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 775b7ce..33387ea 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Simple Qt web display using webkit"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=75a9adc782a6df0d3a5419743e9a9f18"
 SECTION = "multimedia"
 
 inherit qt-provider
@@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r9"
+PR = "r10"
 
-SRCREV = "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
+SRCREV = "f68ab545a60ca446635f9db00d64569cef9c9091"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=http;branch=${BRANCH}"
-- 
1.7.9.5


