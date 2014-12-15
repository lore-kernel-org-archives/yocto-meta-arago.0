Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 4C46852A6A
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 21:23:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGN000687EDAGC0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Dec 2014 15:23:02 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LrklEcZZ c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8 a=lRxpQPx1AAAA:8	a=6lQN5XduiVzfTrJTXM0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2991220088;	Mon,
	15 Dec 2014 16:23:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Dec 2014 16:22:58 -0500
Message-id: <1418678579-22938-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] refresh-screen: patch Makefile.build to work with Qt5
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
X-List-Received-Date: Mon, 15 Dec 2014 21:23:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Makefile.build is only used when building from within SDK through a
top-level SDK Makefile.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 ++++++++++++++++++++
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
new file mode 100644
index 0000000..726b9ea
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
@@ -0,0 +1,31 @@
+From 394eacf80efaacc719e69179c7c709016d21b707 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 15 Dec 2014 15:46:08 -0500
+Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile.build |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.build b/Makefile.build
+index a0ceaad..e6cb010 100644
+--- a/Makefile.build
++++ b/Makefile.build
+@@ -8,11 +8,11 @@ all: release
+ .PHONY: qmake
+ qmake : refresh_screen.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=release refresh_screen.pro
++	qmake CONFIG+=release refresh_screen.pro
+ 
+ qmake_debug : refresh_screen.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=debug refresh_screen.pro
++	qmake CONFIG+=debug refresh_screen.pro
+ 
+ debug : qmake_debug
+ 	@. ${ENV_SETUP}; \
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 50d95fc..6c2c72e 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -9,7 +9,7 @@ inherit qt-provider
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-PR = "r6"
+PR = "r7"
 
 SRCREV = "ad3835b250c8b2b55ae65ffa19c2b85e412826b0"
 BRANCH ?= "master"
@@ -19,6 +19,7 @@ SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;bra
 QT5_DIFF = " \
 file://0001-refresh-screen.pro-add-widgets-module-to-the-project.patch \
 file://0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch \
+file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
 "
 
 SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
-- 
1.7.9.5


