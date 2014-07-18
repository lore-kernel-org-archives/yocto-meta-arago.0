Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id E9CF5529C8
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X00FU18F56FV0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CFC1A21CF3; Fri,
	18 Jul 2014 14:52:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:52:00 -0400
Message-id: <1405709522-404-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/11] refresh-screen: fix up Windows newlines in patches
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...sh-screen.pro-add-widgets-module-to-the-project.patch | 16 ++++++++--------
 ...002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
index c379b5c..b9a1f80 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
@@ -13,14 +13,14 @@ index afe5c25..a79abd0 100644
 --- a/refresh_screen.pro
 +++ b/refresh_screen.pro
 @@ -4,7 +4,7 @@
- #
- #-------------------------------------------------
- 
--QT       += core gui
-+QT       += core gui widgets
- 
- TARGET = refresh_screen
- TEMPLATE = app
+ #
+ #-------------------------------------------------
+ 
+-QT       += core gui
++QT       += core gui widgets
+ 
+ TARGET = refresh_screen
+ TEMPLATE = app
 -- 
 1.9.2
 
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
index 4966238..66c002d 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
@@ -13,14 +13,14 @@ index c5744d8..5a61904 100644
 --- a/main.cpp
 +++ b/main.cpp
 @@ -36,7 +36,7 @@
-  *
- */
- 
--#include <QtGui/QApplication>
-+#include <QtWidgets/QApplication>
- #include "mainwindow.h"
- 
- int main(int argc, char *argv[])
+  *
+ */
+ 
+-#include <QtGui/QApplication>
++#include <QtWidgets/QApplication>
+ #include "mainwindow.h"
+ 
+ int main(int argc, char *argv[])
 -- 
 1.9.2
 
-- 
2.0.0


